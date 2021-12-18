import "package:gql/src/validation/rules/missing_fragment_definitions.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.missingFragmentDefinition,
});

void main() {
  group("Missing Fragement Definitions", () {
    test("- error when fragement definition is missing", () {
      expect(
        validate(
          """
        query GetPerson {
          people(id: "7") {
            ...NameParts
            avatar(size: LARGE)
          }
        }
        """,
        ),
        contains(
          errorOfType<MissingFragmentDefinitionError>(),
        ),
      );
    });

    test("- no errors when fragment definition is present", () {
      expect(
        validate(
          """
          query GetPerson {
            people(id: "7") {
              ...NameParts
              avatar(size: LARGE)
            }
          }

          fragment NameParts on Person {
            firstName
            lastName
          }
        """,
        ),
        isNot(
          contains(
            errorOfType<MissingFragmentDefinitionError>(),
          ),
        ),
      );
    });
  });
}
