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
}
