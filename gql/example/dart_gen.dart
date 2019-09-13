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
