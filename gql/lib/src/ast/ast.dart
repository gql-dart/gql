import "package:gql/src/ast/visitor.dart";
import "package:meta/meta.dart";
import "package:quiver/collection.dart";
import "package:quiver/core.dart";
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

  List<Object> _getChildren();

  /// Lets [Visitor] [v] visit children nodes of this node.
  void visitChildren<R>(Visitor<R> v) => _getChildren().forEach(
        (child) {
          if (child is Iterable<Node>) {
            _visitAll(child, v);
          } else if (child is Node) {
            _visitOne(child, v);
          }
        },
      );

  @override
  bool operator ==(Object o) {
    if (o is Node) {
      if (o.runtimeType != runtimeType) return false;

      final oChildren = o._getChildren();
      final children = _getChildren();

      for (var i = 0; i < oChildren.length; i++) {
        final dynamic oElement = oChildren[i];
        final dynamic element = children[i];

        if (oElement == element) continue;

        if (oElement is Iterable && element is Iterable) {
          if (listsEqual(
            oElement.toList(),
            element.toList(),
          )) {
            continue;
          }
        }

        return false;
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => hashObjects(
        _getChildren().map<Object>(
          (child) {
            if (child is Iterable) {
              return hashObjects(child);
            }

            return child;
          },
        ),
      );

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
  _getChildren() => <Object>[
        definitions,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitOperationDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        type,
        selectionSet,
        variableDefinitions,
        directives,
      ];
}

class SelectionSetNode extends Node {
  final Iterable<SelectionNode> selections;

  const SelectionSetNode({
    this.selections = const [],
    FileSpan span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitSelectionSetNode(this);

  @override
  _getChildren() => <Object>[
        selections,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitFieldNode(this);

  @override
  _getChildren() => <Object>[
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
    @required this.name,
    @required this.value,
    FileSpan span,
  })  : assert(name != null),
        assert(value != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitArgumentNode(this);

  @override
  _getChildren() => <Object>[
        name,
        value,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitFragmentSpreadNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInlineFragmentNode(this);

  @override
  _getChildren() => <Object>[
        typeCondition,
        selectionSet,
        directives,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitFragmentDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        typeCondition,
        selectionSet,
        directives,
      ];
}

class TypeConditionNode extends Node {
  final NamedTypeNode on;

  const TypeConditionNode({
    @required this.on,
    FileSpan span,
  })  : assert(on != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitTypeConditionNode(this);

  @override
  _getChildren() => <Object>[
        on,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitVariableNode(this);

  @override
  _getChildren() => <Object>[
        name,
      ];
}

class IntValueNode extends ValueNode {
  final String value;

  const IntValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitIntValueNode(this);

  @override
  _getChildren() => <Object>[
        value,
      ];
}

class FloatValueNode extends ValueNode {
  final String value;

  const FloatValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitFloatValueNode(this);

  @override
  _getChildren() => <Object>[
        value,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitStringValueNode(this);

  @override
  _getChildren() => <Object>[
        value,
        isBlock,
      ];
}

class BooleanValueNode extends ValueNode {
  final bool value;

  const BooleanValueNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitBooleanValueNode(this);

  @override
  _getChildren() => <Object>[
        value,
      ];
}

class NullValueNode extends ValueNode {
  const NullValueNode({
    FileSpan span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitNullValueNode(this);

  @override
  _getChildren() => <Object>[];
}

class EnumValueNode extends ValueNode {
  final NameNode name;

  const EnumValueNode({
    @required this.name,
    FileSpan span,
  })  : assert(name != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitEnumValueNode(this);

  @override
  _getChildren() => <Object>[
        name,
      ];
}

class ListValueNode extends ValueNode {
  final Iterable<ValueNode> values;

  const ListValueNode({
    this.values = const [],
    FileSpan span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitListValueNode(this);

  @override
  _getChildren() => <Object>[
        values,
      ];
}

class ObjectValueNode extends ValueNode {
  final Iterable<ObjectFieldNode> fields;

  const ObjectValueNode({
    this.fields = const [],
    FileSpan span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitObjectValueNode(this);

  @override
  _getChildren() => <Object>[
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitObjectFieldNode(this);

  @override
  _getChildren() => <Object>[
        name,
        value,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitVariableDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        variable,
        type,
        defaultValue,
        directives,
      ];
}

class DefaultValueNode extends Node {
  final ValueNode value;

  const DefaultValueNode({
    @required this.value,
    FileSpan span,
  }) : super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitDefaultValueNode(this);

  @override
  _getChildren() => <Object>[
        value,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitNamedTypeNode(this);

  @override
  _getChildren() => <Object>[
        isNonNull,
        name,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitListTypeNode(this);

  @override
  _getChildren() => <Object>[
        isNonNull,
        type,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitDirectiveNode(this);

  @override
  _getChildren() => <Object>[
        name,
        arguments,
      ];
}

class NameNode extends Node {
  final String value;

  const NameNode({
    @required this.value,
    FileSpan span,
  })  : assert(value != null),
        super(span);

  @override
  R accept<R>(Visitor<R> v) => v.visitNameNode(this);

  @override
  _getChildren() => <Object>[
        value,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitSchemaDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        directives,
        operationTypes,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitOperationTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        operation,
        type,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitScalarTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitObjectTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        interfaces,
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitFieldDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        type,
        args,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInputValueDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        type,
        defaultValue,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitUnionTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        types,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitEnumTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        values,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitEnumValueDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        directives,
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitDirectiveDefinitionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        description,
        locations,
        args,
        repeatable,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitSchemaExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        operationTypes,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitScalarTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitObjectTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        interfaces,
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInterfaceTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        fields,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitUnionTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        types,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitEnumTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        values,
      ];
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
  R accept<R>(Visitor<R> v) => v.visitInputObjectTypeExtensionNode(this);

  @override
  _getChildren() => <Object>[
        name,
        directives,
        fields,
      ];
}
