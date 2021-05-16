/// Contents:
/// * [GraphQLEntity]
/// * [AbstractType]
/// * [NamedType]
/// * [ListType]
/// * [Argument]
/// * [Directive]
/// * [TypeSystemDefinition]
/// * [TypeDefinition]
import "package:meta/meta.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart";

import "./definitions.dart";
import "./type_resolver.dart";
import "./value_types.dart";

@immutable
abstract class GraphQLEntity {
  const GraphQLEntity();

  @override
  String toString() => printNode(astNode!);

  Node? get astNode;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    if (o.runtimeType == runtimeType) {
      return astNode == (o as GraphQLEntity).astNode;
    }

    return false;
  }

  @override
  int get hashCode => astNode.hashCode;
}

@immutable
abstract class EntityWithResolver extends GraphQLEntity
    implements TypeResolver {
  const EntityWithResolver([ResolveType? getType])
      : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    if (o.runtimeType == runtimeType) {
      final _o = o as EntityWithResolver;
      return astNode == _o.astNode && getType == _o.getType;
    }

    return false;
  }

  @override
  int get hashCode => const ListEquality<Object?>(
        DeepCollectionEquality(),
      ).hash([astNode, getType]);
}

/// GraphQL supports two abstract types:
/// interfaces ([InterfaceTypeDefinition]) and unions ([UnionTypeDefinition]).
///
/// See [TypeDefinition] for details on all GraphQL Type Definitions.
mixin AbstractType on TypeDefinition {
  /// Determine whether [objectType] is a acceptable as the given [abstractType]
  static bool isSubType(
    AbstractType abstractType,
    ObjectTypeDefinition objectType,
  ) {
    if (abstractType is UnionTypeDefinition) {
      return abstractType.typeNames.contains(objectType.name);
    }
    if (abstractType is InterfaceTypeDefinition) {
      return objectType.interfaceNames
          .map((n) => n.name)
          .contains(abstractType.name);
    }

    throw ArgumentError("$abstractType is unsupported");
  }
}

/// A [Type Reference](https://spec.graphql.org/June2018/#sec-Type-References) to a concrete [TypeDefinition].
///
/// GraphQL describes the types of data expected by query variables.
/// Input types may be lists of another input type, or a non‐null variant of any other input type.
@immutable
abstract class GraphQLType extends EntityWithResolver {
  const GraphQLType();

  @override
  TypeNode get astNode;

  bool get isNonNull => astNode.isNonNull;

  /// Extracts the innermost [NamedType]'s name
  String get baseTypeName;

  static GraphQLType fromNode(
    TypeNode astNode, [
    ResolveType? getType,
  ]) {
    if (astNode is NamedTypeNode) {
      return NamedType(astNode, getType);
    }
    if (astNode is ListTypeNode) {
      return ListType(astNode, getType);
    }
    throw ArgumentError("$astNode is unsupported");
  }
}

/// An unqualified [Named Type](https://spec.graphql.org/June2018/#NamedType) Reference.
///
/// GraphQL describes the types of data expected by query variables.
/// Input types may be lists of another input type, or a non‐null variant of any other input type.
@immutable
class NamedType extends GraphQLType {
  const NamedType(
    this.astNode, [
    ResolveType? getType,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  /// Resolve the referenced type with [getType].
  ///
  /// Will throw a [StateError] if [this] was defined in a context without type resolution
  /// (verifiable via [hasResolver]).
  ///
  /// See [TypeResolver] for mor details on type resolution.
  TypeDefinition? get type => getType(name);

  /// Whether it is safe to resolve the referenced type via [type]
  bool get hasResolver => getType != TypeResolver.withoutContext;

  @override
  final NamedTypeNode astNode;

  String get name => astNode.name.value;

  @override
  String get baseTypeName => name;

  static String nameFromNode(NamedTypeNode astNode) => astNode.name.value;
}

/// A [List Type](https://spec.graphql.org/June2018/#ListType)
/// wrapping another [GraphQLType].
///
/// GraphQL describes the types of data expected by query variables.
/// Input types may be lists of another input type, or a non‐null variant of any other input type.
@immutable
class ListType extends GraphQLType {
  const ListType(
    this.astNode, [
    ResolveType? getType,
  ])  : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  @override
  final ListTypeNode astNode;

  /// The contained [GraphQLType]
  GraphQLType get type => GraphQLType.fromNode(astNode.type, getType);

  @override
  String get baseTypeName => type.baseTypeName;
}

/// [Arguments](https://spec.graphql.org/June2018/#sec-Language.Arguments) to Fields which accept them.
/// [FieldDefinition]s are conceptually functions which return values,
/// and occasionally accept arguments which alter their behavior.
///
/// These arguments often map directly to function arguments within a GraphQL server’s implementation.
@immutable
class Argument extends GraphQLEntity {
  const Argument(this.astNode);

  @override
  final ArgumentNode astNode;

  String get name => astNode.name.value;
  Value get value => Value.fromNode(astNode.value);
}

/// [Directives](https://spec.graphql.org/June2018/#sec-Language.Directives)
/// provide a way to describe alternate runtime execution and type validation behavior in a GraphQL document.
@immutable
class Directive extends GraphQLEntity {
  const Directive(this.astNode);

  @override
  final DirectiveNode astNode;

  String get name => astNode.name.value;

  List<Argument> get arguments =>
      astNode.arguments.map((a) => Argument(a)).toList();
}

/// Base class of all type system definitions
@immutable
abstract class TypeSystemDefinition extends GraphQLEntity {
  const TypeSystemDefinition();

  /// The underlying definition node from `gql/ast.dart`
  @override
  TypeSystemDefinitionNode? get astNode;

  String? get name;
}

/// The fundamental unit of any GraphQL Schema ([spec](https://spec.graphql.org/June2018/#TypeDefinition)).
///
/// There are six kinds of named type definitions in GraphQL, and two wrapping types.
///
/// The most basic type is a `Scalar` ([ScalarTypeDefinition]).
/// A scalar represents a primitive value, like a string or an integer.
///
/// Oftentimes, the possible responses for a scalar field are enumerable.
/// GraphQL offers an `Enum` ([EnumTypeDefinition]) type in those cases,
/// where the type specifies the space of valid responses.
///
/// `Scalars` and `Enums` form the leaves in response trees;
/// the intermediate levels are `Object` types ([ObjectTypeDefinition]),
/// which define a set of fields,where each field is another type in the system,
/// allowing the definition of arbitrary type hierarchies.
///
/// GraphQL supports two abstract types ([AbstractType]): interfaces and unions.
///
/// An `Interface` ([InterfaceTypeDefinition]) defines a list of fields;
/// Object types that implement that interface are guaranteed to implement those fields.
/// Whenever the type system claims it will return an interface, it will return a valid implementing type.
///
/// A `Union` ([UnionTypeDefinition]) defines a list of possible types;
/// similar to interfaces, whenever the type system claims a union will be returned,
/// one of the possible types will be returned.
///
/// Finally, oftentimes it is useful to provide complex structs as inputs to GraphQL field arguments or variables;
/// the `Input Object` type ([InputObjectTypeDefinition]) allows the schema to define exactly what data is expected.
@immutable
abstract class TypeDefinition extends TypeSystemDefinition {
  const TypeDefinition();

  @override
  TypeDefinitionNode get astNode;

  @override
  String? get name => astNode.name.value;

  String? get description => astNode.description?.value;

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();

  static TypeDefinition fromNode(TypeDefinitionNode node) {
    if (node is ScalarTypeDefinitionNode) {
      return ScalarTypeDefinition(node);
    }

    if (node is InterfaceTypeDefinitionNode) {
      return InterfaceTypeDefinition(node);
    }

    if (node is ObjectTypeDefinitionNode) {
      return ObjectTypeDefinition(node);
    }

    if (node is UnionTypeDefinitionNode) {
      return UnionTypeDefinition(node);
    }

    if (node is EnumTypeDefinitionNode) {
      return EnumTypeDefinition(node);
    }

    if (node is InputObjectTypeDefinitionNode) {
      return InputObjectTypeDefinition(node);
    }

    /* 
    https://github.com/graphql/graphql-js/blob/49d86bbc810d1203aa3f7d93252e51f257d9460f/src/language/predicates.js#L59
    doesn't include enum values
    if (node is EnumValueDefinitionNode) {
      return EnumValueDefinition.fromNode(node);
    }
    */

    throw ArgumentError("$node is unsupported");
  }
}

@immutable
abstract class TypeDefinitionWithResolver extends TypeDefinition
    implements TypeResolver {
  const TypeDefinitionWithResolver([ResolveType? getType])
      : getType = getType ?? TypeResolver.withoutContext,
        super();

  @override
  final ResolveType getType;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    if (o.runtimeType == runtimeType) {
      final _o = o as TypeDefinitionWithResolver;
      return astNode == _o.astNode && getType == _o.getType;
    }

    return false;
  }

  @override
  int get hashCode => const ListEquality<Object?>(
        DeepCollectionEquality(),
      ).hash([astNode, getType]);
}
