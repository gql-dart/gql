// ignore_for_file: implicit_dynamic_method, unused_local_variable,implicit_dynamic_map_literal

import "dart:async";
import "dart:core";

import "package:collection/collection.dart";
import "package:dio/dio.dart" as dio;
import "package:gql/language.dart";
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_exec/gql_exec.dart";
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
        o.validateStatus == validateStatus &&
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
        client.post<dynamic>(
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
                  DioLinkResponseContext(statusCode: 200),
                ),
          ),
          emitsDone,
        ]),
      );
    });

    test("uses the defined endpoint", () async {
      when(
        client.post<dynamic>(
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
        client.post<dynamic>(
          "/graphql-test",
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).called(1);
    });

    test("uses json mime types", () async {
      when(
        client.post<dynamic>(
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
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    dio.Headers.contentTypeHeader: "application/json",
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
        client.post<dynamic>(
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
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                  responseType: dio.ResponseType.json,
                  headers: <String, dynamic>{
                    dio.Headers.contentTypeHeader: "application/json",
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
        client.post<dynamic>(
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
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                    responseType: dio.ResponseType.json,
                    headers: <String, dynamic>{
                      dio.Headers.contentTypeHeader: "application/json",
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
        client.post<dynamic>(
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
                  dio.Headers.contentTypeHeader: "application/jsonize",
                },
              ),
            ],
          ),
        ),
      ).first;

      verify(
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: argThat(
            predicate((dio.Options o) => o.extEqual(dio.Options(
                    responseType: dio.ResponseType.json,
                    headers: <String, dynamic>{
                      dio.Headers.contentTypeHeader: "application/jsonize",
                      "Accept": "*/*",
                    }))),
            named: "options",
          ),
        ),
      ).called(1);
    });

    test("serializes the request", () async {
      when(
        client.post<dynamic>(
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
        client.post<dynamic>(
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
        client.post<dynamic>(
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
            context: Context()
                .withEntry(
                  ResponseExtensions(null),
                )
                .withEntry(
                  DioLinkResponseContext(statusCode: 200),
                ),
          ),
          emitsDone,
        ]),
      );
    });

    test("throws DioLinkServerException when status code >= 300", () async {
      final dio.Response response = dio.Response<Map<String, dynamic>>(
        data: <String, dynamic>{
          "data": <String, dynamic>{"something": "random text 55656"},
        },
        statusCode: 300,
      );

      when(
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          response,
        ),
      );

      DioLinkServerException exception;

      try {
        await execute().first;
      } catch (e) {
        exception = e as DioLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<DioLinkServerException>(),
      );
      expect(
        exception.response.data,
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
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          response,
        ),
      );

      DioLinkServerException exception;

      try {
        await execute().first;
      } catch (e) {
        exception = e as DioLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<DioLinkServerException>(),
      );
      expect(
        exception.response.data,
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
        client.post<dynamic>(
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
        client.post<dynamic>(
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
      link.close(force: true);

      verify(
        client.close(force: true),
      ).called(1);
    });

    test(
        "throws HttpLinkServerException if response status not in specified success status list",
        () async {
      when(
        client.post<dynamic>(
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
            statusCode: 201,
          ),
        ),
      );

      DioLinkServerException exception;

      try {
        await DioLink("/graphql-test", client: client, successStatuses: [200])
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
        exception = e as DioLinkServerException;
      }

      expect(
        exception,
        TypeMatcher<DioLinkServerException>(),
      );
    });

    test("succeeds if response status in specified success status list",
        () async {
      when(
        client.post<dynamic>(
          any,
          data: anyNamed("data"),
          options: anyNamed("options"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          dio.Response<Map<String, dynamic>>(
            data: <String, dynamic>{
              "data": {"test": "value"},
            },
            statusCode: 200,
          ),
        ),
      );

      DioLinkServerException exception;

      final response =
          await DioLink("/graphql-test", client: client, successStatuses: [200])
              .request(
                Request(
                  operation: Operation(
                    document: parseString("query MyQuery {}"),
                  ),
                  variables: const <String, dynamic>{"i": 12},
                ),
              )
              .first;

      expect(
        response.data,
        {"test": "value"},
      );
    });
  });
}
