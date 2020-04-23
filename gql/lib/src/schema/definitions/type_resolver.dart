part of 'definitions.dart';

/// Callback to dereference a type name into it's material version
typedef ResolveType = TypeDefinition Function(String name);

abstract class TypeResolver {
  @protected
  ResolveType get getType;

  static TypeDefinition addedTo(
    TypeDefinition definition,
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
    return null;
  }

  static TypeDefinition withoutContext(String name) => throw StateError(
      'Cannot resolve type $name in a context without a type resolver!');
}
