import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateDirectiveNameError extends ValidationError {
  const DuplicateDirectiveNameError({
    DirectiveDefinitionNode? node,
  }) : super(
          node: node,
        );
}

class UniqueDirectiveNames extends ValidatingVisitor {
  List<String> directiveNames = [];

  @override
  List<ValidationError> visitDirectiveDefinitionNode(
      DirectiveDefinitionNode node) {
    if (directiveNames.contains(node.name.value)) {
      return [
        DuplicateDirectiveNameError(node: node),
      ];
    }

    directiveNames.add(node.name.value);

    return [];
  }
}
