import "package:gql/ast.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:gql/src/validation/validator.dart";

class DuplicateTypeNameError extends ValidationError {
  const DuplicateTypeNameError({
    TypeDefinitionNode? node,
  }) : super(
          node: node,
        );
}

class UniqueTypeNames extends ValidatingVisitor {
  List<String> typeDefinitionsNames = [];

  List<ValidationError> _visitTypeDefinitionNode(TypeDefinitionNode node) {
    if (typeDefinitionsNames.contains(node.name.value)) {
      return [
        DuplicateTypeNameError(node: node),
      ];
    }

    typeDefinitionsNames.add(node.name.value);

    return [];
  }

  @override
  List<ValidationError> visitScalarTypeDefinitionNode(
          ScalarTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);

  @override
  List<ValidationError> visitObjectTypeDefinitionNode(
          ObjectTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);

  @override
  List<ValidationError> visitInterfaceTypeDefinitionNode(
          InterfaceTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);

  @override
  List<ValidationError> visitUnionTypeDefinitionNode(
          UnionTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);

  @override
  List<ValidationError> visitEnumTypeDefinitionNode(
          EnumTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);

  @override
  List<ValidationError> visitInputObjectTypeDefinitionNode(
          InputObjectTypeDefinitionNode node) =>
      _visitTypeDefinitionNode(node);
}
