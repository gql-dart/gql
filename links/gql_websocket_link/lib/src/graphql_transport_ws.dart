import "dart:async";
import "dart:convert" show jsonDecode, jsonEncode;
import "dart:math" show Random;

import "package:gql_exec/gql_exec.dart" show Request, Response;
import "package:gql_link/gql_link.dart"
    show Link, NextLink, RequestSerializer, ResponseParser;
import "package:gql_websocket_link/src/exceptions.dart"
    show WebSocketLinkParserException, WebSocketLinkServerException;
import "package:gql_websocket_link/src/messages.dart" show ConnectionAck;
import "package:web_socket_channel/web_socket_channel.dart"
    show WebSocketChannel;

import "link.dart" show ChannelGenerator, GraphQLSocketMessageDecoder;
import "transport_ws_common.dart";

enum TransportWsEventType {
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

/// An event dispatched by the [TransportWsClient].
class TransportWsEvent {
  /// The type of the event.
  final TransportWsEventType type;
  final WebSocketChannel? socket;
  final Map<String, Object?>? payload;
  final bool? received;
  final TransportWsMessage? message;
  final Object? event;

  /// Executes the handler for the current event type.
  T? execute<T>(TransportWsEventHandler<T> handler) {
    switch (type) {
      case TransportWsEventType.connecting:
        return handler.connecting?.call();
      case TransportWsEventType.opened:
        return handler.opened?.call(socket!);
      case TransportWsEventType.connected:
        return handler.connected?.call(socket!, payload);
      case TransportWsEventType.ping:
        return handler.ping?.call(payload, received: received!);
      case TransportWsEventType.pong:
        return handler.pong?.call(payload, received: received!);
      case TransportWsEventType.message:
        return handler.message?.call(message!);
      case TransportWsEventType.closed:
        return handler.closed?.call(event!);
      case TransportWsEventType.error:
        return handler.error?.call(event!);
    }
  }

  const TransportWsEvent.connecting()
      : type = TransportWsEventType.connecting,
        socket = null,
        payload = null,
        received = null,
        message = null,
        event = null;
  const TransportWsEvent.opened(WebSocketChannel this.socket)
      : type = TransportWsEventType.opened,
        payload = null,
        received = null,
        message = null,
        event = null;
  const TransportWsEvent.connected(
    WebSocketChannel this.socket,
    this.payload,
  )   : type = TransportWsEventType.connected,
        received = null,
        message = null,
        event = null;

  const TransportWsEvent.ping(
    this.payload, {
    required bool this.received,
  })  : type = TransportWsEventType.ping,
        socket = null,
        message = null,
        event = null;
  const TransportWsEvent.pong(
    this.payload, {
    required bool this.received,
  })  : type = TransportWsEventType.pong,
        socket = null,
        message = null,
        event = null;

  const TransportWsEvent.message(TransportWsMessage this.message)
      : type = TransportWsEventType.message,
        payload = null,
        received = null,
        socket = null,
        event = null;
  const TransportWsEvent.closed(Object this.event)
      : type = TransportWsEventType.closed,
        payload = null,
        received = null,
        message = null,
        socket = null;
  const TransportWsEvent.error(Object this.event)
      : type = TransportWsEventType.error,
        payload = null,
        received = null,
        message = null,
        socket = null;
}

/// A class that handles events dispatched by the [TransportWsClient].
class TransportWsEventHandler<T> {
  /// Executed when the client is staring a connection
  final T? Function()? connecting;

  /// The first argument is actually the `WebSocket`, but to avoid
  /// bundling DOM typings because the client can run in Node env too,
  /// you should assert the websocket type during implementation.
  final T? Function(WebSocketChannel socket)? opened;

  /// The first argument is actually the `WebSocket`, but to avoid
  /// bundling DOM typings because the client can run in Node env too,
  /// you should assert the websocket type during implementation.
  ///
  /// Also, the second argument is the optional payload that the server may
  /// send through the `ConnectionAck` message.
  final T? Function(WebSocketChannel socket, Map<String, Object?>? payload)?
      connected;

  /// The first argument communicates whether the ping was received from the server.
  /// If `false`, the ping was sent by the client.
  final T? Function(Map<String, Object?>? payload, {required bool received})?
      ping;

  /// The first argument communicates whether the pong was received from the server.
  /// If `false`, the pong was sent by the client.
  final T? Function(Map<String, Object?>? payload, {required bool received})?
      pong;

  /// Called for all **valid** messages received by the client. Mainly useful for
  /// debugging and logging received messages.
  final T? Function(TransportWsMessage message)? message;

  /// The argument is actually the websocket `CloseEvent`, but to avoid
  /// bundling DOM typings because the client can run in Node env too,
  /// you should assert the websocket type during implementation.
  final T? Function(Object event)? closed;

  /// Events dispatched from the WebSocket `onerror` are handled in this listener,
  /// as well as all internal client errors that could throw.
  final T? Function(Object event)? error;

  /// A class that handles events dispatched by the [TransportWsClient].
  const TransportWsEventHandler({
    this.connecting,
    this.opened,
    this.connected,
    this.ping,
    this.pong,
    this.message,
    this.closed,
    this.error,
  });

  /// Executes the handler for the given [event].
  T? handle(TransportWsEvent event) => event.execute(this);

  /// The [TransportWsEventType]s that this handler will handle.
  Set<TransportWsEventType> eventTypesHandled() => {
        if (connecting != null) TransportWsEventType.connecting,
        if (opened != null) TransportWsEventType.opened,
        if (connected != null) TransportWsEventType.connected,
        if (ping != null) TransportWsEventType.ping,
        if (pong != null) TransportWsEventType.pong,
        if (message != null) TransportWsEventType.message,
        if (closed != null) TransportWsEventType.closed,
        if (error != null) TransportWsEventType.error,
      };
}

/// Called for all **valid** messages received by the client. Mainly useful for
/// debugging and logging received messages.
///
/// @category Client
typedef _EventMessageListener = void Function(TransportWsMessage message);

/// Creates a [WebSocketChannel] from a URL or a [ChannelGenerator].
class WebSocketMaker {
  /// A function that returns the URL of the GraphQL server.
  /// Will be used to create the [WebSocketChannel].
  final FutureOr<String> Function()? url;

  /// A generator that will be used to create the [WebSocketChannel].
  final ChannelGenerator? generator;

  /// A function that returns the URL of the GraphQL server.
  /// Will be used to create the [WebSocketChannel].
  const WebSocketMaker.url(FutureOr<String> Function() this.url)
      : generator = null;

  /// A generator that will be used to create the [WebSocketChannel].
  const WebSocketMaker.generator(ChannelGenerator this.generator) : url = null;
}

/// Configuration used for the GraphQL over WebSocket client.
///
/// @category Client
class TransportWsClientOptions {
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
  /// @default [print]
  final void Function(Object? errorOrCloseEvent)? onNonLazyError;

  /// How long should the client wait before closing the socket after the last oparation has
  /// completed. This is meant to be used in combination with `lazy`. You might want to have
  /// a calmdown time before actually closing the connection. Kinda' like a lazy close "debounce".
  ///
  /// @default [Duration.zero] // close immediately
  final Duration lazyCloseTimeout;

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
  /// @default [Duration.zero]
  final Duration keepAlive;

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
  /// @default [Duration.zero]
  final Duration connectionAckWaitTimeout;

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
  /// @default [randomizedExponentialBackoff]
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
  /// @default [isFatalConnectionProblemDefault] Non close events
  final bool Function(Object errOrCloseEvent) isFatalConnectionProblem;

  /// Register listeners before initialising the client. This way
  /// you can ensure to catch all client relevant emitted events.
  ///
  /// The listeners passed in will **always** be the first ones
  /// to get the emitted event before other registered listeners.
  final List<TransportWsEventHandler>? eventHandlers;

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
  ///
  /// @default [generateUUID]
  final String Function() generateID;

  /// Serializer used to serialize [Request]s.
  final RequestSerializer serializer;

  /// Parses [Response]s from the Web Socket message.
  final ResponseParser parser;

  /// A function that encodes the request message to json string before sending it over the network.
  final FutureOr<Object> Function(TransportWsMessage message)
      graphQLSocketMessageEncoder;

  /// The default [graphQLSocketMessageEncoder] that encodes the request message to json string.
  static String defaultGraphQLSocketMessageEncoder(
          TransportWsMessage message) =>
      jsonEncode(message);

  /// A function that decodes the incoming http response to `Map<String, dynamic>`,
  /// the decoded map will be then passes to the `RequestSerializer`.
  /// It is recommended for performance to decode the response using `compute` function.
  /// ```dart
  /// graphQLSocketMessageDecoder : (dynamic message) async => await compute(jsonDecode, message as String) as Map<String, dynamic>,
  /// ```
  final GraphQLSocketMessageDecoder graphQLSocketMessageDecoder;

  /// The default [graphQLSocketMessageDecoder] that decodes the request message from a json string.
  static Map<String, dynamic>? defaultGraphQLSocketMessageDecoder(
          dynamic message) =>
      jsonDecode(message as String) as Map<String, dynamic>?;

  /// A function that logs events within the execution of the [TransportWsClient].
  /// Useful for debugging.
  final void Function(String logMessage)? log;

  /// Options for a [TransportWsClient] instance.
  const TransportWsClientOptions({
    required this.socketMaker,
    this.connectionParams,
    this.lazy = true,
    this.onNonLazyError = print,
    this.lazyCloseTimeout = Duration.zero,
    this.keepAlive = Duration.zero,
    this.connectionAckWaitTimeout = Duration.zero,
    this.disablePong = false,
    this.retryAttempts = 0,
    this.retryWait = randomizedExponentialBackoff,
    this.isFatalConnectionProblem = isFatalConnectionProblemDefault,
    this.eventHandlers,
    this.generateID = generateUUID,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.graphQLSocketMessageEncoder = defaultGraphQLSocketMessageEncoder,
    this.graphQLSocketMessageDecoder = defaultGraphQLSocketMessageDecoder,
    this.log,
  });

  static final _random = Random();

  /// Start with 1s delay and adds random timeout from 300ms to 3s
  static Future<void> randomizedExponentialBackoff(int retries) async {
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

  /// non `CloseEvent`s are fatal by default
  static bool isFatalConnectionProblemDefault(Object errOrCloseEvent) =>
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
abstract class TransportWsClient {
  /// The options used to create the client.
  TransportWsClientOptions get options;

  /// Listens on the client which dispatches events about the socket state.
  void Function() on(TransportWsEventHandler listener);

  /// Subscribes through the WebSocket following the config parameters. It
  /// uses the `sink` to emit received data or errors. Returns a _cleanup_
  /// function used for dropping the subscription and cleaning stuff up.
  void Function() subscribe(
    Request payload,
    EventSink<Response> sink,
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

  /// Closes the WebSocket gracefully.
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
  final TransportWsClientOptions options;

  Future<_Connected>? connecting;
  int locks = 0;
  bool retrying = false;
  int retries = 0;
  bool disposed = false;

  // TODO: WebSocketChannel should have a `state` getter and `onStateChange` stream
  bool isOpen = false;

  /// Checks the `connect` problem and evaluates if the client should retry.
  bool shouldRetryConnectOrThrow(Object errOrCloseEvent) {
    options.log?.call("shouldRetryConnectOrThrow $errOrCloseEvent");
    // some close codes are worth reporting immediately
    if (errOrCloseEvent is LikeCloseEvent &&
        (_isFatalInternalCloseCode(errOrCloseEvent.code) ||
            const [
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
      emitter.on(TransportWsEventHandler<void>(
        // errors are fatal and more critical than close events, throw them first
        error: (Object err) {
          listening.forEach((unlisten) => unlisten());
          cb(err);
        },
        // closes can be graceful and not fatal, throw them second (if error didnt throw)
        closed: (Object event) {
          listening.forEach((unlisten) => unlisten());
          cb(event);
        },
      )),
    ]);
  }

  Future<_Connected> _startConnecting() {
    final _comp = Completer<_Connected>();
    final connected = _comp.complete;
    final denied = _comp.completeError;
    options.log?.call("_startConnecting");

    (() async {
      if (retrying) {
        await options.retryWait(retries);

        // subscriptions might complete while waiting for retry
        if (locks == 0) {
          connecting = null;
          return denied(
            LikeCloseEvent(code: 1000, reason: "All Subscriptions Gone"),
          );
        }

        retries++;
      }

      emitter.emit(const TransportWsEvent.connecting());
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
        if (options.keepAlive.inMicroseconds > 0) {
          queuedPing
              ?.cancel(); // in case where a pong was received before a ping (this is valid behaviour)
          queuedPing = Timer(options.keepAlive, () async {
            final _pingMsg =
                await options.graphQLSocketMessageEncoder(PingMessage(null));
            if (isOpen) {
              socket.sink.add(_pingMsg);
              emitter.emit(TransportWsEvent.ping(null, received: false));
            }
          });
        }
      }

      void Function(Object)? onError =
          (Object err) => emitter.emit(TransportWsEvent.error(err));
      void Function(Object)? onClose =
          (Object event) => emitter.emit(TransportWsEvent.closed(event));
      errorOrClosed((errOrEvent) {
        options.log?.call("errorOrClosed $errOrEvent");
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
        options.log?.call("onOpen");
        isOpen = true;
        try {
          emitter.emit(TransportWsEvent.opened(socket));
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

          if (options.connectionAckWaitTimeout.inMicroseconds > 0) {
            connectionAckTimeout = Timer(options.connectionAckWaitTimeout, () {
              options.log?.call("connectionAckTimeout");
              isOpen = false;
              socket.sink.close(
                closeCodeInteger(CloseCode.connectionAcknowledgementTimeout),
                "Connection acknowledgement timeout",
              );
            });
          }

          enqueuePing(); // enqueue ping (noop if disabled)
        } catch (err) {
          emitter.emit(TransportWsEvent.error(err));
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
          options.log?.call(
            "socket.stream protocol:${socket.protocol} msg:${msg}",
          );
          try {
            final TransportWsMessage message;
            try {
              final messageMap = await options.graphQLSocketMessageDecoder(msg);
              message = parseMessage(messageMap!, options.parser);
            } catch (e, s) {
              throw WebSocketLinkParserException(
                // TODO: should not be ConnectionAck
                message: ConnectionAck(),
                originalException: e,
                originalStackTrace: s,
              );
            }
            // parseMessage(msg!, reviver: options.jsonMessageReviver);
            if (!isOpen) return;
            emitter.emit(TransportWsEvent.message(message));
            if (message is PingMessage || message is PongMessage) {
              final msgPayload = message is PingMessage
                  ? message.payload
                  : (message as PongMessage).payload;
              emitter.emit(
                message is PingMessage
                    ? TransportWsEvent.ping(msgPayload, received: true)
                    : TransportWsEvent.pong(msgPayload, received: true),
              ); // received

              if (message is PongMessage) {
                enqueuePing(); // enqueue next ping (noop if disabled)
              } else if (!options.disablePong) {
                // respond with pong on ping
                socket.sink.add(
                  await options
                      .graphQLSocketMessageEncoder(PongMessage(msgPayload)),
                );
                emitter
                    .emit(TransportWsEvent.pong(msgPayload, received: false));
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
            emitter.emit(TransportWsEvent.connected(
              socket,
              message.payload,
            )); // connected = socket opened + acknowledged
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
            print("_messageSubs.cancel()");
            // ignore: unawaited_futures
            _messageSubs.cancel();
            emitter.emit(TransportWsEvent.error(err));
            // ignore: unawaited_futures
            socket.sink.close(
              closeCodeInteger(CloseCode.badResponse),
              limitCloseReason(err.toString(), "Bad response"),
            );
          }
        },
        onDone: () => onClose?.call(
          socket.closeCode == null
              ? "DONE"
              : LikeCloseEvent(
                  code: socket.closeCode!,
                  reason: socket.closeReason!,
                ),
        ),
        onError: (Object err) => onError?.call(err),
      );

      // TODO: listen to open event on WebSocketChannel
      onOpen();
    })()
        .onError(
      (error, stackTrace) => denied(
        WebSocketLinkServerException(
          originalException: error,
          originalStackTrace: stackTrace,
        ),
        stackTrace,
      ),
    );
    return _comp.future;
  }

  Future<_Connection> connect() async {
    connecting ??= _startConnecting();
    final _connection = await connecting!;

    options.log?.call("_connection");

    final socket = _connection.socket;
    final throwOnClose = _connection.throwOnClose;

    // if the provided socket is in a closing state, wait for the throw on close
    // TODO: WebSocketChannel should have a `state` getter
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
            if (options.lazyCloseTimeout.inMicroseconds > 0) {
              // if the keepalive is set, allow for the specified calmdown time and
              // then complete. but only if no lock got created in the meantime and
              // if the socket is still open
              Future.delayed(
                options.lazyCloseTimeout,
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

class _Client extends TransportWsClient {
  _Client({required this.state});

  final _ConnectionState state;
  _Emitter get emitter => state.emitter;
  @override
  TransportWsClientOptions get options => state.options;

  @override
  void Function() on(TransportWsEventHandler listener) => emitter.on(listener);

  @override
  void Function() subscribe(
    Request payload,
    EventSink<Response> sink,
  ) {
    final id = options.generateID();
    options.log?.call("subscribe $id");

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
          final _subscribeMsg = await options.graphQLSocketMessageEncoder(
            SubscribeMessage(id, options.serializer.serializeRequest(payload)),
          );
          if (done) return release();

          final unlisten = emitter.onMessage(id, (message) {
            if (message is NextMessage) {
              sink.add(message.payload);
            } else if (message is ErrorMessage) {
              errored = true;
              done = true;
              sink.addError(message.payload);
              releaser();
            } else if (message is CompleteMessage) {
              done = true;
              releaser(); // release completes the sink
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
    options.log?.call("dispose");
    state.disposed = true;
    if (state.connecting != null) {
      // if there is a connection, close it
      final socket = (await state.connecting!).socket;
      await socket.sink.close(1000, "Normal Closure");
    }
  }

  @override
  void terminate() {
    options.log?.call("terminate");
    if (state.connecting != null) {
      // only if there is a connection
      emitter.emit(TransportWsEvent.closed(
        LikeCloseEvent(
          code: 4499,
          reason: "Terminated",
          wasClean: false,
        ),
      ));
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
  final Map<TransportWsEventType, List<TransportWsEventHandler>> listeners;
  final void Function() Function(
    String id,
    void Function(TransportWsMessage) listener,
  ) onMessage;
  final void Function(String logMessage)? log;
  _Emitter({
    required this.listeners,
    required this.onMessage,
    this.log,
  });

  void Function() on(TransportWsEventHandler listener) {
    final types = listener.eventTypesHandled();
    for (final event in types) {
      final l = listeners.putIfAbsent(event, () => []);
      l.add(listener);
    }
    return () {
      for (final event in types) {
        final l = listeners[event]!;
        l.remove(listener);
      }
    };
  }

  void emit(TransportWsEvent event) {
    log?.call("emit $event");
    final list = listeners[event.type];
    if (list == null) return;
    // we copy the listeners so that unlistens dont "pull the rug under our feet"
    for (final listener in [...list]) {
      // @ts-expect-error: The args should fit
      event.execute<dynamic>(listener);
    }
  }
}

/// Creates a disposable GraphQL over WebSocket client.
///
/// @category Client
TransportWsClient createClient(TransportWsClientOptions options) {
  // websocket status emitter, subscriptions are handled differently
  final emitter = (() {
    final Map<String, _EventMessageListener> _listenersMessage = {};
    void Function() onMessage(String id, _EventMessageListener listener) {
      _listenersMessage[id] = listener;
      return () {
        _listenersMessage.remove(id);
      };
    }

    void emitMessage(TransportWsMessage message) {
      _listenersMessage[message.id]?.call(message);
    }

    final Map<TransportWsEventType, List<TransportWsEventHandler>> listeners =
        Map.fromIterables(
      TransportWsEventType.values,
      TransportWsEventType.values.map((e) => []),
    );
    listeners[TransportWsEventType.message]!
        .add(TransportWsEventHandler<void>(message: emitMessage));

    final on = options.eventHandlers;
    if (on != null) {
      for (final handler in on) {
        for (final type in handler.eventTypesHandled()) {
          listeners[type]!.add(handler);
        }
      }
    }

    return _Emitter(
      onMessage: onMessage,
      listeners: listeners,
      log: options.log,
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

  @override
  String toString() =>
      "LikeCloseEvent(code: $code, reason: $reason, wasClean: $wasClean)";
}

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

class TransportWebSocketLink extends Link {
  TransportWebSocketLink(TransportWsClientOptions options)
      : client = createClient(options);
  final TransportWsClient client;

  @override
  Future<void> dispose() async {
    await super.dispose();
    await client.dispose();
  }

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final controller = StreamController<Response>();
    void Function()? cancelSub;
    controller.onListen = () {
      cancelSub = client.subscribe(request, controller.sink);
    };

    controller.onCancel = () {
      cancelSub?.call();
      cancelSub = null;
    };

    return controller.stream.map(
      (response) {
        if (response.data == null && response.errors == null) {
          throw WebSocketLinkServerException(
            parsedResponse: response,
            // TODO pass more data?
          );
        }
        return response;
      },
    );
  }
}
