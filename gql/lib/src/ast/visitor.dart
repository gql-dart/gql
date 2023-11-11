import "package:gql/src/ast/ast.dart";

/// A class defining visit methods for all concrete subclasses of [Node].
abstract class Visitor<R> {
  const Visitor();

  /// Visit [DocumentNode].
  R visitDocumentNode(
    DocumentNode node,
  );

  /// Visit [NameNode].
  R visitNameNode(
    NameNode node,
  );

  /// Visit [DirectiveNode].
  R visitDirectiveNode(
    DirectiveNode node,
  );

  /// Visit [ListTypeNode].
  R visitListTypeNode(
    ListTypeNode node,
  );

  /// Visit [NamedTypeNode].
  R visitNamedTypeNode(
    NamedTypeNode node,
  );

  /// Visit [DefaultValueNode].
  R visitDefaultValueNode(
    DefaultValueNode node,
  );

  /// Visit [VariableDefinitionNode].
  R visitVariableDefinitionNode(
    VariableDefinitionNode node,
  );

  /// Visit [ObjectFieldNode].
  R visitObjectFieldNode(
    ObjectFieldNode node,
  );

  /// Visit [ObjectValueNode].
  R visitObjectValueNode(
    ObjectValueNode node,
  );

  /// Visit [ListValueNode].
  R visitListValueNode(
    ListValueNode node,
  );

  /// Visit [EnumValueNode].
  R visitEnumValueNode(
    EnumValueNode node,
  );

  /// Visit [NullValueNode].
  R visitNullValueNode(
    NullValueNode node,
  );

  /// Visit [BooleanValueNode].
  R visitBooleanValueNode(
    BooleanValueNode node,
  );

  /// Visit [StringValueNode].
  R visitStringValueNode(
    StringValueNode node,
  );

  /// Visit [FloatValueNode].
  R visitFloatValueNode(
    FloatValueNode node,
  );

  /// Visit [IntValueNode].
  R visitIntValueNode(
    IntValueNode node,
  );

  /// Visit [VariableNode].
  R visitVariableNode(
    VariableNode node,
  );

  /// Visit [TypeConditionNode].
  R visitTypeConditionNode(
    TypeConditionNode node,
  );

  /// Visit [FragmentDefinitionNode].
  R visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  );

  /// Visit [InlineFragmentNode].
  R visitInlineFragmentNode(
    InlineFragmentNode node,
  );

  /// Visit [FragmentSpreadNode].
  R visitFragmentSpreadNode(
    FragmentSpreadNode node,
  );

  /// Visit [ArgumentNode].
  R visitArgumentNode(
    ArgumentNode node,
  );

  /// Visit [FieldNode].
  R visitFieldNode(
    FieldNode node,
  );

  /// Visit [SelectionSetNode].
  R visitSelectionSetNode(
    SelectionSetNode node,
  );

  /// Visit [OperationDefinitionNode].
  R visitOperationDefinitionNode(
    OperationDefinitionNode node,
  );

  /// Visit [SchemaDefinitionNode].
  R visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  );

  /// Visit [OperationTypeDefinitionNode].
  R visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  );

  /// Visit [ScalarTypeDefinitionNode].
  R visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  );

  /// Visit [ObjectTypeDefinitionNode].
  R visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  );

  /// Visit [FieldDefinitionNode].
  R visitFieldDefinitionNode(
    FieldDefinitionNode node,
  );

  /// Visit [InputValueDefinitionNode].
  R visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  );

  /// Visit [InterfaceTypeDefinitionNode].
  R visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  );

  /// Visit [UnionTypeDefinitionNode].
  R visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  );

  /// Visit [EnumTypeDefinitionNode].
  R visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  );

  /// Visit [EnumValueDefinitionNode].
  R visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  );

  /// Visit [InputObjectTypeDefinitionNode].
  R visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  );

  /// Visit [DirectiveDefinitionNode].
  R visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  );

  /// Visit [SchemaExtensionNode].
  R visitSchemaExtensionNode(
    SchemaExtensionNode node,
  );

  /// Visit [ScalarTypeExtensionNode].
  R visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  );

  /// Visit [ObjectTypeExtensionNode].
  R visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  );

  /// Visit [InterfaceTypeExtensionNode].
  R visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  );

  /// Visit [UnionTypeExtensionNode].
  R visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  );

  /// Visit [EnumTypeExtensionNode].
  R visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  );

  /// Visit [InputObjectTypeExtensionNode].
  R visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  );
}

/// A simple implementation of [Visitor] returning `null` from each visit method.
class SimpleVisitor<R> implements Visitor<R?> {
  const SimpleVisitor();
  @override
  R? visitDocumentNode(
    DocumentNode node,
  ) =>
      null;

  @override
  R? visitNameNode(
    NameNode node,
  ) =>
      null;

  @override
  R? visitDirectiveNode(
    DirectiveNode node,
  ) =>
      null;

  @override
  R? visitListTypeNode(
    ListTypeNode node,
  ) =>
      null;

  @override
  R? visitNamedTypeNode(
    NamedTypeNode node,
  ) =>
      null;

  @override
  R? visitDefaultValueNode(
    DefaultValueNode node,
  ) =>
      null;

  @override
  R? visitVariableDefinitionNode(
    VariableDefinitionNode node,
  ) =>
      null;

  @override
  R? visitObjectFieldNode(
    ObjectFieldNode node,
  ) =>
      null;

  @override
  R? visitObjectValueNode(
    ObjectValueNode node,
  ) =>
      null;

  @override
  R? visitListValueNode(
    ListValueNode node,
  ) =>
      null;

  @override
  R? visitEnumValueNode(
    EnumValueNode node,
  ) =>
      null;

  @override
  R? visitNullValueNode(
    NullValueNode node,
  ) =>
      null;

  @override
  R? visitBooleanValueNode(
    BooleanValueNode node,
  ) =>
      null;

  @override
  R? visitStringValueNode(
    StringValueNode node,
  ) =>
      null;

  @override
  R? visitFloatValueNode(
    FloatValueNode node,
  ) =>
      null;

  @override
  R? visitIntValueNode(
    IntValueNode node,
  ) =>
      null;

  @override
  R? visitVariableNode(
    VariableNode node,
  ) =>
      null;

  @override
  R? visitTypeConditionNode(
    TypeConditionNode node,
  ) =>
      null;

  @override
  R? visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) =>
      null;

  @override
  R? visitInlineFragmentNode(
    InlineFragmentNode node,
  ) =>
      null;

  @override
  R? visitFragmentSpreadNode(
    FragmentSpreadNode node,
  ) =>
      null;

  @override
  R? visitArgumentNode(
    ArgumentNode node,
  ) =>
      null;

  @override
  R? visitFieldNode(
    FieldNode node,
  ) =>
      null;

  @override
  R? visitSelectionSetNode(
    SelectionSetNode node,
  ) =>
      null;

  @override
  R? visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) =>
      null;

  @override
  R? visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) =>
      null;

  @override
  R? visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitFieldDefinitionNode(
    FieldDefinitionNode node,
  ) =>
      null;

  @override
  R? visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) =>
      null;

  @override
  R? visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) =>
      null;

  @override
  R? visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      null;

  @override
  R? visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) =>
      null;

  @override
  R? visitSchemaExtensionNode(
    SchemaExtensionNode node,
  ) =>
      null;

  @override
  R? visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) =>
      null;

  @override
  R? visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) =>
      null;

  @override
  R? visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) =>
      null;

  @override
  R? visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  ) =>
      null;

  @override
  R? visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  ) =>
      null;

  @override
  R? visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) =>
      null;
}

/// A recursive [Visitor] calling [Node.visitChildren] to make sure every node is visited.
///
/// When extending any of the visit methods you are responsible for calling the same
/// visit method on `super` to make sure the whole AST is visited.
abstract class RecursiveVisitor implements Visitor<void> {
  const RecursiveVisitor();
  @override
  void visitArgumentNode(
    ArgumentNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitBooleanValueNode(
    BooleanValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitDefaultValueNode(
    DefaultValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitDirectiveNode(
    DirectiveNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitDocumentNode(
    DocumentNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitEnumValueNode(
    EnumValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitFieldDefinitionNode(
    FieldDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitFieldNode(
    FieldNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitFloatValueNode(
    FloatValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitFragmentSpreadNode(
    FragmentSpreadNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInlineFragmentNode(
    InlineFragmentNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitIntValueNode(
    IntValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitListTypeNode(
    ListTypeNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitListValueNode(
    ListValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitNameNode(
    NameNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitNamedTypeNode(
    NamedTypeNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitNullValueNode(
    NullValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitObjectFieldNode(
    ObjectFieldNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitObjectValueNode(
    ObjectValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitSchemaExtensionNode(
    SchemaExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitSelectionSetNode(
    SelectionSetNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitStringValueNode(
    StringValueNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitTypeConditionNode(
    TypeConditionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitVariableDefinitionNode(
    VariableDefinitionNode node,
  ) =>
      node.visitChildren(this);

  @override
  void visitVariableNode(
    VariableNode node,
  ) =>
      node.visitChildren(this);
}

/// A [Visitor] to accumulate values of type [A].
///
/// This [Visitor] let's you use multiple [SimpleVisitor]s
/// traversing the AST only once and collecting the return
/// values in the `accumulator`.
class AccumulatingVisitor<A> extends RecursiveVisitor {
  List<SimpleVisitor<List<A>>> visitors;
  List<A> accumulator = [];

  AccumulatingVisitor({
    this.visitors = const [],
  });

  @override
  void visitArgumentNode(
    ArgumentNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitArgumentNode(node) ?? <A>[],
      )
    ];

    super.visitArgumentNode(node);
  }

  @override
  void visitBooleanValueNode(
    BooleanValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitBooleanValueNode(node) ?? <A>[],
      )
    ];

    super.visitBooleanValueNode(node);
  }

  @override
  void visitDefaultValueNode(
    DefaultValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitDefaultValueNode(node) ?? <A>[],
      )
    ];

    super.visitDefaultValueNode(node);
  }

  @override
  void visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitDirectiveDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitDirectiveDefinitionNode(node);
  }

  @override
  void visitDirectiveNode(
    DirectiveNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitDirectiveNode(node) ?? <A>[],
      )
    ];

    super.visitDirectiveNode(node);
  }

  @override
  void visitDocumentNode(
    DocumentNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitDocumentNode(node) ?? <A>[],
      )
    ];

    super.visitDocumentNode(node);
  }

  @override
  void visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitEnumTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitEnumTypeDefinitionNode(node);
  }

  @override
  void visitEnumTypeExtensionNode(
    EnumTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitEnumTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitEnumTypeExtensionNode(node);
  }

  @override
  void visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitEnumValueDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitEnumValueDefinitionNode(node);
  }

  @override
  void visitEnumValueNode(
    EnumValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitEnumValueNode(node) ?? <A>[],
      )
    ];

    super.visitEnumValueNode(node);
  }

  @override
  void visitFieldDefinitionNode(
    FieldDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitFieldDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitFieldDefinitionNode(node);
  }

  @override
  void visitFieldNode(
    FieldNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitFieldNode(node) ?? <A>[],
      )
    ];

    super.visitFieldNode(node);
  }

  @override
  void visitFloatValueNode(
    FloatValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitFloatValueNode(node) ?? <A>[],
      )
    ];

    super.visitFloatValueNode(node);
  }

  @override
  void visitFragmentDefinitionNode(
    FragmentDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitFragmentDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitFragmentDefinitionNode(node);
  }

  @override
  void visitFragmentSpreadNode(
    FragmentSpreadNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitFragmentSpreadNode(node) ?? <A>[],
      )
    ];

    super.visitFragmentSpreadNode(node);
  }

  @override
  void visitInlineFragmentNode(
    InlineFragmentNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInlineFragmentNode(node) ?? <A>[],
      )
    ];

    super.visitInlineFragmentNode(node);
  }

  @override
  void visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInputObjectTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitInputObjectTypeDefinitionNode(node);
  }

  @override
  void visitInputObjectTypeExtensionNode(
    InputObjectTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInputObjectTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitInputObjectTypeExtensionNode(node);
  }

  @override
  void visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInputValueDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitInputValueDefinitionNode(node);
  }

  @override
  void visitIntValueNode(
    IntValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitIntValueNode(node) ?? <A>[],
      )
    ];

    super.visitIntValueNode(node);
  }

  @override
  void visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInterfaceTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitInterfaceTypeDefinitionNode(node);
  }

  @override
  void visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitInterfaceTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitInterfaceTypeExtensionNode(node);
  }

  @override
  void visitListTypeNode(
    ListTypeNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitListTypeNode(node) ?? <A>[],
      )
    ];

    super.visitListTypeNode(node);
  }

  @override
  void visitListValueNode(
    ListValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitListValueNode(node) ?? <A>[],
      )
    ];

    super.visitListValueNode(node);
  }

  @override
  void visitNameNode(
    NameNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitNameNode(node) ?? <A>[],
      )
    ];

    super.visitNameNode(node);
  }

  @override
  void visitNamedTypeNode(
    NamedTypeNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitNamedTypeNode(node) ?? <A>[],
      )
    ];

    super.visitNamedTypeNode(node);
  }

  @override
  void visitNullValueNode(
    NullValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitNullValueNode(node) ?? <A>[],
      )
    ];

    super.visitNullValueNode(node);
  }

  @override
  void visitObjectFieldNode(
    ObjectFieldNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitObjectFieldNode(node) ?? <A>[],
      )
    ];

    super.visitObjectFieldNode(node);
  }

  @override
  void visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitObjectTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitObjectTypeDefinitionNode(node);
  }

  @override
  void visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitObjectTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitObjectTypeExtensionNode(node);
  }

  @override
  void visitObjectValueNode(
    ObjectValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitObjectValueNode(node) ?? <A>[],
      )
    ];

    super.visitObjectValueNode(node);
  }

  @override
  void visitOperationDefinitionNode(
    OperationDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitOperationDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitOperationDefinitionNode(node);
  }

  @override
  void visitOperationTypeDefinitionNode(
    OperationTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitOperationTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitOperationTypeDefinitionNode(node);
  }

  @override
  void visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitScalarTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitScalarTypeDefinitionNode(node);
  }

  @override
  void visitScalarTypeExtensionNode(
    ScalarTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitScalarTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitScalarTypeExtensionNode(node);
  }

  @override
  void visitSchemaDefinitionNode(
    SchemaDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitSchemaDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitSchemaDefinitionNode(node);
  }

  @override
  void visitSchemaExtensionNode(
    SchemaExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitSchemaExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitSchemaExtensionNode(node);
  }

  @override
  void visitSelectionSetNode(
    SelectionSetNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitSelectionSetNode(node) ?? <A>[],
      )
    ];

    super.visitSelectionSetNode(node);
  }

  @override
  void visitStringValueNode(
    StringValueNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitStringValueNode(node) ?? <A>[],
      )
    ];

    super.visitStringValueNode(node);
  }

  @override
  void visitTypeConditionNode(
    TypeConditionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitTypeConditionNode(node) ?? <A>[],
      )
    ];

    super.visitTypeConditionNode(node);
  }

  @override
  void visitUnionTypeDefinitionNode(
    UnionTypeDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitUnionTypeDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitUnionTypeDefinitionNode(node);
  }

  @override
  void visitUnionTypeExtensionNode(
    UnionTypeExtensionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitUnionTypeExtensionNode(node) ?? <A>[],
      )
    ];

    super.visitUnionTypeExtensionNode(node);
  }

  @override
  void visitVariableDefinitionNode(
    VariableDefinitionNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitVariableDefinitionNode(node) ?? <A>[],
      )
    ];

    super.visitVariableDefinitionNode(node);
  }

  @override
  void visitVariableNode(
    VariableNode node,
  ) {
    accumulator = [
      ...accumulator,
      ...visitors.expand(
        (visitor) => visitor.visitVariableNode(node) ?? <A>[],
      )
    ];

    super.visitVariableNode(node);
  }
}
