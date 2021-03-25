import "dart:async";
import "dart:convert";

import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";
import "package:rxdart/rxdart.dart";
import "package:uuid_enhanced/uuid.dart";
import "package:web_socket_channel/web_socket_channel.dart";
import "package:web_socket_channel/status.dart" as websocket_status;

typedef ChannelGenerator = FutureOr<WebSocketChannel> Function();
typedef GraphQLSocketMessageDecoder = FutureOr<Map<String, dynamic>> Function(dynamic message);

typedef GraphQLSocketMessageEncoder = FutureOr<String> Function(Map<String, dynamic> message);

@immutable
class RequestId extends ContextEntry {
  final String id;

  const RequestId(this.id) : assert(id != null);

  @override
  List<Object> get fieldsForEquality => [id];
}

/// A Universal WebSocket [Link] implementation to support the
/// WebSocket-GraphQL transport.
/// It supports subscriptions, query and mutation operations as well.
///
/// NOTE: the actual socket connection will only get established after
/// a [Request] is handled by this [WebSocketLink].
class WebSocketLink extends Link {
  String _uri;
  WebSocketChannel _channel;

  // Current active subscriptions
  final _requests = <Request>[];

  // Current active subscriptions listening for messages from the active requests.
  final _messageSubscriptions = <String, StreamSubscription<GraphQLSocketMessage>>{};

  // subscriptions that need to be re-initialized after channel reconnect
  final _reConnectRequests = <Request>[];

  /// A function that returns a `WebSocketChannel`.
  /// This is useful if you have dynamic Auth token and want to regenerate it after the socket has disconnected.
  ChannelGenerator _channelGenerator;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Response parser
  ResponseParser parser;

  /// A function that encodes the request message to json string before sending it over the network.
  final GraphQLSocketMessageEncoder graphQLSocketMessageEncoder;

  static String _defaultGraphQLSocketMessageEncoder(Map<String, dynamic> message) => json.encode(message);

  /// A function that decodes the incoming http response to `Map<String, dynamic>`,
  /// the decoded map will be then passes to the `RequestSerializer`.
  /// It is recommended for performance to decode the response using `compute` function.
  /// ```
  /// graphQLSocketMessageDecoder : (dynamic message) async => await compute(jsonDecode, message as String) as Map<String, dynamic>,
  /// ```
  final GraphQLSocketMessageDecoder graphQLSocketMessageDecoder;

  static Map<String, dynamic> _defaultGraphQLSocketMessageDecoder(dynamic message) =>
      json.decode(message as String) as Map<String, dynamic>;

  /// Automatically recreate the channel when connection is lost,
  /// and re send all active subscriptions. `true` by default.
  bool autoReconnect;

  Timer _reconnectTimer;

  /// The interval between reconnects, the default value is 10 seconds.
  final Duration reconnectInterval;

  /// Payload to be sent with the connection_init request
  /// Must be able to `json.encode(initialPayload)`.
  final dynamic initialPayload;

  /// The duration after which the connection is considered unstable,
  /// because no keep alive message was received from the server in the given time-frame.
  /// The connection to the server will be closed.
  /// If the value is null this is ignored, By default this is null.
  final Duration inactivityTimeout;

  // Possible states of the connection.
  static const int closed = 0;
  static const int connecting = 1;
  static const int open = 2;
  final BehaviorSubject<int> _connectionStateController = BehaviorSubject<int>.seeded(closed);

  final StreamController<GraphQLSocketMessage> _messagesController = StreamController<GraphQLSocketMessage>.broadcast();
  StreamSubscription<ConnectionKeepAlive> _keepAliveSubscription;

  /// Initialize the [WebSocketLink] with a [uri].
  /// You can customize the headers & protocols by passing [channelGenerator],
  /// if [channelGenerator] is passed, [uri] must be null.
  /// [channelGenerator] is a function that returns [WebSocketChannel] or [IOWebSocketChannel] or [HtmlWebSocketChannel].
  /// You can also pass custom [RequestSerializer serializer] & [ResponseParser parser].
  /// Also [initialPayload] to be passed with the first request to the GraphQL server.
  WebSocketLink(
    String uri, {
    ChannelGenerator channelGenerator,
    this.autoReconnect = true,
    this.reconnectInterval = const Duration(seconds: 10),
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.graphQLSocketMessageEncoder = _defaultGraphQLSocketMessageEncoder,
    this.graphQLSocketMessageDecoder = _defaultGraphQLSocketMessageDecoder,
    this.initialPayload,
    this.inactivityTimeout,
  }) : assert(uri == null || (channelGenerator == null)) {
    if (uri != null) {
      _uri = uri;
    } else {
      _channelGenerator = channelGenerator ?? () => WebSocketChannel.connect(Uri.parse(_uri));
    }
  }

  @override
  Stream<Response> request(Request request, [forward]) async* {
    final String id = Uuid.randomUuid().toString();
    final requestWithContext = request.withContextEntry<RequestId>(
      RequestId(id),
    );
    _requests.add(requestWithContext);

    if (_channel == null || _connectionStateController.value == closed) {
      await _connect();
    }
    final StreamController<Response> response = StreamController();
    StreamSubscription<GraphQLSocketMessage> messagesSubscription;

    response.onListen = () {
      final Stream<int> waitForConnectedState = _connectionStateController.where((state) => state == open).take(1);

      waitForConnectedState.listen((_) {
        // listen for response messages
        messagesSubscription = _messagesController.stream
            .where((message) =>
                (message is SubscriptionData && message.id == id) ||
                (message is SubscriptionError && message.id == id) ||
                (message is SubscriptionComplete && message.id == id))
            .takeWhile((_) => !response.isClosed)
            .listen(
          (message) {
            if (message is SubscriptionData || message is SubscriptionError) {
              try {
                final parsed = _parseMessage(message).withContextEntry(RequestId(id));
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
            } else if (message is SubscriptionComplete) {
              response.close();
            }
          },
          onError: response.addError,
        );
        _messageSubscriptions[id] = messagesSubscription;
        // Send the request.
        _write(
          StartOperation(
            id,
            serializer.serializeRequest(requestWithContext),
          ),
        ).catchError(response.addError);
      });
    };

    response.onCancel = () {
      messagesSubscription?.cancel();
      _messageSubscriptions.remove(id);
      _write(StopOperation(id)).catchError(response.addError);
      _requests.removeWhere((e) => e.context.entry<RequestId>().id == id);
    };

    yield* response.stream;
  }

  /// Stops the subscription to the request with the given id.
  /// The requestId can be found in the context of any response.
  /// ```
  /// String requestId = response.context.entry<RequestId>().id;
  /// ```
  Future<void> stop(String requestId) async {
    final messagesSubscription = _messageSubscriptions[requestId];
    messagesSubscription?.cancel();
    _messageSubscriptions.remove(requestId);
    _write(StopOperation(requestId));
    _requests.removeWhere((e) => e.context.entry<RequestId>().id == requestId);
  }

  /// Connects to the server.
  Future<void> _connect() async {
    try {
      _connectionStateController.add(connecting);
      _channel = await _channelGenerator();
      _reconnectTimer?.cancel();
      _channel.stream.listen((dynamic message) async {
        // Mark the connection as [open] and can be used.
        if (_connectionStateController.value != open) {
          _connectionStateController.add(open);
        }
        final parsedMessage = await _parseSocketMessage(message);
        _messagesController.add(parsedMessage);
        if (parsedMessage is ConnectionAck) {
          _reConnectRequests.forEach((request) {
            // Send the request.
            _write(
              StartOperation(
                request.context.entry<RequestId>().id,
                serializer.serializeRequest(request),
              ),
            ).catchError(_messagesController.addError);
          });
          _reConnectRequests.clear();
        }
      }, onDone: () {
        _connectionStateController.add(closed);
        if (autoReconnect) {
          _reConnectRequests.clear();
          _reConnectRequests.addAll(_requests);
          if (_reconnectTimer?.isActive != true) {
            _reconnectTimer = Timer.periodic(reconnectInterval, (timer) {
              if (_connectionStateController.value == closed) {
                _connect();
              }
            });
          }
        } else {
          _close();
        }
      }, onError: (dynamic error) {
        _messagesController.addError(error);
      });

      if (initialPayload is Function) {
        final dynamic payload = await initialPayload();
        await _write(InitOperation(payload)).catchError(_messagesController.addError);
      } else {
        await _write(InitOperation(initialPayload)).catchError(_messagesController.addError);
      }

      // inactivityTimeout
      if (inactivityTimeout != null) {
        _keepAliveSubscription = _messagesController.stream
            .where(
              (GraphQLSocketMessage message) => message is ConnectionKeepAlive,
            )
            .map<ConnectionKeepAlive>((message) => message as ConnectionKeepAlive)
            .timeout(inactivityTimeout, onTimeout: (_) {
          _channel.sink.close(websocket_status.goingAway);
        }).listen(null);
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

  Response _parseMessage(GraphQLSocketMessage message) {
    try {
      return parser.parseResponse(message.toJson());
    } catch (e) {
      throw WebSocketLinkParserException(
        originalException: e,
        message: message,
      );
    }
  }

  Future<void> _write(final GraphQLSocketMessage message) async {
    // We can send during [connecting] & [connected].
    if (_connectionStateController.value == closed) {
      throw WebSocketLinkServerException(
        originalException: null,
        parsedResponse: null,
        requestMessage: message,
      );
    }
    final encodedMessage = await graphQLSocketMessageEncoder(message.toJson());
    _channel.sink.add(encodedMessage);
  }

  Future<GraphQLSocketMessage> _parseSocketMessage(dynamic message) async {
    final Map<String, dynamic> map = await graphQLSocketMessageDecoder(message);
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

  /// Close the WebSocket channel.
  Future<void> _close() async {
    await _keepAliveSubscription?.cancel();
    await _channel?.sink?.close(websocket_status.goingAway);
    _connectionStateController.add(closed);
    await _connectionStateController.close();
    await _messagesController.close();
    _reconnectTimer?.cancel();
  }

  /// Disposes the underlying channel explicitly.
  /// Only use this, if you want to disconnect from the current server
  /// in favour of another one. If that's the case,
  /// create a new [WebSocketLink] instance.
  Future<void> dispose() async {
    await _close();
    _channel = null;
  }
}
