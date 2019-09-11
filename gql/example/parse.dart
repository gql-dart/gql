import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;
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
