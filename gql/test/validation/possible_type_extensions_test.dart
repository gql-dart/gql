import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

import "./common.dart";

final validate = createValidator({
  ValidationRule.possibleTypeExtensions,
});

void main() {
  group("Possible type extensions", () {
    test("one extension per type", () {
      expect(
        validate(
          """
          scalar FooScalar
          type FooObject
          interface FooInterface
          union FooUnion
          enum FooEnum
          input FooInputObject
    
          extend scalar FooScalar @dummy
          extend type FooObject @dummy
          extend interface FooInterface @dummy
          extend union FooUnion @dummy
          extend enum FooEnum @dummy
          extend input FooInputObject @dummy
          """,
        ).map((it) => it.toString()),
        equals([]),
      );
    });

    test("multiple extension per type", () {
      expect(
        validate(
          """
          scalar FooScalar
          type FooObject
          interface FooInterface
          union FooUnion
          enum FooEnum
          input FooInputObject
    
          extend scalar FooScalar @dummy
          extend type FooObject @dummy
          extend interface FooInterface @dummy
          extend union FooUnion @dummy
          extend enum FooEnum @dummy
          extend input FooInputObject @dummy

          extend scalar FooScalar @dummy
          extend type FooObject @dummy
          extend interface FooInterface @dummy
          extend union FooUnion @dummy
          extend enum FooEnum @dummy
          extend input FooInputObject @dummy
          """,
        ).map((it) => it.toString()),
        equals([]),
      );
    });

    test("ignores non type definitions", () {
      expect(
        validate(
          """
          query Foo { __typename }
          fragment Foo on Query { __typename }
          directive @Foo on SCHEMA

          extend scalar Foo @dummy
          extend type Foo @dummy
          extend interface Foo @dummy
          extend union Foo @dummy
          extend enum Foo @dummy
          extend input Foo @dummy
          """,
        ).map((it) => it.toString()),
        equals([
          'Cannot extend type "Foo" because it is not defined.',
          'Cannot extend type "Foo" because it is not defined.',
          'Cannot extend type "Foo" because it is not defined.',
          'Cannot extend type "Foo" because it is not defined.',
          'Cannot extend type "Foo" because it is not defined.',
          'Cannot extend type "Foo" because it is not defined.',
        ]),
      );
    });

    test("undefined type", () {
      expect(
        validate(
          """
          type Known
    
          extend scalar Unknown @dummy
          extend type Unknown @dummy
          extend interface Unknown @dummy
          extend union Unknown @dummy
          extend enum Unknown @dummy
          extend input Unknown @dummy
          """,
        ).map((it) => it.toString()),
        equals([
          'Cannot extend type "Unknown" because it is not defined.',
          'Cannot extend type "Unknown" because it is not defined.',
          'Cannot extend type "Unknown" because it is not defined.',
          'Cannot extend type "Unknown" because it is not defined.',
          'Cannot extend type "Unknown" because it is not defined.',
          'Cannot extend type "Unknown" because it is not defined.',
        ]),
      );
    });

    test("incorrect types", () {
      expect(
        validate(
          """
          scalar FooScalar
          type FooObject
          interface FooInterface
          union FooUnion
          enum FooEnum
          input FooInputObject
    
          extend type FooScalar @dummy
          extend interface FooObject @dummy
          extend union FooInterface @dummy
          extend enum FooUnion @dummy
          extend input FooEnum @dummy
          extend scalar FooInputObject @dummy
      """,
        ).map((it) => it.toString()),
        equals([
          'Cannot extend non-object type "FooScalar".',
          'Cannot extend non-interface type "FooObject".',
          'Cannot extend non-union type "FooInterface".',
          'Cannot extend non-enum type "FooUnion".',
          'Cannot extend non-input type "FooEnum".',
          'Cannot extend non-scalar type "FooInputObject".',
        ]),
      );
    });
  });
}
