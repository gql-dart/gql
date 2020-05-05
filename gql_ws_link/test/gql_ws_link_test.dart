/**
 * Originally from https://github.com/zino-app/graphql-flutter
 * Adapted to `gql` by @iscriptology
 */

import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";
import "package:gql_ws_link/src/messages.dart";
import "package:gql_ws_link/src/socket_client.dart";
import "package:gql_ws_link/gql_ws_link.dart";
import "package:gql_link/gql_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";

class MockClient extends Mock implements SocketClient {}

class MockRequestSerializer extends Mock implements RequestSerializer {}

class MockResponseParser extends Mock implements ResponseParser {}

void main() {
  group("WSLink", () {
    MockClient client;
    Request request;
    WSLink link;

    final Stream<Response> Function([
      Request customRequest,
    ]) execute = ([
      Request customRequest,
    ]) =>
        link.request(customRequest ?? request);

    setUp(() {
      client = MockClient();
      request = Request(
        operation: Operation(
          document: parseString("subscription MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );
      link = WSLink(
        "/graphql-test",
      );
    });
  });

  /*
  * For now no tests present because the [SocketClient] class has its own tests,
  * nonetheless tests here would be super important to ensure the quality of the implementation
  * Feel free to PR :)
   */
}
