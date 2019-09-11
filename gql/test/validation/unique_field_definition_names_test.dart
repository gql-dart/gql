import "package:gql/src/validation/rules/unique_field_definition_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueFieldDefinitionNames,
});

void main() {
  group("Unique field definition names", () {
    test("no errors on unique field names per complex type", () {
      expect(
        validate(
          """
          type A { a: String, b: String, c: String }
          input B { a: String, b: String, c: String }
          interface C { a: String, b: String, c: String }
          """,
        ),
        isNot(
          contains(
            errorOfType<DuplicateFieldDefinitionNameError>(),
          ),
        ),
      );
    });

    test("errors on non-unique field names on object type", () {
      expect(
        validate(
          """
          type A { a: String, b : String, a: String }
          """,
        ),
        contains(
          errorOfType<DuplicateFieldDefinitionNameError>(),
        ),
      );
    });

    test("errors on non-unique field names on input object type", () {
      expect(
        validate(
          """
          input A { a: String, b : String, a: String }
          """,
        ),
        contains(
          errorOfType<DuplicateFieldDefinitionNameError>(),
        ),
      );
    });

    test("errors on non-unique field names on interface type", () {
      expect(
        validate(
          """
          interface A { a: String, b : String, a: String }
          """,
        ),
        contains(
          errorOfType<DuplicateFieldDefinitionNameError>(),
        ),
      );
    });
  });
}
