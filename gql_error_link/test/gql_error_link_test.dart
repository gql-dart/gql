import "dart:async";

import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:test/test.dart";
import "package:async/async.dart";

class TestException extends LinkException {
  final int id;
  final bool handled;

  const TestException(this.id, {this.handled = false}) : super(null);

  @override
  bool operator ==(Object o) =>
      o is TestException && o.id == id && o.handled == handled;

  @override
  String toString() => "TestException:${id}";
}

void main() {
  group("ErrorLink", () {
    group("passthrough", () {
      test("response", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
          (request) => Stream.fromIterable([
            Response(data: const <String, dynamic>{"a": 1}),
          ]),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(data: const <String, dynamic>{"a": 1}),
            emitsDone,
          ]),
        );
      });

      test("error", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
          (request) => Stream.fromIterable([
            Response(
              data: const <String, dynamic>{"a": 1},
              errors: const <GraphQLError>[
                GraphQLError(message: "Something went wrong"),
              ],
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
            ),
            emitsDone,
          ]),
        );
      });

      test("exception", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
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

        final responseStream = link.request(
          null,
          (request) => Stream.fromIterable([
            Response(data: const <String, dynamic>{"a": 1}),
            Response(data: const <String, dynamic>{"a": 1}),
          ]),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(data: const <String, dynamic>{"a": 1}),
            Response(data: const <String, dynamic>{"a": 1}),
            emitsDone,
          ]),
        );
      });

      test("response, exception", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(Response(data: const <String, dynamic>{"a": 1})),
              Result.error(TestException(1)),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(data: const <String, dynamic>{"a": 1}),
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });

      test("exception, response", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.error(TestException(1)),
              Result.value(Response(data: const <String, dynamic>{"a": 1})),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            Response(data: const <String, dynamic>{"a": 1}),
            emitsDone,
          ]),
        );
      });

      test("exception, exception", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
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
          null,
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

      test("consume exception", () async {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) async* {
            if (exception is TestException && exception.id == 1) {
              return;
            }

            yield Result.error(exception);
          },
        );

        final responseStream = errorLink.request(
          null,
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
            emitsError(TestException(2)),
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
            yield Result.error(exception);
          },
        );

        final responseStream = errorLink.request(
          null,
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

      test("yield value", () {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) async* {
            yield Result.value(
              Response(
                data: <String, dynamic>{
                  "id": (exception as TestException).id,
                },
              ),
            );
          },
        );

        final responseStream = errorLink.request(
          null,
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
            ),
            Response(
              data: const <String, dynamic>{"id": 2},
            ),
            emitsDone,
          ]),
        );
      });

      test("discard original stream", () async {
        final errorLink = ErrorLink(
          onException: (
            Request request,
            NextLink forward,
            LinkException exception,
          ) =>
              null,
        );

        final responseStream = errorLink.request(
          null,
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
            emitsDone,
          ]),
        );
      });
    });

    group("errors", () {
      test("no error", () {
        final link = ErrorLink();

        final responseStream = link.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(data: const <String, dynamic>{"a": 1}),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(data: const <String, dynamic>{"a": 1}),
            emitsDone,
          ]),
        );
      });

      test("consume response", () async {
        final errorLink = ErrorLink(
          onError: (
            Request request,
            NextLink forward,
            Response response,
          ) async* {
            if (response.errors.first.message == "consume") {
              return;
            }

            yield Result.value(response);
          },
        );

        final responseStream = errorLink.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "consume"),
                  ],
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "pass"),
                  ],
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
                GraphQLError(message: "pass"),
              ],
            ),
            emitsDone,
          ]),
        );
      });

      test("yield exception", () async {
        final errorLink = ErrorLink(
          onError: (
            Request request,
            NextLink forward,
            Response response,
          ) async* {
            yield Result.error(response);
          },
        );

        final responseStream = errorLink.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "consume"),
                  ],
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "pass"),
                  ],
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
                  GraphQLError(message: "consume"),
                ],
              ),
            ),
            emitsError(
              Response(
                errors: const <GraphQLError>[
                  GraphQLError(message: "pass"),
                ],
              ),
            ),
            emitsDone,
          ]),
        );
      });

      test("yield response", () {
        final errorLink = ErrorLink(
          onError: (
            Request request,
            NextLink forward,
            Response response,
          ) async* {
            yield Result.value(response);
          },
        );

        final responseStream = errorLink.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "consume"),
                  ],
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "pass"),
                  ],
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
                GraphQLError(message: "consume"),
              ],
            ),
            Response(
              errors: const <GraphQLError>[
                GraphQLError(message: "pass"),
              ],
            ),
            emitsDone,
          ]),
        );
      });

      test("discard original stream", () async {
        final errorLink = ErrorLink(
          onError: (
            Request request,
            NextLink forward,
            Response response,
          ) =>
              null,
        );

        final responseStream = errorLink.request(
          null,
          (request) => Result.releaseStream(
            Stream.fromIterable([
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "consume"),
                  ],
                ),
              ),
              Result.value(
                Response(
                  errors: const <GraphQLError>[
                    GraphQLError(message: "pass"),
                  ],
                ),
              ),
            ]),
          ),
        );

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsDone,
          ]),
        );
      });
    });
  });
}
