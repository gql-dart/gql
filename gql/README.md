A package for working with GraphQL documents.

⚠️ This package is under development ⚠️

This package exports several libraries:
- `package:gql/language.dart` for working with GraphQL source;
- `package:gql/ast.dart` for working with GraphQL AST nodes;
- `package:gql/dart.dart` for generating Dart code from GraphQL AST nodes.

## `package:gql/language.dart`

### Parsing GraphQL documents

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;

void main() {
  final ast.DocumentNode doc = lang.parseString(
    """
    query UserInfo(\$id: ID!) {
      user(id: \$id) {
        id
        name
      }
    }
    """,
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

## `package:gql/ast.dart`

### Visiting GraphQL AST nodes

```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;

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
}
```

### Transforming GraphQL documents
```dart
import "package:gql/language.dart" as lang;
import "package:gql/ast.dart" as ast;

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
  final ast.DocumentNode doc = lang.parseString(
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

## `package:gql/dart.dart`

### Generating Dart code from GraphQL AST nodes

```dart
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/ast.dart" as ast;
import "package:gql/dart.dart" as dart;
import "package:gql/language.dart" as lang;

void main() {
  final ast.DocumentNode docNode = lang.parseString(
    """
    query UserInfo(\$id: ID!) {
      user(id: \$id) {
        id
        name
      }
    }
    """,
  );

  final Expression docExpression = dart.fromNode(
    docNode,
  );

  final library = Library(
    (b) => b.body.add(
      docExpression.assignFinal("document").statement,
    ),
  );

  final formatted = DartFormatter().format(
    "${library.accept(
      DartEmitter.scoped(),
    )}",
  );

  print(formatted);
}
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
