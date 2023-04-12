import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateFieldDefinitionNameError extends ValidationError {
  final TypeDefinitionNode? typeNode;

  const DuplicateFieldDefinitionNameError({
    this.typeNode,
    NameNode? nameNode,
  }) : super(
          node: nameNode,
        );
}

class _Accumulator {
  List<ValidationError> errors;
  List<String> fieldNames;

  _Accumulator({
    this.errors = const [],
    this.fieldNames = const [],
  });
}

class UniqueFieldDefinitionNames extends ValidatingVisitor {
  const UniqueFieldDefinitionNames();
  List<ValidationError> _validateFields(
    List<NameNode> nodes,
    TypeDefinitionNode typeNode,
  ) =>
      nodes.fold<_Accumulator>(
        _Accumulator(),
        (fold, node) {
          if (fold.fieldNames.contains(node.value)) {
            return _Accumulator(
              fieldNames: fold.fieldNames,
              errors: [
                ...fold.errors,
                DuplicateFieldDefinitionNameError(
                  typeNode: typeNode,
                  nameNode: node,
                ),
              ],
            );
          }

          return _Accumulator(
            fieldNames: [
              ...fold.fieldNames,
              node.value,
            ],
            errors: fold.errors,
          );
        },
      ).errors;

  @override
  List<ValidationError> visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields
            .map(
              (field) => field.name,
            )
            .toList(growable: false),
        node,
      );

  @override
  List<ValidationError> visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields
            .map(
              (field) => field.name,
            )
            .toList(growable: false),
        node,
      );

  @override
  List<ValidationError> visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields
            .map(
              (field) => field.name,
            )
            .toList(growable: false),
        node,
      );
}
