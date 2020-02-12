A package for working with GraphQL documents.

This package exports several libraries:
- `package:gql/language.dart` provides ability to parse GraphQL string into AST and print AST as a string;
- `package:gql/ast.dart` defines the AST and provides visitors and transformers;

## ⚠️ Call for contributions ⚠️
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

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
