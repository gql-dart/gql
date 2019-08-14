import "package:gql/ast.dart";

import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateFieldDefinitionNameError extends ValidationError {
  const DuplicateFieldDefinitionNameError({
    TypeDefinitionNode typeNode,
    NameNode nameNode,
  }) : super(
          node: nameNode,
        );
}

class _Accumulator {
  Iterable<ValidationError> errors;
  Iterable<String> fieldNames;

  _Accumulator({
    this.errors = const [],
    this.fieldNames = const [],
  });
}

class UniqueFieldDefinitionNames extends ValidatingVisitor {
  Iterable<ValidationError> _validateFields(
    Iterable<NameNode> nodes,
    TypeDefinitionNode typeNode,
  ) =>
      nodes.fold<_Accumulator>(
        _Accumulator(),
        (fold, node) {
          if (fold.fieldNames.contains(node.value)) {
            return _Accumulator(
              fieldNames: fold.fieldNames,
              errors: fold.errors.followedBy([
                DuplicateFieldDefinitionNameError(
                  typeNode: typeNode,
                  nameNode: node,
                )
              ]),
            );
          }

          return _Accumulator(
            fieldNames: fold.fieldNames.followedBy([
              node.value,
            ]),
            errors: fold.errors,
          );
        },
      ).errors;

  @override
  visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields.map(
          (field) => field.name,
        ),
        node,
      );

  @override
  visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields.map(
          (field) => field.name,
        ),
        node,
      );

  @override
  visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      _validateFields(
        node.fields.map(
          (field) => field.name,
        ),
        node,
      );
}
