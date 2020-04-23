// Contents:
// * FieldDefinition
// * ScalarTypeDefinition
// * InputValueDefinition
// * EnumTypeDefinition
// * EnumValueDefinition
// * InputObjectTypeDefinition
// * DirectiveDefinition
// * InterfaceTypeDefinition
// * ObjectTypeDefinition
// * UnionTypeDefinition
import 'package:major_graphql_generator/src/schema/defaults.dart';
import 'package:meta/meta.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

part 'base_types.dart';
part 'value_types.dart';
part 'type_resolver.dart';

extension WithTypeName on OperationType {
  String get name {
    switch (this) {
      case OperationType.query:
        return 'query';
      case OperationType.mutation:
        return 'mutation';
      case OperationType.subscription:
        return 'subscription';
    }
    throw StateError('Impossible OperationType $this');
  }
}

/*
  Begin [TypeResolver]-enabled classes
*/
@immutable
class FieldDefinition extends GraphQLEntity implements TypeResolver {
  const FieldDefinition(
    this.astNode, [
    ResolveType getType,
    bool isOverride,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        isOverride = isOverride ?? false;

  @override
  final ResolveType getType;

  final bool isOverride;

  @override
  final FieldDefinitionNode astNode;

  String get name => astNode.name.value;

  String get description => astNode.description?.value;

  GraphQLType get type => GraphQLType.fromNode(astNode.type, getType);

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  List<InputValueDefinition> get args =>
      astNode.args.map(InputValueDefinition.fromNode).toList();

  static FieldDefinition fromNode(FieldDefinitionNode astNode,
          [ResolveType getType]) =>
      FieldDefinition(astNode, getType);
}

@immutable
abstract class TypeDefinitionWithFieldSet extends TypeDefinition
    implements TypeResolver {
  const TypeDefinitionWithFieldSet([
    ResolveType getType,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  List<FieldDefinition> get fields;

  List<FieldDefinition> get _fields => [typeNameField, ...fields];

  FieldDefinition getField(String fieldName);
}

@immutable
class InterfaceTypeDefinition extends TypeDefinitionWithFieldSet
    with AbstractType {
  const InterfaceTypeDefinition(
    this.astNode, [
    ResolveType getType,
  ]) : super(getType);

  @override
  List<FieldDefinition> get fields =>
      astNode.fields.map((field) => FieldDefinition(field, getType)).toList();

  @override
  FieldDefinition getField(String fieldName) =>
      _fields.firstWhere((field) => field.name == fieldName,
          orElse: () => throw StateError('No such field $fieldName on $this'));

  @override
  final InterfaceTypeDefinitionNode astNode;

  bool isImplementedBy(ObjectTypeDefinition objectType) =>
      objectType.interfaceNames.contains(name);

  static InterfaceTypeDefinition fromNode(InterfaceTypeDefinitionNode astNode,
          [ResolveType getType]) =>
      InterfaceTypeDefinition(astNode, getType);
}

@immutable
class ObjectTypeDefinition extends TypeDefinitionWithFieldSet {
  const ObjectTypeDefinition(
    this.astNode, [
    ResolveType getType,
  ]) : super(getType);

  @override
  final ObjectTypeDefinitionNode astNode;

  @override
  List<FieldDefinition> get fields {
    final inherited = _inheritedFieldNames;
    return astNode.fields
        .map((fieldNode) => FieldDefinition(
              fieldNode,
              getType,
              inherited.contains(fieldNode.name.value),
            ))
        .toList();
  }

  @override
  FieldDefinition getField(String fieldName) =>
      _fields.firstWhere((field) => field.name == fieldName,
          orElse: () => throw StateError('No such field $fieldName on $this'));

  List<NamedType> get interfaceNames => astNode.interfaces
      .map((name) => NamedType.fromNode(name, getType))
      .toList();

  List<InterfaceTypeDefinition> get interfaces => interfaceNames
      .map((i) => getType(i.name) as InterfaceTypeDefinition)
      .toList();

  Set<String> get _inheritedFieldNames {
    var inherited = <String>{};
    for (final face in interfaces) {
      inherited.addAll(face._fields.map((f) => f.name));
    }
    return inherited;
  }

  static ObjectTypeDefinition fromNode(
    ObjectTypeDefinitionNode astNode, [
    ResolveType getType,
  ]) =>
      ObjectTypeDefinition(astNode, getType);
}

@immutable
class UnionTypeDefinition extends TypeDefinition
    with AbstractType
    implements TypeResolver {
  const UnionTypeDefinition(
    this.astNode, [
    ResolveType getType,
  ]) : getType = getType ?? TypeResolver.withoutContext;

  @override
  final ResolveType getType;

  @override
  final UnionTypeDefinitionNode astNode;

  List<NamedType> get typeNames =>
      astNode.types.map((name) => NamedType.fromNode(name, getType)).toList();

  Iterable<String> get _typeNames => typeNames.map((t) => t.name);

  /// http://spec.graphql.org/draft/#sel-HAHdfFDABABlG3ib:
  /// > The member types of a Union type must all be Object base types;
  /// > Scalar, Interface and Union types must not be member types of a Union.
  /// > Similarly, wrapping types must not be member types of a Union.
  List<ObjectTypeDefinition> get types =>
      _typeNames.map(getType).cast<ObjectTypeDefinition>().toList();

  static UnionTypeDefinition fromNode(
    UnionTypeDefinitionNode astNode, [
    ResolveType getType,
  ]) =>
      UnionTypeDefinition(astNode, getType);
}

/*
  Begin simple/dumb classes
*/
@immutable
class ScalarTypeDefinition extends TypeDefinition {
  const ScalarTypeDefinition(this.astNode);

  @override
  final ScalarTypeDefinitionNode astNode;

  static ScalarTypeDefinition fromNode(ScalarTypeDefinitionNode astNode) =>
      ScalarTypeDefinition(astNode);
}

@immutable
class InputValueDefinition extends GraphQLEntity {
  const InputValueDefinition(this.astNode);

  @override
  final InputValueDefinitionNode astNode;

  String get name => astNode.name.value;

  String get description => astNode.description?.value;

  GraphQLType get type => GraphQLType.fromNode(astNode.type);

  Value get defaultValue => Value.fromNode(astNode.defaultValue);

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  static InputValueDefinition fromNode(InputValueDefinitionNode astNode) =>
      InputValueDefinition(astNode);
}

@immutable
class EnumTypeDefinition extends TypeDefinition {
  const EnumTypeDefinition(this.astNode);

  @override
  final EnumTypeDefinitionNode astNode;

  List<EnumValueDefinition> get values =>
      astNode.values.map(EnumValueDefinition.fromNode).toList();

  static EnumTypeDefinition fromNode(EnumTypeDefinitionNode astNode) =>
      EnumTypeDefinition(astNode);
}

@immutable
class EnumValueDefinition extends TypeDefinition {
  const EnumValueDefinition(this.astNode);

  @override
  final EnumValueDefinitionNode astNode;

  static EnumValueDefinition fromNode(EnumValueDefinitionNode astNode) =>
      EnumValueDefinition(astNode);
}

@immutable
class InputObjectTypeDefinition extends TypeDefinition {
  const InputObjectTypeDefinition(this.astNode);

  @override
  final InputObjectTypeDefinitionNode astNode;

  List<InputValueDefinition> get fields =>
      astNode.fields.map(InputValueDefinition.fromNode).toList();

  static InputObjectTypeDefinition fromNode(
          InputObjectTypeDefinitionNode astNode) =>
      InputObjectTypeDefinition(astNode);
}

@immutable
class DirectiveDefinition extends TypeSystemDefinition {
  const DirectiveDefinition(this.astNode);

  @override
  final DirectiveDefinitionNode astNode;

  String get description => astNode.description?.value;

  List<InputValueDefinition> get args =>
      astNode.args.map(InputValueDefinition.fromNode).toList();

  List<DirectiveLocation> get locations => astNode.locations;

  bool get repeatable => astNode.repeatable;

  static DirectiveDefinition fromNode(DirectiveDefinitionNode astNode) =>
      DirectiveDefinition(astNode);
}

@immutable
class OperationTypeDefinition extends GraphQLEntity {
  const OperationTypeDefinition(this.astNode);

  @override
  final OperationTypeDefinitionNode astNode;

  OperationType get operation => astNode.operation;

  NamedType get type => NamedType.fromNode(astNode.type);

  static OperationTypeDefinition fromNode(
          OperationTypeDefinitionNode astNode) =>
      OperationTypeDefinition(astNode);
}
