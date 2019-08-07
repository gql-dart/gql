import "package:gql/language.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

String nonExecutableDefinitionMessage(String definition) {}

class ExecutableDefinitions extends ValidatingVisitor {
  @override
  visitDocumentNode(DocumentNode node) => node.definitions
          .where(
        (def) => def is! ExecutableDefinitionNode,
      )
          .map((def) {
        if (def is SchemaDefinitionNode || def is SchemaExtensionNode) {
          return ValidationError(
            message: nonExecutableDefinitionMessage("schema"),
            node: def,
          );
        }

        if (def is TypeExtensionNode) {
          return ValidationError(
            message: nonExecutableDefinitionMessage(def.name.value),
            node: def,
          );
        }

        if (def is TypeDefinitionNode) {
          return ValidationError(
            message: nonExecutableDefinitionMessage(def.name.value),
            node: def,
          );
        }

        if (def is DirectiveDefinitionNode) {
          return ValidationError(
            message: nonExecutableDefinitionMessage(def.name.value),
            node: def,
          );
        }

        return ValidationError(
          message: null,
          node: def,
        );
      });
}
