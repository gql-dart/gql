import "dart:async";
import "dart:convert";
import "dart:io";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:test/test.dart";
import "package:web_socket_channel/io.dart";
import "package:web_socket_channel/status.dart" as websocket_status;
import "package:web_socket_channel/web_socket_channel.dart";

void main() {
  group("WebSocketLink", () {
    test("WebSocketLink Construction with uri isn't null", () {
      WebSocketLink(
        "",
        initialPayload: {"authorization": "Bearer 12345"},
      );
    });

    group("apollo ws sub-protocol", () {
      _testLinks(
        (
          uri, {
          channelGenerator,
          initialPayload,
          inactivityTimeout,
          autoReconnect,
          reconnectInterval,
        }) =>
            WebSocketLink(
          uri,
          channelGenerator: channelGenerator,
          initialPayload: initialPayload,
          inactivityTimeout: inactivityTimeout,
          autoReconnect: autoReconnect ?? true,
          reconnectInterval: reconnectInterval ?? const Duration(seconds: 10),
        ),
        isApolloSubProtocol: true,
      );
    });

    group("transport ws sub-protocol", () {
      // TODO: Too many initialisation requests

      // ErrorReason.duplicateSubscriptionId,
      // 'Subscriber for ${msg.id} already exists',

      _testLinks(
        (
          uri, {
          channelGenerator,
          initialPayload,
          inactivityTimeout,
          autoReconnect,
          reconnectInterval,
        }) {
          Timer? timer;
          WebSocketChannel? activeSocket;
          return TransportWebSocketLink(
            TransportWsClientOptions(
              socketMaker: uri != null
                  ? WebSocketMaker.url(() => uri)
                  : WebSocketMaker.generator(channelGenerator!),
              connectionParams: initialPayload,
              keepAlive: inactivityTimeout ?? Duration.zero,
              connectionAckWaitTimeout: inactivityTimeout ?? Duration.zero,
              retryAttempts: autoReconnect == false ? 0 : 5,
              retryWait: reconnectInterval != null
                  ? (_) => Future.delayed(reconnectInterval)
                  : TransportWsClientOptions.randomizedExponentialBackoff,
              eventHandlers: [
                if (inactivityTimeout != null)
                  TransportWsEventHandler<void>(
                    connected: (WebSocketChannel socket, Object? payload) =>
                        activeSocket = socket,
                    ping: (Object? payload, {required bool received}) {
                      if (!received) {
                        // sent
                        timer = Timer(inactivityTimeout, () {
                          // TODO:
                          if (activeSocket!.closeCode == null) {
                            activeSocket!.sink.close(4408, "Request Timeout");
                          }
                        }); // wait inactivityTimeout for the pong and then close the connection
                      }
                    },
                    pong: (Object? payload, {required bool received}) {
                      if (received) {
                        // pong is received, clear connection close timeout
                        timer?.cancel();
                      }
                    },
                  ),
              ],
            ),
          );
        },
        isApolloSubProtocol: false,
      );
    });
  });
}

void _testLinks(
  Link Function(
    String? uri, {
    FutureOr<WebSocketChannel> Function()? channelGenerator,
    FutureOr<Map<String, Object?>?>? Function()? initialPayload,
    Duration? inactivityTimeout,
    bool? autoReconnect,
    Duration? reconnectInterval,
  }) makeLink, {
  required bool isApolloSubProtocol,
}) {
  final dataMessageType = isApolloSubProtocol ? "data" : "next";
  final startMessageType = isApolloSubProtocol ? "start" : "subscribe";

  test(
    "send connection_init",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;

      request = Request(
        operation: Operation(
          operationName: "sub",
          document: parseString("subscription MySubscription {}"),
        ),
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.take(1).listen(
            expectAsync1<void, dynamic>(
              (dynamic message) {
                final map =
                    json.decode(message as String) as Map<String, dynamic>;
                expect(map["type"], MessageTypes.connectionInit);
              },
            ),
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      //
      link.request(request).listen(print);

      await server.close();
    },
  );

  test(
    "send initialPayload",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;
      final Map<String, String> initialPayload = {"data": "some data"};

      request = Request(
        operation: Operation(
          operationName: "sub",
          document: parseString("subscription MySubscription {}"),
        ),
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.take(1).listen(
            expectAsync1<void, dynamic>(
              (dynamic message) {
                final map =
                    json.decode(message as String) as Map<String, dynamic>;
                expect(map["type"], MessageTypes.connectionInit);
                expect(map["payload"], initialPayload);
              },
            ),
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(
        null,
        channelGenerator: () => channel,
        // TODO: this changed
        initialPayload: () => initialPayload,
      );
      //
      link.request(request).listen(print);

      await server.close();
    },
  );

  test(
    "send async initialPayload",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;

      final Map<String, String> baseInitialPayload = {"data": "some data"};

      final initialPayload = () => Future.value(baseInitialPayload);

      request = Request(
        operation: Operation(
          operationName: "sub",
          document: parseString("subscription MySubscription {}"),
        ),
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.take(1).listen(
            expectAsync1<void, dynamic>(
              (dynamic message) {
                final map =
                    json.decode(message as String) as Map<String, dynamic>;
                expect(map["type"], MessageTypes.connectionInit);
                expect(map["payload"], baseInitialPayload);
              },
            ),
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(
        null,
        channelGenerator: () => channel,
        initialPayload: initialPayload,
      );
      //
      link.request(request).listen(print);

      await server.close();
    },
  );

  test(
    "yield correct response",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      final responseExtensions = {
        "customExtension": {"value": 1}
      };
      final responseData = {
        "data": {
          "pokemons": [
            {"name": "Bulbasaur"},
            {"name": "Ivysaur"},
            {"name": "Venusaur"}
          ]
        }
      };

      final Request request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream
              .map<dynamic>((dynamic s) => json.decode(s as String))
              .listen(
            (dynamic message) {
              print("message $message");
              if (message["type"] == "connection_init") {
                channel.sink.add(
                  json.encode(
                    ConnectionAck(),
                  ),
                );
              } else if (message["type"] == startMessageType) {
                print("enter subscribe");
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": message["id"],
                      "payload": {
                        "data": responseData,
                        "errors": null,
                        "extensions": responseExtensions,
                      },
                    },
                  ),
                );
              }
            },
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      link.request(request).listen(
        expectAsync1(
          (Response response) {
            print(response);
            expect(response.data, responseData);
            expect(response.errors, null);
            expect(
              response.context.entry<ResponseExtensions>()?.extensions,
              responseExtensions,
            );
          },
        ),
      );

      await server.close();
    },
  );

  test(
    "yield updated response",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;
      final responseData1 = {
        "data": {
          "pokemons": [
            {"name": "Bulbasaur"},
            {"name": "Ivysaur"},
            {"name": "Venusaur"}
          ]
        }
      };

      final responseExtensions2 = {"customExtension": "1"};
      final responseData2 = {
        "data": {
          "pokemons": [
            {"name": "Charmander"},
            {"name": "Charmeleon"},
            {"name": "Charizard"}
          ]
        }
      };

      request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.listen(
            (dynamic message) async {
              final map =
                  json.decode(message as String) as Map<String, dynamic>;
              if (map["type"] == "connection_init") {
                channel.sink.add(
                  json.encode(
                    ConnectionAck(),
                  ),
                );
              } else if (map["type"] == startMessageType) {
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": map["id"],
                      "payload": {
                        "data": responseData1,
                        "errors": null,
                      },
                    },
                  ),
                );
                await Future<void>.delayed(Duration(seconds: 1));
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": map["id"],
                      "payload": {
                        "data": responseData2,
                        "errors": null,
                        "extensions": responseExtensions2,
                      },
                    },
                  ),
                );
              }
            },
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      // We expect responseData1, then responseData2 in order.
      int callCounter = 0;
      const maxCall = 2;
      link.request(request).listen(
            expectAsync1(
              (response) {
                callCounter += 1;
                if (callCounter == 1) {
                  expect(
                    response.data,
                    responseData1,
                  );
                  expect(
                    response.context.entry<ResponseExtensions>()?.extensions,
                    null,
                  );
                } else if (callCounter == 2) {
                  expect(
                    response.data,
                    responseData2,
                  );
                  expect(
                    response.context.entry<ResponseExtensions>()?.extensions,
                    responseExtensions2,
                  );
                }
              },
              count: maxCall,
            ),
          );

      await server.close();
    },
  );

  test(
    "yield correct response with errors",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;
      final responseError = {
        "message": "Message",
        "locations": [
          {"line": 1, "column": 1}
        ],
        "path": ["path1", "path2"],
        "extensions": {"key1": "val", "key2": 77},
      };
      final responseExtensions = {
        "extensinon1": {"dw": 2},
        "extensinon2": {
          "l": [3]
        },
      };

      request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.listen(
            (dynamic message) {
              final map =
                  json.decode(message as String) as Map<String, dynamic>;
              if (map["type"] == "connection_init") {
                channel.sink.add(
                  json.encode(
                    ConnectionAck(),
                  ),
                );
              } else if (map["type"] == startMessageType) {
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": map["id"],
                      "payload": {
                        "data": null,
                        "errors": [responseError],
                        "extensions": responseExtensions,
                      },
                    },
                  ),
                );
              }
            },
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      link.request(request).listen(
        expectAsync1(
          (Response response) {
            expect(response.data, null);
            expect(
              response.errors![0],
              GraphQLError(
                message: responseError["message"] as String,
                locations: [
                  ErrorLocation(
                    line:
                        (responseError["locations"] as List)[0]["line"] as int,
                    column: (responseError["locations"] as List)[0]["column"]
                        as int,
                  ),
                ],
                path: responseError["path"] as List<String>,
                extensions: responseError["extensions"] as Map<String, dynamic>,
              ),
            );
            expect(
              response.context.entry<ResponseExtensions>()?.extensions,
              responseExtensions,
            );
          },
        ),
      );

      await server.close();
    },
  );

  test(
    "yield updated response filtered by id",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;
      final responseData1 = {
        "data": {
          "pokemons": [
            {"name": "Bulbasaur"},
            {"name": "Ivysaur"},
            {"name": "Venusaur"}
          ]
        }
      };
      final responseData2 = {
        "data": {
          "pokemons": [
            {"name": "Charmander"},
            {"name": "Charmeleon"},
            {"name": "Charizard"}
          ]
        }
      };
      final responseData3 = {
        "data": {
          "pokemons": [
            {"name": "Bagon"},
            {"name": "Cacnea"},
            {"name": "Elgyem"}
          ]
        }
      };

      request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.listen(
            (dynamic message) async {
              final map =
                  json.decode(message as String) as Map<String, dynamic>;
              if (map["type"] == "connection_init") {
                channel.sink.add(
                  json.encode(
                    ConnectionAck(),
                  ),
                );
              } else if (map["type"] == startMessageType) {
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": map["id"],
                      "payload": {
                        "data": responseData1,
                        "errors": null,
                      },
                    },
                  ),
                );
                await Future<void>.delayed(Duration(seconds: 1));
                // Now send with wrong id
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": "314",
                      "payload": {
                        "data": responseData2,
                        "errors": null,
                      },
                    },
                  ),
                );
                await Future<void>.delayed(Duration(seconds: 1));
                channel.sink.add(
                  json.encode(
                    <String, dynamic>{
                      "type": dataMessageType,
                      "id": map["id"],
                      "payload": {
                        "data": responseData3,
                        "errors": null,
                      },
                    },
                  ),
                );
              }
            },
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      // We expect responseData1, then responseData3 in order.
      int callCounter = 0;
      const maxCall = 2;
      link.request(request).map((Response response) => response.data).listen(
            expectAsync1(
              (data) {
                callCounter += 1;
                if (callCounter == 1) {
                  expect(
                    data,
                    responseData1,
                  );
                } else if (callCounter == 2) {
                  expect(
                    data,
                    responseData3,
                  );
                }
              },
              count: maxCall,
            ),
          );

      await server.close();
    },
  );

  test("throw WebSocketLinkParserException when unable to parse response",
      () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    Link link;
    Request request;

    request = Request(
      operation: Operation(
        operationName: "sub",
        document: parseString("subscription MySubscription {}"),
      ),
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer()).listen(
      (webSocket) async {
        final channel = IOWebSocketChannel(webSocket);
        channel.stream
            .map<dynamic>((dynamic s) => json.decode(s as String))
            .listen(
          (dynamic message) {
            if (message["type"] == "connection_init") {
              channel.sink.add(
                json.encode(
                  ConnectionAck(),
                ),
              );
            } else if (message["type"] == startMessageType) {
              channel.sink.add(
                json.encode(
                  <String, dynamic>{
                    "type": dataMessageType,
                    "id": message["id"],
                    "payload": <String, dynamic>{
                      "data": "foo",
                      "errors": null,
                    },
                  },
                ),
              );
            }
          },
        );
      },
    );

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);
    link = makeLink(null, channelGenerator: () => channel);
    await server.close();
    expect(
      link.request(request).first,
      throwsA(isA<WebSocketLinkParserException>()),
    );
  });

  test(
      "throw WebSocketLinkServerException when response is missing both `data` and `errors`",
      () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    Link link;
    Request request;

    request = Request(
      operation: Operation(
        operationName: "sub",
        document: parseString("subscription MySubscription {}"),
      ),
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer()).listen(
      (webSocket) async {
        final channel = IOWebSocketChannel(webSocket);
        channel.stream
            .map<dynamic>((dynamic s) => json.decode(s as String))
            .listen(
          (dynamic message) {
            if (message["type"] == "connection_init") {
              channel.sink.add(
                json.encode(
                  ConnectionAck(),
                ),
              );
            } else if (message["type"] == startMessageType) {
              channel.sink.add(
                json.encode(
                  <String, dynamic>{
                    "type": dataMessageType,
                    "id": message["id"],
                    "payload": <String, dynamic>{},
                  },
                ),
              );
            }
          },
        );
      },
    );

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);
    link = makeLink(null, channelGenerator: () => channel);
    await server.close();
    expect(
      link.request(request).first,
      throwsA(isA<WebSocketLinkServerException>()),
    );
  });

  test("throw WebSocketLinkServerException when network fails", () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    late Link link;
    Request request;

    request = Request(
      operation: Operation(
        operationName: "sub",
        document: parseString("subscription MySubscription {}"),
      ),
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer());

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);
    channel.stream.listen(null, onError: (err) {});

    await webSocket.close();
    link = makeLink(
      null,
      channelGenerator: () => channel,
      autoReconnect: false,
    );
    await server.close();
    expect(
      link.request(request).first,
      throwsA(isA<WebSocketLinkServerException>()),
    );
  });

  test("send stop to server once subscription is canceled", () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    Link link;
    Request request;
    late StreamSubscription<Response> responseSub;

    request = Request(
      operation: Operation(
        operationName: "sub",
        document: parseString("subscription MySubscription {}"),
      ),
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer()).listen(
      (webSocket) async {
        final channel = IOWebSocketChannel(webSocket);
        String? subId = "";
        var messageCount = 0;
        channel.stream.listen(
          expectAsyncUntil1<void, dynamic>(
            (dynamic message) {
              final map =
                  json.decode(message as String) as Map<String, dynamic>?;
              if (messageCount == 0) {
                expect(map!["type"], MessageTypes.connectionInit);
                channel.sink.add(
                  json.encode(
                    ConnectionAck(),
                  ),
                );
              } else if (messageCount == 1) {
                expect(map!["id"], isA<String>());
                expect(map["type"], startMessageType);
                subId = map["id"] as String?;
                // cancel the request
                responseSub.cancel();
              } else if (messageCount == 2) {
                expect(map!["id"], isA<String>());
                expect(map["id"], subId);
                expect(
                  map["type"],
                  isApolloSubProtocol ? MessageTypes.stop : "complete",
                );
              } else {
                // fail.
                expect(1, 2);
              }
              messageCount++;
            },
            () => messageCount == 3,
          ),
        );
      },
    );

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);
    link = makeLink(null, channelGenerator: () => channel);
    responseSub = link.request(request).listen(print);

    await server.close();
  });

  test(
      "close the socket when no keep alive received from server withe inactivityTimeout",
      () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    Link link;

    final Request request = Request(
      operation: Operation(
        operationName: "pokemonsSubscription",
        document: parseString(
            r"subscription MySubscription { pokemons(first: $first) { name } }"),
      ),
      variables: const <String, dynamic>{
        "first": 3,
      },
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer()).listen(
      (webSocket) async {
        final channel = IOWebSocketChannel(webSocket);
        channel.stream
            .map<dynamic>((dynamic s) => json.decode(s as String))
            .listen(
          (dynamic message) {
            // Do not send anything, let it timeout.
          },
        );
      },
    );

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);

    link = makeLink(
      null,
      channelGenerator: () => channel,
      inactivityTimeout: Duration(seconds: 5),
      autoReconnect: false,
    );
    link.request(request).listen(null, onError: (Object err) {
      // TODO: check error?
    });
    expect(
      Stream<int>.periodic(
        Duration(milliseconds: 500),
        (_) => webSocket.readyState,
      ),
      emitsThrough(WebSocket.closed),
    );
  });

  test("never close the socket as long as keep alive is send from the server",
      () async {
    HttpServer server;
    WebSocket webSocket;
    IOWebSocketChannel channel;
    Link link;

    final Request request = Request(
      operation: Operation(
        operationName: "pokemonsSubscription",
        document: parseString(
            r"subscription MySubscription { pokemons(first: $first) { name } }"),
      ),
      variables: const <String, dynamic>{
        "first": 3,
      },
    );

    server = await HttpServer.bind("localhost", 0);
    server.transform(WebSocketTransformer()).listen(
      (webSocket) async {
        final channel = IOWebSocketChannel(webSocket);
        channel.stream
            .map<dynamic>((dynamic s) => json.decode(s as String))
            .listen(
          (dynamic message) {
            if (isApolloSubProtocol) {
              Timer.periodic(Duration(seconds: 1), (_) {
                channel.sink.add(
                  json.encode(
                    isApolloSubProtocol
                        ? ConnectionKeepAlive()
                        : {"type": "ping"},
                  ),
                );
              });
            } else {
              final type = (message as Map)["type"] as String;
              if (type == "connection_init") {
                return channel.sink.add(json.encode(ConnectionAck()));
              } else if (type == "ping") {
                Timer.periodic(Duration(seconds: 1), (_) {
                  channel.sink.add(json.encode({"type": "pong"}));
                });
              }
            }
          },
        );
      },
    );

    webSocket = await WebSocket.connect("ws://localhost:${server.port}");
    channel = IOWebSocketChannel(webSocket);

    link = makeLink(
      null,
      channelGenerator: () => channel,
      inactivityTimeout: Duration(seconds: 2),
    );
    link.request(request).listen(null);
    expect(
      Stream<int>.periodic(
        Duration(milliseconds: 500),
        (_) => webSocket.readyState,
      ).take(20),
      neverEmits(WebSocket.closed),
    );
  });

  test(
    "Auto reconnect",
    () async {
      HttpServer server;
      Link link;
      Request request;

      request = Request(
        operation: Operation(
          operationName: "sub",
          document: parseString("subscription MySubscription {}"),
        ),
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).take(2).listen(
            expectAsync1(
              (webSocket) async {
                final channel = IOWebSocketChannel(webSocket);
                var messageCount = 0;
                channel.stream.take(1).listen(
                      expectAsync1<void, dynamic>(
                        (dynamic message) {
                          final map = json.decode(message as String)
                              as Map<String, dynamic>?;
                          if (messageCount == 0) {
                            expect(map!["type"], MessageTypes.connectionInit);
                            channel.sink.add(
                              json.encode(
                                ConnectionAck(),
                              ),
                            );
                            webSocket.close(websocket_status.normalClosure);
                          }
                          messageCount++;
                        },
                        count: 1,
                        max: -1,
                      ),
                    );
              },
              count: 2,
              max: -1,
            ),
          );

      link = makeLink(null, channelGenerator: () async {
        final webSocket =
            await WebSocket.connect("ws://localhost:${server.port}");
        return IOWebSocketChannel(webSocket);
      }, reconnectInterval: Duration(milliseconds: 500), autoReconnect: true);
      link.request(request).listen(print, onError: print);
    },
  );

  test(
    "Auto resubscribe",
    () async {
      HttpServer server1;
      HttpServer server2;
      Link link;
      Request request;
      int connectToServer = 1;
      String? subId;
      final Completer<void> completer = Completer<void>();
      final Completer<void> stopReceivedCompleter = Completer<void>();

      request = Request(
        operation: Operation(
          operationName: "sub",
          document: parseString(
            r"subscription MySubscription { pokemons(first: $first) { name } }",
          ),
        ),
      );

      server1 = await HttpServer.bind("localhost", 0);
      server1.transform(WebSocketTransformer()).listen(
            expectAsync1(
              (webSocket) async {
                final channel = IOWebSocketChannel(webSocket);
                var messageCount = 0;
                channel.stream.listen(
                  expectAsync1<void, dynamic>(
                    (dynamic message) {
                      final map = json.decode(message as String)
                          as Map<String, dynamic>?;
                      if (messageCount == 0) {
                        expect(map!["type"], MessageTypes.connectionInit);
                        channel.sink.add(
                          json.encode(
                            ConnectionAck(),
                          ),
                        );
                      } else if (messageCount == 1) {
                        expect(map!["id"], isA<String>());
                        expect(map["type"], startMessageType);
                        subId = map["id"] as String?;
                        // disconnect
                        webSocket.close(websocket_status.normalClosure);
                      }
                      messageCount++;
                    },
                    count: 2,
                    reason:
                        "server1 should only receive 2 messages, init and start",
                    id: "server1:websocket_messages",
                  ),
                );
              },
              count: 1,
              reason: "server 1 should only be connected once",
              id: "server1:websocket_connections",
            ),
          );

      server2 = await HttpServer.bind("localhost", 0);
      server2.transform(WebSocketTransformer()).listen(
            expectAsync1(
              (webSocket) async {
                final channel = IOWebSocketChannel(webSocket);
                var messageCount = 0;
                channel.stream.listen(
                  expectAsync1<void, dynamic>(
                    (dynamic message) {
                      final map = json.decode(message as String)
                          as Map<String, dynamic>?;
                      if (messageCount == 0) {
                        expect(map!["type"], MessageTypes.connectionInit);
                        channel.sink.add(
                          json.encode(
                            ConnectionAck(),
                          ),
                        );
                      } else if (messageCount == 1) {
                        expect(map!["id"], isA<String>());
                        expect(map["type"], startMessageType);
                        expect(map["id"], subId);
                        completer.complete();
                      } else {
                        expect(map!["id"], isA<String>());
                        expect(
                            map["type"],
                            isApolloSubProtocol
                                ? MessageTypes.stop
                                : MessageTypes.complete);
                        expect(map["id"], subId);

                        stopReceivedCompleter.complete();
                      }
                      messageCount++;
                    },
                    count: 3,
                    id: "server2:websocket_messages",
                    reason:
                        "server 2 should receive init, subscription and complete/stop msg",
                  ),
                );
              },
              count: 1,
              reason: "server 2 should only receive one connection",
            ),
          );

      link = makeLink(
        null,
        channelGenerator: () async {
          if (connectToServer == 1) {
            connectToServer++;
            final webSocket =
                await WebSocket.connect("ws://localhost:${server1.port}");
            return IOWebSocketChannel(webSocket);
          } else {
            final webSocket =
                await WebSocket.connect("ws://localhost:${server2.port}");
            return IOWebSocketChannel(webSocket);
          }
        },
        reconnectInterval: Duration(milliseconds: 500),
      );
      final sub = link.request(request).listen(print, onError: print);
      await completer.future;
      await sub.cancel();
      await stopReceivedCompleter.future;
    },
  );

  test(
      "_connect() must be called only once when executing multiple requests without awaiting",
      () async {
    Link link;
    Request request;

    final server = await HttpServer.bind("localhost", 0);
    final port = server.port;

    request = Request(
      operation: Operation(
        operationName: "sub",
        document: parseString("subscription MySubscription {}"),
      ),
    );

    link = makeLink(
      null,
      channelGenerator: expectAsync0(
        () async => IOWebSocketChannel.connect("ws://localhost:$port"),
        count: 1,
        max: 1,
      ),
    );

    final onError = isApolloSubProtocol ? null : (Object _) {};
    link.request(request).listen((event) {}, onError: onError);
    link.request(request).listen((event) {}, onError: onError);
    link.request(request).listen((event) {}, onError: onError);
    link.request(request).listen((event) {}, onError: onError);
  });

  test(
    "Client dispose closes the server and request streams",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;

      final responseData = {
        "pokemons": [
          {"name": "2"}
        ]
      };

      request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.listen(
            expectAsync1<void, dynamic>(
              (dynamic message) async {
                final map =
                    json.decode(message as String) as Map<String, dynamic>;
                if (map["type"] == "connection_init") {
                  channel.sink.add(json.encode(ConnectionAck()));
                } else if (map["type"] == startMessageType) {
                  channel.sink.add(
                    json.encode(
                      <String, dynamic>{
                        "type": dataMessageType,
                        "id": map["id"],
                        "payload": {
                          "data": responseData,
                        },
                      },
                    ),
                  );
                }
              },
              count: 3,
            ),
            onDone: expectAsync0(
              () {
                expect(channel.closeCode, websocket_status.normalClosure);
              },
              count: 1,
            ),
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      bool received = false;
      final firstFut = link
          .request(request)
          .listen(expectAsync1(
            (Response response) async {
              expect(response.data, responseData);
              if (received) {
                await link.dispose();
              }
              received = true;
            },
            count: 1,
          ))
          .asFuture<Object?>();

      final secondFut = link
          .request(request)
          .listen(expectAsync1(
            (Response response) async {
              expect(response.data, responseData);
              if (received) {
                await link.dispose();
              }
              received = true;
            },
            count: 1,
          ))
          .asFuture<Object?>();

      await Future.wait([firstFut, secondFut]);
    },
  );

  test(
    "error message type parsing",
    () async {
      HttpServer server;
      WebSocket webSocket;
      IOWebSocketChannel channel;
      Link link;
      Request request;

      final errorsList = [
        // Map with errors (similar to data messages)
        {
          "errors": [
            {
              "message": "error message 0",
              "path": ["p1", 2]
            },
          ],
        },
        // Map with errors and response extensions
        {
          "errors": [
            {"message": "error message 1"}
          ],
          "extensions": {
            "otherFields": 1,
          }
        },
        // List of errors
        [
          {
            "message": "error message 2.1",
            "locations": [
              {"column": 1, "line": 2}
            ]
          },
          {
            "message": "error message 2.2",
          }
        ],
        // Single error
        {
          "message": "error message 3",
          "extensions": {
            "otherFields": 3,
          }
        },
      ];
      if (!isApolloSubProtocol) {
        errorsList.removeWhere((element) => element is! List);
      }

      request = Request(
        operation: Operation(
          operationName: "pokemonsSubscription",
          document: parseString(
              r"subscription MySubscription { pokemons(first: $first) { name } }"),
        ),
        variables: const <String, dynamic>{
          "first": 3,
        },
      );

      server = await HttpServer.bind("localhost", 0);
      server.transform(WebSocketTransformer()).listen(
        (webSocket) async {
          final channel = IOWebSocketChannel(webSocket);
          channel.stream.listen(
            expectAsync1<void, dynamic>(
              (dynamic message) async {
                final map =
                    json.decode(message as String) as Map<String, dynamic>;
                if (map["type"] == "connection_init") {
                  channel.sink.add(json.encode(ConnectionAck()));
                } else if (map["type"] == startMessageType) {
                  for (final err in errorsList) {
                    channel.sink.add(
                      json.encode(
                        <String, dynamic>{
                          "type": "error",
                          "id": map["id"],
                          "payload": err,
                        },
                      ),
                    );
                  }
                }
              },
              count: 2,
            ),
          );
        },
      );

      webSocket = await WebSocket.connect("ws://localhost:${server.port}");
      channel = IOWebSocketChannel(webSocket);

      link = makeLink(null, channelGenerator: () => channel);
      int messageIndex = 0;
      if (isApolloSubProtocol) {
        link.request(request).listen(
              expectAsync1(
                (Response response) {
                  switch (messageIndex) {
                    case 0:
                      expect(response.errors!.length, 1);
                      expect(
                        response.errors!.first.message,
                        "error message 0",
                      );
                      expect(
                        response.errors!.first.path,
                        ["p1", 2],
                      );

                      break;
                    case 1:
                      expect(response.errors!.length, 1);
                      expect(
                        response.errors!.first.message,
                        "error message 1",
                      );
                      expect(
                        response.context
                            .entry<ResponseExtensions>()!
                            .extensions,
                        {
                          "otherFields": 1,
                        },
                      );
                      break;
                    case 2:
                      final errors = response.errors!;
                      expect(errors.length, 2);
                      expect(
                        errors.first.message,
                        "error message 2.1",
                      );
                      expect(
                        errors.first.locations!
                            .map((e) => {"column": e.column, "line": e.line}),
                        [
                          {"column": 1, "line": 2}
                        ],
                      );
                      expect(
                        errors.last.message,
                        "error message 2.2",
                      );
                      break;
                    case 3:
                      expect(response.errors!.length, 1);
                      expect(
                        response.errors!.first.message,
                        "error message 3",
                      );
                      expect(
                        response.errors!.first.extensions,
                        {
                          "otherFields": 3,
                        },
                      );
                      expect(
                        response.context
                            .entry<ResponseExtensions>()!
                            .extensions,
                        null,
                      );
                      break;
                    default:
                      throw Error();
                  }
                  messageIndex += 1;
                },
                count: errorsList.length,
              ),
            );
      } else {
        link.request(request).listen(
          (event) {},
          onError: (Object err, StackTrace stack) {
            final errors = err as List<GraphQLError>;
            expect(errors.length, 2);
            expect(
              errors.first.message,
              "error message 2.1",
            );
            expect(
              errors.first.locations!
                  .map((e) => {"column": e.column, "line": e.line}),
              [
                {"column": 1, "line": 2}
              ],
            );
            expect(
              errors.last.message,
              "error message 2.2",
            );
          },
        );
      }
    },
  );
}
