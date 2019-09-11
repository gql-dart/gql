import "package:gql/src/validation/rules/lone_schema_definition.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.loneSchemaDefinition,
});

void main() {
  group("Lone schema definitions", () {
    test("errors multiple schema definitions", () {
      expect(
        validate(
          """
          schema {}
          schema {}
          """,
        ),
        contains(
          errorOfType<MultipleSchemaDefinitionsError>(),
        ),
      );
    });

    test("no errors on single schema definition", () {
      expect(
        validate(
          """
          schema {}
          """,
        ),
        isNot(
          contains(
            errorOfType<MultipleSchemaDefinitionsError>(),
          ),
        ),
      );
    });

    test("no errors on no schema definition", () {
      expect(
        validate(
          """
          type Query { a: String }
          """,
        ),
        isNot(
          contains(
            errorOfType<MultipleSchemaDefinitionsError>(),
          ),
        ),
      );
    });
  });
}
