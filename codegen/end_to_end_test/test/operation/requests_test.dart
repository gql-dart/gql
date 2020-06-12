import "package:test/test.dart";
import "package:gql/language.dart";

import 'package:end_to_end_test/variables/human_with_args.req.gql.dart';
import 'package:end_to_end_test/variables/human_with_args.ast.gql.dart';

void main() {
  group("Requests", () {
    final req = GHumanWithArgs((b) => b..vars.id = "123");
    final json = {
      "operation": {
        "operationName": "HumanWithArgs",
        "document": printNode(document),
      },
      "vars": {
        "id": "123",
      },
    };

    test('request objects can be serialized / deserialized', () {
      expect(req.toJson(), equals(json));
      expect(GHumanWithArgs.fromJson(json), req);
    });
  });
}
