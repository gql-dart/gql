A package for working with GraphQL documents.

⚠️ This package is under development ⚠️

## Usage

This package exports two libraries: `language.dart` for working with GraphQL source and `ast.dart` for working with GraphQL AST nodes.

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;
```

### Parsing GraphQL documents

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;
import "package:source_span/source_span.dart";

void main() {
  final ast.DocumentNode doc = lang.parse(
    SourceFile.fromString(
      """
        query UserInfo(\$id: ID!) {
          user(id: \$id) {
            id
            name
          }
        }
      """,
    ),
  );

  print(
    (doc.definitions.first as ast.OperationDefinitionNode).name.value,
  );
}
```

### Printing GraphQL AST to string

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;

void main() {
  print(
    lang.printNode(
      ast.SchemaDefinitionNode(
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
}
```

### Visiting GraphQL AST nodes

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;
import "package:source_span/source_span.dart";

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
  final ast.DocumentNode doc = lang.parse(
    SourceFile.fromString(
      """
        type A { id: ID! }
        type B { id: ID! }
        type C { id: ID! }
        type D { id: ID! }
        type E { id: ID! }
      """,
    ),
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
}
```

### Transforming GraphQL documents
```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;
import "package:source_span/source_span.dart";

class AddTypenames extends ast.TransformingVisitor {
  @override
  visitFieldNode(ast.FieldNode node) {
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
        ].followedBy(node.selectionSet.selections),
      ),
    );
  }
}

void main() {
  final ast.DocumentNode doc = lang.parse(
    SourceFile.fromString(
      """
        query UserInfo(\$id: ID!, \$articleId: ID!) {
          user(id: \$id) {
            id
            name
          }
          post(id: \$articleId) {
            id
            title
            description
          }
        }
      """,
    ),
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
}
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
