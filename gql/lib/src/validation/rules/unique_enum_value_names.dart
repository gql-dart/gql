import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateEnumValueNameError extends ValidationError {
  final EnumValueDefinitionNode? valueNode;

  const DuplicateEnumValueNameError({
    this.valueNode,
    NameNode? nameNode,
  }) : super(
          node: nameNode,
        );
}

class _Accumulator {
  List<ValidationError> errors;
  List<String> valueNames;

  _Accumulator({
    this.errors = const [],
    this.valueNames = const [],
  });
}

class UniqueEnumValueNames extends ValidatingVisitor {
  const UniqueEnumValueNames();
  @override
  List<ValidationError> visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      node.values.fold<_Accumulator>(
        _Accumulator(),
        (fold, node) {
          if (fold.valueNames.contains(node.name.value)) {
            return _Accumulator(
              valueNames: fold.valueNames,
              errors: [
                ...fold.errors,
                DuplicateEnumValueNameError(
                  valueNode: node,
                  nameNode: node.name,
                ),
              ],
            );
          }

          return _Accumulator(
            valueNames: [
              ...fold.valueNames,
              node.name.value,
            ],
            errors: fold.errors,
          );
        },
      ).errors;
}
