import "package:gql/src/validation/rules/unique_enum_value_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueEnumValueNames,
});

void main() {
  group("Unique enum value names", () {
    test("errors on non-unique enum value names", () {
      expect(
        validate(
          """
          enum E { A B A }
          """,
        ),
        contains(
          errorOfType<DuplicateEnumValueNameError>(),
        ),
      );
    });

    test("no errors on unique enum value names", () {
      expect(
        validate(
          """
          enum E { A B C }
          """,
        ),
        isNot(
          contains(
            errorOfType<DuplicateEnumValueNameError>(),
          ),
        ),
      );
    });
  });
}
