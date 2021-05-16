import "package:gql/language.dart" as lang;
import "package:gql/schema.dart" as gql_schema;
import "package:gql/operation.dart" as gql_operation;

final schemaDefinition = lang.parseString(r"""
schema {
  query: StarWarsQuery
}

interface Character {
  id: String
  name: String
}

type Droid implements Character {
  id: String
  name: String
  primaryFunction: String
}

type StarWarsQuery {
  droids: [Droid!]
}
""");

void inspectSchema() {
  final schema = gql_schema.GraphQLSchema.fromNode(schemaDefinition);

  final character =
      schema.getType("Character") as gql_schema.InterfaceTypeDefinition;
  final droid = schema.getType("Droid") as gql_schema.ObjectTypeDefinition;

  print(character.isImplementedBy(droid));
  // prints "true"

  print(schema.query!.getField("droids").type.toString());
  // prints "[Droid!]"
}

final fragmentDefinitions = [
  lang.parseString(r"""
  fragment droidName on Droid {
    name
  }
  """),
];

final queryDefinition = lang.parseString(r"""
query AllDroids {
  droids {
    ...droidName
    primaryFunction
  }
}
""");

void inspectQuery() {
  final schema = gql_schema.GraphQLSchema.fromNode(schemaDefinition);

  final document = gql_operation.ExecutableDocument(
    queryDefinition,
    schema.getType,
    // necessary for dereferencing schema definitions
    fragmentDefinitions,
  );

  final importedFragment = document.getFragment("droidName");
  print(importedFragment);
  // prints the fagment above

  final query = document.operations.first;
  final droids = query.selectionSet.fields.first;
  final spreadDroidName = droids.selectionSet!.fragmentSpreads.first;

  print(
    // dereference fragment spread into fragment definition
    spreadDroidName.fragment == importedFragment,
  );
}

void main() {
  inspectSchema();
  inspectQuery();
}
