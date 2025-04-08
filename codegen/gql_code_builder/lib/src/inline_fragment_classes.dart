import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/when_extension.dart";

import "../source.dart";
import "./common.dart";
import "./operation/data.dart";

/// Builds a set of classes to represent GraphQL inline fragments in Dart.
///
/// For a GraphQL query with inline fragments (like `... on Human { name }`),
/// this function generates:
///
/// 1. An abstract root class that all concrete classes implement
/// 2. A "base" class containing common fields shared across all types
/// 3. Type-specific classes for each inline fragment type condition
///
/// The resulting classes work with built_value for serialization and include
/// helper methods for safely accessing type-specific fields.
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
  // Create a mapping of GraphQL type names to generated Dart class names
  final typeMap = <String, String>{};
  for (final frag in inlineFragments) {
    if (frag.typeCondition != null) {
      final typeName = frag.typeCondition!.on.name.value;
      typeMap[typeName] = builtClassName("${name}__as$typeName");
    }
  }

  // Generate the "when" extension for pattern matching on concrete types if configured
  final whenExtension = inlineFragmentWhenExtension(
    baseTypeName: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
    dataClassAliasMap: dataClassAliasMap,
  );

  // IMPORTANT: Filter out inline fragments for the base class to prevent recursion
  final baseClassSelections =
      selections.where((s) => s is! InlineFragmentNode).toList();

  // Preserve the exact order and structure of the original implementation to avoid
  // any unexpected changes in method override hierarchies
  final List<Spec> result = [
    // 1. Abstract root class that all concrete classes implement
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
          if (built)
            ..._inlineFragmentRootSerializationMethods(
              name: builtClassName(name),
              inlineFragments: inlineFragments,
              dataClassAliasMap: dataClassAliasMap,
            ),
        ]),
    ),

    // 2. Optional when extension for pattern matching
    if (whenExtension != null) whenExtension,

    // 3. Base class with fields common to all types, using the original structure
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
      // Keep the original parameters exactly as they were
      isBaseClass: true,
      parentInlineFragments: inlineFragments,
      typeMap: typeMap,
    ),

    // 4. Type-specific classes for each inline fragment - maintain precise logic of original
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

        // Use the exact same logic for building superclass hierarchies as the original
        final expandedSuperclassSelections = {...superclassSelections};

        // Maintain the exact logic from the original implementation
        for (final superName in superclassSelections.keys.toList()) {
          final specializedName = "${superName}__as$fragmentTypeName";

          // Check if specialized interface exists using original logic
          final hasSpecializedInterface = inlineFragments.any((f) =>
              f.typeCondition != null &&
              f.typeCondition!.on.name.value == fragmentTypeName);

          // Apply exactly the same logic for interface implementation
          if (hasSpecializedInterface && superName != name) {
            expandedSuperclassSelections[specializedName] =
                superclassSelections[superName]!;

            if (superName != name) {
              expandedSuperclassSelections.remove(superName);
            }
          }
        }

        // CRITICAL: Preserve the direct parent interface
        expandedSuperclassSelections[name] =
            SourceSelections(url: null, selections: selections);

        // Extract fragment-specific selections exactly as in original
        final fragmentSpecificSelections = inlineFragment
            .selectionSet.selections
            .where((s) => s is! InlineFragmentNode)
            .toList();

        // Call buildSelectionSetDataClasses with exact same parameters as original
        return buildSelectionSetDataClasses(
            name: fragmentClassName,
            selections: [
              ...baseClassSelections,
              ...fragmentSpecificSelections,
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

  return result;
}

/// Generates serialization methods for the root fragment class.
///
/// Creates methods for built_value serialization that properly handle
/// polymorphic types based on __typename:
/// - serializer getter: Uses InlineFragmentSerializer
/// - toJson: Converts to JSON map
/// - fromJson: Creates instance from JSON map
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
