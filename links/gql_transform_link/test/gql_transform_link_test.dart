import "dart:async";

import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_transform_link/gql_transform_link.dart";
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
  group("Transform Link", () {
    test("transforms request", () {
      final mockLink = MockLink();

      final extensionGetter = RequestExtensionsThunk(
        (req) => req.variables,
      );

      const response = <String, dynamic>{
        "data": <String, dynamic>{"a": 1}
      };
      when(
        mockLink.request(any, any),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          Response(
            data: response["data"] as Map<String, dynamic>?,
            response: response,
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

      const response = <String, dynamic>{
        "data": <String, dynamic>{"a": 1}
      };
      when(
        mockLink.request(any, any),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          Response(
            data: response["data"] as Map<String, dynamic>?,
            response: response,
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
          data: response["data"] as Map<String, dynamic>?,
          response: response,
        ).withContextEntry(
          ResponseExtensions(
            "CUSTOM-EXTENSIONS",
          ),
        ),
      );
    });
  });
}
