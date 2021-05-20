// Contents:
// * Value
// * IntValue
// * FloatValue
// * StringValue
// * BooleanValue
// * NullValue
// * EnumValue
// * ListValue
// * ObjectField<Value>
// * ObjectValue
// * DefaultValue
import "package:meta/meta.dart";
import "package:gql/ast.dart";

import "./base_types.dart";

/// A literal value type
@immutable
abstract class Value extends GraphQLEntity {
  const Value();

  @override
  ValueNode? get astNode;

  static Value fromNode(ValueNode? node) {
    if (node is IntValueNode) {
      return IntValue(node);
    }

    if (node is FloatValueNode) {
      return FloatValue(node);
    }
    if (node is StringValueNode) {
      return StringValue(node);
    }
    if (node is BooleanValueNode) {
      return BooleanValue(node);
    }
    if (node is NullValueNode) {
      return NullValue(node);
    }
    if (node is EnumValueNode) {
      return EnumValue(node);
    }
    if (node is ListValueNode) {
      return ListValue(node);
    }
    if (node is ObjectValueNode) {
      return ObjectValue(node);
    }

    throw ArgumentError("$node is unsupported");
  }
}

@immutable
class IntValue extends Value {
  const IntValue(this.astNode);

  @override
  final IntValueNode astNode;

  int get value => int.parse(astNode.value);
}

@immutable
class FloatValue extends Value {
  const FloatValue(this.astNode);

  @override
  final FloatValueNode astNode;

  double get value => double.parse(astNode.value);
}

@immutable
class StringValue extends Value {
  const StringValue(this.astNode);

  @override
  final StringValueNode? astNode;

  String get value => astNode!.value;
}

@immutable
class BooleanValue extends Value {
  const BooleanValue(this.astNode);

  @override
  final BooleanValueNode astNode;

  bool get value => astNode.value;
}

@immutable
class NullValue extends Value {
  const NullValue(this.astNode);

  @override
  final NullValueNode astNode;
}

@immutable
class EnumValue extends Value {
  const EnumValue(this.astNode);

  @override
  final EnumValueNode astNode;

  String get name => astNode.name.value;
}

@immutable
class ListValue extends Value {
  const ListValue(this.astNode);

  @override
  final ListValueNode astNode;

  List<Value> get values => astNode.values.map(Value.fromNode).toList();
}

@immutable
class ObjectField<V extends Value> extends GraphQLEntity {
  const ObjectField(this.astNode);

  @override
  final ObjectFieldNode astNode;

  String get name => astNode.name.value;

  V get value => Value.fromNode(astNode.value) as V;

  static MapEntry<String, ObjectField<Value>> asEntry(ObjectFieldNode astNode) {
    final field = ObjectField(astNode);
    return MapEntry(field.name, field);
  }
}

@immutable
class ObjectValue extends Value {
  const ObjectValue(this.astNode);

  @override
  final ObjectValueNode astNode;

  Map<String, ObjectField> get fields =>
      Map.fromEntries(astNode.fields.map(ObjectField.asEntry));
}

@immutable
class DefaultValue extends GraphQLEntity {
  const DefaultValue(this.astNode);

  @override
  final DefaultValueNode? astNode;

  Value get value => Value.fromNode(astNode!.value);
}

// While I don't believe VariableValues are possible in the schema definition,
// I included this here so ValueNode.fromNode could be made complete
@immutable
class Variable extends Value {
  const Variable(this.astNode);

  @override
  final VariableNode astNode;

  String get name => astNode.name.value;
}
