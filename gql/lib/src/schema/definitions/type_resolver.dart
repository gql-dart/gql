import "package:meta/meta.dart";
import "./base_types.dart" show TypeDefinition;
import "./definitions.dart"
    show
        InterfaceTypeDefinition,
        ObjectTypeDefinition,
        UnionTypeDefinition,
        InputObjectTypeDefinition;

/// Callback to dereference a full type definition by name
typedef ResolveType = TypeDefinition? Function(String name);

/// Enables "type resolution" for implementing classes,
/// allowing for type-dereferencing, such as is done by `GraphQLSchema`.
///
/// This makes schema-aware use-cases such as code generation much simpler.
abstract class TypeResolver {
  /// Resolve the given `name` into a [TypeDefinition],
  /// usually defined within the given context such as a `GraphQLSchema`.
  @protected
  ResolveType get getType;

  /// Saturates the [definition] with a [getType] if it extends from [TypeResolver]
  static TypeDefinition? addedTo(
    TypeDefinition? definition,
    ResolveType getType,
  ) {
    if (definition == null) {
      return null;
    }
    if (definition is InterfaceTypeDefinition) {
      return InterfaceTypeDefinition(definition.astNode, getType);
    }
    if (definition is ObjectTypeDefinition) {
      return ObjectTypeDefinition(definition.astNode, getType);
    }
    if (definition is UnionTypeDefinition) {
      return UnionTypeDefinition(definition.astNode, getType);
    }

    if (definition is InputObjectTypeDefinition) {
      return InputObjectTypeDefinition(definition.astNode, getType);
    }

    return null;
  }

  /// throw a [StateError] when resolution is attempted without a context passed down
  static TypeDefinition withoutContext(String name) => throw StateError(
        "Cannot resolve type $name in a context without a type resolver!",
      );
}
