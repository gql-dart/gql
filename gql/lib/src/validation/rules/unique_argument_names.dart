import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateArgumentNameError extends ValidationError {
  const DuplicateArgumentNameError({
    ArgumentNode? node,
  }) : super(
          node: node,
        );
}

class UniqueArgumentNames extends ValidatingVisitor {
  final Map<String, NameNode> _knownArgNames = {};

  @override
  List<ValidationError> visitArgumentNode(ArgumentNode node) {
    final argName = node.name.value;
    if (_knownArgNames.containsKey(argName)) {
      return [DuplicateArgumentNameError(node: node)];
    } else {
      _knownArgNames[argName] = node.name;
    }
    return [];
  }

  @override
  List<ValidationError> visitDirectiveNode(DirectiveNode node) {
    _knownArgNames.clear();
    return [];
  }

  @override
  List<ValidationError> visitFieldNode(FieldNode node) {
    _knownArgNames.clear();
    return [];
  }
}
