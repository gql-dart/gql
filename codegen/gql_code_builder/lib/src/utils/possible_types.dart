import "package:gql/ast.dart";

/// implementation based on graphql_codegen:
/// https://github.com/heftapp/graphql_codegen/blob/main/packages/graphql_codegen/lib/src/context.dart#L770
extension PossibleTypes on DocumentNode {
  Map<String, Set<String>> possibleTypesMap() {
    // TODO handle interfaces that extend other interfaces?
    // https://github.com/graphql/graphql-spec/pull/373
    final possibleTypes = <String, Set<String>>{};

    for (final definition in definitions) {
      if (definition is UnionTypeDefinitionNode) {
        final types = possibleTypes[definition.name.value] ?? {};
        for (final tpe in definition.types) {
          types.add(tpe.name.value);
        }
        possibleTypes[definition.name.value] = types;
      } else if (definition is ObjectTypeDefinitionNode) {
        for (final tpe in definition.interfaces) {
          final types = possibleTypes[tpe.name.value] ?? {};
          types.add(definition.name.value);
          possibleTypes[tpe.name.value] = types;
        }
      }
    }
    return possibleTypes.map((key, value) => MapEntry<String, Set<String>>(
        key,
        value
            .expand<ObjectTypeDefinitionNode>(_lookupConcreteTypes)
            .map((e) => e.name.value)
            .toSet()));
  }

  Iterable<ObjectTypeDefinitionNode> _lookupConcreteTypes(String name) {
    final typeDefinition = _lookupType(name);
    if (typeDefinition is ObjectTypeDefinitionNode) {
      return [typeDefinition];
    }
    if (typeDefinition is UnionTypeDefinitionNode) {
      return typeDefinition.types
          .expand((e) => _lookupConcreteTypes(e.name.value));
    }

    if (typeDefinition is InterfaceTypeDefinitionNode) {
      return definitions.whereType<ObjectTypeDefinitionNode>().where(
            (element) => element.interfaces
                .where((element) => element.name.value == name)
                .isNotEmpty,
          );
    }

    return [];
  }

  TType? _lookupType<TType extends TypeDefinitionNode>(String name) {
    final defs = _memoizedTypeDefinitionsOf(this);

    final def = defs[name];
    if (def == null) {
      return null;
    }
    if (def is! TType) {
      return null;
    }
    return def;
  }
}

final _memoizedTypeDefinitionsOf = _memo1(_typeDefinitionsOf);

Map<String, TypeDefinitionNode> _typeDefinitionsOf(DocumentNode schema) =>
    Map.fromEntries(
      schema.definitions
          .whereType<TypeDefinitionNode>()
          .map((e) => MapEntry(e.name.value, e)),
    );

/// Checks 1 argument for equality with [==] operator and returns the cached
/// result if it was not changed.
R Function(A) _memo1<A, R>(R Function(A) func) {
  late A prevArg;
  late R prevResult;
  bool isInitial = true;

  return (A arg) {
    if (!isInitial && arg == prevArg) {
      return prevResult;
    } else {
      prevArg = arg;
      prevResult = func(arg);
      isInitial = false;

      return prevResult;
    }
  };
}
