import 'dart:convert';
import 'dart:io';

import 'package:gql/language.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_exec/exec/operation.dart';
import 'package:gql_exec/exec/request.dart';
import 'package:gql_ws_link/gql_ws_link.dart';
import 'package:web_socket_channel/io.dart';
import 'package:test/test.dart';

void main() {
  group('WsLink', () {
    test(
      'send connection_init',
      () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WsLink link;
        Request request;

        request = Request(
          operation: Operation(
            operationName: 'sub',
            document: parseString('subscription MySubscription {}'),
          ),
          variables: {},
        );

        server = await HttpServer.bind('localhost', 0);
        server.transform(WebSocketTransformer()).listen(
          (webSocket) async {
            var channel = IOWebSocketChannel(webSocket);
            channel.stream.map((s) => json.decode(s)).listen(
                  expectAsync1(
                    (request) {
                      expect(request, InitOperation(null).toJson());
                    },
                    max: -1,
                  ),
                );
          },
        );

        webSocket = await WebSocket.connect('ws://localhost:${server.port}');
        channel = IOWebSocketChannel(webSocket);

        link = WsLink(channel: channel);
        //
        link.request(request);
      },
    );

    test(
      'send initialPayload',
      () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WsLink link;
        Request request;
        Map<String, String> initialPayload = {'data': 'some data'};

        request = Request(
          operation: Operation(
            operationName: 'sub',
            document: parseString('subscription MySubscription {}'),
          ),
          variables: {},
        );

        server = await HttpServer.bind('localhost', 0);
        server.transform(WebSocketTransformer()).listen(
          (webSocket) async {
            var channel = IOWebSocketChannel(webSocket);
            channel.stream.map((s) => json.decode(s)).listen(
                  expectAsync1(
                    (request) {
                      expect(request, InitOperation(initialPayload).toJson());
                    },
                    max: -1,
                  ),
                );
          },
        );

        webSocket = await WebSocket.connect('ws://localhost:${server.port}');
        channel = IOWebSocketChannel(webSocket);

        link = WsLink(
          channel: channel,
          initialPayload: initialPayload,
        );
        //
        link.request(request);
      },
    );

    test(
      'yield correct response',
      () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WsLink link;
        Request request;
        var responseData = {
          'data': {
            'pokemons': [
              {'name': 'Bulbasaur'},
              {'name': 'Ivysaur'},
              {'name': 'Venusaur'}
            ]
          }
        };

        request = Request(
          operation: Operation(
            operationName: 'pokemonsSubscription',
            document: parseString(
                r'subscription MySubscription { pokemons(first: $first) { name } }'),
          ),
          variables: {
            'first': 3,
          },
        );

        server = await HttpServer.bind('localhost', 0);
        server.transform(WebSocketTransformer()).listen(
          (webSocket) async {
            var channel = IOWebSocketChannel(webSocket);
            channel.stream.map((s) => json.decode(s)).listen(
              (request) {
                if (request['type'] == 'connection_init') {
                  channel.sink.add(
                    json.encode(
                      ConnectionAck(),
                    ),
                  );
                } else if (request['type'] == 'start') {
                  channel.sink.add(
                    json.encode(
                      {
                        'type': 'data',
                        'id': request['id'],
                        'payload': {
                          'data': responseData,
                          'errors': null,
                        },
                      },
                    ),
                  );
                }
              },
            );
          },
        );

        webSocket = await WebSocket.connect('ws://localhost:${server.port}');
        channel = IOWebSocketChannel(webSocket);

        link = WsLink(channel: channel);
        //
        expect(
            link.request(request),
            emitsInOrder([
              Response(data: responseData, errors: null),
            ]));
      },
    );

    test(
      'yield updated response',
      () async {
        HttpServer server;
        WebSocket webSocket;
        IOWebSocketChannel channel;
        WsLink link;
        Request request;
        var responseData1 = {
          'data': {
            'pokemons': [
              {'name': 'Bulbasaur'},
              {'name': 'Ivysaur'},
              {'name': 'Venusaur'}
            ]
          }
        };
        var responseData2 = {
          'data': {
            'pokemons': [
              {'name': 'Charmander'},
              {'name': 'Charmeleon'},
              {'name': 'Charizard'}
            ]
          }
        };

        request = Request(
          operation: Operation(
            operationName: 'pokemonsSubscription',
            document: parseString(
                r'subscription MySubscription { pokemons(first: $first) { name } }'),
          ),
          variables: {
            'first': 3,
          },
        );

        server = await HttpServer.bind('localhost', 0);
        server.transform(WebSocketTransformer()).listen(
          (webSocket) async {
            var channel = IOWebSocketChannel(webSocket);
            channel.stream.map((s) => json.decode(s)).listen(
              (request) async {
                if (request['type'] == 'connection_init') {
                  channel.sink.add(
                    json.encode(
                      ConnectionAck(),
                    ),
                  );
                } else if (request['type'] == 'start') {
                  channel.sink.add(
                    json.encode(
                      {
                        'type': 'data',
                        'id': request['id'],
                        'payload': {
                          'data': responseData1,
                          'errors': null,
                        },
                      },
                    ),
                  );
                  await Future.delayed(Duration(seconds: 1));
                  channel.sink.add(
                    json.encode(
                      {
                        'type': 'data',
                        'id': request['id'],
                        'payload': {
                          'data': responseData2,
                          'errors': null,
                        },
                      },
                    ),
                  );
                }
              },
            );
          },
        );

        webSocket = await WebSocket.connect('ws://localhost:${server.port}');
        channel = IOWebSocketChannel(webSocket);

        link = WsLink(channel: channel);
        //
        expect(
            link.request(request),
            emitsInOrder([
              Response(data: responseData1, errors: null),
              Response(data: responseData2, errors: null),
            ]));
      },
    );

    test('yield correct response with errors', () {
      // TODO
    });
  });
}
