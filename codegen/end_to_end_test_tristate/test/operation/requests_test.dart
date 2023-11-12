import "package:test/test.dart";
import "package:gql/language.dart";

import 'package:end_to_end_test_tristate/variables/__generated__/human_with_args.req.gql.dart';
import 'package:end_to_end_test_tristate/variables/__generated__/human_with_args.ast.gql.dart'
    as human_with_args_ast;
import 'package:end_to_end_test_tristate/no_vars/__generated__/hero_no_vars.req.gql.dart';
import 'package:end_to_end_test_tristate/no_vars/__generated__/hero_no_vars.ast.gql.dart'
    as hero_no_args_ast;

void main() {
  group("Requests", () {
    test('request objects can be serialized / deserialized', () {
      final req = GHumanWithArgs((b) => b..vars.id = "123");
      final json = {
        "operation": {
          "operationName": "HumanWithArgs",
          "document": printNode(human_with_args_ast.document),
        },
        "vars": {
          "id": "123",
        },
      };
      expect(req.toJson(), equals(json));
      expect(GHumanWithArgs.fromJson(json), req);
    });

    test('requests can be initialized without vars', () {
      final req = GHeroNoVars();
      final json = {
        "operation": {
          "operationName": "HeroNoVars",
          "document": printNode(hero_no_args_ast.document),
        },
        "vars": {},
      };
      expect(req.toJson(), equals(json));
      expect(GHeroNoVars.fromJson(json), req);
    });
  });
}
