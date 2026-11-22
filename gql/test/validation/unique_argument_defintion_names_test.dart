import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.uniqueArgumentDefinitionNames,
});

void main() {
  group("Unique argument definition names", () {
    test("no arguments", () {
      expect(
        validate(
          """
          type SomeObject { 
            someField: String
          }

          interface SomeInterface {
            someField: String
          }

          directive @someDirective on QUERY
          """,
        ).map((it) => it.toString()),
        equals([]),
      );
    });

    test("one argument", () {
      expect(
        validate(
          """
          type SomeObject {
            someField(foo: String): String
          }
    
          interface SomeInterface {
            someField(foo: String): String
          }
    
          extend type SomeObject {
            anotherField(foo: String): String
          }
    
          extend interface SomeInterface {
            anotherField(foo: String): String
          }
    
          directive @someDirective(foo: String) on QUERY
          """,
        ).map((it) => it.toString()),
        equals([]),
      );
    });

    test("multiple arguments", () {
      expect(
        validate(
          """
          type SomeObject {
            someField(
              foo: String
              bar: String
            ): String
          }
    
          interface SomeInterface {
            someField(
              foo: String
              bar: String
            ): String
          }
    
          extend type SomeObject {
            anotherField(
              foo: String
              bar: String
            ): String
          }
    
          extend interface SomeInterface {
            anotherField(
              foo: String
              bar: String
            ): String
          }
    
          directive @someDirective(
            foo: String
            bar: String
          ) on QUERY
          """,
        ).map((it) => it.toString()),
        equals([]),
      );
    });

    test("duplicating arguments", () {
      expect(
        validate(
          """
          type SomeObject {
            someField(
              foo: String
              bar: String
              foo: String
            ): String
          }
    
          interface SomeInterface {
            someField(
              foo: String
              bar: String
              foo: String
            ): String
          }
    
          extend type SomeObject {
            anotherField(
              foo: String
              bar: String
              bar: String
            ): String
          }
    
          extend interface SomeInterface {
            anotherField(
              bar: String
              foo: String
              foo: String
            ): String
          }
    
          directive @someDirective(
            foo: String
            bar: String
            foo: String
          ) on QUERY
          """,
        ).map((it) => it.toString()),
        equals([
          'Argument "SomeObject.someField(foo:)" can only be defined once.',
          'Argument "SomeInterface.someField(foo:)" can only be defined once.',
          'Argument "SomeObject.anotherField(bar:)" can only be defined once.',
          'Argument "SomeInterface.anotherField(foo:)" can only be defined once.',
          'Argument "@someDirective(foo:)" can only be defined once.',
        ]),
      );
    });
  });
}
