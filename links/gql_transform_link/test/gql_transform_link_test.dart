import "dart:async";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_transform_link/gql_transform_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";

class MockLink extends Mock implements Link {}

void main() {
  group("Transform Link", () {
    test("transforms request", () {
      final mockLink = MockLink();

      final extensionGetter = RequestExtensionsThunk(
        (req) => req.variables,
      );

      when(
        mockLink.request(any, any),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          Response(
            data: const <String, dynamic>{"a": 1},
          ),
        ]),
      );

      final link = Link.from([
        TransformLink(
          requestTransformer: (req) => req.withContextEntry(extensionGetter),
        ),
        mockLink,
      ]);

      link.request(
        Request(
          operation: Operation(
            document: parseString(""""""),
          ),
          variables: const <String, dynamic>{"i": 12},
        ),
      );

      verify(
        mockLink.request(
          Request(
            operation: Operation(
              document: parseString(""""""),
            ),
            variables: const <String, dynamic>{"i": 12},
          ).withContextEntry(extensionGetter),
          null,
        ),
      ).called(1);
    });

    test("transforms response", () async {
      final mockLink = MockLink();

      when(
        mockLink.request(any, any),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          Response(
            data: const <String, dynamic>{"a": 1},
          ),
        ]),
      );

      final link = Link.from([
        TransformLink(
          responseTransformer: (resp) => resp.withContextEntry(
            ResponseExtensions(
              "CUSTOM-EXTENSIONS",
            ),
          ),
        ),
        mockLink,
      ]);

      final stream = link.request(
        Request(
          operation: Operation(
            document: parseString(""""""),
          ),
          variables: const <String, dynamic>{"i": 12},
        ),
      );

      expect(
        await stream.first,
        Response(
          data: const <String, dynamic>{"a": 1},
        ).withContextEntry(
          ResponseExtensions(
            "CUSTOM-EXTENSIONS",
          ),
        ),
      );
    });
  });
}
