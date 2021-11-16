import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

Expression buildPossibleTypes(
  List<DefinitionNode> definitions,
) {
  final typeDefs = definitions.whereType<TypeDefinitionNode>();

  final typesByName = typeDefs.fold<Map<NameNode, TypeDefinitionNode>>(
      {}, (map, typeDef) => map..[typeDef.name] = typeDef);

  final interfaceImplementors = _interfaceImplementors(typeDefs);

  final Map<String, Set<String>> possibleTypesMap =
      typeDefs.fold({}, (map, typeDef) {
    if (typeDef is UnionTypeDefinitionNode ||
        typeDef is InterfaceTypeDefinitionNode) {
      final concreteTypes = _concreteTypes(
        typeDef.name,
        typesByName,
        interfaceImplementors,
      );
      return map
        ..[typeDef.name.value] =
            concreteTypes.map((type) => type.name.value).toSet();
    } else {
      return map;
    }
  });

  return literalMap(possibleTypesMap).assignConst("possibleTypes");
}

Set<ObjectTypeDefinitionNode> _concreteTypes(
  NameNode name,
  Map<NameNode, TypeDefinitionNode> typesByName,
  Map<NameNode, Set<TypeDefinitionNode>> interfaceImplementors,
) {
  final type = typesByName[name]!;

  if (type is UnionTypeDefinitionNode) {
    return type.types
        .expand(
          (subtype) =>
              _concreteTypes(subtype.name, typesByName, interfaceImplementors),
        )
        .toSet();
  } else if (type is InterfaceTypeDefinitionNode) {
    return interfaceImplementors[type.name]!
        .expand(
          (subtype) =>
              _concreteTypes(subtype.name, typesByName, interfaceImplementors),
        )
        .toSet();
  } else if (type is ObjectTypeDefinitionNode) {
    return {type};
  } else {
    return {};
  }
}

Map<NameNode, Set<TypeDefinitionNode>> _interfaceImplementors(
  Iterable<TypeDefinitionNode> typeDefs,
) {
  final interfaces = typeDefs
      .whereType<InterfaceTypeDefinitionNode>()
      .map((interface) => interface.name);
  final interfaceMap = Map<NameNode, Set<TypeDefinitionNode>>.fromIterable(
      interfaces,
      value: (dynamic _) => {});

  for (final typeDef in typeDefs) {
    if (typeDef is InterfaceTypeDefinitionNode) {
      /// TODO: handle interfaces that implement other interfaces once this is implemented in gql ast
      /// https://github.com/graphql/graphql-spec/pull/373
    } else if (typeDef is ObjectTypeDefinitionNode) {
      typeDef.interfaces
          .forEach((interface) => interfaceMap[interface.name]!.add(typeDef));
    } else if (typeDef is UnionTypeDefinitionNode) {
      /// TODO: handle unions
    }
  }

  return interfaceMap;
}
