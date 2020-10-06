import "dart:async";
import "dart:convert";
import "dart:io";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:web_socket_channel/io.dart";
import "package:test/test.dart";

void main() {
  group(
    "WebSocketLink",
    () {
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

          link = WebSocketLink(null, channel: channel);
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
            channel: channel,
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
            channel: channel,
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

          link = WebSocketLink(null, channel: channel);
          link.request(request).listen(
            expectAsync1(
              (Response response) {
                expect(response.data, responseData);
                expect(response.errors, null);
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

          link = WebSocketLink(null, channel: channel);
          // We expect responseData1, then responseData2 in order.
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
                        responseData2,
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

          link = WebSocketLink(null, channel: channel);
          link.request(request).listen(
            expectAsync1(
              (Response response) {
                expect(response.data, null);
                expect(
                  response.errors[0],
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

          link = WebSocketLink(null, channel: channel);
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
        link = WebSocketLink(null, channel: channel);
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
        link = WebSocketLink(null, channel: channel);
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
        link = WebSocketLink(null, channel: channel);
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
        StreamSubscription<Response> responseSub;

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
            var subId = "";
            var messageCount = 0;
            channel.stream.listen(
              expectAsyncUntil1<void, dynamic>(
                (dynamic message) {
                  // cancel the request
                  responseSub.cancel();
                  final map =
                      json.decode(message as String) as Map<String, dynamic>;
                  if (messageCount == 0) {
                    expect(map["type"], MessageTypes.connectionInit);
                  } else if (messageCount == 1) {
                    expect(map["id"], isA<String>());
                    expect(map["type"], MessageTypes.start);
                    subId = map["id"] as String;
                  } else if (messageCount == 2) {
                    expect(map["id"], isA<String>());
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
        link = WebSocketLink(null, channel: channel);
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
          channel: channel,
          inactivityTimeout: Duration(seconds: 5),
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
          channel: channel,
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
    },
  );
}
