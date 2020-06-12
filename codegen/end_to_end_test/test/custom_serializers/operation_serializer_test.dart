import "package:test/test.dart";
import "package:gql_exec/gql_exec.dart";

import 'package:end_to_end_test/fragments/hero_with_fragments.ast.gql.dart';
import 'package:end_to_end_test/graphql/serializers.gql.dart';

void main() {
  group("Operation Type", () {
    final operation = Operation(document: document);

    test('can be serialized / deserialized', () {
      final json = serializers.serialize(operation);
      final Operation deserialized = serializers.deserialize(json);
      expect(deserialized, equals(operation));
    });
  });
}
