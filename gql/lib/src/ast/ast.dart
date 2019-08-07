import "package:meta/meta.dart";
import "package:source_span/source_span.dart";

import "package:gql/src/ast/visitor.dart";

void _visitOne<R>(
  Node node,
  Visitor<R> v,
) =>
    node?.accept(v);

void _visitAll<R>(
  Iterable<Node> nodes,
  Visitor<R> v,
) =>
    nodes.forEach(
      (node) => _visitOne(node, v),
    );

/// The base class for any GraphQL AST [Node].
abstract class Node {
  /// [FileSpan] representing the location of the node in the the [SourceFile]
  FileSpan span;

  Node(this.span);

  /// Lets [Visitor] [v] visit children nodes of this node.
  void visitChildren<R>(Visitor<R> v);

  /// Accepts a [Visitor] [v].
  R accept<R>(Visitor<R> v);
}

class DocumentNode extends Node {
  Iterable<DefinitionNode> definitions;

  DocumentNode({
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
  DefinitionNode(FileSpan span) : super(span);
}

abstract class ExecutableDefinitionNode extends DefinitionNode {
  ExecutableDefinitionNode(FileSpan span) : super(span);
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
  OperationType type;

  NameNode name;

  Iterable<VariableDefinitionNode> variableDefinitions;

  Iterable<DirectiveNode> directives;

  SelectionSetNode selectionSet;

  OperationDefinitionNode({
    @required this.type,
    this.name,
    this.variableDefinitions = const [],
    this.directives = const [],
    @required this.selectionSet,
    FileSpan span,
  })  : assert(variableDefinitions != null),
        assert(directives != null),
        assert(selectionSet != null),
        super(span);

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
  Iterable<SelectionNode> selections;

  SelectionSetNode({
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
  SelectionNode(FileSpan span) : super(span);
}

class FieldNode extends SelectionNode {
  NameNode alias;

  NameNode name;

  Iterable<ArgumentNode> arguments;

  Iterable<DirectiveNode> directives;

  SelectionSetNode selectionSet;

  FieldNode({
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
  NameNode name;

  ValueNode value;

  ArgumentNode({
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
  NameNode name;

  Iterable<DirectiveNode> directives;

  FragmentSpreadNode({
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
  TypeConditionNode typeCondition;

  Iterable<DirectiveNode> directives;

  SelectionSetNode selectionSet;

  InlineFragmentNode({
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
  NameNode name;

  TypeConditionNode typeCondition;

  Iterable<DirectiveNode> directives;

  SelectionSetNode selectionSet;

  FragmentDefinitionNode({
    @required this.name,
    @required this.typeCondition,
    this.directives = const [],
    @required this.selectionSet,
    FileSpan span,
  })  : assert(name != null),
        assert(typeCondition != null),
        assert(directives != null),
        assert(selectionSet != null),
        super(span);

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
  NamedTypeNode on;

  TypeConditionNode({
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
  ValueNode(FileSpan span) : super(span);
}

class VariableNode extends ValueNode {
  NameNode name;

  VariableNode({
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
  String value;

  IntValueNode({
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
  String value;

  FloatValueNode({
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
  String value;

  bool isBlock;

  StringValueNode({
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
  bool value;

  BooleanValueNode({
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
  NullValueNode({
    FileSpan span,
  }) : super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {}

  @override
  R accept<R>(Visitor<R> v) => v.visitNullValueNode(this);
}

class EnumValueNode extends ValueNode {
  NameNode name;

  EnumValueNode({
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
  Iterable<ValueNode> values;

  ListValueNode({
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
  Iterable<ObjectFieldNode> fields;

  ObjectValueNode({
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
  NameNode name;

  ValueNode value;

  ObjectFieldNode({
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
  VariableNode variable;

  TypeNode type;

  DefaultValueNode defaultValue;

  Iterable<DirectiveNode> directives;

  VariableDefinitionNode({
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
  ValueNode value;

  DefaultValueNode({
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
  bool isNonNull;

  TypeNode(this.isNonNull, FileSpan span)
      : assert(isNonNull != null),
        super(span);
}

class NamedTypeNode extends TypeNode {
  NameNode name;

  NamedTypeNode({
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
  TypeNode type;

  ListTypeNode({
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
  NameNode name;

  Iterable<ArgumentNode> arguments;

  DirectiveNode({
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
  String value;

  NameNode({
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
  TypeSystemDefinitionNode(FileSpan span) : super(span);
}

abstract class TypeDefinitionNode extends TypeSystemDefinitionNode {
  StringValueNode description;
  NameNode name;
  Iterable<DirectiveNode> directives;

  TypeDefinitionNode({
    this.description,
    @required this.name,
    this.directives = const [],
    FileSpan span,
  })  : assert(name != null),
        assert(directives != null),
        super(span);
}

abstract class TypeSystemExtensionNode extends TypeSystemDefinitionNode {
  TypeSystemExtensionNode(FileSpan span) : super(span);
}

abstract class TypeExtensionNode extends TypeSystemExtensionNode {
  NameNode name;
  Iterable<DirectiveNode> directives;

  TypeExtensionNode({
    FileSpan span,
    @required this.name,
    this.directives = const [],
  })  : assert(name != null),
        assert(directives != null),
        super(span);
}

class SchemaDefinitionNode extends TypeSystemDefinitionNode {
  Iterable<DirectiveNode> directives;
  Iterable<OperationTypeDefinitionNode> operationTypes;

  SchemaDefinitionNode({
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan span,
  })  : assert(directives != null),
        assert(operationTypes != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(directives, v);
    _visitAll(operationTypes, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaDefinitionNode(this);
}

class OperationTypeDefinitionNode extends Node {
  OperationType operation;
  NamedTypeNode type;

  OperationTypeDefinitionNode({
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
  ScalarTypeDefinitionNode({
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
  Iterable<NamedTypeNode> interfaces;
  Iterable<FieldDefinitionNode> fields;

  ObjectTypeDefinitionNode({
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
  StringValueNode description;
  NameNode name;
  TypeNode type;
  Iterable<DirectiveNode> directives;
  Iterable<InputValueDefinitionNode> args;

  FieldDefinitionNode({
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
  StringValueNode description;
  NameNode name;
  TypeNode type;
  ValueNode defaultValue;
  Iterable<DirectiveNode> directives;

  InputValueDefinitionNode({
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
  Iterable<FieldDefinitionNode> fields;

  InterfaceTypeDefinitionNode({
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
  Iterable<NamedTypeNode> types;

  UnionTypeDefinitionNode({
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
  Iterable<EnumValueDefinitionNode> values;

  EnumTypeDefinitionNode({
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
  EnumValueDefinitionNode({
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
  Iterable<InputValueDefinitionNode> fields;

  InputObjectTypeDefinitionNode({
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
  StringValueNode description;
  NameNode name;
  Iterable<InputValueDefinitionNode> args;
  Iterable<DirectiveLocation> locations;
  bool repeatable;

  DirectiveDefinitionNode({
    this.description,
    @required this.name,
    this.args = const [],
    this.locations = const [],
    this.repeatable = false,
    FileSpan span,
  })  : assert(name != null),
        assert(args != null),
        assert(locations != null),
        assert(repeatable != null),
        super(span);

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
  Iterable<DirectiveNode> directives;
  Iterable<OperationTypeDefinitionNode> operationTypes;

  SchemaExtensionNode({
    this.directives = const [],
    this.operationTypes = const [],
    FileSpan span,
  })  : assert(directives != null),
        assert(operationTypes != null),
        super(span);

  @override
  void visitChildren<R>(Visitor<R> v) {
    _visitAll(directives, v);
    _visitAll(operationTypes, v);
  }

  @override
  R accept<R>(Visitor<R> v) => v.visitSchemaExtensionNode(this);
}

class ScalarTypeExtensionNode extends TypeExtensionNode {
  ScalarTypeExtensionNode({
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
  Iterable<NamedTypeNode> interfaces;
  Iterable<FieldDefinitionNode> fields;

  ObjectTypeExtensionNode({
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
  Iterable<FieldDefinitionNode> fields;

  InterfaceTypeExtensionNode({
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
  Iterable<NamedTypeNode> types;

  UnionTypeExtensionNode({
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
  Iterable<EnumValueDefinitionNode> values;

  EnumTypeExtensionNode({
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
  Iterable<InputValueDefinitionNode> fields;

  InputObjectTypeExtensionNode({
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
