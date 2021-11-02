import "dart:async";

import "package:async/async.dart";
import "package:gql/language.dart";
import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:test/test.dart";

class TestException extends LinkException {
  final int id;

  const TestException(this.id) : super(null);

  @override
  bool operator ==(Object o) => o is TestException && o.id == id;

  @override
  String toString() => "TestException:${id}";
}

void main() {
  Request req() => Request(
        operation: Operation(document: parseString("")),
        variables: const <String, dynamic>{"i": 12},
      );

  group("ErrorLink", () {
    group("passthrough", () {
      test("response", () {
        final link = ErrorLink();

        const response = <String, dynamic>{
          "data": {"a": 1}
        };
        final responseStream = link.request(
          req(),
          (request) => Stream.fromIterable([
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
          ]),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("error", () {
        final link = ErrorLink();

        const response = {
          "data": <String, dynamic>{"a": 1},
          "errors": [
            {"message": "Something went wrong"}
          ],
        };
        final responseStream = link.request(
          req(),
          (request) => Stream.fromIterable([
            Response(
              data: response["data"] as Map<String, dynamic>?,
              errors: const <GraphQLError>[
                GraphQLError(message: "Something went wrong"),
              ],
              response: response,
            ),
          ]),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: const <String, dynamic>{"a": 1},
              errors: const <GraphQLError>[
                GraphQLError(message: "Something went wrong"),
              ],
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("exception", () {
        final link = ErrorLink();

        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });

      test("response, response", () {
        final link = ErrorLink();

        const response = <String, dynamic>{
          "data": <String, dynamic>{"a": 1}
        };
        final responseStream = link.request(
          req(),
          (request) => Stream.fromIterable([
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
          ]),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("response, exception", () {
        final link = ErrorLink();

        const response = <String, dynamic>{
          "data": <String, dynamic>{"a": 1}
        };
        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(Response(
                data: response["data"] as Map<String, dynamic>?,
                response: response,
              )),
              Result.error(TestException(1)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });

      test("exception, response", () {
        final link = ErrorLink();

        const response = <String, dynamic>{
          "data": <String, dynamic>{"a": 1}
        };
        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.value(Response(
                data: response["data"] as Map<String, dynamic>?,
                response: response,
              )),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("exception, exception", () {
        final link = ErrorLink();

        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.error(TestException(1)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });
    });

    group("exceptions", () {
      test("non-LinkException", () {
        final link = ErrorLink();

        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error("exception"),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError("exception"),
            emitsDone,
          ]),
        );
      });

      test("yield exception", () async {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) async* {
            throw exception;
          },
        );

        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.error(TestException(2)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });

      test("yield value", () {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) async* {
            yield Response(
              data: <String, dynamic>{
                "id": (exception as TestException).id,
              },
              response: <String, dynamic>{
                "data": <String, dynamic>{
                  "id": exception.id,
                },
              },
            );
          },
        );

        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.error(TestException(2)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: const <String, dynamic>{"id": 1},
              response: const <String, dynamic>{
                "data": <String, dynamic>{
                  "id": 1,
                },
              },
            ),
            emitsDone,
          ]),
        );
      });

      test("continue original stream", () async {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) =>
              null,
        );

        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.error(TestException(2)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            emitsError(TestException(2)),
            emitsDone,
          ]),
        );
      });
    });

    group("errors", () {
      test("no error", () {
        final link = ErrorLink();

        const response = <String, dynamic>{"a": 1};
        final responseStream = link.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  data: response["data"] as Map<String, dynamic>?,
                  response: response,
                ),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              data: response["data"] as Map<String, dynamic>?,
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("yield exception", () async {
        final errorLink = ErrorLink(
          onGraphQLError: (
            Request request,
            NextLink forward,
            Response response,
          ) async* {
            throw response;
          },
        );

        const response = <String, dynamic>{
          "errors": <Map<String, dynamic>>[
            <String, dynamic>{"message": "A"},
          ],
        };
        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "A"),
                  ],
                  response: response,
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "B"),
                  ],
                  response: response,
                ),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(
              Response(
                errors: const <GraphQLError>[
                  GraphQLError(message: "A"),
                ],
                response: response,
              ),
            ),
            emitsDone,
          ]),
        );
      });

      test("yield response", () {
        final errorLink = ErrorLink(
          onGraphQLError: (
            Request request,
            NextLink forward,
            Response response,
          ) async* {
            yield response;
          },
        );

        const response = <String, dynamic>{
          "errors": <Map<String, dynamic>>[
            <String, dynamic>{"message": "A"},
          ],
        };
        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "A"),
                  ],
                  response: response,
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "B"),
                  ],
                  response: response,
                ),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              errors: const <GraphQLError>[
                GraphQLError(message: "A"),
              ],
              response: response,
            ),
            emitsDone,
          ]),
        );
      });

      test("continue original stream", () async {
        final errorLink = ErrorLink(
          onGraphQLError: (
            Request request,
            NextLink forward,
            Response response,
          ) =>
              null,
        );

        const response = <String, dynamic>{
          "errors": <Map<String, dynamic>>[
            <String, dynamic>{"message": "A"},
          ],
        };
        final responseStream = errorLink.request(
          req(),
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "A"),
                  ],
                  response: response,
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "B"),
                  ],
                  response: response,
                ),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(
              errors: const <GraphQLError>[
                GraphQLError(message: "A"),
              ],
              response: response,
            ),
            Response(
              errors: const <GraphQLError>[
                GraphQLError(message: "B"),
              ],
              response: response,
            ),
            emitsDone,
          ]),
        );
      });
    });
  });
}
