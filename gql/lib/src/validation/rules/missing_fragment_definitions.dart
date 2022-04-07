import "package:gql/ast.dart";
import "package:gql/document.dart";
import "package:gql/src/validation/validating_visitor.dart";

class MissingFragmentDefinitionError implements ValidationError {
  const MissingFragmentDefinitionError({
    required this.node,
  });

  @override
  final FragmentSpreadNode node;

  @override
  String get message {
    final fragmentName = node.name.value;
    final url = node.name.span?.file.url;
    final line = node.name.span?.start.line;
    var message = "no definition was found for $fragmentName fragment";
    if (url != null && line != null) {
      message = message + " in: $url:$line";
    } else if (line != null) {
      message = message + " in: line $line";
    }
    return message;
  }
}

/// Validates that every [FragmentSpreadNode] has [FragmentDefinitionNode] within the same [DocumentNode]
class MissingFragmentDefinition extends ValidatingVisitor {
  @override
  List<ValidationError> visitDocumentNode(DocumentNode node) {
    final errors = <ValidationError>[];
    // a workaround the fact that ValidatingVisitor is a SimpleVisitor which will only visit each node once.
    // the document is recursively being visited here to ensure that all [FragmentSpreadNode]s and [FragmentDefiniton]s
    // have been visited before returning an error.
    final recusriveVisitor = _MissingFragmentDefinitionRecursive();
    // visit all children of the given document node
    node.accept(recusriveVisitor);
    // validate that all FragmentSpreadNode has a FragmentDefinitionNode
    for (final fragmentSpread in recusriveVisitor.fragmentSpreads) {
      if (recusriveVisitor.fragmentDefinitions
          .any((f) => f.name.value == fragmentSpread.name.value)) {
        continue;
      } else {
        errors.add(MissingFragmentDefinitionError(node: fragmentSpread));
      }
    }
    return errors;
  }
}

class _MissingFragmentDefinitionRecursive extends RecursiveVisitor {
  final List<FragmentDefinitionNode> fragmentDefinitions = [];
  final List<FragmentSpreadNode> fragmentSpreads = [];

  @override
  void visitFragmentDefinitionNode(FragmentDefinitionNode node) {
    fragmentDefinitions.add(node);
    super.visitFragmentDefinitionNode(node);
  }

  @override
  void visitFragmentSpreadNode(FragmentSpreadNode node) {
    fragmentSpreads.add(node);
    super.visitFragmentSpreadNode(node);
  }
}
