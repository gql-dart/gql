import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:meta/meta.dart";
import "package:rxdart/rxdart.dart";
import "package:uuid/uuid.dart";
import "package:web_socket_channel/status.dart" as websocket_status;
import "package:web_socket_channel/web_socket_channel.dart";

final uuid = Uuid();

typedef ChannelGenerator = FutureOr<WebSocketChannel> Function();
typedef GraphQLSocketMessageDecoder = FutureOr<Map<String, dynamic>>? Function(
    dynamic message);

typedef GraphQLSocketMessageEncoder = FutureOr<String> Function(
    Map<String, dynamic> message);

@immutable
class RequestId extends ContextEntry {
  final String id;

  const RequestId(this.id);

  @override
  List<Object> get fieldsForEquality => [id];
}

/// Possible connection states of the [WebSocketLink].
enum ConnectionState {
  /// The [WebSocketLink] is closed.
  closed,

  /// The [WebSocketLink] is currently connecting.
  connecting,

  /// The [WebSocketLink] has an opened connection.
  open,
}

/// A Universal WebSocket [Link] implementation to support the
/// WebSocket-GraphQL transport.
/// It supports subscriptions, query and mutation operations as well.
///
/// NOTE: the actual socket connection will only get established after
/// a [Request] is handled by this [WebSocketLink].
class WebSocketLink extends Link {
  WebSocketChannel? _channel;

  // Current active subscriptions
  final _requests = <Request>[];

  // subscriptions that need to be re-initialized after channel reconnect
  final _reConnectRequests = <Request>[];

  /// A function that returns a `WebSocketChannel`.
  /// This is useful if you have dynamic Auth token and want to regenerate it after the socket has disconnected.
  late ChannelGenerator _channelGenerator;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Response parser
  ResponseParser parser;

  /// A function that encodes the request message to json string before sending it over the network.
  final GraphQLSocketMessageEncoder graphQLSocketMessageEncoder;

  static String _defaultGraphQLSocketMessageEncoder(
          Map<String, dynamic> message) =>
      json.encode(message);

  /// A function that decodes the incoming http response to `Map<String, dynamic>`,
  /// the decoded map will be then passes to the `RequestSerializer`.
  /// It is recommended for performance to decode the response using `compute` function.
  /// ```
  /// graphQLSocketMessageDecoder : (dynamic message) async => await compute(jsonDecode, message as String) as Map<String, dynamic>,
  /// ```
  final GraphQLSocketMessageDecoder graphQLSocketMessageDecoder;

  static Map<String, dynamic>? _defaultGraphQLSocketMessageDecoder(
          dynamic message) =>
      json.decode(message as String) as Map<String, dynamic>?;

  /// Automatically recreate the channel when connection is lost,
  /// and re send all active subscriptions. `true` by default.
  bool autoReconnect;

  Timer? _reconnectTimer;

  /// The interval between reconnects, the default value is 10 seconds.
  final Duration reconnectInterval;

  /// Payload to be sent with the connection_init request
  /// Must be able to `json.encode(initialPayload)`.
  final dynamic initialPayload;

  /// The duration after which the connection is considered unstable,
  /// because no keep alive message was received from the server in the given time-frame.
  /// The connection to the server will be closed.
  /// If the value is null this is ignored, By default this is null.
  final Duration? inactivityTimeout;

  /// Tracks state of the connection state.
  final BehaviorSubject<ConnectionState> _connectionStateController =
      BehaviorSubject<ConnectionState>.seeded(ConnectionState.closed);

  final StreamController<GraphQLSocketMessage> _messagesController =
      StreamController<GraphQLSocketMessage>.broadcast();
  StreamSubscription<ConnectionKeepAlive>? _keepAliveSubscription;

  /// Completes when the [WebSocketLink] is disposed.
  /// Non-null when the Link is closing or already closed with [_close].
  Completer<void>? _disposedCompleter;

  /// true when the [WebSocketLink] can't send any more messages.
  /// This happends after calling [dispose] or when [autoReconnect] is false
  /// and the web socket disconnected.
  bool get isDisabled => _disposedCompleter != null;

  /// A stream that notifies about changes of the current connection state.
  Stream<ConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  /// Initialize the [WebSocketLink] with a [uri].
  /// You can customize the headers & protocols by passing [channelGenerator],
  /// if [channelGenerator] is passed, [uri] must be null.
  /// [channelGenerator] is a function that returns [WebSocketChannel] or [IOWebSocketChannel] or [HtmlWebSocketChannel].
  /// You can also pass custom [RequestSerializer serializer] & [ResponseParser parser].
  /// Also [initialPayload] to be passed with the first request to the GraphQL server.
  WebSocketLink(
    String? uri, {
    ChannelGenerator? channelGenerator,
    this.autoReconnect = true,
    this.reconnectInterval = const Duration(seconds: 10),
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.graphQLSocketMessageEncoder = _defaultGraphQLSocketMessageEncoder,
    this.graphQLSocketMessageDecoder = _defaultGraphQLSocketMessageDecoder,
    this.initialPayload,
    this.inactivityTimeout,
  }) : assert((uri == null && channelGenerator != null) ||
            (uri != null && channelGenerator == null)) {
    _channelGenerator =
        channelGenerator ?? () => WebSocketChannel.connect(Uri.parse(uri!));
  }

  @override
  Stream<Response> request(Request request, [forward]) async* {
    final String id = uuid.v4();
    final requestWithContext = request.withContextEntry<RequestId>(
      RequestId(id),
    );
    _requests.add(requestWithContext);

    if (_connectionStateController.value == ConnectionState.closed) {
      await _connect();
    }
    final StreamController<Response> response = StreamController();
    StreamSubscription<GraphQLSocketMessage>? messagesSubscription;

    response.onListen = () {
      final Stream<ConnectionState> waitForConnectedState =
          _connectionStateController
              .where((state) => state == ConnectionState.open)
              .take(1);

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
            } else if (message is SubscriptionComplete) {
              response.close();
            }
          },
          onError: response.addError,
          onDone: response.close,
        );
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
      if (isDisabled) {
        return;
      }
      messagesSubscription?.cancel();
      _write(StopOperation(id)).catchError(response.addError);
      _requests.removeWhere((e) => e.context.entry<RequestId>()!.id == id);
    };

    yield* response.stream;
  }

  /// Connects to the server.
  Future<void> _connect() async {
    try {
      _connectionStateController.add(ConnectionState.connecting);
      _channel = await _channelGenerator();
      _reconnectTimer?.cancel();
      _channel!.stream.listen((dynamic message) async {
        // Mark the connection as [open] and can be used.
        if (_connectionStateController.value != ConnectionState.open) {
          _connectionStateController.add(ConnectionState.open);
        }
        final parsedMessage = await _parseSocketMessage(message);
        _messagesController.add(parsedMessage);
        if (parsedMessage is ConnectionAck) {
          _reConnectRequests.forEach((request) {
            // Send the request.
            _write(
              StartOperation(
                request.context.entry<RequestId>()!.id,
                serializer.serializeRequest(request),
              ),
            ).catchError(_messagesController.addError);
          });
          _reConnectRequests.clear();
        }
      }, onDone: () {
        if (isDisabled) {
          // already disposed
          return;
        }
        _connectionStateController.add(ConnectionState.closed);
        if (autoReconnect) {
          _reConnectRequests.clear();
          _reConnectRequests.addAll(_requests);
          if (_reconnectTimer?.isActive != true) {
            _reconnectTimer = Timer.periodic(reconnectInterval, (timer) {
              if (_connectionStateController.value == ConnectionState.closed) {
                _connect();
              }
            });
          }
        } else {
          _close();
        }
      }, onError: (Object error) {
        _messagesController.addError(error);
      });

      if (initialPayload is Function) {
        final dynamic payload = await initialPayload();
        await _write(InitOperation(payload))
            .catchError(_messagesController.addError);
      } else {
        await _write(InitOperation(initialPayload))
            .catchError(_messagesController.addError);
      }

      // inactivityTimeout
      if (inactivityTimeout != null) {
        _keepAliveSubscription = _messagesController.stream
            .where(
              (GraphQLSocketMessage message) => message is ConnectionKeepAlive,
            )
            .map<ConnectionKeepAlive>(
                (message) => message as ConnectionKeepAlive)
            .timeout(inactivityTimeout!, onTimeout: (_) {
          _channel!.sink.close(websocket_status.normalClosure);
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
    if (_connectionStateController.value == ConnectionState.closed) {
      throw WebSocketLinkServerException(
        originalException: null,
        parsedResponse: null,
        requestMessage: message,
      );
    }
    final encodedMessage = await graphQLSocketMessageEncoder(message.toJson());
    _channel!.sink.add(encodedMessage);
  }

  Future<GraphQLSocketMessage> _parseSocketMessage(dynamic message) async {
    final Map<String, dynamic> map =
        await graphQLSocketMessageDecoder(message)!;
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
        final dynamic extensions = payload["extensions"];
        return SubscriptionData(id, data, errors, extensions);
      case MessageTypes.error:
        List<Map<String, Object?>>? _tryCastErrors(List<Object?> list) {
          final allAreErrors = list.every(
            (map) =>
                map is Map<String, Object?> &&
                map["message"] is String &&
                (map["path"] is List?) &&
                (map["locations"] is List?) &&
                (map["extensions"] is Map<String, Object?>?),
          );
          return allAreErrors ? list.cast() : null;
        }
        Object? extensions;
        List<Map<String, Object?>>? errors;
        if (payload is List) {
          errors = _tryCastErrors(payload);
        } else if (payload is Map) {
          if (payload["errors"] is List) {
            extensions = payload["extensions"];
            errors = _tryCastErrors(payload["errors"] as List);
          } else {
            errors = _tryCastErrors([payload]);
            // only pass root level extensions if they weren't passed as
            // extensions in the error
            if (errors == null) {
              extensions = payload["extensions"];
            }
          }
        }
        return SubscriptionError(id, payload, errors, extensions);
      case MessageTypes.complete:
        return SubscriptionComplete(id);
      default:
        return UnknownData(map);
    }
  }

  /// Close the WebSocket channel.
  Future<void> _close() async {
    if (_disposedCompleter != null) {
      return _disposedCompleter!.future;
    }
    _disposedCompleter = Completer();
    _reconnectTimer?.cancel();
    await _keepAliveSubscription?.cancel();
    await _channel?.sink.close(websocket_status.normalClosure);
    _connectionStateController.add(ConnectionState.closed);
    await _connectionStateController.close();
    await _messagesController.close();
    _disposedCompleter!.complete();
  }

  /// Disposes the underlying channel explicitly.
  /// Only use this, if you want to disconnect from the current server
  /// in favour of another one. If that's the case,
  /// create a new [WebSocketLink] instance.
  @override
  Future<void> dispose() async {
    await _close();
    _channel = null;
  }
}
