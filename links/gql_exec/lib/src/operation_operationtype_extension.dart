import "package:collection/collection.dart";
import "package:gql/ast.dart";

import "../gql_exec.dart";

extension OperationTypeExtension on Operation {
  OperationType? getOperationType() {
    final visitor = _OperationTypeVisitor(operationName);

    final type = document.definitions
        .map((d) => d.accept(visitor))
        .whereNotNull()
        .firstOrNull;

    return type;
  }
}

/// use visitor to avoid expensive type checks
class _OperationTypeVisitor extends Visitor<OperationType?> {
  final String? operationName;

  const _OperationTypeVisitor(this.operationName);

  @override
  OperationType? visitArgumentNode(ArgumentNode node) => null;

  @override
  OperationType? visitBooleanValueNode(BooleanValueNode node) => null;

  @override
  OperationType? visitDefaultValueNode(DefaultValueNode node) => null;

  @override
  OperationType? visitDirectiveDefinitionNode(DirectiveDefinitionNode node) =>
      null;

  @override
  OperationType? visitDirectiveNode(DirectiveNode node) => null;

  @override
  OperationType? visitDocumentNode(DocumentNode node) => null;

  @override
  OperationType? visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitEnumTypeExtensionNode(EnumTypeExtensionNode node) => null;

  @override
  OperationType? visitEnumValueDefinitionNode(EnumValueDefinitionNode node) =>
      null;

  @override
  OperationType? visitEnumValueNode(EnumValueNode node) => null;

  @override
  OperationType? visitFieldDefinitionNode(FieldDefinitionNode node) => null;

  @override
  OperationType? visitFieldNode(FieldNode node) => null;

  @override
  OperationType? visitFloatValueNode(FloatValueNode node) => null;

  @override
  OperationType? visitFragmentDefinitionNode(FragmentDefinitionNode node) =>
      null;

  @override
  OperationType? visitFragmentSpreadNode(FragmentSpreadNode node) => null;

  @override
  OperationType? visitInlineFragmentNode(InlineFragmentNode node) => null;

  @override
  OperationType? visitInputObjectTypeDefinitionNode(
          InputObjectTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitInputObjectTypeExtensionNode(
          InputObjectTypeExtensionNode node) =>
      null;

  @override
  OperationType? visitInputValueDefinitionNode(InputValueDefinitionNode node) =>
      null;

  @override
  OperationType? visitIntValueNode(IntValueNode node) => null;

  @override
  OperationType? visitInterfaceTypeDefinitionNode(
          InterfaceTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitInterfaceTypeExtensionNode(
          InterfaceTypeExtensionNode node) =>
      null;

  @override
  OperationType? visitListTypeNode(ListTypeNode node) => null;

  @override
  OperationType? visitListValueNode(ListValueNode node) => null;

  @override
  OperationType? visitNameNode(NameNode node) => null;

  @override
  OperationType? visitNamedTypeNode(NamedTypeNode node) => null;

  @override
  OperationType? visitNullValueNode(NullValueNode node) => null;

  @override
  OperationType? visitObjectFieldNode(ObjectFieldNode node) => null;

  @override
  OperationType? visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitObjectTypeExtensionNode(ObjectTypeExtensionNode node) =>
      null;

  @override
  OperationType? visitObjectValueNode(ObjectValueNode node) => null;

  @override
  OperationType? visitOperationDefinitionNode(OperationDefinitionNode node) =>
      operationName == null || node.name?.value == operationName
          ? node.type
          : null;

  @override
  OperationType? visitOperationTypeDefinitionNode(
          OperationTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitScalarTypeDefinitionNode(ScalarTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitScalarTypeExtensionNode(ScalarTypeExtensionNode node) =>
      null;

  @override
  OperationType? visitSchemaDefinitionNode(SchemaDefinitionNode node) => null;

  @override
  OperationType? visitSchemaExtensionNode(SchemaExtensionNode node) => null;

  @override
  OperationType? visitSelectionSetNode(SelectionSetNode node) => null;

  @override
  OperationType? visitStringValueNode(StringValueNode node) => null;

  @override
  OperationType? visitTypeConditionNode(TypeConditionNode node) => null;

  @override
  OperationType? visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node) =>
      null;

  @override
  OperationType? visitUnionTypeExtensionNode(UnionTypeExtensionNode node) =>
      null;

  @override
  OperationType? visitVariableDefinitionNode(VariableDefinitionNode node) =>
      null;

  @override
  OperationType? visitVariableNode(VariableNode node) => null;
}
