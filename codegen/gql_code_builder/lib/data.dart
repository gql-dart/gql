import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/config/data_class_config.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "./source.dart";
import "./src/operation/data.dart";

export "package:gql_code_builder/src/config/data_class_config.dart";
export "package:gql_code_builder/src/config/when_extension_config.dart";


Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides, [
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig =
      const InlineFragmentSpreadWhenExtensionConfig(
    generateWhenExtensionMethod: false,
    generateMaybeWhenExtensionMethod: false,
  ),
  DataClassConfig dataClassConfig = const DataClassConfig(
    reuseFragments: false,
  ),
]) {
  final fragmentMap = _fragmentMap(docSource);
  final dataClassAliasMap = dataClassConfig.reuseFragments
      ? _dataClassAliasMap(docSource, fragmentMap)
      : <String, Reference>{};

  final operationDataClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .expand(
        (op) => buildOperationDataClasses(
          op,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
          fragmentMap,
          dataClassAliasMap,
        ),
      )
      .toList();

  final fragmentDataClasses = docSource.document.definitions
      .whereType<FragmentDefinitionNode>()
      .expand(
        (frag) => buildFragmentDataClasses(
          frag,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
          fragmentMap,
          dataClassAliasMap,
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

Map<String, SourceSelections> _fragmentMap(SourceNode source) => {
      for (final def
          in source.document.definitions.whereType<FragmentDefinitionNode>())
        def.name.value: SourceSelections(
          url: source.url,
          selections: def.selectionSet.selections,
        ),
      for (final import in source.imports) ..._fragmentMap(import)
    };

Map<String, Reference> _dataClassAliasMap(
    SourceNode source, Map<String, SourceSelections> fragmentMap,
    [Map<String, Reference>? aliasMap, Set<String>? visitedSource]) {
  aliasMap ??= {};
  visitedSource ??= {};

  source.imports.forEach((s) {
    if (!visitedSource!.contains(source.url)) {
      visitedSource.add(source.url);
      _dataClassAliasMap(s, fragmentMap, aliasMap);
    }
  });

  for (final def
      in source.document.definitions.whereType<OperationDefinitionNode>()) {
    _dataClassAliasMapDFS(
      typeRefPrefix: builtClassName("${def.name!.value}Data"),
      getAliasTypeName: (fragmentName) => "${builtClassName(fragmentName)}Data",
      selections: def.selectionSet.selections,
      fragmentMap: fragmentMap,
      aliasMap: aliasMap,
    );
  }

  for (final def
      in source.document.definitions.whereType<FragmentDefinitionNode>()) {
    _dataClassAliasMapDFS(
      typeRefPrefix: builtClassName(def.name.value),
      getAliasTypeName: builtClassName,
      selections: def.selectionSet.selections,
      fragmentMap: fragmentMap,
      aliasMap: aliasMap,
    );
    _dataClassAliasMapDFS(
      typeRefPrefix: builtClassName("${def.name.value}Data"),
      getAliasTypeName: (fragmentName) => "${builtClassName(fragmentName)}Data",
      selections: def.selectionSet.selections,
      fragmentMap: fragmentMap,
      aliasMap: aliasMap,
    );
  }

  return aliasMap;
}

void _dataClassAliasMapDFS({
  required String typeRefPrefix,
  required String Function(String fragmentName) getAliasTypeName,
  required List<SelectionNode> selections,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> aliasMap,
}) {
  if (selections.isEmpty) return;

  // flatten selections to extract untouched fragments while visiting children.
  final shrunkenSelections =
      shrinkSelections(mergeSelections(selections, fragmentMap), fragmentMap);

  // alias single fragment and finish
  final selectionsWithoutTypename = shrunkenSelections
      .where((s) => !(s is FieldNode && s.name.value == "__typename"));
  if (selectionsWithoutTypename.length == 1 &&
      selectionsWithoutTypename.first is FragmentSpreadNode) {
    final node = selectionsWithoutTypename.first as FragmentSpreadNode;
    final fragment = fragmentMap[node.name.value];
    final fragmentTypeName = getAliasTypeName(node.name.value);
    aliasMap[typeRefPrefix] =
        refer(fragmentTypeName, "${fragment!.url ?? ""}#data");
    // print("alias $typeRefPrefix => $fragmentTypeName");
    return;
  }

  for (final node in selectionsWithoutTypename) {
    if (node is FragmentSpreadNode) {
      // exclude redefined selections from each fragment selections
      final fragmentSelections = fragmentMap[node.name.value]!.selections;
      final exclusiveFragmentSelections =
          mergeSelections(fragmentSelections, fragmentMap).where((s1) {
        if (s1 is FieldNode) {
          final name = (s1.alias ?? s1.name).value;
          return selectionsWithoutTypename
              .whereType<FieldNode>()
              .every((s2) => name != (s2.alias ?? s2.name).value);
        } else if (s1 is InlineFragmentNode && s1.typeCondition != null) {
          /// TODO: Handle inline fragments without a type condition
          final name = s1.typeCondition!.on.name.value;
          return selectionsWithoutTypename
              .whereType<InlineFragmentNode>()
              .every((s2) => name != s2.typeCondition?.on.name.value);
        }
        return false;
      }).toList();

      _dataClassAliasMapDFS(
        typeRefPrefix: typeRefPrefix,
        getAliasTypeName: getAliasTypeName,
        selections: exclusiveFragmentSelections,
        fragmentMap: fragmentMap,
        aliasMap: aliasMap,
      );
    } else if (node is InlineFragmentNode) {
      if (node.typeCondition != null) {
        /// TODO: Handle inline fragments without a type condition
        _dataClassAliasMapDFS(
          typeRefPrefix:
              "${typeRefPrefix}__as${node.typeCondition!.on.name.value}",
          getAliasTypeName: getAliasTypeName,
          selections: [
            ...selections.where((s) => s != node),
            ...node.selectionSet.selections,
          ],
          fragmentMap: fragmentMap,
          aliasMap: aliasMap,
        );
      }
    } else if (node is FieldNode && node.selectionSet != null) {
      _dataClassAliasMapDFS(
        typeRefPrefix: "${typeRefPrefix}_${(node.alias ?? node.name).value}",
        getAliasTypeName: getAliasTypeName,
        selections: node.selectionSet!.selections,
        fragmentMap: fragmentMap,
        aliasMap: aliasMap,
      );
    }
  }
}

