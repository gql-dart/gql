import "dart:async";
import "dart:convert";
import "dart:io";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:test/test.dart";
import "package:web_socket_channel/io.dart";
import "package:web_socket_channel/status.dart" as websocket_status;

void main() {
  group(
    "WebSocketLink",
    () {
      test("WebSocketLink Construction with uri isn't null", () {
        WebSocketLink(
          "",
          initialPayload: {"authorization": "Bearer 12345"},
        );
      });

      test(
        "send connection_init",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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

          link = WebSocketLink(null, channelGenerator: () => channel);
          //
          link.request(request).listen(print);
        },
      );

      test(
        "send initialPayload",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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

          link = WebSocketLink(
            null,
            channelGenerator: () => channel,
            initialPayload: initialPayload,
          );
          //
          link.request(request).listen(print);
        },
      );

      test(
        "send async initialPayload",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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

          link = WebSocketLink(
            null,
            channelGenerator: () => channel,
            initialPayload: initialPayload,
          );
          //
          link.request(request).listen(print);
        },
      );

      test(
        "yield correct response",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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
                  if (message["type"] == "connection_init") {
                    channel.sink.add(
                      json.encode(
                        ConnectionAck(),
                      ),
                    );
                  } else if (message["type"] == "start") {
                    channel.sink.add(
                      json.encode(
                        <String, dynamic>{
                          "type": "data",
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

          link = WebSocketLink(null, channelGenerator: () => channel);
          link.request(request).listen(
            expectAsync1(
              (Response response) {
                expect(response.data, responseData);
                expect(response.errors, null);
                expect(
                  response.context.entry<ResponseExtensions>()?.extensions,
                  responseExtensions,
                );
              },
            ),
          );
        },
      );

      test(
        "yield updated response",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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
                  } else if (map["type"] == "start") {
                    channel.sink.add(
                      json.encode(
                        <String, dynamic>{
                          "type": "data",
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
                          "type": "data",
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

          link = WebSocketLink(null, channelGenerator: () => channel);
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
                        response.context
                            .entry<ResponseExtensions>()
                            ?.extensions,
                        null,
                      );
                    } else if (callCounter == 2) {
                      expect(
                        response.data,
                        responseData2,
                      );
                      expect(
                        response.context
                            .entry<ResponseExtensions>()
                            ?.extensions,
                        responseExtensions2,
                      );
                    }
                  },
                  count: maxCall,
                ),
              );
        },
      );

      test(
        "yield correct response with errors",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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
                  } else if (map["type"] == "start") {
                    channel.sink.add(
                      json.encode(
                        <String, dynamic>{
                          "type": "data",
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

          link = WebSocketLink(null, channelGenerator: () => channel);
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
                        line: (responseError["locations"] as List)[0]["line"]
                            as int,
                        column: (responseError["locations"] as List)[0]
                            ["column"] as int,
                      ),
                    ],
                    path: responseError["path"] as List<String>,
                    extensions:
                        responseError["extensions"] as Map<String, dynamic>,
                  ),
                );
                expect(
                  response.context.entry<ResponseExtensions>()?.extensions,
                  responseExtensions,
                );
              },
            ),
          );
        },
      );

      test(
        "yield updated response filtered by id",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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
                  } else if (map["type"] == "start") {
                    channel.sink.add(
                      json.encode(
                        <String, dynamic>{
                          "type": "data",
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
                          "type": "data",
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
                          "type": "data",
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

          link = WebSocketLink(null, channelGenerator: () => channel);
          // We expect responseData1, then responseData3 in order.
          int callCounter = 0;
          const maxCall = 2;
          link
              .request(request)
              .map((Response response) => response.data)
              .listen(
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
        },
      );

      test("throw WebSocketLinkParserException when unable to parse response",
          () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WebSocketLink link;
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
                } else if (message["type"] == "start") {
                  channel.sink.add(
                    json.encode(
                      <String, dynamic>{
                        "type": "data",
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
        link = WebSocketLink(null, channelGenerator: () => channel);
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
        WebSocketLink link;
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
                } else if (message["type"] == "start") {
                  channel.sink.add(
                    json.encode(
                      <String, dynamic>{
                        "type": "data",
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
        link = WebSocketLink(null, channelGenerator: () => channel);
        expect(
          link.request(request).first,
          throwsA(isA<WebSocketLinkServerException>()),
        );
      });

      test("throw WebSocketLinkServerException when network fails", () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WebSocketLink link;
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
        // Close the socket to cause network error.
        await webSocket.close();
        channel = IOWebSocketChannel(webSocket);
        link = WebSocketLink(null, channelGenerator: () => channel);
        expect(
          link.request(request).first,
          throwsA(isA<WebSocketLinkServerException>()),
        );
      });

      test("send stop to server once subscription is canceled", () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WebSocketLink link;
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
                    expect(map["type"], MessageTypes.start);
                    subId = map["id"] as String?;
                    // cancel the request
                    responseSub.cancel();
                  } else if (messageCount == 2) {
                    expect(map!["id"], isA<String>());
                    expect(map["id"], subId);
                    expect(map["type"], MessageTypes.stop);
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
        link = WebSocketLink(null, channelGenerator: () => channel);
        responseSub = link.request(request).listen(print);
      });

      test(
          "close the socket when no keep alive received from server withe inactivityTimeout",
          () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WebSocketLink link;

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

        link = WebSocketLink(
          null,
          channelGenerator: () => channel,
          inactivityTimeout: Duration(seconds: 5),
          autoReconnect: false,
        );
        link.request(request).listen(null);
        expect(
          Stream<int>.periodic(
            Duration(milliseconds: 500),
            (_) => webSocket.readyState,
          ),
          emitsThrough(WebSocket.closed),
        );
      });

      test(
          "never close the socket as long as keep alive is send from the server",
          () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WebSocketLink link;

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
                Timer.periodic(Duration(seconds: 1), (_) {
                  channel.sink.add(
                    json.encode(
                      ConnectionKeepAlive(),
                    ),
                  );
                });
              },
            );
          },
        );

        webSocket = await WebSocket.connect("ws://localhost:${server.port}");
        channel = IOWebSocketChannel(webSocket);

        link = WebSocketLink(
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
          WebSocketLink link;
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
                                expect(
                                    map!["type"], MessageTypes.connectionInit);
                                channel.sink.add(
                                  json.encode(
                                    ConnectionAck(),
                                  ),
                                );
                                webSocket.close(websocket_status.goingAway);
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

          link = WebSocketLink(
            null,
            channelGenerator: () async {
              final webSocket =
                  await WebSocket.connect("ws://localhost:${server.port}");
              return IOWebSocketChannel(webSocket);
            },
            reconnectInterval: Duration(milliseconds: 500),
          );
          //
          link.request(request).listen(print, onError: print);
        },
      );

      test("Auto resubscribe", () async {
        HttpServer server1;
        HttpServer server2;
        WebSocketLink link;
        Request request;
        int connectToServer = 1;
        String? subId;

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
                          expect(map["type"], MessageTypes.start);
                          subId = map["id"] as String?;
                          // disconnect
                          webSocket.close(websocket_status.goingAway);
                        }
                        messageCount++;
                      },
                      count: 2,
                    ),
                  );
                },
                count: 1,
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
                          expect(map["type"], MessageTypes.start);
                          expect(map["id"], subId);
                          // disconnect
                          webSocket.close(websocket_status.goingAway);
                        }
                        messageCount++;
                      },
                      count: 2,
                    ),
                  );
                },
                count: 1,
              ),
            );

        link = WebSocketLink(
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
        link.request(request).listen(print, onError: print);
      });

      test(
          "_connect() must be called only once when executing multiple requests without awaiting",
          () async {
        WebSocketLink link;
        Request request;

        request = Request(
          operation: Operation(
            operationName: "sub",
            document: parseString("subscription MySubscription {}"),
          ),
        );

        link = WebSocketLink(
          null,
          channelGenerator: expectAsync0(
            () async => IOWebSocketChannel.connect("ws://localhost"),
            count: 1,
            max: 1,
          ),
        );

        link.request(request).listen((event) {});
        link.request(request).listen((event) {});
        link.request(request).listen((event) {});
        link.request(request).listen((event) {});
      });

      test(
        "Client dispose closes the server and request streams",
        () async {
          HttpServer server;
          WebSocket webSocket;
          IOWebSocketChannel channel;
          WebSocketLink link;
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
                    } else if (map["type"] == "start") {
                      channel.sink.add(
                        json.encode(
                          <String, dynamic>{
                            "type": "data",
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

          link = WebSocketLink(null, channelGenerator: () => channel);
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
          WebSocketLink link;
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
                    } else if (map["type"] == "start") {
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

          link = WebSocketLink(null, channelGenerator: () => channel);
          int messageIndex = 0;
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
        },
      );
    },
  );
}
