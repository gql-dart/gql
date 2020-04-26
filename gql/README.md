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

## `package:gql/schema.dart` (experimental)

Higher-level schema type definitions derived from the `gql/ast.dart` asts.
Adds convenience attributes and type dereferencing facilities.

**NOTE**: does not currently have runtime features, such as field resolution.
It was initially developed as a more friendly way to work with schema asts.

```dart
import "package:gql/language.dart" as lang;
import "package:gql/schema.dart" as gqlSchema;
import "package:gql/operation.dart" as gqlOperation;

void main() {
  final schema =  gqlSchema.GraphQLSchema(lang.parseString(mySchemaString));

  final character = schema.getType("Character") as gqlSchema.InterfaceTypeDefinition;
  final droid = schema.getType("Droid") as gqlSchema.ObjectTypeDefinition;

  print(character.isImplementedBy(droid));

  print(schema.isPossibleType(character, droid));

  final document = gqlOperation.ExecutableDocument(
    lang.parseString(myQueryString),
    schema.getType,
    myImportedFragmentStrings.map(lang.parseString)
  );

  final importedFragment = document.getFragment("MyImportedFragment");

  final spreads = document.operations.first.selectionSet.fragmentSpreads;

  print(
    // dereference fragment spread into fragment definition
    spreads.first.fragment == importedFragment,
  );

}
```

## `package:gql/operation.dart` (experimental)

Higher-level "executable document" (i.e. operation) type definitions derived from the `gql/ast.dart` asts.
Adds convenience attributes as well as fragment and type dereferencing facilities.

Sibling subpackage of `gql/schema.dart`

```dart
import "package:gql/language.dart" as lang;
import "package:gql/operation.dart" as gqlOperation;

void main() {
  final document = gqlOperation.ExecutableDocument(
    lang.parseString(myQueryString),
    myGqlSchema.getType, // necessary for dereferencing schema definitions
    myImportedFragmentStrings.map(lang.parseString)
  );

  final importedFragment = document.getFragment("MyImportedFragment");

  final spreads = document.operations.first.selectionSet.fragmentSpreads;

  print(
    // dereference fragment spread into fragment definition
    spreads.first.fragment == importedFragment,
  );

}
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
