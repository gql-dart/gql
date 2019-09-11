import "package:gql/src/validation/rules/unique_directive_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueDirectiveNames,
});

void main() {
  group("Unique directive names", () {
    test("errors on non-unique directive names", () {
      expect(
        validate(
          """
          directive @A on QUERY
          directive @A on QUERY
          """,
        ),
        contains(
          errorOfType<DuplicateDirectiveNameError>(),
        ),
      );
    });

    test("no errors on unique directive names", () {
      expect(
        validate(
          """
          directive @A on QUERY
          directive @B on QUERY
          """,
        ),
        isNot(
          contains(
            errorOfType<DuplicateDirectiveNameError>(),
          ),
        ),
      );
    });
  });
}
