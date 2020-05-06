/**
 * Originally from https://github.com/zino-app/graphql-flutter
 * Adapted to `gql` by @iscriptology
 */

import "dart:async";
import "dart:collection";
import "dart:convert";
import "dart:typed_data";
import "package:meta/meta.dart";
import "package:websocket/websocket.dart" show WebSocket, WebSocketStatus;

import "package:rxdart/rxdart.dart";
import "package:uuid_enhanced/uuid.dart";

import "package:gql_websocket_link/src/messages.dart";

class SocketClientConfig {
  const SocketClientConfig({
    this.autoReconnect = true,
    this.queryAndMutationTimeout = const Duration(seconds: 10),
    this.inactivityTimeout = const Duration(seconds: 30),
    this.delayBetweenReconnectionAttempts = const Duration(seconds: 5),
    this.connectionParams,
  });

  /// Whether to reconnect to the server after detecting connection loss.
  final bool autoReconnect;

  /// The duration after which the connection is considered unstable, because no keep alive message
  /// was received from the server in the given time-frame. The connection to the server will be closed.
  /// If [autoReconnect] is set to true, we try to reconnect to the server after the specified [delayBetweenReconnectionAttempts].
  ///
  /// If null, the keep alive messages will be ignored.
  final Duration inactivityTimeout;

  /// The duration that needs to pass before trying to reconnect to the server after a connection loss.
  /// This only takes effect when [autoReconnect] is set to true.
  ///
  /// If null, the reconnection will occur immediately, although not recommended.
  final Duration delayBetweenReconnectionAttempts;

  // The duration after which a query or mutation should time out.
  // If null, no timeout is applied, although not recommended.
  final Duration queryAndMutationTimeout;

  /// The initial params that will be sent to the server upon connection.
  /// Usually used for authentication with an `authToken` field
  /// Can be null, but must be a valid json structure if provided.
  final dynamic connectionParams;

  InitOperation get initOperation => InitOperation(connectionParams);
}

enum SocketConnectionState { notConnected, connecting, connected }

/// Wraps a standard web socket instance to marshal and un-marshal the server /
/// client payloads into dart object representation.
///
/// This class also deals with reconnection, handles timeout and keep alive messages.
///
/// It is meant to be instantiated once, and you can let this class handle all the heavy-
/// lifting of socket state management. Once you're done with the socket connection, make sure
/// you call the [dispose] method to release all allocated resources.
class SocketClient {
  SocketClient(
    this.url, {
    this.protocols = const <String>[
      "graphql-ws",
    ],
    this.config = const SocketClientConfig(),
    @visibleForTesting this.randomBytesForUuid,
  }) {
    _connect();
  }

  Uint8List randomBytesForUuid;
  final String url;
  final SocketClientConfig config;
  final Iterable<String> protocols;
  final BehaviorSubject<SocketConnectionState> _connectionStateController =
      BehaviorSubject<SocketConnectionState>();

  final HashMap<String, Function> _subscriptionInitializers = HashMap();
  bool _connectionWasLost = false;

  Timer _reconnectTimer;
  WebSocket _socket;

  @visibleForTesting
  WebSocket get socket => _socket;
  Stream<GraphQLSocketMessage> _messageStream;

  StreamSubscription<ConnectionKeepAlive> _keepAliveSubscription;
  StreamSubscription<GraphQLSocketMessage> _messageSubscription;

  /// Connects to the server.
  ///
  /// If this instance is disposed, this method does nothing.
  Future<void> _connect() async {
    if (_connectionStateController.isClosed) {
      return;
    }

    _connectionStateController.value = SocketConnectionState.connecting;

    try {
      _socket = await WebSocket.connect(
        url,
        protocols: protocols,
      );
      _connectionStateController.value = SocketConnectionState.connected;

      _write(config.initOperation);

      _messageStream =
          _socket.stream.map<GraphQLSocketMessage>(_parseSocketMessage);

      if (config.inactivityTimeout != null) {
        _keepAliveSubscription = _messagesOfType<ConnectionKeepAlive>().timeout(
          config.inactivityTimeout,
          onTimeout: (EventSink<ConnectionKeepAlive> event) {
            // Haven't received keep alive message for [config.inactivityTimeout.inSeconds]
            // and therefore disconnecting...
            event.close();
            _socket.close(WebSocketStatus.goingAway);
            _connectionStateController.value =
                SocketConnectionState.notConnected;
          },
        ).listen(null);
      }

      _messageSubscription = _messageStream.listen(
        (_) {},
        onDone: onConnectionLost,
        cancelOnError: true,
      );

      if (_connectionWasLost) {
        for (final Function callback in _subscriptionInitializers.values) {
          callback();
        }

        _connectionWasLost = false;
      }
    } catch (e) {
      onConnectionLost(e);
    }
  }

  void onConnectionLost([dynamic e]) {
    _reconnectTimer?.cancel();
    _keepAliveSubscription?.cancel();
    _messageSubscription?.cancel();

    if (_connectionStateController.isClosed) {
      return;
    }

    _connectionWasLost = true;

    if (_connectionStateController.value !=
        SocketConnectionState.notConnected) {
      _connectionStateController.value = SocketConnectionState.notConnected;
    }

    if (config.autoReconnect && !_connectionStateController.isClosed) {
      if (config.delayBetweenReconnectionAttempts != null) {
        // will try reconnecting in [config.delayBetweenReconnectionAttempts.inSeconds]...");
        _reconnectTimer = Timer(
          config.delayBetweenReconnectionAttempts,
          _connect,
        );
      } else {
        Timer.run(_connect);
      }
    }
  }

  /// Closes the underlying socket if connected, and stops reconnection attempts.
  /// After calling this method, this [SocketClient] instance must be considered
  /// unusable. Instead, create a new instance of this class.
  ///
  /// Use this method if you'd like to disconnect from the specified server permanently,
  /// and you'd like to connect to another server instead of the current one.
  Future<void> dispose() async {
    _reconnectTimer?.cancel();
    await Future.wait<dynamic>([
      Future<dynamic>.value(_socket?.close()),
      Future<dynamic>.value(_keepAliveSubscription?.cancel()),
      Future<dynamic>.value(_messageSubscription?.cancel()),
      Future<dynamic>.value(_connectionStateController?.close()),
    ]);
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

  void _write(final GraphQLSocketMessage message) {
    if (_connectionStateController.value == SocketConnectionState.connected) {
      _socket.add(
        json.encode(
          message,
          toEncodable: (dynamic m) => m.toJson(),
        ),
      );
    }
  }

  /// Sends a query, mutation or subscription request to the server, and returns a stream of the response.
  ///
  /// If the request is a query or mutation, a timeout will be applied to the request as specified by
  /// [SocketClientConfig]'s [queryAndMutationTimeout] field.
  ///
  /// If the request is a subscription, obviously no timeout is applied.
  ///
  /// In case of socket disconnection, the returned stream will be closed.
  Stream<SubscriptionData> subscribe(final QueryPayload payload,
      {@required final bool waitForConnection,
      @required final bool isSubscription}) {
    final String id = Uuid.randomUuid(random: randomBytesForUuid).toString();
    final StreamController<SubscriptionData> response =
        StreamController<SubscriptionData>();
    StreamSubscription<SocketConnectionState> sub;
    final bool addTimeout =
        !isSubscription && config.queryAndMutationTimeout != null;

    final onListen = () {
      final Stream<SocketConnectionState> waitForConnectedStateWithoutTimeout =
          _connectionStateController
              .startWith(
                  waitForConnection ? null : SocketConnectionState.connected)
              .where((SocketConnectionState state) =>
                  state == SocketConnectionState.connected)
              .take(1);

      final Stream<SocketConnectionState> waitForConnectedState = addTimeout
          ? waitForConnectedStateWithoutTimeout.timeout(
              config.queryAndMutationTimeout,
              onTimeout: (EventSink<SocketConnectionState> event) {
                response.addError(TimeoutException("Connection timed out."));
                event.close();
                response.close();
              },
            )
          : waitForConnectedStateWithoutTimeout;

      sub = waitForConnectedState.listen((_) {
        final Stream<GraphQLSocketMessage> dataErrorComplete =
            _messageStream.where(
          (GraphQLSocketMessage message) {
            if (message is SubscriptionData) {
              return message.id == id;
            }

            if (message is SubscriptionError) {
              return message.id == id;
            }

            if (message is SubscriptionComplete) {
              return message.id == id;
            }

            return false;
          },
        ).takeWhile((_) => !response.isClosed);

        final Stream<GraphQLSocketMessage> subscriptionComplete = addTimeout
            ? dataErrorComplete
                .where((GraphQLSocketMessage message) =>
                    message is SubscriptionComplete)
                .take(1)
                .timeout(
                config.queryAndMutationTimeout,
                onTimeout: (EventSink<GraphQLSocketMessage> event) {
                  response.addError(TimeoutException("Request timed out."));
                  event.close();
                  response.close();
                },
              )
            : dataErrorComplete
                .where((GraphQLSocketMessage message) =>
                    message is SubscriptionComplete)
                .take(1);

        subscriptionComplete.listen((_) => response.close());

        dataErrorComplete
            .where(
                (GraphQLSocketMessage message) => message is SubscriptionData)
            .cast<SubscriptionData>()
            .listen(response.add);

        dataErrorComplete
            .where(
                (GraphQLSocketMessage message) => message is SubscriptionError)
            .listen(response.addError);

        _write(StartOperation(id, payload));
      });
    };

    response.onListen = onListen;

    response.onCancel = () {
      _subscriptionInitializers.remove(id);

      sub?.cancel();
      if (_connectionStateController.value == SocketConnectionState.connected &&
          _socket != null) {
        _write(StopOperation(id));
      }
    };

    _subscriptionInitializers[id] = onListen;

    return response.stream;
  }

  /// These streams will emit done events when the current socket is done.

  /// A stream that emits the last value of the connection state upon subscription.
  Stream<SocketConnectionState> get connectionState =>
      _connectionStateController.stream;

  /// Filter `_messageStream` for messages of the given type of [GraphQLSocketMessage]
  ///
  /// Example usages:
  /// `_messagesOfType<ConnectionAck>()` for init acknowledgments
  /// `_messagesOfType<ConnectionError>()` for errors
  /// `_messagesOfType<UnknownData>()` for unknown data messages
  Stream<M> _messagesOfType<M extends GraphQLSocketMessage>() => _messageStream
      .where((GraphQLSocketMessage message) => message is M)
      .cast<M>();
}
