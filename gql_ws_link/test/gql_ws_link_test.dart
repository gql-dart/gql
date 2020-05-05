import "dart:convert";
import 'dart:io';

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
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
            operationName: "sub",
            document: parseString("subscription MySubscription {}"),
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

        link = WsLink(
          "ws://localhost",
          channel: channel,
        );
        //
        link.request(request);
      },
    );

    test('use defined endpoint', () {
      // TODO
    });

    test('send initialPayload', () {
      // TODO
    });

    test('yield correct response', () {
      // TODO
    });

    test('yield updated response', () {
      // TODO
    });

    test('yield correct response with errors', () {
      // TODO
    });
  });
}
