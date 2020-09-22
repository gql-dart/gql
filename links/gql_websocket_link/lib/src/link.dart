import "dart:async";
import "dart:convert";

import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:rxdart/rxdart.dart";
import "package:uuid_enhanced/uuid.dart";
import "package:web_socket_channel/web_socket_channel.dart";
import "package:web_socket_channel/status.dart" as websocket_status;

/// A Universal WebSocket [Link] implementation to support the
/// WebSocket-GraphQL transport.
/// It supports subscriptions, query and mutation operations as well.
///
/// NOTE: the actual socket connection will only get established after
/// a [Request] is handled by this [WebSocketLink].
class WebSocketLink extends Link {
  String _uri;
  WebSocketChannel _channel;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Response parser
  ResponseParser parser;

  /// Payload to be sent with the connection_init request
  /// Must be able to `json.encode(initialPayload)`.
  final dynamic initialPayload;

  // Possible states of the connection.
  static const int connecting = 0;
  static const int open = 1;
  static const int closing = 2;
  static const int closed = 3;
  final BehaviorSubject<int> _connectionStateController =
      BehaviorSubject<int>();

  Stream<GraphQLSocketMessage> _messageStream;
  StreamSubscription<GraphQLSocketMessage> _messageSubscription;

  /// Initialize the [WebSocketLink] with a [uri].
  /// You can customize the headers & protocols by passing [channel],
  /// if [channel] is passed, [uri] must be null.
  /// [channel] if of type [WebSocketChannel],
  /// you may also use [IOWebSocketChannel] or [HtmlWebSocketChannel].
  /// You can also pass custom [RequestSerializer serializer] & [ResponseParser parser].
  /// Also [initialPayload] to be passed with the first request to the GraphQL server.
  WebSocketLink(
    String uri, {
    WebSocketChannel channel,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.initialPayload,
  }) : assert(uri == null || channel == null) {
    _uri = uri;
    _channel = channel;
    _connectionStateController.value = closed;
  }

  @override
  Stream<Response> request(Request request, [forward]) async* {
    if (_channel == null || _connectionStateController.value == closed) {
      await _connect();
    }
    final StreamController<Response> response = StreamController();
    final String id = Uuid.randomUuid().toString();

    response.onListen = () {
      final Stream<int> waitForConnectedState = _connectionStateController
          .startWith(open)
          .where((state) => state == open)
          .take(1);

      waitForConnectedState.listen(
        (_) {
          // Filter own messages by `id`.
          final Stream<GraphQLSocketMessage> dataErrorComplete =
              _messageStream.where(
            (GraphQLSocketMessage message) {
              if (message is SubscriptionData) {
                return message.id == id;
              } else if (message is SubscriptionError) {
                return message.id == id;
              } else if (message is SubscriptionComplete) {
                return message.id == id;
              } else {
                return false;
              }
            },
          ).takeWhile((_) => !response.isClosed);

          // Close [response] when receiving `SubscriptionComplete`.
          final Stream<GraphQLSocketMessage> subscriptionComplete =
              dataErrorComplete
                  .where((GraphQLSocketMessage message) =>
                      message is SubscriptionComplete)
                  .take(1);
          subscriptionComplete.listen((_) => response.close());

          // Forward data messages to [response].
          dataErrorComplete
              .where(
                  (GraphQLSocketMessage message) => message is SubscriptionData)
              .cast<SubscriptionData>()
              .listen(
            (SubscriptionData message) {
              try {
                final parsed = _parseMessage(message);
                if (parsed.data == null && parsed.errors == null) {
                  throw WebSocketLinkServerException(
                    originalException: null,
                    parsedResponse: parsed,
                    requestMessage: null,
                  );
                }
                response.add(parsed);
              } catch (e) {
                response.addError(e);
              }
            },
          );

          // Forward errors messages to [response].
          dataErrorComplete
              .where((GraphQLSocketMessage message) =>
                  message is SubscriptionError)
              .listen(response.addError);

          // Send the request.
          _write(
            StartOperation(
              id,
              serializer.serializeRequest(request),
            ),
          );
        },
      );
    };

    yield* response.stream;
  }

  /// Connects to the server.
  Future<void> _connect() async {
    _connectionStateController.value = connecting;
    try {
      _channel ??= WebSocketChannel.connect(Uri.parse(_uri));

      _connectionStateController.value = open;

      _messageStream = _channel.stream
          .map(_parseSocketMessage)
          .cast<GraphQLSocketMessage>()
          .asBroadcastStream();
      _messageSubscription = _messageStream.listen(
        (_) {},
        onDone: () async {
          await dispose();
        },
        onError: (dynamic e) {
          throw e;
        },
      );

      if (initialPayload is Function) {
        final dynamic payload = await initialPayload();
        _write(InitOperation(payload));
      } else {
        _write(InitOperation(initialPayload));
      }
    } catch (e) {
      if (e is LinkException) {
        rethrow;
      } else {
        throw WebSocketLinkServerException(
          originalException: e,
          parsedResponse: null,
          requestMessage: null,
        );
      }
    }
  }

  Response _parseMessage(SubscriptionData message) {
    try {
      return parser.parseResponse(message.toJson());
    } catch (e) {
      throw WebSocketLinkParserException(
        originalException: e,
        message: message,
      );
    }
  }

  void _write(final GraphQLSocketMessage message) {
    if (_channel.closeCode != null) {
      throw WebSocketLinkServerException(
        originalException: null,
        parsedResponse: null,
        requestMessage: message,
      );
    }
    _channel.sink.add(
      json.encode(
        message,
      ),
    );
  }

  static GraphQLSocketMessage _parseSocketMessage(dynamic message) {
    final Map<String, dynamic> map =
        json.decode(message as String) as Map<String, dynamic>;
    final String type = (map["type"] ?? "unknown") as String;
    final dynamic payload = map["payload"] ?? <String, dynamic>{};
    final String id = (map["id"] ?? "none") as String;

    switch (type) {
      case MessageTypes.connectionAck:
        return ConnectionAck();
      case MessageTypes.connectionError:
        return ConnectionError(payload);
      case MessageTypes.connectionKeepAlive:
        return ConnectionKeepAlive();
      case MessageTypes.data:
        final dynamic data = payload["data"];
        final dynamic errors = payload["errors"];
        return SubscriptionData(id, data, errors);
      case MessageTypes.error:
        return SubscriptionError(id, payload);
      case MessageTypes.complete:
        return SubscriptionComplete(id);
      default:
        return UnknownData(map);
    }
  }

  /// Disposes the underlying channel explicitly.
  /// Only use this, if you want to disconnect from the current server
  /// in favour of another one. If that's the case,
  /// create a new [WebSocketLink] instance.
  Future<void> dispose() async {
    _connectionStateController.value = closing;
    await _messageSubscription?.cancel();
    await _channel?.sink?.close(websocket_status.goingAway);
    _channel = null;
    _connectionStateController.value = closed;
    await _connectionStateController?.close();
  }
}
