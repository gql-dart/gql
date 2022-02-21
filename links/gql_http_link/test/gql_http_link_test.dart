import "dart:async";
import "dart:convert";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:test/test.dart";

import "./helpers.dart";
import "./mocks/mocks.dart";

class CustomScalar {
  const CustomScalar(this.value);
  final int value;
  String toJson() => "CustomScalar($value)";
}

void main() {
  group("HttpLink", () {
    late MockHttpClient client;
    late Request request;
    late HttpLink link;

    final Stream<Response> Function([
      Request? customRequest,
    ]) execute = ([
      Request? customRequest,
    ]) =>
        link.request(customRequest ?? request);

    setUp(() {
      client = MockHttpClient();
      request = Request(
        operation: Operation(
          document: parseString("query MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );
      link = HttpLink(
        "/graphql-test",
        httpClient: client,
      );
    });

    test("parses a successful response", () {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
            {"header-1": "value-1"},
          ),
        ),
      );

      expect(
        execute(),
        emitsInOrder(<dynamic>[
          Response(
            data: const <String, dynamic>{},
            errors: null,
            response: const <String, dynamic>{"data": <String, dynamic>{}},
            context: Context()
                .withEntry(
                  ResponseExtensions(null),
                )
                .withEntry(
                  HttpLinkResponseContext(
                    statusCode: 200,
                    headers: const {"header-1": "value-1"},
                  ),
                ),
          ),
          emitsDone,
        ]),
      );
    });

    test("uses the defined endpoint", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.url,
              "expected endpoint",
              Uri.parse("/graphql-test"),
            ),
          ),
        ),
      ).called(1);
    });

    test("uses json mime types", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.headers,
              "mime types",
              allOf([
                containsPair("Content-type", "application/json"),
                containsPair("Accept", "*/*"),
              ]),
            ),
          ),
        ),
      ).called(1);
    });

    test("adds headers from context", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute(
        Request(
          operation: Operation(
            document: parseString("query MyQuery {}"),
          ),
          variables: const <String, dynamic>{"i": 12},
          context: Context.fromList(
            const [
              HttpLinkHeaders(
                headers: {
                  "foo": "bar",
                },
              ),
            ],
          ),
        ),
      ).first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.headers,
              "context headers",
              containsPair("foo", "bar"),
            ),
          ),
        ),
      ).called(1);
    });

    test("adds default headers", () async {
      final client = MockHttpClient();
      final link = HttpLink(
        "/graphql-test",
        httpClient: client,
        defaultHeaders: {
          "foo": "bar",
        },
      );

      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await link
          .request(
            Request(
              operation: Operation(
                document: parseString("query MyQuery {}"),
              ),
              variables: const <String, dynamic>{"i": 12},
            ),
          )
          .first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.headers,
              "default headers",
              containsPair("foo", "bar"),
            ),
          ),
        ),
      ).called(1);
    });

    test("headers from context override defaults", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute(
        Request(
          operation: Operation(
            document: parseString("query MyQuery {}"),
          ),
          variables: const <String, dynamic>{"i": 12},
          context: Context.fromList(
            const [
              HttpLinkHeaders(
                headers: {
                  "Content-type": "application/jsonize",
                },
              ),
            ],
          ),
        ),
      ).first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.headers,
              "headers from context",
              containsPair("Content-type", "application/jsonize"),
            ),
          ),
        ),
      ).called(1);
    });

    test("serializes the request", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.body,
              "serialized body",
              '{"operationName":null,"variables":{"i":12},"query":"query MyQuery {\\n  \\n}"}',
            ),
          ),
        ),
      ).called(1);
    });

    test("serializes all types", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      await execute(Request(
        operation: Operation(
          document: parseString(r"query MyQuery($richInput: RichInput) {}"),
        ),
        variables: const <String, dynamic>{
          "string": "string",
          "bool": true,
          "float": 123.4567,
          "int": 1234567,
          "null": null,
          "object": {
            "nested": ["array"],
            "bool": false
          },
          "array": [true, 123, "ID"],
          "custom": CustomScalar(1),
        },
      )).first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.body,
              "serialized body",
              r"{"
                  r'"operationName":null,'
                  r'"variables":{'
                  r'"string":"string",'
                  r'"bool":true,'
                  r'"float":123.4567,'
                  r'"int":1234567,'
                  r'"null":null,'
                  r'"object":{"nested":["array"],"bool":false},'
                  r'"array":[true,123,"ID"],'
                  r'"custom":"CustomScalar(1)"'
                  r"},"
                  r'"query":"query MyQuery($richInput: RichInput) {\n  \n}"'
                  r"}",
            ),
          ),
        ),
      ).called(1);
    });
    test("parses a successful response with errors", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
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
            {"header-1": "value-1"},
          ),
        ),
      );

      expect(
        execute(),
        emitsInOrder(<dynamic>[
          Response(
            data: const <String, dynamic>{},
            errors: const [
              GraphQLError(
                message: "Execution error",
                path: <dynamic>["friends", 0, "name"],
                extensions: <String, dynamic>{},
                locations: [
                  ErrorLocation(line: 1, column: 1),
                ],
              ),
            ],
            response: const <String, dynamic>{
              "data": <String, dynamic>{},
              "errors": <Map<String, dynamic>>[
                <String, dynamic>{
                  "message": "Execution error",
                  "path": <dynamic>["friends", 0, "name"],
                  "extensions": <String, dynamic>{},
                  "locations": <Map<String, dynamic>>[
                    <String, dynamic>{"line": 1, "column": 1},
                  ],
                },
              ],
            },
            context: Context()
                .withEntry(
                  ResponseExtensions(null),
                )
                .withEntry(
                  HttpLinkResponseContext(
                    statusCode: 200,
                    headers: const {"header-1": "value-1"},
                  ),
                ),
          ),
          emitsDone,
        ]),
      );
    });

    test("throws HttpLinkServerException when status code >= 300", () async {
      final data = json.encode(<String, dynamic>{
        "data": <String, dynamic>{},
      });

      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(data, 300),
        ),
      );

      HttpLinkServerException? exception;

      try {
        await execute().first;
      } catch (e) {
        exception = e as HttpLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<HttpLinkServerException>(),
      );
      expect(exception!.response.body, data);
      expect(
        exception.parsedResponse,
        equals(
          Response(
            data: const <String, dynamic>{},
            errors: null,
            response: const <String, dynamic>{"data": <String, dynamic>{}},
            context: Context().withEntry(
              ResponseExtensions(null),
            ),
          ),
        ),
      );
    });

    test("throws HttpLinkServerException when no data and errors", () async {
      final data = json.encode(<String, dynamic>{});
      final _response = simpleResponse(data, 200);

      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          _response,
        ),
      );

      HttpLinkServerException? exception;

      try {
        await execute().first;
      } on HttpLinkServerException catch (e) {
        exception = e;
      }

      expect(
        exception,
        TypeMatcher<HttpLinkServerException>(),
      );
      expect(
        exception!.response.body,
        data,
      );
      expect(
        exception.parsedResponse,
        equals(
          Response(
              data: null,
              errors: null,
              response: const <String, dynamic>{},
              context: Context().withEntry(
                ResponseExtensions(null),
              )),
        ),
      );
    });

    test("throws SerializerException when unable to serialize request",
        () async {
      final client = MockHttpClient();
      final serializer = MockRequestSerializer();
      final link = HttpLink(
        "/graphql-test",
        httpClient: client,
        serializer: serializer,
      );

      final originalException = Exception("Foo bar");

      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      when(
        serializer.serializeRequest(
          any,
        ),
      ).thenThrow(originalException);

      RequestFormatException? exception;

      try {
        await link
            .request(
              Request(
                operation: Operation(
                  document: parseString("query MyQuery {}"),
                ),
                variables: const <String, dynamic>{"i": 12},
              ),
            )
            .first;
      } catch (e) {
        exception = e as RequestFormatException;
      }

      expect(
        exception,
        TypeMatcher<RequestFormatException>(),
      );
      expect(
        exception!.originalException,
        originalException,
      );
    });

    test("throws ParserException when unable to serialize request", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            "foobar",
            200,
          ),
        ),
      );

      ResponseFormatException? exception;

      try {
        await link
            .request(
              Request(
                operation: Operation(
                  document: parseString("query MyQuery {}"),
                ),
                variables: const <String, dynamic>{"i": 12},
              ),
            )
            .first;
      } catch (e) {
        exception = e as ResponseFormatException;
      }

      expect(
        exception,
        TypeMatcher<ResponseFormatException>(),
      );
      expect(
        exception!.originalException,
        TypeMatcher<FormatException>(),
      );
    });

    test("closes the underlining http client", () async {
      await link.dispose();

      verify(
        client.close(),
      ).called(1);
    });
  });

  group("HttpLink useGETForQueries", () {
    late MockHttpClient client;
    late HttpLink link;

    setUp(() {
      client = MockHttpClient();
      link = HttpLink(
        "/graphql-test",
        httpClient: client,
        useGETForQueries: true,
      );
    });

    test("uses GET for query without files", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      final queryRequest = Request(
        operation: Operation(
          document: parseString("query MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      await link.request(queryRequest).first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.method,
              "method",
              "GET",
            ),
          ),
        ),
      ).called(1);
    });

    test("uses POST for mutation", () async {
      when(
        client.send(any),
      ).thenAnswer(
        (_) => Future.value(
          simpleResponse(
            json.encode(<String, dynamic>{
              "data": <String, dynamic>{},
            }),
            200,
          ),
        ),
      );

      final mutationRequest = Request(
        operation: Operation(
          document: parseString("mutation MyMutation {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      await link.request(mutationRequest).first;

      verify(
        client.send(
          argThat(
            isA<http.Request>().having(
              (request) => request.method,
              "method",
              "POST",
            ),
          ),
        ),
      ).called(1);
    });
  });
}
