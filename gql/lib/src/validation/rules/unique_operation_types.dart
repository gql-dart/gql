import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateOperationTypeError extends ValidationError {
  const DuplicateOperationTypeError({
    OperationTypeDefinitionNode? node,
  }) : super(
          node: node,
        );
}

class _Accumulator {
  List<ValidationError> errors;
  List<OperationType> operations;

  _Accumulator({
    this.errors = const [],
    this.operations = const [],
  });
}

class UniqueOperationTypes extends ValidatingVisitor {
  const UniqueOperationTypes();
  @override
  List<ValidationError> visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) =>
      node.operationTypes.fold<_Accumulator>(
        _Accumulator(),
        (fold, node) {
          if (fold.operations.contains(node.operation)) {
            return _Accumulator(
              operations: fold.operations,
              errors: [
                ...fold.errors,
                DuplicateOperationTypeError(
                  node: node,
                ),
              ],
            );
          }

          return _Accumulator(
            operations: [
              ...fold.operations,
              node.operation,
            ],
            errors: fold.errors,
          );
        },
      ).errors;
}
