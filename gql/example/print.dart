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
