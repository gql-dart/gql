import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateInputFieldNameError extends ValidationError {
  const DuplicateInputFieldNameError({
    ObjectFieldNode? node,
  }) : super(
          node: node,
        );
}

class UniqueInputFieldNames extends ValidatingVisitor {
  Map<String, NameNode> knownNames = {};

  @override
  List<ValidationError> visitObjectValueNode(ObjectValueNode node) {
    knownNames.clear();
    final List<ValidationError> errors = [];
    node.fields.forEach((field) => errors.addAll(_visitObjectFieldNode(field)));
    return errors;
  }

  List<ValidationError> _visitObjectFieldNode(ObjectFieldNode node) {
    final fieldName = node.name.value;
    if (knownNames.containsKey(fieldName)) {
      return [DuplicateInputFieldNameError(node: node)];
    } else {
      knownNames[fieldName] = node.name;
    }
    return [];
  }
}
