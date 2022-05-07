import "dart:async";
import "dart:convert" show json;
import "dart:math" show Random;

import "package:gql/language.dart" show printNode;
import "package:gql_exec/gql_exec.dart"
    show Request, Response, Context, RequestExtensionsThunk, ResponseExtensions;
import "package:gql_link/gql_link.dart"
    show Link, NextLink, RequestSerializer, ResponseParser;
import "package:web_socket_channel/web_socket_channel.dart"
    show WebSocketChannel;

import "link.dart" show ChannelGenerator, GraphQLSocketMessageDecoder;
import "transport_ws_common.dart";

void _log(Object message) {
  print(message);
}

///
/// client
///

// import { ExecutionResult } from 'graphql';
// import {
//   GRAPHQL_TRANSPORT_WS_PROTOCOL,
//   CloseCode,
//   Sink,
//   ID,
//   Disposable,
//   Message,
//   MessageType,
//   ConnectionInitMessage,
//   ConnectionAckMessage,
//   PingMessage,
//   PongMessage,
//   parseMessage,
//   stringifyMessage,
//   SubscribePayload,
//   JSONMessageReviver,
//   JSONMessageReplacer,
// } from './common';
// import { isObject, limitCloseReason } from './utils';

// /** This file is the entry point for browsers, re-export common elements. */
// export * from './common';

enum Event {
  /// WebSocket started connecting.
  ///
  /// @category Client
  connecting,

  /// WebSocket has opened.
  ///
  /// @category Client
  opened,

  /// Open WebSocket connection has been acknowledged.
  ///
  /// @category Client
  connected,

  /// `PingMessage` has been received or sent.
  ///
  /// @category Client
  ping,

  /// `PongMessage` has been received or sent.
  ///
  /// @category Client
  pong,

  /// A message has been received.
  ///
  /// @category Client
  message,

  /// WebSocket connection has closed.
  ///
  /// @category Client
  closed,

  /// WebSocket connection had an error or client had an internal error.
  ///
  /// @category Client
  error,
}

// /**
//  * All events that could occur.
//  *
//  * @category Client
//  */
// export type Event =
//   | EventConnecting
//   | EventOpened
//   | EventConnected
//   | EventPing
//   | EventPong
//   | EventMessage
//   | EventClosed
//   | EventError;

/// @category Client */
typedef EventConnectingListener = void Function();

/// The first argument is actually the `WebSocket`, but to avoid
/// bundling DOM typings because the client can run in Node env too,
/// you should assert the websocket type during implementation.
///
/// @category Client
typedef EventOpenedListener = void Function(Object socket);

/// The first argument is actually the `WebSocket`, but to avoid
/// bundling DOM typings because the client can run in Node env too,
/// you should assert the websocket type during implementation.
///
/// Also, the second argument is the optional payload that the server may
/// send through the `ConnectionAck` message.
///
/// @category Client
typedef EventConnectedListener = void Function(
  Object socket,
  Map<String, Object?> // ConnectionAckMessage['payload']
      payload,
);

/// The first argument communicates whether the ping was received from the server.
/// If `false`, the ping was sent by the client.
///
/// @category Client
typedef EventPingListener = void Function(
  bool received,
  Map<String, Object?>
      // PingMessage['payload']
      payload,
);

/// The first argument communicates whether the pong was received from the server.
/// If `false`, the pong was sent by the client.
///
/// @category Client
typedef EventPongListener = void Function(
  bool received,
  Map<String, Object?>
      // PongMessage['payload']
      payload,
);

/// Called for all **valid** messages received by the client. Mainly useful for
/// debugging and logging received messages.
///
/// @category Client
typedef EventMessageListener = void Function(Message message);

/// The argument is actually the websocket `CloseEvent`, but to avoid
/// bundling DOM typings because the client can run in Node env too,
/// you should assert the websocket type during implementation.
///
/// @category Client
typedef EventClosedListener = void Function(Object event);

/// Events dispatched from the WebSocket `onerror` are handled in this listener,
/// as well as all internal client errors that could throw.
///
/// @category Client
typedef EventErrorListener = void Function(Object error);

/// @category Client */
// typedef EventListener = Function;
// E extends EventConnecting
//   ? EventConnectingListener
//   : E extends EventOpened
//   ? EventOpenedListener
//   : E extends EventConnected
//   ? EventConnectedListener
//   : E extends EventPing
//   ? EventPingListener
//   : E extends EventPong
//   ? EventPongListener
//   : E extends EventMessage
//   ? EventMessageListener
//   : E extends EventClosed
//   ? EventClosedListener
//   : E extends EventError
//   ? EventErrorListener
//   : never;

class WebSocketMaker {
  final FutureOr<String> Function()? url;
  final ChannelGenerator? generator;

  const WebSocketMaker.url(FutureOr<String> Function() this.url)
      : generator = null;
  const WebSocketMaker.generator(ChannelGenerator this.generator) : url = null;
}

/// Configuration used for the GraphQL over WebSocket client.
///
/// @category Client
class ClientOptions {
  /// URL of the GraphQL over WebSocket Protocol compliant server to connect.
  ///
  /// If the option is a function, it will be called on every WebSocket connection attempt.
  /// Returning a promise is supported too and the connecting phase will stall until it
  /// resolves with the URL.
  ///
  /// A good use-case for having a function is when using the URL for authentication,
  /// where subsequent reconnects (due to auth) may have a refreshed identity token in
  /// the URL.
  final WebSocketMaker socketMaker;

  /// Optional parameters, passed through the `payload` field with the `ConnectionInit` message,
  /// that the client specifies when establishing a connection with the server. You can use this
  /// for securely passing arguments for authentication.
  ///
  /// If you decide to return a promise, keep in mind that the server might kick you off if it
  /// takes too long to resolve! Check the `connectionInitWaitTimeout` on the server for more info.
  ///
  /// Throwing an error from within this function will close the socket with the `Error` message
  /// in the close event reason.
  final FutureOr<Map<String, Object?>?> Function()? connectionParams;

  /// Controls when should the connection be established.
  ///
  /// - `false`: Establish a connection immediately. Use `onNonLazyError` to handle errors.
  /// - `true`: Establish a connection on first subscribe and close on last unsubscribe. Use
  /// the subscription sink's `error` to handle errors.
  ///
  /// @default true
  final bool lazy;

  /// Used ONLY when the client is in non-lazy mode (`lazy = false`). When
  /// using this mode, the errors might have no sinks to report to; however,
  /// to avoid swallowing errors, consider using `onNonLazyError`,  which will
  /// be called when either:
  /// - An unrecoverable error/close event occurs
  /// - Silent retry attempts have been exceeded
  ///
  /// After a client has errored out, it will NOT perform any automatic actions.
  ///
  /// The argument can be a websocket `CloseEvent` or an `Error`. To avoid bundling
  /// DOM types, you should derive and assert the correct type. When receiving:
  /// - A `CloseEvent`: retry attempts have been exceeded or the specific
  /// close event is labeled as fatal (read more in `retryAttempts`).
  /// - An `Error`: some internal issue has occured, all internal errors are
  /// fatal by nature.
  ///
  /// @default console.error
  final void Function(Object? errorOrCloseEvent)? onNonLazyError;

  /// How long should the client wait before closing the socket after the last oparation has
  /// completed. This is meant to be used in combination with `lazy`. You might want to have
  /// a calmdown time before actually closing the connection. Kinda' like a lazy close "debounce".
  ///
  /// @default 0 // close immediately
  final int lazyCloseTimeout;

  /// The timout between dispatched keep-alive messages, naimly server pings. Internally
  /// dispatches the `PingMessage` type to the server and expects a `PongMessage` in response.
  /// This helps with making sure that the connection with the server is alive and working.
  ///
  /// Timeout countdown starts from the moment the socket was opened and subsequently
  /// after every received `PongMessage`.
  ///
  /// Note that NOTHING will happen automatically with the client if the server never
  /// responds to a `PingMessage` with a `PongMessage`. If you want the connection to close,
  /// you should implement your own logic on top of the client. A simple example looks like this:
  ///
  /// ```js
  /// import { createClient } from 'graphql-ws';
  ///
  /// let activeSocket, timedOut;
  /// createClient({
  ///   url: 'ws://i.time.out:4000/after-5/seconds',
  ///   keepAlive: 10_000, // ping server every 10 seconds
  ///   on: {
  ///     connected: (socket) => (activeSocket = socket),
  ///     ping: (received) {
  ///       if (!received) // sent
  ///         timedOut = setTimeout(() {
  ///           if (activeSocket.readyState == WebSocket.OPEN)
  ///             activeSocket.close(4408, 'Request Timeout');
  ///         }, 5_000); // wait 5 seconds for the pong and then close the connection
  ///     },
  ///     pong: (received) {
  ///       if (received) clearTimeout(timedOut); // pong is received, clear connection close timeout
  ///     },
  ///   },
  /// });
  /// ```
  ///
  /// @default 0
  final int keepAlive;

  /// The amount of time for which the client will wait
  /// for `ConnectionAck` message.
  ///
  /// Set the value to `Infinity`, `''`, `0`, `null` or `undefined` to skip waiting.
  ///
  /// If the wait timeout has passed and the server
  /// has not responded with `ConnectionAck` message,
  /// the client will terminate the socket by
  /// dispatching a close event `4418: Connection acknowledgement timeout`
  ///
  /// @default 0
  final int connectionAckWaitTimeout;

  /// Disable sending the `PongMessage` automatically.
  ///
  /// Useful for when integrating your own custom client pinger that performs
  /// custom actions before responding to a ping, or to pass along the optional pong
  /// message payload. Please check the readme recipes for a concrete example.
  final bool disablePong;

  /// How many times should the client try to reconnect on abnormal socket closure before it errors out?
  ///
  /// The library classifies the following close events as fatal:
  /// - _All internal WebSocket fatal close codes (check `isFatalInternalCloseCode` in `src/client.ts` for exact list)_
  /// - `4500: Internal server error`
  /// - `4005: Internal client error`
  /// - `4400: Bad request`
  /// - `4004: Bad response`
  /// - `4401: Unauthorized` _tried subscribing before connect ack_
  /// - `4406: Subprotocol not acceptable`
  /// - `4409: Subscriber for <id> already exists` _distinction is very important_
  /// - `4429: Too many initialisation requests`
  ///
  /// These events are reported immediately and the client will not reconnect.
  ///
  /// @default 5
  final int retryAttempts;

  /// Control the wait time between retries. You may implement your own strategy
  /// by timing the resolution of the returned promise with the retries count.
  /// `retries` argument counts actual connection attempts, so it will begin with
  /// 0 after the first retryable disconnect.
  ///
  /// @default Randomised exponential backoff
  final Future<void> Function(int retries) retryWait;

  /// Check if the close event or connection error is fatal. If you return `true`,
  /// the client will fail immediately without additional retries; however, if you
  /// return `false`, the client will keep retrying until the `retryAttempts` have
  /// been exceeded.
  ///
  /// The argument is either a WebSocket `CloseEvent` or an error thrown during
  /// the connection phase.
  ///
  /// Beware, the library classifies a few close events as fatal regardless of
  /// what is returned. They are listed in the documentation of the `retryAttempts`
  /// option.
  ///
  /// @default Non close events
  final bool Function(Object errOrCloseEvent) isFatalConnectionProblem;

  /// Register listeners before initialising the client. This way
  /// you can ensure to catch all client relevant emitted events.
  ///
  /// The listeners passed in will **always** be the first ones
  /// to get the emitted event before other registered listeners.
  final Map<Event, Function>? on;

  /// A custom WebSocket implementation to use instead of the
  /// one provided by the global scope. Mostly useful for when
  /// using the client outside of the browser environment.
  // final Object? webSocketImpl;

  /// A custom ID generator for identifying subscriptions.
  ///
  /// The default generates a v4 UUID to be used as the ID using `Math`
  /// as the random number generator. Supply your own generator
  /// in case you need more uniqueness.
  ///
  /// Reference: https://gist.github.com/jed/982883
  final String Function() generateID;

  // /// An optional override for the JSON.parse function used to hydrate
  // /// incoming messages to this client. Useful for parsing custom datatypes
  // /// out of the incoming JSON.
  // final JSONMessageReviver? jsonMessageReviver;

  // /// An optional override for the JSON.stringify function used to serialize
  // /// outgoing messages from this client. Useful for serializing custom
  // /// datatypes out to the client.
  // final JSONMessageReplacer? jsonMessageReplacer;

  // TODO: use parser and serializer
  /// Serializer used to serialize requests.
  final RequestSerializer serializer;

  // TODO: use parser and serializer
  /// Response parser.
  final ResponseParser parser;

  /// A function that encodes the request message to json string before sending it over the network.
  final FutureOr<Object> Function(Message message) graphQLSocketMessageEncoder;

  static String defaultGraphQLSocketMessageEncoder(Message message) =>
      json.encode(message);

  /// A function that decodes the incoming http response to `Map<String, dynamic>`,
  /// the decoded map will be then passes to the `RequestSerializer`.
  /// It is recommended for performance to decode the response using `compute` function.
  /// ```
  /// graphQLSocketMessageDecoder : (dynamic message) async => await compute(jsonDecode, message as String) as Map<String, dynamic>,
  /// ```
  final GraphQLSocketMessageDecoder graphQLSocketMessageDecoder;

  static Map<String, dynamic>? defaultGraphQLSocketMessageDecoder(
          dynamic message) =>
      json.decode(message as String) as Map<String, dynamic>?;

  const ClientOptions({
    required this.socketMaker,
    this.connectionParams,
    this.lazy = true,
    this.onNonLazyError = print,
    this.lazyCloseTimeout = 0,
    this.keepAlive = 0,
    this.connectionAckWaitTimeout = 0,
    this.disablePong = false,
    this.retryAttempts = 0,
    this.retryWait = randomisedExponentialBackoff,
    this.isFatalConnectionProblem = isFatalConnectionProblemDefault,
    this.on,
    this.generateID = generateUUID,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.graphQLSocketMessageEncoder = defaultGraphQLSocketMessageEncoder,
    this.graphQLSocketMessageDecoder = defaultGraphQLSocketMessageDecoder,
  });

  // ChannelGenerator? channelGenerator,

  static final _random = Random();

  static Future<void> randomisedExponentialBackoff(int retries) async {
    int retryDelay = 1000; // start with 1s delay
    for (int i = 0; i < retries; i++) {
      retryDelay *= 2;
    }
    await Future<void>.delayed(
      Duration(
        milliseconds: retryDelay +
            // add random timeout from 300ms to 3s
            (_random.nextDouble() * (3000 - 300) + 300).floor(),
      ),
    );
  }

  static bool isFatalConnectionProblemDefault(Object errOrCloseEvent) =>
      // non `CloseEvent`s are fatal by default
      errOrCloseEvent is! LikeCloseEvent;

  /// Generates a v4 UUID to be used as the ID using `Math`
  /// as the random number generator. Supply your own generator
  /// in case you need more uniqueness.
  ///
  /// Reference: https://gist.github.com/jed/982883
  static String generateUUID() => "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
          .replaceAllMapped(RegExp("[xy]"), (c) {
        final int r = (_random.nextDouble() * 16).floor() | 0;
        final v = c.group(0) == "x" ? r : (r & 0x3) | 0x8;
        return v.toRadixString(16);
      });
}

class _Connected {
  final WebSocketChannel socket;
  final Future<void> throwOnClose;

  _Connected(
    this.socket,
    this.throwOnClose,
  );
}

/// @category Client */
abstract class Client {
  ClientOptions get options;

  /// Listens on the client which dispatches events about the socket state.
  void Function() on(Event event, Function listener);

  /// Subscribes through the WebSocket following the config parameters. It
  /// uses the `sink` to emit received data or errors. Returns a _cleanup_
  /// function used for dropping the subscription and cleaning stuff up.
  void Function() subscribe(
    SubscribePayload payload,
    EventSink<ExecutionResult> sink,
  );

  /// Terminates the WebSocket abruptly and immediately.
  ///
  /// A close event `4499: Terminated` is issued to the current WebSocket and an
  /// artificial `{ code: 4499, reason: 'Terminated', wasClean: false }` close-event-like
  /// object is immediately emitted without waiting for the one coming from `WebSocket.onclose`.
  ///
  /// Terminating is not considered fatal and a connection retry will occur as expected.
  ///
  /// Useful in cases where the WebSocket is stuck and not emitting any events;
  /// can happen on iOS Safari, see: https://github.com/enisdenjo/graphql-ws/discussions/290.
  void terminate();

  Future<void> dispose();
}

class _ConnectionState {
  _ConnectionState({required this.emitter, required this.options}) {
    // in non-lazy (hot?) mode always hold one connection lock to persist the socket
    if (!options.lazy) {
      (() async {
        locks++;
        for (;;) {
          try {
            final throwOnClose = (await connect()).waitForReleaseOrThrowOnClose;
            await throwOnClose; // will always throw because releaser is not used
          } catch (errOrCloseEvent) {
            try {
              if (!shouldRetryConnectOrThrow(errOrCloseEvent)) return;
            } catch (errOrCloseEvent) {
              // report thrown error, no further retries
              return options.onNonLazyError?.call(errOrCloseEvent);
            }
          }
        }
      })();
    }
  }

  final _Emitter emitter;
  final ClientOptions options;

  Future<_Connected>? connecting;
  int locks = 0;
  bool retrying = false;
  int retries = 0;
  bool disposed = false;

  // TODO:
  bool isOpen = false;

  /// Checks the `connect` problem and evaluates if the client should retry.
  bool shouldRetryConnectOrThrow(Object errOrCloseEvent) {
    // some close codes are worth reporting immediately
    if (errOrCloseEvent is LikeCloseEvent &&
        (_isFatalInternalCloseCode(errOrCloseEvent.code) ||
            [
              CloseCode.internalServerError,
              CloseCode.internalClientError,
              CloseCode.badRequest,
              CloseCode.badResponse,
              CloseCode.unauthorized,
              // CloseCode.Forbidden, might grant access out after retry
              CloseCode.subprotocolNotAcceptable,
              // CloseCode.ConnectionInitialisationTimeout, might not time out after retry
              // CloseCode.ConnectionAcknowledgementTimeout, might not time out after retry
              CloseCode.subscriberAlreadyExists,
              CloseCode.tooManyInitialisationRequests,
              // 4499, // Terminated, probably because the socket froze, we want to retry
            ].contains(errOrCloseEvent.code))) {
      throw errOrCloseEvent;
    }

    // client was disposed, no retries should proceed regardless
    if (disposed) return false;

    // normal closure (possibly all subscriptions have completed)
    // if no locks were acquired in the meantime, shouldnt try again
    if (errOrCloseEvent is LikeCloseEvent && errOrCloseEvent.code == 1000) {
      return locks > 0;
    }

    // retries are not allowed or we tried to many times, report error
    if (options.retryAttempts == 0 || retries >= options.retryAttempts) {
      throw errOrCloseEvent;
    }

    // throw fatal connection problems immediately
    if (options.isFatalConnectionProblem(errOrCloseEvent)) {
      throw errOrCloseEvent;
    }

    // looks good, start retrying
    return retrying = true;
  }

  // invokes the callback either when an error or closed event is emitted,
  // first one that gets called prevails, other emissions are ignored
  void errorOrClosed(void Function(Object errOrEvent) cb) {
    final listening = <void Function()>[];
    listening.addAll([
      // errors are fatal and more critical than close events, throw them first
      emitter.on(Event.error, (Object err) {
        listening.forEach((unlisten) => unlisten());
        cb(err);
      }),
      // closes can be graceful and not fatal, throw them second (if error didnt throw)
      emitter.on(Event.closed, (Object event) {
        listening.forEach((unlisten) => unlisten());
        cb(event);
      }),
    ]);
  }

  Future<_Connected> _startConnecting() {
    final _comp = Completer<_Connected>();
    final connected = _comp.complete;
    final denied = _comp.completeError;
    _log("_startConnecting");

    // ignore: unawaited_futures
    (() async {
      if (retrying) {
        await options.retryWait(retries);

        // subscriptions might complete while waiting for retry
        if (locks == 0) {
          connecting = null;
          return denied(
              LikeCloseEvent(code: 1000, reason: "All Subscriptions Gone"));
        }

        retries++;
      }

      emitter.emit(Event.connecting);
      final WebSocketChannel socket;
      if (options.socketMaker.url != null) {
        socket = WebSocketChannel.connect(
          Uri.parse(await options.socketMaker.url!()),
          protocols: [graphQLTransportWSProtocol],
        );
      } else {
        socket = await options.socketMaker.generator!();
      }

      Timer? connectionAckTimeout;
      Timer? queuedPing;
      void enqueuePing() {
        if (options.keepAlive.isFinite && options.keepAlive > 0) {
          queuedPing
              ?.cancel(); // in case where a pong was received before a ping (this is valid behaviour)
          queuedPing =
              Timer(Duration(milliseconds: options.keepAlive), () async {
            final _pingMsg =
                await options.graphQLSocketMessageEncoder(PingMessage(null));
            if (isOpen) {
              socket.sink.add(_pingMsg);
              emitter.emit(Event.ping, [false, null]);
            }
          });
        }
      }

      void Function(Object)? onError =
          (Object err) => emitter.emit(Event.error, [err]);
      void Function(Object?)? onClose =
          (Object? event) => emitter.emit(Event.closed, [event]);
      errorOrClosed((errOrEvent) {
        _log("errorOrClosed $errOrEvent");
        connecting = null;
        isOpen = false;
        connectionAckTimeout?.cancel();
        queuedPing?.cancel();
        if (!_comp.isCompleted) {
          denied(errOrEvent);
        }

        if (errOrEvent is LikeCloseEvent && errOrEvent.code == 4499) {
          // close event is artificial and emitted manually, see `Client.terminate()` below
          socket.sink.close(4499, "Terminated");
          onError = null;
          onClose = null;
        }
      });

      void onOpen() async {
        if (isOpen) return;
        _log("onOpen");
        isOpen = true;
        try {
          emitter.emit(Event.opened, [socket]);
          final payload = options.connectionParams == null
              ? null
              : await options.connectionParams!();

          final _initMsg = await options.graphQLSocketMessageEncoder(
            ConnectionInitMessage(payload),
          );
          // connectionParams might take too long causing the server to kick off the client
          // the necessary error/close event is already reported - simply stop execution
          if (!isOpen) return;

          socket.sink.add(_initMsg);

          if (options.connectionAckWaitTimeout.isFinite &&
              options.connectionAckWaitTimeout > 0) {
            connectionAckTimeout = Timer(
                Duration(milliseconds: options.connectionAckWaitTimeout), () {
              _log("connectionAckTimeout");
              isOpen = false;
              socket.sink.close(
                closeCodeInteger(CloseCode.connectionAcknowledgementTimeout),
                "Connection acknowledgement timeout",
              );
            });
          }

          enqueuePing(); // enqueue ping (noop if disabled)
        } catch (err) {
          emitter.emit(Event.error, [err]);
          await socket.sink.close(
            closeCodeInteger(CloseCode.internalClientError),
            limitCloseReason(
              err.toString(),
              "Internal client error",
            ),
          );
        }
      }

      bool acknowledged = false;
      late final StreamSubscription _messageSubs;
      _messageSubs = socket.stream.listen(
        (Object? msg) async {
          _log("socket.stream msg protocol:${socket.protocol} msg:${msg}");
          try {
            final messageMap = await options.graphQLSocketMessageDecoder(msg);
            final message = parseMessage(messageMap!);
            // parseMessage(msg!, reviver: options.jsonMessageReviver);
            emitter.emit(Event.message, [message]);
            if (message is PingMessage || message is PongMessage) {
              final msgPayload = message is PingMessage
                  ? message.payload
                  : (message as PongMessage).payload;
              emitter.emit(
                message is PingMessage ? Event.ping : Event.pong,
                [true, msgPayload],
              ); // received

              if (message is PongMessage) {
                enqueuePing(); // enqueue next ping (noop if disabled)
              } else if (!options.disablePong) {
                // respond with pong on ping
                socket.sink.add(
                  await options
                      .graphQLSocketMessageEncoder(PongMessage(msgPayload)),
                );
                emitter.emit(Event.pong, [false, msgPayload]);
              }
              return; // ping and pongs can be received whenever
            }
            if (acknowledged) return; // already connected and acknowledged

            if (message is! ConnectionAckMessage) {
              throw Exception(
                "First message cannot be of type ${message.type}",
              );
            }
            connectionAckTimeout?.cancel();
            acknowledged = true;
            emitter.emit(Event.connected, [
              socket,
              message.payload
            ]); // connected = socket opened + acknowledged
            retrying = false; // future lazy connects are not retries
            retries = 0; // reset the retries on connect
            final _completer = Completer<void>();
            errorOrClosed(_completer.completeError);
            connected(_Connected(
              socket,
              _completer.future,
            ));
          } catch (err) {
            // stop reading messages as soon as reading breaks once
            // ignore: unawaited_futures
            _messageSubs.cancel();
            emitter.emit(Event.error, [err]);
            // ignore: unawaited_futures
            socket.sink.close(
              closeCodeInteger(CloseCode.badResponse),
              limitCloseReason(err.toString(), "Bad response"),
            );
          }
        },
        // TODO: close event?
        onDone: () => onClose?.call("DONE"),
        onError: (Object err) => onError?.call(err),
      );

      // TODO: listen to open event on WebSocketChannel
      onOpen();
    })();
    return _comp.future;
  }

  Future<_Connection> connect() async {
    connecting ??= _startConnecting();
    final _connection = await connecting!;

    _log("_connection");

    final socket = _connection.socket;
    final throwOnClose = _connection.throwOnClose;

    // if the provided socket is in a closing state, wait for the throw on close
    // TODO:
    // if (socket.readyState == WebSocketImpl.CLOSING) await throwOnClose;

    final _releaseComp = Completer<void>();
    final void Function() release = _releaseComp.complete;
    final released = _releaseComp.future;

    return _Connection(
      socket: socket,
      release: release,
      waitForReleaseOrThrowOnClose: Future.any([
        // wait for
        released.then((_) {
          if (locks == 0) {
            // and if no more locks are present, complete the connection
            final complete = () {
              isOpen = false;
              socket.sink.close(1000, "Normal Closure");
            };
            if (options.lazyCloseTimeout.isFinite &&
                options.lazyCloseTimeout > 0) {
              // if the keepalive is set, allow for the specified calmdown time and
              // then complete. but only if no lock got created in the meantime and
              // if the socket is still open
              Future.delayed(
                Duration(milliseconds: options.lazyCloseTimeout),
                () {
                  if (locks == 0 && isOpen) {
                    complete();
                  }
                },
              );
            } else {
              // otherwise complete immediately
              complete();
            }
          }
        }),
        // or
        throwOnClose,
      ]),
    );
  }
}

class _Client extends Client {
  _Client({required this.state});

  final _ConnectionState state;
  _Emitter get emitter => state.emitter;
  @override
  ClientOptions get options => state.options;

  @override
  void Function() on(Event event, Function listener) =>
      emitter.on(event, listener);

  @override
  void Function() subscribe(
    SubscribePayload payload,
    EventSink<ExecutionResult> sink,
  ) {
    final id = options.generateID();
    _log("subscribe $id");

    bool done = false;
    bool errored = false;
    Function() releaser = () {
      // for handling completions before connect
      state.locks--;
      done = true;
    };

    (() async {
      state.locks++;
      for (;;) {
        try {
          final _c = await state.connect();
          final socket = _c.socket;
          final release = _c.release;
          final waitForReleaseOrThrowOnClose = _c.waitForReleaseOrThrowOnClose;

          // if done while waiting for connect, release the connection lock right away
          final _subscribeMsg = await options
              .graphQLSocketMessageEncoder(SubscribeMessage(id, payload));
          if (done) return release();

          final unlisten = emitter.onMessage(id, (message) {
            if (message is NextMessage) {
              sink.add(message.payload);
              return;
            } else if (message is ErrorMessage) {
              errored = true;
              done = true;
              sink.addError(message.payload);
              releaser();
              return;
            }
            if (message is CompleteMessage) {
              done = true;
              releaser(); // release completes the sink
              return;
            }
          });

          socket.sink.add(_subscribeMsg);

          releaser = () async {
            final _completeMsg =
                await options.graphQLSocketMessageEncoder(CompleteMessage(id));
            if (!done && state.isOpen) {
              // if not completed already and socket is open, send complete message to server on release
              socket.sink.add(_completeMsg);
            }
            state.locks--;
            done = true;
            release();
          };

          // either the releaser will be called, connection completed and
          // the promise resolved or the socket closed and the promise rejected.
          // whatever happens though, we want to stop listening for messages
          await waitForReleaseOrThrowOnClose.whenComplete(unlisten);

          return; // completed, shouldnt try again
        } catch (errOrCloseEvent) {
          if (!state.shouldRetryConnectOrThrow(errOrCloseEvent)) return;
        }
      }
    })()
        .then((_) {
      // delivering either an error or a complete terminates the sequence
      if (!errored) sink.close();
    }) // resolves on release or normal closure
        .onError<Object>((err, stackTrace) {
      sink.addError(err, stackTrace);
    }); // rejects on close events and errors

    return () {
      // dispose only of active subscriptions
      if (!done) releaser();
    };
  }

  @override
  Future<void> dispose() async {
    _log("dispose");
    state.disposed = true;
    if (state.connecting != null) {
      // if there is a connection, close it
      final socket = (await state.connecting!).socket;
      await socket.sink.close(1000, "Normal Closure");
    }
  }

  @override
  void terminate() {
    _log("terminate");
    if (state.connecting != null) {
      // only if there is a connection
      emitter.emit(
        Event.closed,
        [
          LikeCloseEvent(
            code: 4499,
            reason: "Terminated",
            wasClean: false,
          ),
        ],
      );
    }
  }
}

class _Connection {
  final WebSocketChannel socket;
  final void Function() release;
  final Future<void> waitForReleaseOrThrowOnClose;

  _Connection({
    required this.socket,
    required this.release,
    required this.waitForReleaseOrThrowOnClose,
  });
}

class _Emitter {
  final Map<Event, List<Function>> listeners;
  final void Function() Function(String id, void Function(Message) listener)
      onMessage;
  _Emitter({
    required this.listeners,
    required this.onMessage,
  });

  void Function() on<E extends Event>(E event, Function listener) {
    final l = listeners[event] as List<Function>;
    l.add(listener);
    return () {
      l.remove(listener);
    };
  }

  void emit(Event event, [List<Object?>? args]) {
    _log("emit $event ($args)");
    // we copy the listeners so that unlistens dont "pull the rug under our feet"
    for (final listener in [...listeners[event]!]) {
      // @ts-expect-error: The args should fit
      Function.apply(listener, args);
    }
  }
}

/// Creates a disposable GraphQL over WebSocket client.
///
/// @category Client
Client createClient(ClientOptions options) {
  // var ws;
  // if (webSocketImpl) {
  //   if (!_isWebSocket(webSocketImpl)) {
  //     throw Exception("Invalid WebSocket implementation provided");
  //   }
  //   ws = webSocketImpl;
  // } else if (typeof WebSocket != 'undefined') {
  //   ws = WebSocket;
  // } else if (typeof global != 'undefined') {
  //   ws =
  //     global.WebSocket ||
  //     // @ts-expect-error: Support more browsers
  //     global.MozWebSocket;
  // } else if (typeof window != 'undefined') {
  //   ws =
  //     window.WebSocket ||
  //     // @ts-expect-error: Support more browsers
  //     window.MozWebSocket;
  // }
  // if (!ws){
  //   throw Exception(
  //     "WebSocket implementation missing; on Node you can `import WebSocket from 'ws';` and pass `webSocketImpl: WebSocket` to `createClient`",
  //   );}
  // final WebSocketImpl = ws;

  // websocket status emitter, subscriptions are handled differently
  final emitter = (() {
    final Map<String, EventMessageListener> _listenersMessage = {};
    void Function() onMessage(String id, EventMessageListener listener) {
      _listenersMessage[id] = listener;
      return () {
        _listenersMessage.remove(id);
      };
    }

    void emitMessage(Message message) {
      _listenersMessage[message.id]?.call(message);
    }

    final on = options.on;

    final Map<Event, List<Function>> listeners = Map.fromIterables(
      Event.values,
      Event.values.map((e) => on?[e] != null ? [on![e]!] : []),
    );
    listeners[Event.message]!.insert(0, emitMessage);
    // {
    //   Event.connecting: on?.connecting != null ? [on.connecting] : [],
    //   Event.opened: on?.opened != null ? [on.opened] : [],
    //   Event.connected: on?.connected != null ? [on.connected] : [],
    //   Event.ping: on?.ping != null ? [on.ping] : [],
    //   Event.pong: on?.pong != null ? [on.pong] : [],
    //   Event.message: on?.message != null ? [emitMessage, on.message] : [emitMessage],
    //   Event.closed: on?.closed != null ? [on.closed] : [],
    //   Event.error: on?.error != null ? [on.error] : [],
    // };

    return _Emitter(
      onMessage: onMessage,
      listeners: listeners,
    );
  })();

  final state = _ConnectionState(
    emitter: emitter,
    options: options,
  );
  return _Client(state: state);
}

/// Minimal close event interface required by the lib for error and socket close handling. */
class LikeCloseEvent {
  /// Returns the WebSocket connection close code provided by the server. */
  final int code;

  /// Returns the WebSocket connection close reason provided by the server. */
  final String reason;

  final bool? wasClean;

  LikeCloseEvent({
    required this.code,
    required this.reason,
    this.wasClean,
  });
}

// bool _isLikeCloseEvent(dynamic val)=>  val is Map && val.containsKey("code") && val.containsKey("reason");

bool _isFatalInternalCloseCode(int code) {
  if (const [
    1000, // Normal Closure is not an erroneous close code
    1001, // Going Away
    1006, // Abnormal Closure
    1005, // No Status Received
    1012, // Service Restart
    1013, // Try Again Later
    1013, // Bad Gateway
  ].contains(code)) {
    return false;
  }
  // all other internal errors are fatal
  return code >= 1000 && code <= 1999;
}

// bool _isWebSocket(dynamic val)=>
//     val is 'function' &&
//     'constructor' in val &&
//     'CLOSED' in val &&
//     'CLOSING' in val &&
//     'CONNECTING' in val &&
//     'OPEN' in val
//   ;

class GQLTransportWebSocketLink extends Link {
  GQLTransportWebSocketLink(ClientOptions options)
      : client = createClient(options);
  final Client client;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final controller = StreamController<ExecutionResult>();
    void Function()? cancelSub;
    controller.onListen = () {
      final payload = SubscribePayload(
        query: printNode(request.operation.document),
        variables: request.variables,
        operationName: request.operation.operationName,
        extensions: request.context
            .entry<RequestExtensionsThunk>()
            ?.getRequestExtensions(request) as Map<String, Object?>?,
      );
      cancelSub = client.subscribe(payload, controller.sink);
    };

    controller.onCancel = () {
      cancelSub?.call();
      cancelSub = null;
    };

    return controller.stream.map(
      (event) => Response(
        context: event.extensions == null
            ? const Context()
            : const Context().withEntry(ResponseExtensions(event.extensions)),
        response: event.rawResponse,
        data: event.data,
        errors: event.errors,
      ),
    );
  }
}
