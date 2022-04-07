import "package:gql/src/ast/ast.dart";
import "package:gql/src/ast/visitor.dart";

/// Transforms an AST [node] using a list of [visitors].
///
/// - [node] can be any [Node] in the tree.
/// - [visitors] must define transformations as described in [TransformingVisitor]
N transform<N extends Node>(
  N node,
  List<TransformingVisitor> visitors,
) =>
    node.accept(
      _Transformer(visitors: visitors),
    ) as N;

/// A [Visitor] returning the node it is visiting.
///
/// Used to implement AST transformers.
///
/// When used together with [transform] you only need to override
/// the visit methods relevant to your transformation.
/// [transform] will make sure to walk the AST recursively.
abstract class TransformingVisitor extends Visitor<Node> {
  @override
  DocumentNode visitDocumentNode(
    DocumentNode node,
  ) =>
      node;

  @override
  NameNode visitNameNode(
    NameNode node,
  ) =>
      node;

  @override
  DirectiveNode visitDirectiveNode(
    DirectiveNode node,
  ) =>
      node;

  @override
  ListTypeNode visitListTypeNode(
    ListTypeNode node,
  ) =>
      node;

  @override
  NamedTypeNode visitNamedTypeNode(
    NamedTypeNode node,
  ) =>
      node;

  @override
  DefaultValueNode visitDefaultValueNode(
    DefaultValueNode node,
  ) =>
      node;

  @override
  VariableDefinitionNode visitVariableDefinitionNode(
    VariableDefinitionNode node,
  ) =>
      node;

  @override
  ObjectFieldNode visitObjectFieldNode(
    ObjectFieldNode node,
  ) =>
      node;

  @override
  ObjectValueNode visitObjectValueNode(
    ObjectValueNode node,
  ) =>
      node;

  @override
  ListValueNode visitListValueNode(
    ListValueNode node,
  ) =>
      node;

  @override
  EnumValueNode visitEnumValueNode(
    EnumValueNode node,
  ) =>
      node;

  @override
  NullValueNode visitNullValueNode(
    NullValueNode node,
  ) =>
      node;

  @override
  BooleanValueNode visitBooleanValueNode(
    BooleanValueNode node,
  ) =>
      node;

  @override
  StringValueNode visitStringValueNode(
    StringValueNode node,
  ) =>
      node;

  @override
  FloatValueNode visitFloatValueNode(
    FloatValueNode node,
  ) =>
      node;

  @override
  IntValueNode visitIntValueNode(
    IntValueNode node,
  ) =>
      node;

  @override
  VariableNode visitVariableNode(
    VariableNode node,
  ) =>
      node;

  @override
  TypeConditionNode visitTypeConditionNode(
    TypeConditionNode node,
  ) =>
      node;

  @override
  FragmentDefinitionNode visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) =>
      node;

  @override
  InlineFragmentNode visitInlineFragmentNode(
    InlineFragmentNode node,
  ) =>
      node;

  @override
  FragmentSpreadNode visitFragmentSpreadNode(
    FragmentSpreadNode node,
  ) =>
      node;

  @override
  ArgumentNode visitArgumentNode(
    ArgumentNode node,
  ) =>
      node;

  @override
  FieldNode visitFieldNode(
    FieldNode node,
  ) =>
      node;

  @override
  SelectionSetNode visitSelectionSetNode(
    SelectionSetNode node,
  ) =>
      node;

  @override
  OperationDefinitionNode visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) =>
      node;

  @override
  SchemaDefinitionNode visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) =>
      node;

  @override
  OperationTypeDefinitionNode visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) =>
      node;

  @override
  ScalarTypeDefinitionNode visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      node;

  @override
  ObjectTypeDefinitionNode visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      node;

  @override
  FieldDefinitionNode visitFieldDefinitionNode(
    FieldDefinitionNode node,
  ) =>
      node;

  @override
  InputValueDefinitionNode visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) =>
      node;

  @override
  InterfaceTypeDefinitionNode visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      node;

  @override
  UnionTypeDefinitionNode visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  ) =>
      node;

  @override
  EnumTypeDefinitionNode visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      node;

  @override
  EnumValueDefinitionNode visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) =>
      node;

  @override
  InputObjectTypeDefinitionNode visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      node;

  @override
  DirectiveDefinitionNode visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) =>
      node;

  @override
  SchemaExtensionNode visitSchemaExtensionNode(
    SchemaExtensionNode node,
  ) =>
      node;

  @override
  ScalarTypeExtensionNode visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) =>
      node;

  @override
  ObjectTypeExtensionNode visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) =>
      node;

  @override
  InterfaceTypeExtensionNode visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) =>
      node;

  @override
  UnionTypeExtensionNode visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  ) =>
      node;

  @override
  EnumTypeExtensionNode visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  ) =>
      node;

  @override
  InputObjectTypeExtensionNode visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) =>
      node;
}

class _Transformer extends Visitor<Node> {
  List<TransformingVisitor> visitors;

  _Transformer({
    this.visitors = const [],
  });

  N _visitOne<N extends Node?>(
    N node,
  ) {
    if (node == null) return node;

    return node.accept(this) as N;
  }

  List<N> _visitAll<N extends Node>(
    List<N> nodes,
  ) =>
      nodes
          .map(
            (
              node,
            ) =>
                node.accept(this),
          )
          .cast<N>()
          .toList(growable: false);

  @override
  DocumentNode visitDocumentNode(
    DocumentNode node,
  ) {
    final updatedNode = DocumentNode(
      definitions: _visitAll(node.definitions),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitDocumentNode(prev),
    );
  }

  @override
  ArgumentNode visitArgumentNode(
    ArgumentNode node,
  ) {
    final updatedNode = ArgumentNode(
      name: _visitOne(node.name),
      value: _visitOne(node.value),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitArgumentNode(prev),
    );
  }

  @override
  BooleanValueNode visitBooleanValueNode(
    BooleanValueNode node,
  ) {
    final updatedNode = BooleanValueNode(
      value: node.value,
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitBooleanValueNode(prev),
    );
  }

  @override
  DefaultValueNode visitDefaultValueNode(
    DefaultValueNode node,
  ) {
    final updatedNode = DefaultValueNode(
      value: _visitOne(node.value),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitDefaultValueNode(prev),
    );
  }

  @override
  DirectiveDefinitionNode visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) {
    final updatedNode = DirectiveDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      locations: node.locations,
      repeatable: node.repeatable,
      args: _visitAll(node.args),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitDirectiveDefinitionNode(prev),
    );
  }

  @override
  DirectiveNode visitDirectiveNode(
    DirectiveNode node,
  ) {
    final updatedNode = DirectiveNode(
      arguments: _visitAll(node.arguments),
      name: _visitOne(node.name),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitDirectiveNode(prev),
    );
  }

  @override
  EnumTypeDefinitionNode visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) {
    final updatedNode = EnumTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      values: _visitAll(node.values),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitEnumTypeDefinitionNode(prev),
    );
  }

  @override
  EnumTypeExtensionNode visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  ) {
    final updatedNode = EnumTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      values: _visitAll(node.values),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitEnumTypeExtensionNode(prev),
    );
  }

  @override
  EnumValueDefinitionNode visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) {
    final updatedNode = EnumValueDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitEnumValueDefinitionNode(prev),
    );
  }

  @override
  EnumValueNode visitEnumValueNode(
    EnumValueNode node,
  ) {
    final updatedNode = EnumValueNode(
      name: _visitOne(node.name),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitEnumValueNode(prev),
    );
  }

  @override
  FieldDefinitionNode visitFieldDefinitionNode(
    FieldDefinitionNode node,
  ) {
    final updatedNode = FieldDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      args: _visitAll(node.args),
      type: _visitOne(node.type),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitFieldDefinitionNode(prev),
    );
  }

  @override
  FieldNode visitFieldNode(
    FieldNode node,
  ) {
    final updatedNode = FieldNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      alias: _visitOne(node.alias),
      arguments: _visitAll(node.arguments),
      selectionSet: _visitOne(node.selectionSet),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitFieldNode(prev),
    );
  }

  @override
  FloatValueNode visitFloatValueNode(
    FloatValueNode node,
  ) {
    final updatedNode = FloatValueNode(
      value: node.value,
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitFloatValueNode(prev),
    );
  }

  @override
  FragmentDefinitionNode visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) {
    final updatedNode = FragmentDefinitionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      selectionSet: _visitOne(node.selectionSet),
      typeCondition: _visitOne(node.typeCondition),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitFragmentDefinitionNode(prev),
    );
  }

  @override
  FragmentSpreadNode visitFragmentSpreadNode(
    FragmentSpreadNode node,
  ) {
    final updatedNode = FragmentSpreadNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitFragmentSpreadNode(prev),
    );
  }

  @override
  InlineFragmentNode visitInlineFragmentNode(
    InlineFragmentNode node,
  ) {
    final updatedNode = InlineFragmentNode(
      directives: _visitAll(node.directives),
      selectionSet: _visitOne(node.selectionSet),
      typeCondition: _visitOne(node.typeCondition),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInlineFragmentNode(prev),
    );
  }

  @override
  InputObjectTypeDefinitionNode visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) {
    final updatedNode = InputObjectTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInputObjectTypeDefinitionNode(prev),
    );
  }

  @override
  InputObjectTypeExtensionNode visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) {
    final updatedNode = InputObjectTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInputObjectTypeExtensionNode(prev),
    );
  }

  @override
  InputValueDefinitionNode visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) {
    final updatedNode = InputValueDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      defaultValue: _visitOne(node.defaultValue),
      type: _visitOne(node.type),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInputValueDefinitionNode(prev),
    );
  }

  @override
  IntValueNode visitIntValueNode(
    IntValueNode node,
  ) {
    final updatedNode = IntValueNode(
      value: node.value,
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitIntValueNode(prev),
    );
  }

  @override
  InterfaceTypeDefinitionNode visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) {
    final updatedNode = InterfaceTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
      interfaces: _visitAll(node.interfaces),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInterfaceTypeDefinitionNode(prev),
    );
  }

  @override
  InterfaceTypeExtensionNode visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) {
    final updatedNode = InterfaceTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
      interfaces: _visitAll(node.interfaces),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitInterfaceTypeExtensionNode(prev),
    );
  }

  @override
  ListTypeNode visitListTypeNode(
    ListTypeNode node,
  ) {
    final updatedNode = ListTypeNode(
      type: _visitOne(node.type),
      isNonNull: node.isNonNull,
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitListTypeNode(prev),
    );
  }

  @override
  ListValueNode visitListValueNode(
    ListValueNode node,
  ) {
    final updatedNode = ListValueNode(
      values: _visitAll(node.values),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitListValueNode(prev),
    );
  }

  @override
  NameNode visitNameNode(
    NameNode node,
  ) {
    final updatedNode = NameNode(span: node.span, value: node.value);

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitNameNode(prev),
    );
  }

  @override
  NamedTypeNode visitNamedTypeNode(
    NamedTypeNode node,
  ) {
    final updatedNode = NamedTypeNode(
      isNonNull: node.isNonNull,
      name: _visitOne(node.name),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitNamedTypeNode(prev),
    );
  }

  @override
  NullValueNode visitNullValueNode(
    NullValueNode node,
  ) {
    final updatedNode = NullValueNode();

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitNullValueNode(prev),
    );
  }

  @override
  ObjectFieldNode visitObjectFieldNode(
    ObjectFieldNode node,
  ) {
    final updatedNode = ObjectFieldNode(
      name: _visitOne(node.name),
      value: _visitOne(node.value),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitObjectFieldNode(prev),
    );
  }

  @override
  ObjectTypeDefinitionNode visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) {
    final updatedNode = ObjectTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
      interfaces: _visitAll(node.interfaces),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitObjectTypeDefinitionNode(prev),
    );
  }

  @override
  ObjectTypeExtensionNode visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) {
    final updatedNode = ObjectTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      fields: _visitAll(node.fields),
      interfaces: _visitAll(node.interfaces),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitObjectTypeExtensionNode(prev),
    );
  }

  @override
  ObjectValueNode visitObjectValueNode(
    ObjectValueNode node,
  ) {
    final updatedNode = ObjectValueNode(
      fields: _visitAll(node.fields),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitObjectValueNode(prev),
    );
  }

  @override
  OperationDefinitionNode visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) {
    final updatedNode = OperationDefinitionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      type: node.type,
      selectionSet: _visitOne(node.selectionSet),
      variableDefinitions: _visitAll(node.variableDefinitions),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitOperationDefinitionNode(prev),
    );
  }

  @override
  OperationTypeDefinitionNode visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) {
    final updatedNode = OperationTypeDefinitionNode(
      operation: node.operation,
      type: _visitOne(node.type),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitOperationTypeDefinitionNode(prev),
    );
  }

  @override
  ScalarTypeDefinitionNode visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) {
    final updatedNode = ScalarTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitScalarTypeDefinitionNode(prev),
    );
  }

  @override
  ScalarTypeExtensionNode visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) {
    final updatedNode = ScalarTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitScalarTypeExtensionNode(prev),
    );
  }

  @override
  SchemaDefinitionNode visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) {
    final updatedNode = SchemaDefinitionNode(
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      operationTypes: _visitAll(node.operationTypes),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitSchemaDefinitionNode(prev),
    );
  }

  @override
  SchemaExtensionNode visitSchemaExtensionNode(
    SchemaExtensionNode node,
  ) {
    final updatedNode = SchemaExtensionNode(
      directives: _visitAll(node.directives),
      operationTypes: _visitAll(node.operationTypes),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitSchemaExtensionNode(prev),
    );
  }

  @override
  SelectionSetNode visitSelectionSetNode(
    SelectionSetNode node,
  ) {
    final updatedNode = SelectionSetNode(
      selections: _visitAll(node.selections),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitSelectionSetNode(prev),
    );
  }

  @override
  StringValueNode visitStringValueNode(
    StringValueNode node,
  ) {
    final updatedNode = StringValueNode(
      isBlock: node.isBlock,
      value: node.value,
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitStringValueNode(prev),
    );
  }

  @override
  TypeConditionNode visitTypeConditionNode(
    TypeConditionNode node,
  ) {
    final updatedNode = TypeConditionNode(
      on: _visitOne(node.on),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitTypeConditionNode(prev),
    );
  }

  @override
  UnionTypeDefinitionNode visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  ) {
    final updatedNode = UnionTypeDefinitionNode(
      name: _visitOne(node.name),
      description: _visitOne(node.description),
      directives: _visitAll(node.directives),
      types: _visitAll(node.types),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitUnionTypeDefinitionNode(prev),
    );
  }

  @override
  UnionTypeExtensionNode visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  ) {
    final updatedNode = UnionTypeExtensionNode(
      name: _visitOne(node.name),
      directives: _visitAll(node.directives),
      types: _visitAll(node.types),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitUnionTypeExtensionNode(prev),
    );
  }

  @override
  VariableDefinitionNode visitVariableDefinitionNode(
    VariableDefinitionNode node,
  ) {
    final updatedNode = VariableDefinitionNode(
      directives: _visitAll(node.directives),
      defaultValue: _visitOne(node.defaultValue),
      type: _visitOne(node.type),
      variable: _visitOne(node.variable),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitVariableDefinitionNode(prev),
    );
  }

  @override
  VariableNode visitVariableNode(
    VariableNode node,
  ) {
    final updatedNode = VariableNode(
      name: _visitOne(node.name),
    );

    return visitors.fold(
      updatedNode,
      (prev, visitor) => visitor.visitVariableNode(prev),
    );
  }
}
