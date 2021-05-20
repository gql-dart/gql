import "package:gql/schema.dart";
import "package:test/test.dart";

import "./data/schema.gql.dart" as _sample;

void main() {
  group("GraphQLSchema sanity checks and type resolution", () {
    final schema = GraphQLSchema.fromNode(_sample.schema);
    test("All object types listed", () {
      expect(
        schema.objectTypes.map((o) => o.name),
        unorderedEquals(<String>{
          "Droid",
          "Human",
          "Review",
          "ReviewResults",
          "Starship",
          "StarWarsMutation",
          "StarWarsQuery",
          "Subscription",
        }),
      );
    });

    test("Can dereference an object interace", () {
      final droid = schema.getType("Droid") as ObjectTypeDefinition;
      expect(
        droid.interfaces[0]!.name,
        equals("Character"),
      );
    });

    test("interface.isImplementedBy results", () {
      final character = schema.getType("Character") as InterfaceTypeDefinition;

      final droid = schema.getType("Droid") as ObjectTypeDefinition;
      final review = schema.getType("Review") as ObjectTypeDefinition;

      expect(character.isImplementedBy(droid), equals(true));
      expect(character.isImplementedBy(review), equals(false));

      expect(schema.isSubType(character, droid), equals(true));
      expect(schema.isSubType(character, review), equals(false));
    });

    test("schema.getPossibleTypes results", () {
      final character = schema.getType("Character") as InterfaceTypeDefinition?;
      final searchResult = schema.getType(
        "SearchResult",
      ) as UnionTypeDefinition?;

      final human = schema.getType("Human") as ObjectTypeDefinition?;
      final droid = schema.getType("Droid") as ObjectTypeDefinition?;
      final starship = schema.getType("Starship") as ObjectTypeDefinition?;

      expect(
        schema.getPossibleTypes(searchResult),
        unorderedEquals(
          <ObjectTypeDefinition?>{droid, starship, human},
        ),
      );

      expect(
        schema.getPossibleTypes(character),
        unorderedEquals(<ObjectTypeDefinition?>{
          droid,
          human,
        }),
      );
    });

    test("Type dereferencing", () {
      final starshipsType =
          schema.query!.getField("starships").type as ListType;

      expect(starshipsType.baseTypeName, equals("Starship"));

      final starship = (starshipsType.type as NamedType).type!;
      expect(starship.runtimeType, equals(ObjectTypeDefinition));
      expect(starship.name, equals("Starship"));
    });

    test("mutation arguments", () {
      final updateHuman = schema.mutation!.getField("updateHuman");

      expect(updateHuman.args!.first.name, equals("id"));
      expect(updateHuman.args!.first.type!.isNonNull, equals(true));

      final inputTypeRef = updateHuman.args!.last.type as NamedType;
      expect(inputTypeRef.name, equals("HumanInput"));
      expect(inputTypeRef.isNonNull, equals(true));
      expect(inputTypeRef.hasResolver, equals(true));

      final inputType = inputTypeRef.type!;
      expect(inputType.runtimeType, equals(InputObjectTypeDefinition));
      expect(inputType.name, equals("HumanInput"));
    });

    test("mutation arguments", () {
      final updateHuman = schema.mutation!.getField("updateHuman");

      expect(updateHuman.args!.first.name, equals("id"));
      expect(updateHuman.args!.first.type!.isNonNull, equals(true));

      final inputTypeRef = updateHuman.args!.last.type as NamedType;
      expect(inputTypeRef.name, equals("HumanInput"));
      expect(inputTypeRef.isNonNull, equals(true));
      expect(inputTypeRef.hasResolver, equals(true));

      final inputType = inputTypeRef.type!;
      expect(inputType.runtimeType, equals(InputObjectTypeDefinition));
      expect(inputType.name, equals("HumanInput"));
    });

    test("Contains default directives", () {
      expect(
        schema.directives!.map((d) => d.name),
        containsAll(<String>{"skip", "include", "deprecated"}),
      );
    });
  });
}
