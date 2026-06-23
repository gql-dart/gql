import "package:gql/document.dart";
import "package:gql/src/validation/validating_visitor.dart";

import "../../../ast.dart";

class NonExecutableError extends ValidationError {
  const NonExecutableError({required String name, required DefinitionNode node})
      : super(
          message: 'The "$name" definition is not executable.',
          node: node,
        );

  const NonExecutableError.schema({required DefinitionNode node})
      : super(
          message: "The schema definition is not executable.",
          node: node,
        );
}

/// Executable definitions
///
/// A GraphQL document is only valid for execution if all definitions are either
/// operation or fragment definitions.
///
/// See https://spec.graphql.org/draft/#sec-Executable-Definitions
class ExecutableDefinitions extends ValidatingVisitor {
  @override
  List<ValidationError>? visitDocumentNode(DocumentNode node) =>
      node.definitions
          .map((it) {
            if (it is ExecutableDefinitionNode) {
              return null;
            } else {
              if (it is TypeDefinitionNode) {
                return NonExecutableError(name: it.name.value, node: it);
              } else if (it is TypeExtensionNode) {
                return NonExecutableError(name: it.name.value, node: it);
              } else if (it is DirectiveDefinitionNode) {
                return NonExecutableError(name: it.name.value, node: it);
              } else if (it is SchemaDefinitionNode ||
                  it is SchemaExtensionNode) {
                return NonExecutableError.schema(node: it);
              } else {
                throw StateError("Invalid node type");
              }
            }
          })
          .nonNulls
          .toList();
}
