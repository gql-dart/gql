import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.executableDefinitions,
});

void main() {
  group("Executable definitions", () {
    test("with only operation", () {
      expect(
        validate(
          """
          query Foo {
            dog {
              name
            }
          }
          """,
        ),
        isEmpty,
      );
    });

    test("with operation and fragment", () {
      expect(
        validate(
          """
          query Foo {
            dog {
              name
              ...Frag
            }
          }
  
          fragment Frag on Dog {
            name
          }
          """,
        ),
        isEmpty,
      );
    });

    test("with type definition", () {
      expect(
        validate("""
        query Foo {
          dog {
            name
          }
        }
  
        type Cow {
          name: String
        }
  
        extend type Dog {
          color: String
        }
        """).map((it) => it.toString()).toList(),
        equals(
          [
            'The "Cow" definition is not executable.',
            'The "Dog" definition is not executable.',
          ],
        ),
      );
    });

    test("with schema definition", () {
      expect(
        validate("""
        schema {
          query: Query
        }

        type Query {
          test: String
        }

        extend schema @directive
        """).map((it) => it.toString()).toList(),
        equals(
          [
            "The schema definition is not executable.",
            'The "Query" definition is not executable.',
            "The schema definition is not executable.",
          ],
        ),
      );
    });
  });
}
