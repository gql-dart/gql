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
  final doc = lang.parse(
    SourceFile(
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

  final withTypenames = ast.transform(
    doc,
    [
      AddTypenames(),
    ],
  );

  print(
    lang.printNode(withTypenames),
  );
}
