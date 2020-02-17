import "package:gql/src/validation/rules/unique_input_field_names.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueInputFieldNames,
});

void main() {
  group("Unique input field names", () {
    test("errors on non-unique input field names", () {
      expect(
        validate(
          """
          {
            field(arg: { f1: "value", f1: "value" })
          }
          """,
        ),
        contains(
          errorOfType<DuplicateInputFieldNameError>(),
        ),
      );
    });
    test("errors on multiple non-unique input field names", () {
      expect(
        validate(
          """
          {
            field(arg: { f1: "value", f1: "value", f1: "value" })
          }
          """,
        ),
        containsAll(
          <Matcher>[
            errorOfType<DuplicateInputFieldNameError>(),
            errorOfType<DuplicateInputFieldNameError>()
          ],
        ),
      );
    });

    test("errors on nested non-unique input field names", () {
      expect(
        validate(
          """
          {
            field(arg: { f1: {f2: "value", f2: "value" }})
          }
          """,
        ),
        contains(
          errorOfType<DuplicateInputFieldNameError>(),
        ),
      );
    });

    test("allows for nested input objects with similar fields", () {
      expect(validate("""
          {
            field(arg: {
              deep: {
                deep: {
                  id: 1
                }
                id: 1
              }
              id: 1
            })
          }
          """), isEmpty);
    });

    test("allows for input objects with fields", () {
      expect(validate("""
          {
            field(arg: { f: true })
          }
          """), isEmpty);
    });

    test("allows for same input object within two args", () {
      expect(validate("""
          {
            field(arg1: { f: true }, arg2: { f: true })
          }
          """), isEmpty);
    });
  });
}
