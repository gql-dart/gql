import "package:gql/src/validation/rules/unique_argument_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueArgumentNames,
});

void main() {
  group("Unique argument names", () {
    test("reports errors on duplicate field arguments", () {
      expect(
        validate(
          """
          {
            field(arg1: "value", arg1: "value")
          }
          """,
        ),
        contains(
          errorOfType<DuplicateArgumentNameError>(),
        ),
      );
    });
    test("reports errors on duplicate directive arguments", () {
      expect(
        validate(
          """
          {
            field @directive(arg1: "value", arg1: "value")
          }
          """,
        ),
        contains(
          errorOfType<DuplicateArgumentNameError>(),
        ),
      );
    });
    test("reports no errors for same argument on two fields", () {
      expect(
        validate(
          """
          {
            one: field(arg: "value")
            two: field(arg: "value")
          }
          """,
        ),
        isEmpty,
      );
    });
    test("reports no errors for same argument on field and directive", () {
      expect(
        validate(
          """
          {
            field(arg: "value") @directive(arg: "value")
          }
          """,
        ),
        isEmpty,
      );
    });
  });
}
