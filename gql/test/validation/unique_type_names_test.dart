import "package:gql/src/validation/rules/unique_type_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueTypeNames,
});

void main() {
  group("Unique type names", () {
    test("errors on non-unique type names", () {
      expect(
        validate(
          """
          type Foo
          scalar Foo
          """,
        ),
        contains(
          errorOfType<DuplicateTypeNameError>(),
        ),
      );
    });

    test("no errors on unique type names", () {
      expect(
        validate(
          """
          type Foo
          scalar Bar
          """,
        ),
        isNot(
          contains(
            errorOfType<DuplicateTypeNameError>(),
          ),
        ),
      );
    });
  });
}
