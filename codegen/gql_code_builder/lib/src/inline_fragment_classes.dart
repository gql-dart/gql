import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/when_extension.dart";

import "../source.dart";
import "./common.dart";
import "./operation/data.dart";

/// Builds the following classes for inline fragments:
///   1. An abstract root class that will be implemented by each instantiable
///      class. This includes a `built_value` serializer that instantiates
///      the appropriate concrete class based on the `__typename` field.
///   2. A "base" instantiable class that includes the common fields.
///   3. An instantiable class for each inline fragment that includes the
///      common fields and the fragment fields.
List<Spec> buildInlineFragmentClasses({
  required String name,
  required List<Method> fieldGetters,
  required List<SelectionNode> selections,
  required SourceNode schemaSource,
  required SourceNode docSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> superclassSelections,
  required List<InlineFragmentNode> inlineFragments,
  required bool built,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
}) {
  final whenExtension = inlineFragmentWhenExtension(
    baseTypeName: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
    dataClassAliasMap: dataClassAliasMap,
  );
  return [
    if (whenExtension != null) whenExtension,
    ...buildSelectionSetDataClasses(
      name: "${name}__base",
      selections: mergeSelections(
        [
          ...selections.whereType<FieldNode>(),
          ...selections.whereType<FragmentSpreadNode>(),
        ],
        fragmentMap,
      ),
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      schemaSource: schemaSource,
      docSource: docSource,
      type: type,
      typeOverrides: typeOverrides,
      superclassSelections: {name: SourceSelections(url: null, selections: selections)},
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    ),

    /// TODO: Handle inline fragments without a type condition
    /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
    ...inlineFragments.where((frag) {
      if (frag.typeCondition == null) {
        return false;
      }
      final typeName = builtClassName("${name}__as${frag.typeCondition!.on.name.value}");
      if (dataClassAliasMap.containsKey(typeName)) {
        // print("alias $typeName => ${dataClassAliasMap[typeName]!.symbol}");
        return false;
      }
      // TODO this is never called, check if needed
      if (checkReusedRefBySelections([...selections, ...frag.selectionSet.selections], fragmentMap) !=
          null) {
        print("____ !!! nope nope");
        return false;
      }
      return true;
    }).expand(
      (inlineFragment) => buildSelectionSetDataClasses(
          name: "${name}__as${inlineFragment.typeCondition!.on.name.value}",
          selections: mergeSelections(
            [
              ...selections.whereType<FieldNode>(),
              ...selections.whereType<FragmentSpreadNode>(),
              ...inlineFragment.selectionSet.selections,
            ],
            fragmentMap,
          ),
          fragmentMap: fragmentMap,
          dataClassAliasMap: dataClassAliasMap,
          schemaSource: schemaSource,
          docSource: docSource,
          type: inlineFragment.typeCondition!.on.name.value,
          typeOverrides: typeOverrides,
          superclassSelections: {name: SourceSelections(url: null, selections: selections)},
          built: built,
          whenExtensionConfig: whenExtensionConfig),
    ),
    Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(name)
        ..implements.addAll(
          superclassSelections.keys
              .where((superName) => !dataClassAliasMap.containsKey(builtClassName(superName)))
              .map<Reference>(
                (superName) => refer(
                  builtClassName(superName),
                  (superclassSelections[superName]?.url ?? "") + "#data",
                ),
              ),
        )
        ..methods.addAll([
          ...fieldGetters,
          if (built)
            ..._inlineFragmentRootSerializationMethods(
              name: builtClassName(name),
              inlineFragments: inlineFragments,
              dataClassAliasMap: dataClassAliasMap,
              fragmentMap: fragmentMap,
              selections: selections,
            ),
        ]),
    ),
  ];
}

List<Method> _inlineFragmentRootSerializationMethods({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> fragmentMap,
  required List<SelectionNode> selections,
}) =>
    [
      buildSerializerGetter(name).rebuild(
        (b) => b
          ..body = TypeReference((b) => b
            ..symbol = "InlineFragmentSerializer"
            ..url = "package:gql_code_builder/src/serializers/inline_fragment_serializer.dart"
            ..types.add(refer(name))).call([
            literalString(name),
            checkReusedRefBySelections(selections, fragmentMap) ??
                refer("${name}__base"),
            literalMap(
              /// TODO: Handle inline fragments without a type condition
              /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
              {
                for (final v in inlineFragments.where((frag) => frag.typeCondition != null))
                  "${v.typeCondition!.on.name.value}": () {
                        final ref = checkReusedRefBySelections([
                          ...selections,
                          ...v.selectionSet.selections
                        ], fragmentMap);
                        print("############# ref: $ref for ${v.typeCondition!.on.name.value} on $name");
                        if (name == "GheroFieldsFragmentData") {
                          print("!!!!!!!!! $ref for ${v.typeCondition!.on.name.value} on $name");
                        }
                        return ref;
                      }() ??
                      refer(
                        "${name}__as${v.typeCondition!.on.name.value}",
                      )
              },
            ),
          ]).code,
      ),
      buildToJsonGetter(name),
      buildFromJsonGetter(name),
    ];
