import "dart:async";

import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";
import "package:async/async.dart";

class MockLink extends Mock implements Link {
  void returns(List<Result<Response>> results) {
    when(
      request(any, any),
    ).thenAnswer(
      (_) => Result.releaseStream(Stream.fromIterable(results)),
    );
  }
}

class TestException extends LinkException {
  final int id;
  final bool handled;

  const TestException(this.id, {this.handled = false}) : super(null);

  @override
  bool operator ==(Object o) =>
      o is TestException && o.id == id && o.handled == handled;

  @override
  String toString() => id.toString();
}

void main() {
  group("ErrorLink", () {
    MockLink mockLink;
    Link link;

    setUp(() {
      mockLink = MockLink();
      link = Link.concat(
        ErrorLink(),
        mockLink,
      );
    });

    group("passthrough", () {
      test("response", () {
        mockLink.returns([
          Result.value(Response(data: const <String, dynamic>{"a": 1})),
        ]);

        final responseStream = link.request(null);

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            Response(data: const <String, dynamic>{"a": 1}),
            emitsDone,
          ]),
        );
      });

      test("error", () {
        mockLink.returns([
          Result.value(
            Response(
              data: const <String, dynamic>{"a": 1},
              errors: const <GraphQLError>[
                GraphQLError(message: "Something went wrong"),
              ],
            ),
          ),
        ]);

        final responseStream = link.request(null);

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
        mockLink.returns([
          Result.error(TestException(1)),
        ]);

        final responseStream = link.request(null);

        expect(
          responseStream,
          emitsInOrder(<dynamic>[
            emitsError(TestException(1)),
            emitsDone,
          ]),
        );
      });

      test("response, response", () {
        mockLink.returns([
          Result.value(Response(data: const <String, dynamic>{"a": 1})),
          Result.value(Response(data: const <String, dynamic>{"a": 1})),
        ]);

        final responseStream = link.request(null);

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
        mockLink.returns([
          Result.value(Response(data: const <String, dynamic>{"a": 1})),
          Result.error(TestException(1)),
        ]);

        final responseStream = link.request(null);

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
        mockLink.returns([
          Result.error(TestException(1)),
          Result.value(Response(data: const <String, dynamic>{"a": 1})),
        ]);

        final responseStream = link.request(null);

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
        mockLink.returns([
          Result.error(TestException(1)),
          Result.error(TestException(1)),
        ]);

        final responseStream = link.request(null);

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
  });
}
