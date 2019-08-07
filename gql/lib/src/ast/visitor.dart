import "package:gql/src/ast/ast.dart";

abstract class Visitor<R> {
  R visitDocumentNode(DocumentNode node);

  R visitNameNode(NameNode node);

  R visitDirectiveNode(DirectiveNode node);

  R visitListTypeNode(ListTypeNode node);

  R visitNamedTypeNode(NamedTypeNode node);

  R visitDefaultValueNode(DefaultValueNode node);

  R visitVariableDefinitionNode(VariableDefinitionNode node);

  R visitObjectFieldNode(ObjectFieldNode node);

  R visitObjectValueNode(ObjectValueNode node);

  R visitListValueNode(ListValueNode node);

  R visitEnumValueNode(EnumValueNode node);

  R visitNullValueNode(NullValueNode node);

  R visitBooleanValueNode(BooleanValueNode node);

  R visitStringValueNode(StringValueNode node);

  R visitFloatValueNode(FloatValueNode node);

  R visitIntValueNode(IntValueNode node);

  R visitVariableNode(VariableNode node);

  R visitTypeConditionNode(TypeConditionNode node);

  R visitFragmentDefinitionNode(FragmentDefinitionNode node);

  R visitInlineFragmentNode(InlineFragmentNode node);

  R visitFragmentSpreadNode(FragmentSpreadNode node);

  R visitArgumentNode(ArgumentNode node);

  R visitFieldNode(FieldNode node);

  R visitSelectionSetNode(SelectionSetNode node);

  R visitOperationDefinitionNode(OperationDefinitionNode node);

  R visitSchemaDefinitionNode(SchemaDefinitionNode node);

  R visitOperationTypeDefinitionNode(OperationTypeDefinitionNode node);

  R visitScalarTypeDefinitionNode(ScalarTypeDefinitionNode node);

  R visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node);

  R visitFieldDefinitionNode(FieldDefinitionNode node);

  R visitInputValueDefinitionNode(InputValueDefinitionNode node);

  R visitInterfaceTypeDefinitionNode(InterfaceTypeDefinitionNode node);

  R visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node);

  R visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node);

  R visitEnumValueDefinitionNode(EnumValueDefinitionNode node);

  R visitInputObjectTypeDefinitionNode(InputObjectTypeDefinitionNode node);

  R visitDirectiveDefinitionNode(DirectiveDefinitionNode node);

  R visitSchemaExtensionNode(SchemaExtensionNode node);

  R visitScalarTypeExtensionNode(ScalarTypeExtensionNode node);

  R visitObjectTypeExtensionNode(ObjectTypeExtensionNode node);

  R visitInterfaceTypeExtensionNode(InterfaceTypeExtensionNode node);

  R visitUnionTypeExtensionNode(UnionTypeExtensionNode node);

  R visitEnumTypeExtensionNode(EnumTypeExtensionNode node);

  R visitInputObjectTypeExtensionNode(InputObjectTypeExtensionNode node);
}

class SimpleVisitor<R> implements Visitor<R> {
  @override
  R visitDocumentNode(DocumentNode node) => null;

  @override
  R visitNameNode(NameNode node) => null;

  @override
  R visitDirectiveNode(DirectiveNode node) => null;

  @override
  R visitListTypeNode(ListTypeNode node) => null;

  @override
  R visitNamedTypeNode(NamedTypeNode node) => null;

  @override
  R visitDefaultValueNode(DefaultValueNode node) => null;

  @override
  R visitVariableDefinitionNode(VariableDefinitionNode node) => null;

  @override
  R visitObjectFieldNode(ObjectFieldNode node) => null;

  @override
  R visitObjectValueNode(ObjectValueNode node) => null;

  @override
  R visitListValueNode(ListValueNode node) => null;

  @override
  R visitEnumValueNode(EnumValueNode node) => null;

  @override
  R visitNullValueNode(NullValueNode node) => null;

  @override
  R visitBooleanValueNode(BooleanValueNode node) => null;

  @override
  R visitStringValueNode(StringValueNode node) => null;

  @override
  R visitFloatValueNode(FloatValueNode node) => null;

  @override
  R visitIntValueNode(IntValueNode node) => null;

  @override
  R visitVariableNode(VariableNode node) => null;

  @override
  R visitTypeConditionNode(TypeConditionNode node) => null;

  @override
  R visitFragmentDefinitionNode(FragmentDefinitionNode node) => null;

  @override
  R visitInlineFragmentNode(InlineFragmentNode node) => null;

  @override
  R visitFragmentSpreadNode(FragmentSpreadNode node) => null;

  @override
  R visitArgumentNode(ArgumentNode node) => null;

  @override
  R visitFieldNode(FieldNode node) => null;

  @override
  R visitSelectionSetNode(SelectionSetNode node) => null;

  @override
  R visitOperationDefinitionNode(OperationDefinitionNode node) => null;

  @override
  R visitSchemaDefinitionNode(SchemaDefinitionNode node) => null;

  @override
  R visitOperationTypeDefinitionNode(OperationTypeDefinitionNode node) => null;

  @override
  R visitScalarTypeDefinitionNode(ScalarTypeDefinitionNode node) => null;

  @override
  R visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) => null;

  @override
  R visitFieldDefinitionNode(FieldDefinitionNode node) => null;

  @override
  R visitInputValueDefinitionNode(InputValueDefinitionNode node) => null;

  @override
  R visitInterfaceTypeDefinitionNode(InterfaceTypeDefinitionNode node) => null;

  @override
  R visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node) => null;

  @override
  R visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) => null;

  @override
  R visitEnumValueDefinitionNode(EnumValueDefinitionNode node) => null;

  @override
  R visitInputObjectTypeDefinitionNode(InputObjectTypeDefinitionNode node) =>
      null;

  @override
  R visitDirectiveDefinitionNode(DirectiveDefinitionNode node) => null;

  @override
  R visitSchemaExtensionNode(SchemaExtensionNode node) => null;

  @override
  R visitScalarTypeExtensionNode(ScalarTypeExtensionNode node) => null;

  @override
  R visitObjectTypeExtensionNode(ObjectTypeExtensionNode node) => null;

  @override
  R visitInterfaceTypeExtensionNode(InterfaceTypeExtensionNode node) => null;

  @override
  R visitUnionTypeExtensionNode(UnionTypeExtensionNode node) => null;

  @override
  R visitEnumTypeExtensionNode(EnumTypeExtensionNode node) => null;

  @override
  R visitInputObjectTypeExtensionNode(InputObjectTypeExtensionNode node) =>
      null;
}

abstract class RecursiveVisitor implements Visitor<void> {
  @override
  void visitArgumentNode(ArgumentNode node) => node.visitChildren(this);

  @override
  void visitBooleanValueNode(BooleanValueNode node) => node.visitChildren(this);

  @override
  void visitDefaultValueNode(DefaultValueNode node) => node.visitChildren(this);

  @override
  void visitDirectiveDefinitionNode(DirectiveDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitDirectiveNode(DirectiveNode node) => node.visitChildren(this);

  @override
  void visitDocumentNode(DocumentNode node) => node.visitChildren(this);

  @override
  void visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitEnumTypeExtensionNode(EnumTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitEnumValueDefinitionNode(EnumValueDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitEnumValueNode(EnumValueNode node) => node.visitChildren(this);

  @override
  void visitFieldDefinitionNode(FieldDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitFieldNode(FieldNode node) => node.visitChildren(this);

  @override
  void visitFloatValueNode(FloatValueNode node) => node.visitChildren(this);

  @override
  void visitFragmentDefinitionNode(FragmentDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitFragmentSpreadNode(FragmentSpreadNode node) =>
      node.visitChildren(this);

  @override
  void visitInlineFragmentNode(InlineFragmentNode node) =>
      node.visitChildren(this);

  @override
  void visitInputObjectTypeDefinitionNode(InputObjectTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitInputObjectTypeExtensionNode(InputObjectTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitInputValueDefinitionNode(InputValueDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitIntValueNode(IntValueNode node) => node.visitChildren(this);

  @override
  void visitInterfaceTypeDefinitionNode(InterfaceTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitInterfaceTypeExtensionNode(InterfaceTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitListTypeNode(ListTypeNode node) => node.visitChildren(this);

  @override
  void visitListValueNode(ListValueNode node) => node.visitChildren(this);

  @override
  void visitNameNode(NameNode node) => node.visitChildren(this);

  @override
  void visitNamedTypeNode(NamedTypeNode node) => node.visitChildren(this);

  @override
  void visitNullValueNode(NullValueNode node) => node.visitChildren(this);

  @override
  void visitObjectFieldNode(ObjectFieldNode node) => node.visitChildren(this);

  @override
  void visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitObjectTypeExtensionNode(ObjectTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitObjectValueNode(ObjectValueNode node) => node.visitChildren(this);

  @override
  void visitOperationDefinitionNode(OperationDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitOperationTypeDefinitionNode(OperationTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitScalarTypeDefinitionNode(ScalarTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitScalarTypeExtensionNode(ScalarTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitSchemaDefinitionNode(SchemaDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitSchemaExtensionNode(SchemaExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitSelectionSetNode(SelectionSetNode node) => node.visitChildren(this);

  @override
  void visitStringValueNode(StringValueNode node) => node.visitChildren(this);

  @override
  void visitTypeConditionNode(TypeConditionNode node) =>
      node.visitChildren(this);

  @override
  void visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitUnionTypeExtensionNode(UnionTypeExtensionNode node) =>
      node.visitChildren(this);

  @override
  void visitVariableDefinitionNode(VariableDefinitionNode node) =>
      node.visitChildren(this);

  @override
  void visitVariableNode(VariableNode node) => node.visitChildren(this);
}
