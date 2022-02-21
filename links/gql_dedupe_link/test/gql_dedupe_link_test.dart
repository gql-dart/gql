import "dart:async";

import "package:gql/language.dart";
import "package:gql_dedupe_link/gql_dedupe_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";

class MockLink extends Mock implements Link {
  @override
  Stream<Response> request(Request? request, [NextLink? forward]) =>
      super.noSuchMethod(
        Invocation.method(#request, [request, forward]),
        returnValue: Stream.fromIterable(
          <Response>[],
        ),
      ) as Stream<Response>;
}

void main() {
  group("DedupeLink", () {
    test("executes a request", () async {
      final document = parseString(
        """""",
      );

      final req1 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      const result1Data = <String, dynamic>{"a": 1};
      final result1 = Response(
        data: result1Data,
        response: const <String, dynamic>{"data": result1Data},
      );

      final mockLink = MockLink();

      when(
        mockLink.request(req1, null),
      ).thenAnswer(
        (_) => Stream.fromIterable([result1]),
      );

      final link = Link.from([
        DedupeLink(),
        mockLink,
      ]);

      final stream1 = link.request(req1);

      verify(
        mockLink.request(req1, null),
      ).called(1);
      expect(await stream1.first, result1);
    });

    test("does not affect different queries", () async {
      final document = parseString(
        """
        query withVar(\$i: Int) {
          take(i: \$i)
        }
      """,
      );

      final req1 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      final req2 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 42},
      );

      const result1Data = <String, dynamic>{"a": 1};
      final result1 = Response(
        data: result1Data,
        response: const <String, dynamic>{"data": result1Data},
      );

      const result21Data = <String, dynamic>{"a": 1};
      final result2 = Response(
        data: result21Data,
        response: const <String, dynamic>{"data": result21Data},
      );

      final mockLink = MockLink();

      when(
        mockLink.request(req1, null),
      ).thenAnswer(
        (_) => Stream.fromIterable([result1]),
      );

      when(
        mockLink.request(req2, null),
      ).thenAnswer(
        (_) => Stream.fromIterable([result2]),
      );

      final link = Link.from([
        DedupeLink(),
        mockLink,
      ]);

      final stream1 = link.request(req1);
      final stream2 = link.request(req2);

      verify(
        mockLink.request(req1, null),
      ).called(1);
      verify(
        mockLink.request(req2, null),
      ).called(1);
      expect(await stream1.first, result1);
      expect(await stream2.first, result2);
    });

    test("dedupes identical queries", () async {
      final document = parseString(
        """
        query withVar(\$i: Int) {
          take(i: \$i)
        }
      """,
      );

      final req1 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      final req2 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      const result1Data = <String, dynamic>{"a": 1};
      final result1 = Response(
        data: result1Data,
        response: const <String, dynamic>{"data": result1Data},
      );

      final mockLink = MockLink();

      when(
        mockLink.request(req1, null),
      ).thenAnswer(
        (_) => Stream.fromIterable([result1]),
      );

      final link = Link.from([
        DedupeLink(),
        mockLink,
      ]);

      final stream1 = link.request(req1);
      final stream2 = link.request(req2);

      final return1 = stream1.first;
      final return2 = stream2.first;

      verify(
        mockLink.request(req1, null),
      ).called(1);
      verifyNever(
        mockLink.request(req2, null),
      );
      expect(await return1, result1);
      expect(await return2, result1);
    });

    test("does not dedup consequtive queries", () async {
      final document = parseString(
        """
        query withVar(\$i: Int) {
          take(i: \$i)
        }
      """,
      );

      final req1 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      const result1Data = <String, dynamic>{"a": 1};
      final result1 = Response(
        data: result1Data,
        response: const <String, dynamic>{"data": result1Data},
      );

      final mockLink = MockLink();

      when(
        mockLink.request(req1, null),
      ).thenAnswer(
        (_) => Stream.fromIterable([result1]),
      );

      final link = Link.from([
        DedupeLink(),
        mockLink,
      ]);

      expect(
        await link.request(req1).first,
        result1,
      );
      expect(
        await link.request(req1).first,
        result1,
      );
      verify(
        mockLink.request(req1, null),
      ).called(2);
    });

    test("does not dedup a query after an error query", () async {
      final document = parseString(
        """
        query withVar(\$i: Int) {
          take(i: \$i)
        }
      """,
      );

      final req1 = Request(
        operation: Operation(
          document: document,
        ),
        variables: const <String, dynamic>{"i": 12},
      );

      const result1Data = <String, dynamic>{"a": 1};
      final result1 = Response(
        data: result1Data,
        response: const <String, dynamic>{"data": result1Data},
      );

      final mockLink = MockLink();

      final link = Link.from([
        DedupeLink(),
        mockLink,
      ]);

      final controller1 = StreamController<Response>();
      when(
        mockLink.request(req1, null),
      ).thenAnswer((_) => controller1.stream);
      controller1.addError("Error");

      try {
        await link.request(req1).first;
      } catch (e) {
        expect(e, "Error");
      }

      final controller2 = StreamController<Response>();
      when(
        mockLink.request(req1, null),
      ).thenAnswer((_) => controller2.stream);
      controller2.add(result1);

      expect(
        await link.request(req1).first,
        result1,
      );

      verify(
        mockLink.request(req1, null),
      ).called(2);
    });
  });
}
