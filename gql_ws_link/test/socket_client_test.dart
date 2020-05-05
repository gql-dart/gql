/**
 * Originally from https://github.com/zino-app/graphql-flutter
 * Adapted to `gql` by @iscriptology
 */

import "dart:convert";
import "dart:typed_data";

import "package:gql_ws_link/src/socket_client.dart" show SocketClient, SocketConnectionState;
import "package:gql_ws_link/src/messages.dart";
import "package:test/test.dart";

import "helpers.dart";

void main() {
  group("SocketClient", () {
    SocketClient socketClient;
    setUp(overridePrint((log) {
      socketClient = SocketClient(
        "ws://echo.websocket.org",
        protocols: null,
        randomBytesForUuid: Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]),
      );
    }));

    tearDown(overridePrint((log) async {
      await socketClient.dispose();
    }));

    test("connection", () async {
      await expectLater(
        socketClient.connectionState.asBroadcastStream(),
        emitsInOrder(
          <SocketConnectionState>[
            SocketConnectionState.connecting,
            SocketConnectionState.connected,
          ],
        ),
      );
    });
    test("subscription data", () async {
      final payload = QueryPayload(
        query: "subscription {}",
        operationName: "subscription",
        variables: <String, dynamic>{},
      );
      final subscriptionDataStream = socketClient.subscribe(payload, waitForConnection: true, isSubscription: true);
      await socketClient.connectionState.where((state) => state == SocketConnectionState.connected).first;

      // ignore: unawaited_futures
      socketClient.socket.stream
          .where((dynamic message) =>
              message ==
              r'{"type":"start","id":"01020304-0506-4708-890a-0b0c0d0e0f10","payload":{"operationName":"subscription","query":"subscription {}","variables":{}}}')
          .first
          .then((dynamic _) {
        socketClient.socket.add(jsonEncode({
          "type": "data",
          "id": "01020304-0506-4708-890a-0b0c0d0e0f10",
          "payload": {
            "data": {"foo": "bar"},
            "errors": ["error and data can coexist"]
          }
        }));
      });

      await expectLater(
        subscriptionDataStream,
        emits(
          SubscriptionData(
            "01020304-0506-4708-890a-0b0c0d0e0f10",
            {"foo": "bar"},
            ["error and data can coexist"],
          ),
        ),
      );
    });
    test("resubscribe", () async {
      final payload = QueryPayload(
        query: "subscription {}",
        operationName: "subscription",
        variables: <String, dynamic>{},
      );
      final subscriptionDataStream = socketClient.subscribe(payload, waitForConnection: true, isSubscription: true);

      socketClient.onConnectionLost();

      await socketClient.connectionState.where((state) => state == SocketConnectionState.connected).first;

      // ignore: unawaited_futures
      socketClient.socket.stream
          .where((dynamic message) =>
              message ==
              r'{"type":"start","id":"01020304-0506-4708-890a-0b0c0d0e0f10","payload":{"operationName":"subscription","query":"subscription {}","variables":{}}}')
          .first
          .then((dynamic _) {
        socketClient.socket.add(jsonEncode({
          "type": "data",
          "id": "01020304-0506-4708-890a-0b0c0d0e0f10",
          "payload": {
            "data": {"foo": "bar"},
            "errors": ["error and data can coexist"]
          }
        }));
      });

      await expectLater(
        subscriptionDataStream,
        emits(
          SubscriptionData(
            "01020304-0506-4708-890a-0b0c0d0e0f10",
            {"foo": "bar"},
            ["error and data can coexist"],
          ),
        ),
      );
    });
  });
}
