import "package:collection/collection.dart";
import "package:gql/src/ast/visitor.dart";
import "package:meta/meta.dart";
import "package:source_span/source_span.dart";

void _visitOne<R>(
  Node node,
  Visitor<R> v,
) =>
    node.accept(v);

void _visitAll<R>(
  List<Node> nodes,
  Visitor<R> v,
) =>
    nodes.forEach(
      (node) => _visitOne(node, v),
    );

/// The base class for any GraphQL AST [Node].
@immutable
abstract class Node {
  /// [FileSpan] representing the location of the node in the [SourceFile]
  final FileSpan? span;

  const Node(this.span);

  List<Object?> get _children;

  /// Lets [Visitor] [v] visit children nodes of this node.
  void visitChildren<R>(Visitor<R> v) => _children.forEach(
        (child) {
          if (child is List<Node>) {
            _visitAll(child, v);
          } else if (child is Node) {
            _visitOne(child, v);
          }
        },
      );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    if (o.runtimeType != runtimeType) return false;

    return const ListEquality<Object?>(
      DeepCollectionEquality(),
    ).equals(
      (o as Node)._children,
      _children,
    );
  }

  @override
  int get hashCode => const ListEquality<Object?>(
        DeepCollectionEquality(),
      ).hash(
        _children,
      );

  /// Accepts a [Visitor] [v].
  R accept<R>(Visitor<R> v);
}

class DocumentNode extends Node {
  final List<DefinitionNode> definitions;

  const DocumentNode({
    this.definitions = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDocumentNode(this);

  @override
  List<Object> get _children => <Object>[
        definitions,
      ];
}

abstract class DefinitionNode extends Node {
  const DefinitionNode(FileSpan? span) : super(span);
}

abstract class ExecutableDefinitionNode extends DefinitionNode {
  const ExecutableDefinitionNode(FileSpan? span) : super(span);
}

/// Enumeration of all known GraphQL operation types.
enum OperationType {
  query,
  mutation,
  subscription,
}

/// Enumeration of all known directive locations.
enum DirectiveLocation {
  query,
  mutation,
  subscription,
  field,
  fragmentDefinition,
  fragmentSpread,
  inlineFragment,
  variableDefinition,
  schema,
  scalar,
  object,
  fieldDefinition,
  argumentDefinition,
  interface,
  union,
  enumDefinition,
  enumValue,
  inputObject,
  inputFieldDefinition,
}

class OperationDefinitionNode extends ExecutableDefinitionNode {
  final NameNode? name;

  final OperationType type;

  final List<VariableDefinitionNode> variableDefinitions;

  final List<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const OperationDefinitionNode({
    required this.type,
    this.name,
    this.variableDefinitions = const [],
    this.directives = const [],
    required this.selectionSet,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitOperationDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        type,
        selectionSet,
        variableDefinitions,
        directives,
      ];
}

class SelectionSetNode extends Node {
  final List<SelectionNode> selections;

  const SelectionSetNode({
    this.selections = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitSelectionSetNode(this);

  @override
  List<Object> get _children => <Object>[
        selections,
      ];
}

abstract class SelectionNode extends Node {
  const SelectionNode(FileSpan? span) : super(span);
}

class FieldNode extends SelectionNode {
  final NameNode? alias;

  final NameNode name;

  final List<ArgumentNode> arguments;

  final List<DirectiveNode> directives;

  final SelectionSetNode? selectionSet;

  const FieldNode({
    this.alias,
    required this.name,
    this.arguments = const [],
    this.directives = const [],
    this.selectionSet,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFieldNode(this);

  @override
  List<Object?> get _children => <Object?>[
        alias,
        name,
        selectionSet,
        arguments,
        directives,
      ];
}

class ArgumentNode extends Node {
  final NameNode name;

  final ValueNode value;

  const ArgumentNode({
    required this.name,
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitArgumentNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
        value,
      ];
}

class FragmentSpreadNode extends SelectionNode {
  final NameNode name;

  final List<DirectiveNode> directives;

  const FragmentSpreadNode({
    required this.name,
    this.directives = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFragmentSpreadNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
        directives,
      ];
}

class InlineFragmentNode extends SelectionNode {
  final TypeConditionNode? typeCondition;

  final List<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const InlineFragmentNode({
    this.typeCondition,
    this.directives = const [],
    required this.selectionSet,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitInlineFragmentNode(this);

  @override
  List<Object?> get _children => <Object?>[
        typeCondition,
        selectionSet,
        directives,
      ];
}

class FragmentDefinitionNode extends ExecutableDefinitionNode {
  final NameNode name;

  final TypeConditionNode typeCondition;

  final List<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const FragmentDefinitionNode({
    required this.name,
    required this.typeCondition,
    this.directives = const [],
    required this.selectionSet,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFragmentDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        typeCondition,
        selectionSet,
        directives,
      ];
}

class TypeConditionNode extends Node {
  final NamedTypeNode on;

  const TypeConditionNode({
    required this.on,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitTypeConditionNode(this);

  @override
  List<Object> get _children => <Object>[
        on,
      ];
}

abstract class ValueNode extends Node {
  const ValueNode(FileSpan? span) : super(span);
}

class VariableNode extends ValueNode {
  final NameNode name;

  const VariableNode({
    required this.name,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitVariableNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
      ];
}

class IntValueNode extends ValueNode {
  final String value;

  const IntValueNode({
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitIntValueNode(this);

  @override
  List<Object> get _children => <Object>[
        value,
      ];
}

class FloatValueNode extends ValueNode {
  final String value;

  const FloatValueNode({
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFloatValueNode(this);

  @override
  List<Object> get _children => <Object>[
        value,
      ];
}

class StringValueNode extends ValueNode {
  final String value;

  final bool isBlock;

  const StringValueNode({
    required this.value,
    required this.isBlock,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitStringValueNode(this);

  @override
  List<Object> get _children => <Object>[
        value,
        isBlock,
      ];
}

class BooleanValueNode extends ValueNode {
  final bool value;

  const BooleanValueNode({
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitBooleanValueNode(this);

  @override
  List<Object> get _children => <Object>[
        value,
      ];
}

class NullValueNode extends ValueNode {
  const NullValueNode({
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitNullValueNode(this);

  @override
  List<Object> get _children => <Object>[];
}

class EnumValueNode extends ValueNode {
  final NameNode name;

  const EnumValueNode({
    required this.name,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumValueNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
      ];
}

class ListValueNode extends ValueNode {
  final List<ValueNode> values;

  const ListValueNode({
    this.values = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitListValueNode(this);

  @override
  List<Object> get _children => <Object>[
        values,
      ];
}

class ObjectValueNode extends ValueNode {
  final List<ObjectFieldNode> fields;

  const ObjectValueNode({
    this.fields = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectValueNode(this);

  @override
  List<Object> get _children => <Object>[
        fields,
      ];
}

class ObjectFieldNode extends Node {
  final NameNode name;

  final ValueNode value;

  const ObjectFieldNode({
    required this.name,
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectFieldNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
        value,
      ];
}

class VariableDefinitionNode extends Node {
  final VariableNode variable;

  final TypeNode type;

  final DefaultValueNode? defaultValue;

  final List<DirectiveNode> directives;

  const VariableDefinitionNode({
    required this.variable,
    required this.type,
    this.defaultValue,
    this.directives = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitVariableDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        variable,
        type,
        defaultValue,
        directives,
      ];
}

class DefaultValueNode extends Node {
  final ValueNode? value;

  const DefaultValueNode({
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDefaultValueNode(this);

  @override
  List<Object?> get _children => <Object?>[
        value,
      ];
}

abstract class TypeNode extends Node {
  final bool isNonNull;

  const TypeNode(this.isNonNull, FileSpan? span) : super(span);
}

class NamedTypeNode extends TypeNode {
  final NameNode name;

  const NamedTypeNode({
    required this.name,
    bool isNonNull = false,
    FileSpan? span,
  }) : super(isNonNull, span);

  @override
  R accept<R>(Visitor<R> v) => v.visitNamedTypeNode(this);

  @override
  List<Object> get _children => <Object>[
        isNonNull,
        name,
      ];
}

class ListTypeNode extends TypeNode {
  final TypeNode type;

  const ListTypeNode({
    required this.type,
    required bool isNonNull,
    FileSpan? span,
  }) : super(isNonNull, span);

  @override
  R accept<R>(Visitor<R> v) => v.visitListTypeNode(this);

  @override
  List<Object> get _children => <Object>[
        isNonNull,
        type,
      ];
}

class DirectiveNode extends Node {
  final NameNode name;

  final List<ArgumentNode> arguments;

  const DirectiveNode({
    required this.name,
    this.arguments = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDirectiveNode(this);

  @override
  List<Object> get _children => <Object>[
        name,
        arguments,
      ];
}

class NameNode extends Node {
  final String value;

  const NameNode({
    required this.value,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitNameNode(this);

  @override
  List<Object> get _children => <Object>[
        value,
      ];
}

abstract class TypeSystemDefinitionNode extends DefinitionNode {
  const TypeSystemDefinitionNode(FileSpan? span) : super(span);
}

abstract class TypeDefinitionNode extends TypeSystemDefinitionNode {
  final NameNode name;
  final StringValueNode? description;
  final List<DirectiveNode> directives;

  const TypeDefinitionNode({
    this.description,
    required this.name,
    this.directives = const [],
    FileSpan? span,
  }) : super(span);
}

abstract class TypeSystemExtensionNode extends TypeSystemDefinitionNode {
  const TypeSystemExtensionNode(
    FileSpan? span,
  ) : super(span);
}

abstract class TypeExtensionNode extends TypeSystemExtensionNode {
  final NameNode name;
  final List<DirectiveNode> directives;

  const TypeExtensionNode({
    FileSpan? span,
    required this.name,
    this.directives = const [],
  }) : super(span);
}

class SchemaDefinitionNode extends TypeSystemDefinitionNode {
  final StringValueNode? description;
  final List<DirectiveNode> directives;
  final List<OperationTypeDefinitionNode> operationTypes;

  const SchemaDefinitionNode({
    this.description,
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        description,
        directives,
        operationTypes,
      ];
}

class OperationTypeDefinitionNode extends Node {
  final OperationType operation;
  final NamedTypeNode type;

  const OperationTypeDefinitionNode({
    required this.operation,
    required this.type,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitOperationTypeDefinitionNode(this);

  @override
  List<Object> get _children => <Object>[
        operation,
        type,
      ];
}

class ScalarTypeDefinitionNode extends TypeDefinitionNode {
  const ScalarTypeDefinitionNode({
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitScalarTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
      ];
}

class ObjectTypeDefinitionNode extends TypeDefinitionNode {
  final List<NamedTypeNode> interfaces;
  final List<FieldDefinitionNode> fields;

  const ObjectTypeDefinitionNode({
    this.interfaces = const [],
    this.fields = const [],
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        interfaces,
        fields,
      ];
}

class FieldDefinitionNode extends Node {
  final StringValueNode? description;
  final NameNode name;
  final TypeNode type;
  final List<DirectiveNode> directives;
  final List<InputValueDefinitionNode> args;

  const FieldDefinitionNode({
    this.description,
    required this.name,
    required this.type,
    this.args = const [],
    this.directives = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFieldDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        type,
        args,
      ];
}

class InputValueDefinitionNode extends Node {
  final StringValueNode? description;
  final NameNode name;
  final TypeNode type;
  final ValueNode? defaultValue;
  final List<DirectiveNode> directives;

  const InputValueDefinitionNode({
    this.description,
    required this.name,
    required this.type,
    this.defaultValue,
    this.directives = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitInputValueDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        type,
        defaultValue,
      ];
}

class InterfaceTypeDefinitionNode extends TypeDefinitionNode {
  final List<FieldDefinitionNode> fields;
  final List<NamedTypeNode> interfaces;

  const InterfaceTypeDefinitionNode({
    this.fields = const [],
    StringValueNode? description,
    required NameNode name,
    this.interfaces = const [],
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        interfaces,
        fields,
      ];
}

class UnionTypeDefinitionNode extends TypeDefinitionNode {
  final List<NamedTypeNode> types;

  const UnionTypeDefinitionNode({
    this.types = const [],
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitUnionTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        types,
      ];
}

class EnumTypeDefinitionNode extends TypeDefinitionNode {
  final List<EnumValueDefinitionNode> values;

  const EnumTypeDefinitionNode({
    this.values = const [],
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        values,
      ];
}

class EnumValueDefinitionNode extends TypeDefinitionNode {
  final bool fallback;

  const EnumValueDefinitionNode({
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
    this.fallback = false,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumValueDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
      ];
}

class InputObjectTypeDefinitionNode extends TypeDefinitionNode {
  final List<InputValueDefinitionNode> fields;

  const InputObjectTypeDefinitionNode({
    this.fields = const [],
    StringValueNode? description,
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        directives,
        fields,
      ];
}

class DirectiveDefinitionNode extends TypeSystemDefinitionNode {
  final NameNode name;
  final StringValueNode? description;
  final List<InputValueDefinitionNode> args;
  final List<DirectiveLocation> locations;
  final bool repeatable;

  const DirectiveDefinitionNode({
    this.description,
    required this.name,
    this.args = const [],
    this.locations = const [],
    this.repeatable = false,
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDirectiveDefinitionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        description,
        locations,
        args,
        repeatable,
      ];
}

class SchemaExtensionNode extends TypeSystemExtensionNode {
  final List<DirectiveNode> directives;
  final List<OperationTypeDefinitionNode> operationTypes;

  const SchemaExtensionNode({
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan? span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        directives,
        operationTypes,
      ];
}

class ScalarTypeExtensionNode extends TypeExtensionNode {
  const ScalarTypeExtensionNode({
    FileSpan? span,
    required NameNode name,
    List<DirectiveNode> directives = const [],
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitScalarTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
      ];
}

class ObjectTypeExtensionNode extends TypeExtensionNode {
  final List<NamedTypeNode> interfaces;
  final List<FieldDefinitionNode> fields;

  const ObjectTypeExtensionNode({
    required NameNode name,
    this.interfaces = const [],
    this.fields = const [],
    FileSpan? span,
    List<DirectiveNode> directives = const [],
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
        interfaces,
        fields,
      ];
}

class InterfaceTypeExtensionNode extends TypeExtensionNode {
  final List<FieldDefinitionNode> fields;
  final List<NamedTypeNode> interfaces;

  const InterfaceTypeExtensionNode({
    this.fields = const [],
    this.interfaces = const [],
    required NameNode name,
    FileSpan? span,
    List<DirectiveNode> directives = const [],
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
        interfaces,
        fields,
      ];
}

class UnionTypeExtensionNode extends TypeExtensionNode {
  final List<NamedTypeNode> types;

  const UnionTypeExtensionNode({
    this.types = const [],
    required NameNode name,
    List<DirectiveNode> directives = const [],
    FileSpan? span,
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitUnionTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
        types,
      ];
}

class EnumTypeExtensionNode extends TypeExtensionNode {
  final List<EnumValueDefinitionNode> values;

  const EnumTypeExtensionNode({
    this.values = const [],
    FileSpan? span,
    required NameNode name,
    List<DirectiveNode> directives = const [],
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
        values,
      ];
}

class InputObjectTypeExtensionNode extends TypeExtensionNode {
  final List<InputValueDefinitionNode> fields;

  const InputObjectTypeExtensionNode({
    this.fields = const [],
    FileSpan? span,
    required NameNode name,
    List<DirectiveNode> directives = const [],
  }) : super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeExtensionNode(this);

  @override
  List<Object?> get _children => <Object?>[
        name,
        directives,
        fields,
      ];
}
