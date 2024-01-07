import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/possible_types.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "./source.dart";
import "./src/operation/data.dart";

export "package:gql_code_builder/src/config/when_extension_config.dart";

typedef TypeName = String;

typedef FragmentRefMap = Map<(TypeName, BuiltSet<SelectionNode>), Reference>;

Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides, [
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig = const InlineFragmentSpreadWhenExtensionConfig(
    generateWhenExtensionMethod: false,
    generateMaybeWhenExtensionMethod: false,
  ),
]) {
  final fragmentRefMap = <(TypeName, BuiltSet<SelectionNode>), Reference>{};

  final possibleTypesMap = _possibleTypesMap(schemaSource);

  final fragmentDataClasses = docSource.document.definitions
      .whereType<FragmentDefinitionNode>()
      .expand(
        (frag) => buildFragmentDataClasses(
          frag,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
          fragmentRefMap,
          possibleTypesMap,
        ),
      )
      .toList();

  print(fragmentRefMap);

  final operationDataClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .expand(
        (op) => buildOperationDataClasses(
          op,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
          fragmentRefMap,
        ),
      )
      .toList();

  return Library(
    (b) => b
      ..directives.add(Directive.part(partUrl))
      ..body = ListBuilder(<Spec>[
        ...operationDataClasses,
        ...fragmentDataClasses,
      ]),
  );
}

Map<String, Set<String>> _possibleTypesMap(SourceNode source,
    [Set<String>? visitedSource, Map<String, Set<String>>? possibleTypesMap]) {
  visitedSource ??= {};
  possibleTypesMap ??= {};

  source.imports.forEach((s) {
    if (!visitedSource!.contains(source.url)) {
      visitedSource.add(source.url);
      _possibleTypesMap(s, visitedSource, possibleTypesMap);
    }
  });

  source.document.possibleTypesMap().forEach((key, value) {
    possibleTypesMap![key] ??= {};
    possibleTypesMap[key]!.addAll(value);
  });

  return possibleTypesMap;
}
