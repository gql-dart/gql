import "package:gql/schema.dart";
import "package:gql/operation.dart";
import "package:test/test.dart";

import "./data/operations.gql.dart" as _operations;
import "./data/schema.gql.dart" as _sample;

void main() {
  group("Query sanity checks and type resolution", () {
    final document = ExecutableDocument(
      _operations.query,
      GraphQLSchema.fromNode(_sample.schema).getType,
      _operations.importedFragments,
    );

    test("Can dereference schemaType", () {
      final query = document.operations.first;
      expect(query.schemaType!.name, equals("StarWarsQuery"));
    });
  });

  group("Mutation sanity checks and type resolution", () {
    final document = ExecutableDocument(
      _operations.mutation,
      GraphQLSchema.fromNode(_sample.schema).getType,
      _operations.importedFragments,
    );

    test("Can dereference fragmentType", () {
      final mutationField = document.operations.first.selectionSet.fields.first;

      final spreads = mutationField.selectionSet!.fragmentSpreads;
      expect(spreads.first.fragment.name, equals("info"));

      final relationships = spreads[1].fragment;
      expect(relationships.name, equals("relationships"));

      final relationshipsFriends = relationships.selectionSet.fields.first;
      expect(
        relationshipsFriends.selectionSet!.fragmentSpreads.first.fragment.name,
        equals("friendNetwork"),
      );
    });
  });
}
