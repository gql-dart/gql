import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;

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
