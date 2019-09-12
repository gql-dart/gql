import "package:gql/src/ast/visitor.dart";
import "package:meta/meta.dart";
import "package:source_span/source_span.dart";

void _visitOne<R>(
  Node node,
  Visitor<R> v,
) =>
    node?.accept(v);

void _visitAll<R>(
  Iterable<Node> nodes,
  Visitor<R> v,
) =>
    nodes?.forEach(
      (node) => _visitOne(node, v),
    );

/// The base class for any GraphQL AST [Node].
@immutable
abstract class Node {
  /// [FileSpan] representing the location of the node in the [SourceFile]
  final FileSpan span;

  const Node(this.span);

  /// Lets [Visitor] [v] visit children nodes of this node.
  void visitChildren<R>(Visitor<R> v);

  /// Accepts a [Visitor] [v].
  R accept<R>(Visitor<R> v);
}

class DocumentNode extends Node {
  final Iterable<DefinitionNode> definitions;

  const DocumentNode({
    this.definitions = const [],
    FileSpan span,
  })  : assert(definitions != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDocumentNode(this);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(definitions, v);
  }
}

abstract class DefinitionNode extends Node {
  final NameNode name;

  const DefinitionNode({
    @required this.name,
    FileSpan span,
  }) : super(span);
}

abstract class ExecutableDefinitionNode extends DefinitionNode {
  const ExecutableDefinitionNode({
    @required NameNode name,
    FileSpan span,
  }) : super(
          name: name,
          span: span,
        );
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
  final OperationType type;

  final Iterable<VariableDefinitionNode> variableDefinitions;

  final Iterable<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const OperationDefinitionNode({
    @required this.type,
    NameNode name,
    this.variableDefinitions = const [],
    this.directives = const [],
    @required this.selectionSet,
    FileSpan span,
  })  : assert(variableDefinitions != null),
        assert(directives != null),
        assert(selectionSet != null),
        super(
          name: name,
          span: span,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(variableDefinitions, v);
    _visitAll(directives, v);
    _visitOne(selectionSet, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitOperationDefinitionNode(this);
}

class SelectionSetNode extends Node {
  final Iterable<SelectionNode> selections;

  const SelectionSetNode({
    this.selections = const [],
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(selections, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitSelectionSetNode(this);
}

abstract class SelectionNode extends Node {
  const SelectionNode(FileSpan span) : super(span);
}

class FieldNode extends SelectionNode {
  final NameNode alias;

  final NameNode name;

  final Iterable<ArgumentNode> arguments;

  final Iterable<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const FieldNode({
    this.alias,
    @required this.name,
    this.arguments = const [],
    this.directives = const [],
    this.selectionSet,
    FileSpan span,
  })  : assert(name != null),
        assert(arguments != null),
        assert(directives != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(arguments, v);
    _visitAll(directives, v);
    _visitOne(selectionSet, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitFieldNode(this);
}

class ArgumentNode extends Node {
  final NameNode name;

  final ValueNode value;

  const ArgumentNode({
    @required this.name,
    @required this.value,
    FileSpan span,
  })  : assert(name != null),
        assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitOne(value, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitArgumentNode(this);
}

class FragmentSpreadNode extends SelectionNode {
  final NameNode name;

  final Iterable<DirectiveNode> directives;

  const FragmentSpreadNode({
    @required this.name,
    this.directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(directives != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitFragmentSpreadNode(this);
}

class InlineFragmentNode extends SelectionNode {
  final TypeConditionNode typeCondition;

  final Iterable<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const InlineFragmentNode({
    this.typeCondition,
    this.directives = const [],
    @required this.selectionSet,
    FileSpan span,
  })  : assert(directives != null),
        assert(selectionSet != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(typeCondition, v);
    _visitAll(directives, v);
    _visitOne(selectionSet, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInlineFragmentNode(this);
}

class FragmentDefinitionNode extends ExecutableDefinitionNode {
  final TypeConditionNode typeCondition;

  final Iterable<DirectiveNode> directives;

  final SelectionSetNode selectionSet;

  const FragmentDefinitionNode({
    @required NameNode name,
    @required this.typeCondition,
    this.directives = const [],
    @required this.selectionSet,
    FileSpan span,
  })  : assert(name != null),
        assert(typeCondition != null),
        assert(directives != null),
        assert(selectionSet != null),
        super(
          name: name,
          span: span,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitOne(typeCondition, v);
    _visitAll(directives, v);
    _visitOne(selectionSet, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitFragmentDefinitionNode(this);
}

class TypeConditionNode extends Node {
  final NamedTypeNode on;

  const TypeConditionNode({
    @required this.on,
    FileSpan span,
  })  : assert(on != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(on, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitTypeConditionNode(this);
}

abstract class ValueNode extends Node {
  const ValueNode(FileSpan span) : super(span);
}

class VariableNode extends ValueNode {
  final NameNode name;

  const VariableNode({
    @required this.name,
    FileSpan span,
  })  : assert(name != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitVariableNode(this);
}

class IntValueNode extends ValueNode {
  final String value;

  const IntValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitIntValueNode(this);
}

class FloatValueNode extends ValueNode {
  final String value;

  const FloatValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitFloatValueNode(this);
}

class StringValueNode extends ValueNode {
  final String value;

  final bool isBlock;

  const StringValueNode({
    @required this.value,
    @required this.isBlock,
    FileSpan span,
  })  : assert(value != null),
        assert(isBlock != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitStringValueNode(this);
}

class BooleanValueNode extends ValueNode {
  final bool value;

  const BooleanValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitBooleanValueNode(this);
}

class NullValueNode extends ValueNode {
  const NullValueNode({
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitNullValueNode(this);
}

class EnumValueNode extends ValueNode {
  final NameNode name;

  const EnumValueNode({
    @required this.name,
    FileSpan span,
  })  : assert(name != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumValueNode(this);
}

class ListValueNode extends ValueNode {
  final Iterable<ValueNode> values;

  const ListValueNode({
    this.values = const [],
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(values, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitListValueNode(this);
}

class ObjectValueNode extends ValueNode {
  final Iterable<ObjectFieldNode> fields;

  const ObjectValueNode({
    this.fields = const [],
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectValueNode(this);
}

class ObjectFieldNode extends Node {
  final NameNode name;

  final ValueNode value;

  const ObjectFieldNode({
    @required this.name,
    @required this.value,
    FileSpan span,
  })  : assert(name != null),
        assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitOne(value, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectFieldNode(this);
}

class VariableDefinitionNode extends Node {
  final VariableNode variable;

  final TypeNode type;

  final DefaultValueNode defaultValue;

  final Iterable<DirectiveNode> directives;

  const VariableDefinitionNode({
    @required this.variable,
    @required this.type,
    this.defaultValue,
    this.directives = const [],
    FileSpan span,
  })  : assert(variable != null),
        assert(type != null),
        assert(directives != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(variable, v);
    _visitOne(type, v);
    _visitOne(defaultValue, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitVariableDefinitionNode(this);
}

class DefaultValueNode extends Node {
  final ValueNode value;

  const DefaultValueNode({
    @required this.value,
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(value, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitDefaultValueNode(this);
}

abstract class TypeNode extends Node {
  final bool isNonNull;

  const TypeNode(this.isNonNull, FileSpan span)
      : assert(isNonNull != null),
        super(span);
}

class NamedTypeNode extends TypeNode {
  final NameNode name;

  const NamedTypeNode({
    @required this.name,
    bool isNonNull = false,
    FileSpan span,
  })  : assert(name != null),
        assert(isNonNull != null),
        super(isNonNull, span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitNamedTypeNode(this);
}

class ListTypeNode extends TypeNode {
  final TypeNode type;

  const ListTypeNode({
    @required this.type,
    @required bool isNonNull,
    FileSpan span,
  })  : assert(type != null),
        assert(isNonNull != null),
        super(isNonNull, span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(type, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitListTypeNode(this);
}

class DirectiveNode extends Node {
  final NameNode name;

  final Iterable<ArgumentNode> arguments;

  const DirectiveNode({
    @required this.name,
    this.arguments = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(arguments != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(arguments, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitDirectiveNode(this);
}

class NameNode extends Node {
  final String value;

  const NameNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitNameNode(this);
}

abstract class TypeSystemDefinitionNode extends DefinitionNode {
  const TypeSystemDefinitionNode({
    @required NameNode name,
    FileSpan span,
  }) : super(
          name: name,
          span: span,
        );
}

abstract class TypeDefinitionNode extends TypeSystemDefinitionNode {
  final StringValueNode description;
  final Iterable<DirectiveNode> directives;

  const TypeDefinitionNode({
    this.description,
    @required NameNode name,
    this.directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(directives != null),
        super(
          name: name,
          span: span,
        );
}

abstract class TypeSystemExtensionNode extends TypeSystemDefinitionNode {
  const TypeSystemExtensionNode({
    @required NameNode name,
    FileSpan span,
  }) : super(
          name: name,
          span: span,
        );
}

abstract class TypeExtensionNode extends TypeSystemExtensionNode {
  final Iterable<DirectiveNode> directives;

  const TypeExtensionNode({
    FileSpan span,
    @required NameNode name,
    this.directives = const [],
  })  : assert(name != null),
        assert(directives != null),
        super(
          name: name,
          span: span,
        );
}

class SchemaDefinitionNode extends TypeSystemDefinitionNode {
  final Iterable<DirectiveNode> directives;
  final Iterable<OperationTypeDefinitionNode> operationTypes;

  const SchemaDefinitionNode({
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan span,
  })  : assert(directives != null),
        assert(operationTypes != null),
        super(
          name: null,
          span: span,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(directives, v);
    _visitAll(operationTypes, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaDefinitionNode(this);
}

class OperationTypeDefinitionNode extends Node {
  final OperationType operation;
  final NamedTypeNode type;

  const OperationTypeDefinitionNode({
    @required this.operation,
    @required this.type,
    FileSpan span,
  })  : assert(operation != null),
        assert(type != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(type, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitOperationTypeDefinitionNode(this);
}

class ScalarTypeDefinitionNode extends TypeDefinitionNode {
  const ScalarTypeDefinitionNode({
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitScalarTypeDefinitionNode(this);
}

class ObjectTypeDefinitionNode extends TypeDefinitionNode {
  final Iterable<NamedTypeNode> interfaces;
  final Iterable<FieldDefinitionNode> fields;

  const ObjectTypeDefinitionNode({
    this.interfaces = const [],
    this.fields = const [],
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(interfaces != null),
        assert(fields != null),
        assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(interfaces, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectTypeDefinitionNode(this);
}

class FieldDefinitionNode extends Node {
  final StringValueNode description;
  final NameNode name;
  final TypeNode type;
  final Iterable<DirectiveNode> directives;
  final Iterable<InputValueDefinitionNode> args;

  const FieldDefinitionNode({
    this.description,
    @required this.name,
    @required this.type,
    this.args = const [],
    this.directives = const [],
    FileSpan span,
  })  : assert(type != null),
        assert(args != null),
        assert(name != null),
        assert(directives != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitOne(type, v);
    _visitAll(directives, v);
    _visitAll(args, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitFieldDefinitionNode(this);
}

class InputValueDefinitionNode extends Node {
  final StringValueNode description;
  final NameNode name;
  final TypeNode type;
  final ValueNode defaultValue;
  final Iterable<DirectiveNode> directives;

  const InputValueDefinitionNode({
    this.description,
    @required this.name,
    @required this.type,
    this.defaultValue,
    this.directives = const [],
    FileSpan span,
  })  : assert(type != null),
        assert(name != null),
        assert(type != null),
        assert(directives != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitOne(type, v);
    _visitOne(defaultValue, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInputValueDefinitionNode(this);
}

class InterfaceTypeDefinitionNode extends TypeDefinitionNode {
  final Iterable<FieldDefinitionNode> fields;

  const InterfaceTypeDefinitionNode({
    this.fields = const [],
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(fields != null),
        assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeDefinitionNode(this);
}

class UnionTypeDefinitionNode extends TypeDefinitionNode {
  final Iterable<NamedTypeNode> types;

  const UnionTypeDefinitionNode({
    this.types = const [],
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(types != null),
        assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(types, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitUnionTypeDefinitionNode(this);
}

class EnumTypeDefinitionNode extends TypeDefinitionNode {
  final Iterable<EnumValueDefinitionNode> values;

  const EnumTypeDefinitionNode({
    this.values = const [],
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(values != null),
        assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(values, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumTypeDefinitionNode(this);
}

class EnumValueDefinitionNode extends TypeDefinitionNode {
  const EnumValueDefinitionNode({
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumValueDefinitionNode(this);
}

class InputObjectTypeDefinitionNode extends TypeDefinitionNode {
  final Iterable<InputValueDefinitionNode> fields;

  const InputObjectTypeDefinitionNode({
    this.fields = const [],
    StringValueNode description,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(fields != null),
        assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          description: description,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeDefinitionNode(this);
}

class DirectiveDefinitionNode extends TypeSystemDefinitionNode {
  final StringValueNode description;
  final Iterable<InputValueDefinitionNode> args;
  final Iterable<DirectiveLocation> locations;
  final bool repeatable;

  const DirectiveDefinitionNode({
    this.description,
    @required NameNode name,
    this.args = const [],
    this.locations = const [],
    this.repeatable = false,
    FileSpan span,
  })  : assert(name != null),
        assert(args != null),
        assert(locations != null),
        assert(repeatable != null),
        super(
          name: name,
          span: span,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(description, v);
    _visitOne(name, v);
    _visitAll(args, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitDirectiveDefinitionNode(this);
}

class SchemaExtensionNode extends TypeSystemExtensionNode {
  final Iterable<DirectiveNode> directives;
  final Iterable<OperationTypeDefinitionNode> operationTypes;

  const SchemaExtensionNode({
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan span,
  })  : assert(directives != null),
        assert(operationTypes != null),
        super(
          name: null,
          span: span,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(directives, v);
    _visitAll(operationTypes, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaExtensionNode(this);
}

class ScalarTypeExtensionNode extends TypeExtensionNode {
  const ScalarTypeExtensionNode({
    FileSpan span,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
  })  : assert(name != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitScalarTypeExtensionNode(this);
}

class ObjectTypeExtensionNode extends TypeExtensionNode {
  final Iterable<NamedTypeNode> interfaces;
  final Iterable<FieldDefinitionNode> fields;

  const ObjectTypeExtensionNode({
    @required NameNode name,
    this.interfaces = const [],
    this.fields = const [],
    FileSpan span,
    Iterable<DirectiveNode> directives = const [],
  })  : assert(name != null),
        assert(interfaces != null),
        assert(fields != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(interfaces, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectTypeExtensionNode(this);
}

class InterfaceTypeExtensionNode extends TypeExtensionNode {
  final Iterable<FieldDefinitionNode> fields;

  const InterfaceTypeExtensionNode({
    this.fields = const [],
    @required NameNode name,
    FileSpan span,
    Iterable<DirectiveNode> directives = const [],
  })  : assert(name != null),
        assert(fields != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeExtensionNode(this);
}

class UnionTypeExtensionNode extends TypeExtensionNode {
  final Iterable<NamedTypeNode> types;

  const UnionTypeExtensionNode({
    this.types = const [],
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(types != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(types, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitUnionTypeExtensionNode(this);
}

class EnumTypeExtensionNode extends TypeExtensionNode {
  final Iterable<EnumValueDefinitionNode> values;

  const EnumTypeExtensionNode({
    this.values = const [],
    FileSpan span,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
  })  : assert(name != null),
        assert(values != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(values, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumTypeExtensionNode(this);
}

class InputObjectTypeExtensionNode extends TypeExtensionNode {
  final Iterable<InputValueDefinitionNode> fields;

  const InputObjectTypeExtensionNode({
    this.fields = const [],
    FileSpan span,
    @required NameNode name,
    Iterable<DirectiveNode> directives = const [],
  })  : assert(name != null),
        assert(fields != null),
        assert(directives != null),
        super(
          span: span,
          name: name,
          directives: directives,
        );

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitOne(name, v);
    _visitAll(directives, v);
    _visitAll(fields, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeExtensionNode(this);
}
