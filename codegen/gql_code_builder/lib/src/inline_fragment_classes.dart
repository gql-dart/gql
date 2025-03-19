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
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> superclassSelections,
  required List<InlineFragmentNode> inlineFragments,
  required bool built,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
}) {
  print(
      "BUILDING INLINE FRAGMENTS: $name | inlineFragments: ${inlineFragments.length}");
  print(
      "  Fragments: ${inlineFragments.map((f) => f.typeCondition?.on.name.value).toList()}");

  // Create consistent type mapping for all fragments
  final typeMap = <String, String>{};
  for (final frag in inlineFragments) {
    if (frag.typeCondition != null) {
      final typeName = frag.typeCondition!.on.name.value;
      typeMap[typeName] = builtClassName("${name}__as$typeName");
    }
  }

  final whenExtension = inlineFragmentWhenExtension(
    baseTypeName: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
    dataClassAliasMap: dataClassAliasMap,
  );

  // IMPORTANT FIX: Filter out inline fragments for the base class to prevent recursion
  final baseClassSelections =
      selections.where((s) => s is! InlineFragmentNode).toList();

  // Add helper methods for type checking/casting with correct prefix
  final typeCheckMethods =
      inlineFragments.where((frag) => frag.typeCondition != null).map((frag) {
    final typeName = frag.typeCondition!.on.name.value;
    final methodName = "as$typeName";

    return Method((b) => b
      ..annotations.add(refer("override"))
      ..type = MethodType.getter
      ..returns = TypeReference((tr) => tr
        ..symbol = typeMap[typeName]
        ..isNullable = true)
      ..name = methodName);
  }).toList();

  return [
    Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(name)
        ..implements.addAll(
          superclassSelections.keys
              .where((superName) =>
                  !dataClassAliasMap.containsKey(builtClassName(superName)))
              .map<Reference>(
                (superName) => refer(
                  builtClassName(superName),
                  (superclassSelections[superName]?.url ?? "") + "#data",
                ),
              ),
        )
        ..methods.addAll([
          ...fieldGetters,
          ...typeCheckMethods, // Add the type check methods to the interface
          if (built)
            ..._inlineFragmentRootSerializationMethods(
              name: builtClassName(name),
              inlineFragments: inlineFragments,
              dataClassAliasMap: dataClassAliasMap,
            ),
        ]),
    ),
    if (whenExtension != null) whenExtension,
    ...buildSelectionSetDataClasses(
      name: "${name}__base",
      selections: baseClassSelections,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      superclassSelections: {
        name: SourceSelections(url: null, selections: selections)
      },
      built: built,
      whenExtensionConfig: whenExtensionConfig,
      // Add parameter to indicate this is a base class
      isBaseClass: true,
      parentInlineFragments: inlineFragments,
      typeMap: typeMap, // Pass the type map for consistent types
    ),

    /// TODO: Handle inline fragments without a type condition
    /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
    ...inlineFragments.where((frag) {
      if (frag.typeCondition == null) {
        return false;
      }
      final typeName =
          builtClassName("${name}__as${frag.typeCondition!.on.name.value}");
      if (dataClassAliasMap.containsKey(typeName)) {
        return false;
      }
      return true;
    }).expand(
      (inlineFragment) {
        final fragmentTypeName = inlineFragment.typeCondition!.on.name.value;
        final fragmentClassName = "${name}__as$fragmentTypeName";

        // Properly build superclass hierarchy for specialized types
        final expandedSuperclassSelections = {...superclassSelections};

        // Always add any additional type-specific implementations
        for (final superName in superclassSelections.keys.toList()) {
          final specializedName = "${superName}__as$fragmentTypeName";

          // Check if there's a specialized version for this fragment
          final hasSpecializedInterface = inlineFragments.any((f) =>
              f.typeCondition != null &&
              f.typeCondition!.on.name.value == fragmentTypeName);

          // If the specialized interface exists, add it to the list
          if (hasSpecializedInterface && superName != name) {
            // IMPORTANT: For fragment interfaces, we want type-specific variants
            // like GheroFieldsFragment__asHuman instead of GheroFieldsFragment
            expandedSuperclassSelections[specializedName] =
                superclassSelections[superName]!;

            // Only remove the base fragment interface if it's not our direct parent
            if (superName != name) {
              expandedSuperclassSelections.remove(superName);
            }
          }
        }

        // CRITICAL: We must ALWAYS keep our direct parent interface
        expandedSuperclassSelections[name] =
            SourceSelections(url: null, selections: selections);

        return buildSelectionSetDataClasses(
            name: fragmentClassName,
            selections: [
              ...baseClassSelections,
              ...inlineFragment.selectionSet.selections
                  .where((s) => s is! InlineFragmentNode),
            ],
            fragmentMap: fragmentMap,
            dataClassAliasMap: dataClassAliasMap,
            schemaSource: schemaSource,
            type: fragmentTypeName,
            typeOverrides: typeOverrides,
            superclassSelections: expandedSuperclassSelections,
            built: built,
            whenExtensionConfig: whenExtensionConfig,
            fragmentTypeName: fragmentTypeName,
            parentInlineFragments: inlineFragments,
            typeMap: typeMap);
      },
    ),
  ];
}

List<Method> _inlineFragmentRootSerializationMethods({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
  required Map<String, Reference> dataClassAliasMap,
}) =>
    [
      buildSerializerGetter(name).rebuild(
        (b) => b
          ..body = TypeReference((b) => b
            ..symbol = "InlineFragmentSerializer"
            ..url =
                "package:gql_code_builder_serializers/gql_code_builder_serializers.dart"
            ..types.add(refer(name))).call([
            literalString(name),
            refer("${name}__base"),
            literalMap(
              /// TODO: Handle inline fragments without a type condition
              /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
              {
                for (final v in inlineFragments
                    .where((frag) => frag.typeCondition != null))
                  "${v.typeCondition!.on.name.value}": dataClassAliasMap[
                          "${name}__as${v.typeCondition!.on.name.value}"] ??
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
