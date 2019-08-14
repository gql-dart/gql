import "package:gql/ast.dart";

import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateDirectiveNameError extends ValidationError {
  const DuplicateDirectiveNameError({
    DirectiveDefinitionNode node,
  }) : super(
          node: node,
        );
}

class UniqueDirectiveNames extends ValidatingVisitor {
  Iterable<String> directiveNames = [];

  @override
  visitDirectiveDefinitionNode(DirectiveDefinitionNode node) {
    if (directiveNames.contains(node.name.value)) {
      return [
        DuplicateDirectiveNameError(node: node),
      ];
    }

    directiveNames = directiveNames.followedBy([node.name.value]);

    return [];
  }
}
