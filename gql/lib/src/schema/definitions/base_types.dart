// Contents:
// * GraphQLEntity
// * AbstractType
// * NamedType
// * ListType
// * Argument
// * Directive
// * TypeSystemDefinition
// * TypeDefinition
part of 'definitions.dart';

@immutable
abstract class GraphQLEntity {
  const GraphQLEntity();

  @override
  String toString() => printNode(astNode);

  Node get astNode;
}

mixin AbstractType on TypeDefinition {
  static bool isPossibleType(
    AbstractType abstractType,
    ObjectTypeDefinition objectType,
  ) {
    if (abstractType is UnionTypeDefinition) {
      return abstractType._typeNames.contains(objectType.name);
    }
    if (abstractType is InterfaceTypeDefinition) {
      return objectType.interfaceNames.contains(abstractType.name);
    }

    throw ArgumentError('$abstractType is unsupported');
  }
}

@immutable
abstract class GraphQLType extends GraphQLEntity {
  const GraphQLType();

  @override
  TypeNode get astNode;

  bool get isNonNull => astNode.isNonNull;

  String get baseTypeName;

  static GraphQLType fromNode(
    TypeNode astNode, [
    ResolveType getType,
  ]) {
    if (astNode is NamedTypeNode) {
      return NamedType(astNode, getType);
    }
    if (astNode is ListTypeNode) {
      return ListType(astNode, getType);
    }
    throw ArgumentError('$astNode is unsupported');
  }
}

@immutable
class NamedType extends GraphQLType implements TypeResolver {
  const NamedType(
    this.astNode, [
    ResolveType getType,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  TypeDefinition get type => getType(name);
  bool get hasResolver => getType != TypeResolver.withoutContext;

  @override
  final NamedTypeNode astNode;

  String get name => astNode.name.value;

  @override
  String get baseTypeName => name;

  static NamedType fromNode(
    NamedTypeNode astNode, [
    ResolveType getType,
  ]) =>
      NamedType(astNode, getType);

  static String nameFromNode(NamedTypeNode astNode) => astNode.name.value;
}

@immutable
class ListType extends GraphQLType implements TypeResolver {
  const ListType(
    this.astNode, [
    ResolveType getType,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  @override
  final ListTypeNode astNode;

  GraphQLType get type => GraphQLType.fromNode(astNode.type, getType);

  @override
  String get baseTypeName => type.baseTypeName;

  static ListType fromNode(
    ListTypeNode astNode, [
    ResolveType getType,
  ]) =>
      ListType(astNode, getType);
}

@immutable
class Argument extends GraphQLEntity {
  const Argument(this.astNode);

  @override
  final ArgumentNode astNode;

  String get name => astNode.name.value;
  Value get value => Value.fromNode(astNode.value);

  static Argument fromNode(ArgumentNode astNode) => Argument(astNode);
}

@immutable
class Directive extends GraphQLEntity {
  const Directive(this.astNode);

  @override
  final DirectiveNode astNode;

  String get name => astNode.name.value;

  List<Argument> get arguments =>
      astNode.arguments.map(Argument.fromNode).toList();

  static Directive fromNode(DirectiveNode astNode) => Directive(astNode);
}

@immutable
abstract class TypeSystemDefinition extends GraphQLEntity {
  const TypeSystemDefinition();

  @override
  TypeSystemDefinitionNode get astNode;

  String get name => astNode.name.value;
}

/// same as GraphQLNamedType in the graphqljs implementation
///
/// Implementors:
///   ScalarTypeDefinition
///   ObjectTypeDefinition
///   InterfaceTypeDefinition
///   UnionTypeDefinition
///   EnumTypeDefinition
///   InputObjectTypeDefinition
@immutable
abstract class TypeDefinition extends TypeSystemDefinition {
  const TypeDefinition();

  @override
  TypeDefinitionNode get astNode;

  String get description => astNode.description?.value;

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  static TypeDefinition fromNode(TypeDefinitionNode node) {
    if (node is ScalarTypeDefinitionNode) {
      return ScalarTypeDefinition.fromNode(node);
    }

    if (node is InterfaceTypeDefinitionNode) {
      return InterfaceTypeDefinition.fromNode(node);
    }

    if (node is ObjectTypeDefinitionNode) {
      return ObjectTypeDefinition.fromNode(node);
    }

    if (node is UnionTypeDefinitionNode) {
      return UnionTypeDefinition.fromNode(node);
    }

    if (node is EnumTypeDefinitionNode) {
      return EnumTypeDefinition.fromNode(node);
    }

    if (node is InputObjectTypeDefinitionNode) {
      return InputObjectTypeDefinition.fromNode(node);
    }

    /* 
    https://github.com/graphql/graphql-js/blob/49d86bbc810d1203aa3f7d93252e51f257d9460f/src/language/predicates.js#L59
    doesn't include enum values
    if (node is EnumValueDefinitionNode) {
      return EnumValueDefinition.fromNode(node);
    }
    */

    throw ArgumentError('$node is unsupported');
  }
}
