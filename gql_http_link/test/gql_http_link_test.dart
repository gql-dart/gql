import "dart:async";
import "dart:convert";

import "package:gql/execution.dart";
import "package:gql/language.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:test/test.dart";

class MockClient extends Mock implements http.Client {}

void main() {
  group("HttpLink", () {
    MockClient client;
    Request request;
    HttpLink link;

    final Stream<Response> Function() execute = () => link.request(request);

    setUp(() {
      client = MockClient();
      request = Request(
        operation: Operation(
          document: parseString("query MyQuery {}"),
          variables: const <String, dynamic>{"i": 12},
        ),
      );
      link = HttpLink(
        "/graphql-test",
        httpClient: client,
      );
    });

    test("uses the defined endpoint", () {
      execute();

      verify(
        client.post(
          "/graphql-test",
          body: anyNamed("body"),
          headers: anyNamed("headers"),
          encoding: anyNamed("encoding"),
        ),
      ).called(1);
    });

    test("uses json mime types", () {
      execute();

      verify(
        client.post(
          any,
          body: anyNamed("body"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          encoding: anyNamed("encoding"),
        ),
      ).called(1);
    });

    test("serializes the request", () {
      execute();

      verify(
        client.post(
          any,
          body:
              """{"operationName":null,"variables":{"i":12},"query":"query MyQuery {\\n  \\n}"}""",
          headers: anyNamed("headers"),
          encoding: anyNamed("encoding"),
        ),
      ).called(1);
    });

    test("parses a successful response", () {
      when(
        client.post(
          any,
          body: anyNamed("body"),
          headers: anyNamed("headers"),
          encoding: anyNamed("encoding"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          http.Response(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      expect(
        execute(),
        emitsInOrder(<dynamic>[
          const Response(
            data: <String, dynamic>{},
            errors: null,
          ),
          emitsDone,
        ]),
      );
    });

    test("parses a successful response with errors", () async {
      when(
        client.post(
          any,
          body: anyNamed("body"),
          headers: anyNamed("headers"),
          encoding: anyNamed("encoding"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          http.Response(
            json.encode(
              <String, dynamic>{
                "errors": <Map<String, dynamic>>[
                  <String, dynamic>{
                    "message": "Execution error",
                    "path": <dynamic>["friends", 0, "name"],
                    "extensions": <String, dynamic>{},
                    "locations": <Map<String, dynamic>>[
                      <String, dynamic>{
                        "line": 1,
                        "column": 1,
                      },
                    ],
                  },
                ],
                "data": <String, dynamic>{},
              },
            ),
            200,
          ),
        ),
      );

      expect(
        execute(),
        emitsInOrder(<dynamic>[
          const Response(
            data: <String, dynamic>{},
            errors: [
              GraphQLError(
                message: "Execution error",
                path: <dynamic>["friends", 0, "name"],
                extensions: <String, dynamic>{},
                locations: [
                  ErrorLocation(line: 1, column: 1),
                ],
              ),
            ],
          ),
          emitsDone,
        ]),
      );
    });
  });
}
