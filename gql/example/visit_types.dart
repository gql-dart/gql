import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;

class TypeVisitor extends ast.RecursiveVisitor {
  Iterable<ast.ObjectTypeDefinitionNode> types = [];

  @override
  void visitObjectTypeDefinitionNode(
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
