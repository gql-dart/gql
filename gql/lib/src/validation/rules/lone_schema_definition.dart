import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class MultipleSchemaDefinitionsError extends ValidationError {
  const MultipleSchemaDefinitionsError({
    SchemaDefinitionNode? node,
  }) : super(
          node: node,
        );
}

class LoneSchemaDefinition extends ValidatingVisitor {
  bool hasSchemaDef = false;

  @override
  List<ValidationError> visitSchemaDefinitionNode(SchemaDefinitionNode node) {
    if (hasSchemaDef) {
      return [
        MultipleSchemaDefinitionsError(node: node),
      ];
    }

    hasSchemaDef = true;

    return [];
  }
}
