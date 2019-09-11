import "package:gql/src/validation/rules/unique_operation_types.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueOperationTypes,
});

void main() {
  group("Unique operation types", () {
    test("errors on repeating operation types", () {
      expect(
        validate(
          """
          schema {
            query: Q
            query: Query
          }
          """,
        ),
        contains(
          errorOfType<DuplicateOperationTypeError>(),
        ),
      );
    });

    test("no errors on unique operation types", () {
      expect(
        validate(
          """
          schema {
            query: Query
            mutation: Mutation
          }
          """,
        ),
        isNot(
          contains(
            errorOfType<DuplicateOperationTypeError>(),
          ),
        ),
      );
    });
  });
}
