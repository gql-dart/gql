import 'dart:convert';
import 'dart:async';

import 'package:gql_ws_link/src/messages.dart';

import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/exec/context.dart';
import 'package:gql_exec/exec/request.dart';
import 'package:gql_exec/exec/response.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/src/exception.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum SocketConnectionState { NOT_CONNECTED, CONNECTING, CONNECTED }

class WsLink extends Link {
  /// Serializer used to serialize request
  final RequestSerializer serializer;

  IOWebSocketChannel _channel;
  final String uri;
  final dynamic initialPayload;

  Stream<GraphQLSocketMessage> _messageStream;
  StreamSubscription<GraphQLSocketMessage> _messageSubscription;

  final BehaviorSubject<SocketConnectionState> _connectionStateController =
      BehaviorSubject<SocketConnectionState>();

  /// A simple websocket link.
  /// TO send custom headers or protocols pass channel property.
  WsLink(
    this.uri, {
    IOWebSocketChannel channel,
    this.serializer = const RequestSerializer(),
    this.initialPayload,
  }) {
    _channel = channel ?? null;
    this._connect();
  }

  @visibleForTesting
  IOWebSocketChannel get channel {
    return _channel;
  }

  /// Connects to the server.
  ///
  /// If this instance is disposed, this method does nothing.
  Future<void> _connect() async {
    if (_connectionStateController.isClosed) {
      return;
    }
    _connectionStateController.value = SocketConnectionState.CONNECTING;

    if (_channel == null) {
      try {
        this._channel = IOWebSocketChannel.connect(
          this.uri,
          headers: {
            "Content-type": "application/json",
          },
          protocols: [
            'graphql-ws',
          ],
        );
      } on WebSocketChannelException catch (e) {
        throw e;
      }
    }
    _connectionStateController.value = SocketConnectionState.CONNECTED;

    _messageStream = _channel.stream
        .map<GraphQLSocketMessage>(_parseSocketMessage)
        .asBroadcastStream();
    _write(InitOperation(this.initialPayload));
    _messageSubscription = _messageStream.listen(
      (_) {},
      onDone: () async {
        await dispose();
      },
      cancelOnError: true,
      onError: (e) {
        print(e);
      },
    );
  }

  Future<void> dispose() async {
    _connectionStateController.value = SocketConnectionState.NOT_CONNECTED;
    await Future.wait([
      _connectionStateController?.close(),
      _messageSubscription?.cancel(),
    ]);
  }

  @override
  Stream<Response> request(Request request, [NextLink forward]) async* {
    if (_connectionStateController.value ==
        SocketConnectionState.NOT_CONNECTED) {
      _connect();
    }
    final String id = uuid.v4();
    final StreamController<SubscriptionData> response =
        StreamController<SubscriptionData>();
    StreamSubscription<SocketConnectionState> sub;

    final onListen = () {
      final Stream<SocketConnectionState> waitForConnectedState =
          _connectionStateController
              .startWith(SocketConnectionState.CONNECTED)
              .where((SocketConnectionState state) =>
                  state == SocketConnectionState.CONNECTED)
              .take(1);

      sub = waitForConnectedState.listen((_) {
        // Filter own messages by id
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

        // Close [response] when receiving SubscriptionComplete
        final Stream<GraphQLSocketMessage> subscriptionComplete =
            dataErrorComplete
                .where((GraphQLSocketMessage message) =>
                    message is SubscriptionComplete)
                .take(1);
        subscriptionComplete.listen((_) => response.close());

        // Forward messages to [response]
        dataErrorComplete
            .where(
                (GraphQLSocketMessage message) => message is SubscriptionData)
            .cast<SubscriptionData>()
            .listen((SubscriptionData message) => response.add(message));

        // Forward errors to [response]
        dataErrorComplete
            .where(
                (GraphQLSocketMessage message) => message is SubscriptionError)
            .listen(
                (GraphQLSocketMessage message) => response.addError(message));

        // Send the request
        _write(
          StartOperation(
            id,
            serializer.serializeRequest(request),
          ),
        );
      });
    };

    response.onListen = onListen;
    await for (var data in response.stream) {
      yield Response(
        data: data.data,
        errors: data.errors,
        context: Context(),
      );
    }
  }

  void _write(final GraphQLSocketMessage message) {
    if (_connectionStateController.value == SocketConnectionState.CONNECTED) {
      _channel.sink.add(
        json.encode(
          message,
          toEncodable: (dynamic m) => m.toJson(),
        ),
      );
    }
  }

  static GraphQLSocketMessage _parseSocketMessage(dynamic message) {
    final Map<String, dynamic> map =
        json.decode(message as String) as Map<String, dynamic>;
    final String type = (map['type'] ?? 'unknown') as String;
    final dynamic payload = map['payload'] ?? <String, dynamic>{};
    final String id = (map['id'] ?? 'none') as String;

    switch (type) {
      case MessageTypes.GQL_CONNECTION_ACK:
        return ConnectionAck();
      case MessageTypes.GQL_CONNECTION_ERROR:
        return ConnectionError(payload);
      case MessageTypes.GQL_CONNECTION_KEEP_ALIVE:
        return ConnectionKeepAlive();
      case MessageTypes.GQL_DATA:
        final dynamic data = payload['data'];
        final dynamic errors = payload['errors'];
        return SubscriptionData(id, data, errors);
      case MessageTypes.GQL_ERROR:
        return SubscriptionError(id, payload);
      case MessageTypes.GQL_COMPLETE:
        return SubscriptionComplete(id);
      default:
        return UnknownData(map);
    }
  }
}
