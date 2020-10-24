// ignore_for_file: implicit_dynamic_method, unused_local_variable,implicit_dynamic_map_literal

import "dart:async";
import "dart:core";

import "package:collection/collection.dart";
import "package:dio/dio.dart" as dio;
import "package:gql/language.dart";
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";

class MockClient extends Mock implements dio.Dio {}

class MockRequestSerializer extends Mock implements RequestSerializer {}

class MockResponseParser extends Mock implements ResponseParser {}

extension on dio.Options {
  bool extEqual(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
    return o is dio.Options &&
        o.method == method &&
        o.sendTimeout == sendTimeout &&
        o.receiveTimeout == receiveTimeout &&
        mapEquals(o.extra, extra) &&
        mapEquals(o.headers, headers) &&
        o.responseType == responseType &&
        o.contentType == contentType &&
        //o.validateStatus == validateStatus &&
        o.maxRedirects == maxRedirects &&
        o.requestEncoder == requestEncoder &&
        o.responseDecoder == responseDecoder;
  }
}

// Adaptd tests from ``gql_http_link`` tests
// https://github.com/gql-dart/gql/blob/master/gql_http_link/test/gql_http_link_test.dart
void main() {
  group("DioLink", () {
    MockClient client;
    Request request;
    DioLink link;

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
          document: parseString("query MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );
      link = DioLink(
        "/graphql-test",
        client: client,
      );
    });

    test("parses a successful response", () {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
              data: <String, dynamic>{
                "data": <String, dynamic>{},
              },
              statusCode: 200,
              headers: dio.Headers.fromMap(
                {
                  "header-1": ["value-1"]
                },
              )),
        ),
      );

      expect(
        execute(),
        emitsInOrder(<dynamic>[
          Response(
            data: const <String, dynamic>{},
            errors: null,
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
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.requestUri<dynamic>(
          Uri.parse("/graphql-test"),
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).called(1);
    });

    test("uses json mime types", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  method: "POST",
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    "Content-type": "application/json",
                    "Accept": "*/*",
                  },
                ))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("adds headers from context", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
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
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  method: "POST",
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    "Content-type": "application/json",
                    "Accept": "*/*",
                    "foo": "bar",
                  },
                ))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("adds default headers", () async {
      final client = MockClient();
      final link = DioLink(
        "/graphql-test",
        client: client,
        defaultHeaders: {
          "foo": "bar",
        },
      );

      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
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
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                    method: "POST",
                    responseType: dio.ResponseType.json,
                    headers: <String, dynamic>{
                      "Content-type": "application/json",
                      "Accept": "*/*",
                      "foo": "bar",
                    }))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("headers from context override defaults", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
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
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                    method: "POST",
                    responseType: dio.ResponseType.json,
                    headers: <String, dynamic>{
                      "Content-type": "application/jsonize",
                      "Accept": "*/*",
                    }))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("serializes the request", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.requestUri<dynamic>(
          any,
          data: argThat(
              equals({
                "operationName": null,
                "variables": {"i": 12},
                "query": "query MyQuery {\n  \n}"
              }),
              named: "data"),
          //"""{"operationName":null,"variables":{"i":12},"query":"query MyQuery {\\n  \\n}"}""",
          options: anyNamed("options"),
        ),
      ).called(1);
    });

    test("parses a successful response with errors", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
              data: <String, dynamic>{
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
              statusCode: 200,
              headers: dio.Headers.fromMap(
                {
                  "header-1": ["value-1"]
                },
              )),
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
      final dio.Response response = dio.Response<Map<String, dynamic>>(
        data: <String, dynamic>{
          "data": <String, dynamic>{"something": "random text 55656"},
        },
        statusCode: 300,
      );

      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          response,
        ),
      );

      HttpLinkServerException exception;

      try {
        await execute().first;
      } catch (e) {
        exception = e as HttpLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<HttpLinkServerException>(),
      );
      expect(
        exception.response.body,
        response.data,
      );
      expect(
        exception.response.statusCode,
        response.statusCode,
      );
      expect(
        exception.parsedResponse,
        equals(
          Response(
            data: const <String, dynamic>{
              "something": "random text 55656",
            },
            errors: null,
            context: Context().withEntry(
              ResponseExtensions(null),
            ),
          ),
        ),
      );
    });

    test("throws HttpLinkServerException when no data and errors", () async {
      final dio.Response response = dio.Response<Map<String, dynamic>>(
        data: <String, dynamic>{
          "test": <String, dynamic>{"something": "random text 55656"},
        },
        statusCode: 300,
      );

      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          response,
        ),
      );

      HttpLinkServerException exception;

      try {
        await execute().first;
      } catch (e, stk) {
        exception = e as HttpLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<HttpLinkServerException>(),
      );
      expect(
        exception.response.body,
        response.data,
      );
      expect(
        exception.response.statusCode,
        response.statusCode,
      );
      expect(
        exception.parsedResponse,
        equals(
          Response(
              data: null,
              errors: null,
              context: Context().withEntry(
                ResponseExtensions(null),
              )),
        ),
      );
    });

    test("throws SerializerException when unable to serialize request",
        () async {
      final client = MockClient();
      final serializer = MockRequestSerializer();
      final link = DioLink(
        "/graphql-test",
        client: client,
        serializer: serializer,
      );

      final originalException = Exception("Foo bar");

      when(
        client.requestUri<dynamic>(
          any,
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(dio.Response<Map<String, dynamic>>(
          data: <String, dynamic>{},
          statusCode: 200,
        )),
      );

      when(
        serializer.serializeRequest(
          any,
        ),
      ).thenThrow(originalException);

      RequestFormatException exception;

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
        exception.originalException,
        originalException,
      );
    });

    test("throws ParserException when unable to serialize request", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<String>(
            data: "foobar",
            statusCode: 200,
          ),
        ),
      );

      ResponseFormatException exception;

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
      // expect(
      //   exception.originalException,
      //   TypeMatcher<FormatException>(),
      // );
    });

    test("closes the underlining http client", () {
      link.dispose();

      verify(
        client.close(),
      ).called(1);
    });
  });

  group("HttpLink useGETForQueries", () {
    MockClient client;
    Request request;
    DioLink link;

    Stream<Response> execute({
      Request customRequest,
    }) =>
        link.request(customRequest ?? request);

    setUp(() {
      client = MockClient();
      request = Request(
        operation: Operation(
          document: parseString("query MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      );
      link = DioLink(
        "/graphql-test",
        client: client,
        useGETForQueries: true,
      );
    });

    test("uses GET for query without files", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
          ),
        ),
      );

      await execute().first;

      verify(
        client.requestUri<dynamic>(
          argThat(
            isA<Uri>()
                .having(
                  (uri) => uri.path,
                  "Uri.path",
                  "/graphql-test",
                )
                .having(
                  (uri) => uri.queryParameters,
                  "Uri.queryParameters",
                  anything,
                ),
          ),
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  method: "GET",
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    "Content-type": "application/json",
                    "Accept": "*/*",
                  },
                ))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("uses POST for mutation", () async {
      when(
        client.requestUri<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": <String, dynamic>{},
            },
            statusCode: 200,
          ),
        ),
      );

      await execute(
          customRequest: Request(
        operation: Operation(
          document: parseString("mutation MyQuery {}"),
        ),
        variables: const <String, dynamic>{"i": 12},
      )).first;

      verify(
        client.requestUri<dynamic>(
          Uri.parse("/graphql-test"),
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  method: "POST",
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    "Content-type": "application/json",
                    "Accept": "*/*",
                  },
                ))),
            named: "options",
          ),
        ),
      ).called(1);
    });
  });
}
