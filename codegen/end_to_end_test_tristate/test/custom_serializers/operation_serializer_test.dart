import "package:test/test.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_code_builder/src/serializers/operation_serializer.dart";

import 'package:end_to_end_test_tristate/fragments/__generated__/hero_with_fragments.ast.gql.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart';

void main() {
  group("Operation Type", () {
    test('can be serialized / deserialized with operationName', () {
      final operation = Operation(
        document: document,
        operationName: "HeroWithFragments",
      );
      final json = serializers.serialize(operation);
      final Operation deserialized =
          serializers.deserializeWith(OperationSerializer(), json)!;
      expect(deserialized, equals(operation));
    });

    test('can be serialized / deserialized without operationName', () {
      final operation = Operation(document: document);
      final json = serializers.serialize(operation);
      final Operation deserialized =
          serializers.deserializeWith(OperationSerializer(), json)!;
      expect(deserialized, equals(operation));
    });
  });
}
