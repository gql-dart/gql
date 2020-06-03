[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/gql.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/gql/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/gql/issues

[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/gql/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/gql/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/gql/network/members

[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.gg/NryjpVa

A package for working with GraphQL documents.

This package exports several libraries:

- `package:gql/language.dart` provides ability to parse GraphQL string into AST and print AST as a string;
- `package:gql/ast.dart` defines the AST and provides visitors and transformers;

## ⚠ Call for contributions ⚠

`package:gql/document.dart` implements some of the validation rules defined in GraphQL spec.

PRs are welcome to finish the validation support. Rules which are concerned with Schema validation should take preference over rules concerned with Document validation.

## `package:gql/language.dart`

### Parsing GraphQL documents

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;

void main() {
  final ast.DocumentNode doc = lang.parseString(
    r"""
      query UserInfo($id: ID!) {
        user(id: $id) {
          id
          name
        }
      }
    """,
  );

  print(
    (doc.definitions.first as ast.OperationDefinitionNode).name.value,
  ); // prints "UserInfo"
}
```

### Printing GraphQL AST to string

```dart
import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;

void main() {
  print(
    lang.printNode(
      const ast.SchemaDefinitionNode(
        operationTypes: [
          ast.OperationTypeDefinitionNode(
            operation: ast.OperationType.query,
            type: ast.NamedTypeNode(
              name: ast.NameNode(value: "MyQuery"),
              isNonNull: false,
            ),
          )
        ],
      ),
    ),
  );
  // prints
  // "schema {
  //   query: MyQuery
  // }"
}
```

## `package:gql/ast.dart`

### Visiting GraphQL AST nodes

```dart
import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;

class TypeVisitor extends ast.RecursiveVisitor {
  Iterable<ast.ObjectTypeDefinitionNode> types = [];

  @override
  visitObjectTypeDefinitionNode(
    ast.ObjectTypeDefinitionNode node,
  ) {
    types = types.followedBy([node]);
    super.visitObjectTypeDefinitionNode(node);
  }
}

void main() {
  final ast.DocumentNode doc = lang.parseString(
    """
    type A { id: ID! }
    type B { id: ID! }
    type C { id: ID! }
    type D { id: ID! }
    type E { id: ID! }
    """,
  );

  final TypeVisitor v = TypeVisitor();

  doc.accept(v);

  print(
    v.types
        .map(
          (t) => t.name.value,
        )
        .join("\n"),
  );
  // prints
  // "A
  // B
  // C
  // D
  // E"
}
```

### Transforming GraphQL documents

```dart
import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;

class AddTypenames extends ast.TransformingVisitor {
  @override
  ast.FieldNode visitFieldNode(ast.FieldNode node) {
    if (node.selectionSet == null) {
      return node;
    }

    return ast.FieldNode(
      name: node.name,
      alias: node.alias,
      arguments: node.arguments,
      directives: node.directives,
      selectionSet: ast.SelectionSetNode(
        selections: <ast.SelectionNode>[
          ast.FieldNode(
            name: ast.NameNode(value: "__typename"),
          ),
          ...node.selectionSet.selections
        ],
      ),
    );
  }
}

void main() {
  final ast.DocumentNode doc = lang.parseString(
    r"""
      query UserInfo($id: ID!, $articleId: ID!) {
        user(id: $id) {
          id
          name
        }
        post(id: $articleId) {
          id
          title
          description
        }
      }
    """,
  );

  final ast.DocumentNode withTypenames = ast.transform(
    doc,
    [
      AddTypenames(),
    ],
  );

  print(
    lang.printNode(withTypenames),
  );
  // prints
  // "query UserInfo($id: ID!, $articleId: ID!) {
  //   user(id: $id) {
  //     __typename
  //     id
  //     name
  //   }
  //   post(id: $articleId) {
  //     __typename
  //     id
  //     title
  //     description
  //   }
  // }"
}
```

## `gql/schema.dart` and `gql/operation.dart` <sub>(experimental)</sub>

`gql/schema.dart` and `gql/operation.dart` provide higher-level
type definitions derived from `gql/ast.dart` asts for
GraphQL Schemas and Operations respectively.

**NOTE**: does not currently have runtime features, such as field resolution.
It was initially developed as a more friendly way to work with schema ASTs.

```dart
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

  print(schema.query.getField("droids").type.toString());
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
  final spreadDroidName = droids.selectionSet.fragmentSpreads.first;

  print(
    // dereference fragment spread into fragment definition
    spreadDroidName.fragment == importedFragment,
  );
}

void main() {
  inspectSchema();
  inspectQuery();
}

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
