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
///
/// Example:
/// ```graphql
/// query Hero {
///   hero {
///     name
///     ... on Human {
///       height
///     }
///     ... on Droid {
///       primaryFunction
///     }
///   }
/// }
/// ```
///
/// Will generate:
/// - An abstract GHero_hero class
/// - A GHero_hero__base class with the common field 'name'
/// - A GHero_hero__asHuman class with the Human-specific field 'height'
/// - A GHero_hero__asDroid class with the Droid-specific field 'primaryFunction'
List<Spec> buildInlineFragmentClasses({
  required String name,
  required List<Method> fieldGetters,
  required List<SelectionNode> selections,
  required SourceNode docSource,
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
  final typeMap = _buildTypeMap(name, inlineFragments);

  // Generate the "when" extension for pattern matching on concrete types if configured
  final whenExtension = _buildWhenExtension(
    name: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
    dataClassAliasMap: dataClassAliasMap,
  );

  // Filter out inline fragments for the base class
  final baseClassSelections =
      selections.where((s) => s is! InlineFragmentNode).toList();

  final List<Spec> result = [
    // 1. Abstract root class that all concrete classes implement
    _buildRootClass(
      name: name,
      fieldGetters: fieldGetters,
      superclassSelections: superclassSelections,
      dataClassAliasMap: dataClassAliasMap,
      inlineFragments: inlineFragments,
      built: built,
    ),

    // 2. Optional when extension for pattern matching
    if (whenExtension != null) whenExtension,

    // 3. Base class with fields common to all types
    ..._buildBaseClass(
      name: name,
      baseClassSelections: baseClassSelections,
      selections: selections,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      docSource: docSource,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      superclassSelections: superclassSelections,
      inlineFragments: inlineFragments,
      typeMap: typeMap,
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    ),

    // 4. Type-specific classes for each inline fragment
    ..._buildTypeSpecificClasses(
      name: name,
      baseClassSelections: baseClassSelections,
      selections: selections,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      docSource: docSource,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      superclassSelections: superclassSelections,
      inlineFragments: inlineFragments,
      built: built,
      whenExtensionConfig: whenExtensionConfig,
      typeMap: typeMap,
    ),
  ];

  return result;
}

/// Creates a mapping of GraphQL type names to generated Dart class names.
///
/// For example, if we have an inline fragment `... on Human { name }`,
/// this will create a mapping from "Human" to "GQueryName__asHuman".
Map<String, String> _buildTypeMap(
    String name, List<InlineFragmentNode> inlineFragments) {
  final typeMap = <String, String>{};
  for (final frag in inlineFragments) {
    if (frag.typeCondition != null) {
      final typeName = frag.typeCondition!.on.name.value;
      typeMap[typeName] = builtClassName("${name}__as$typeName");
    }
  }
  return typeMap;
}

/// Builds the abstract root class that all concrete fragment classes implement.
///
/// This class defines the interface that all concrete implementations must satisfy
/// and includes serialization methods if built=true.
Class _buildRootClass({
  required String name,
  required List<Method> fieldGetters,
  required Map<String, SourceSelections> superclassSelections,
  required Map<String, Reference> dataClassAliasMap,
  required List<InlineFragmentNode> inlineFragments,
  required bool built,
}) =>
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
            ..._buildRootSerializationMethods(
              name: builtClassName(name),
              inlineFragments: inlineFragments,
              dataClassAliasMap: dataClassAliasMap,
            ),
        ]),
    );

/// Generates serialization methods for the root fragment class.
///
/// Creates methods for built_value serialization that properly handle
/// polymorphic types based on __typename:
/// - serializer getter: Uses InlineFragmentSerializer
/// - toJson: Converts to JSON map
/// - fromJson: Creates instance from JSON map
List<Method> _buildRootSerializationMethods({
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

/// Builds the "when" extension for pattern matching on concrete types.
///
/// Generates methods that allow safely handling different concrete implementations
/// without manual type checking or casting.
Extension? _buildWhenExtension({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
  required InlineFragmentSpreadWhenExtensionConfig config,
  required Map<String, Reference> dataClassAliasMap,
}) =>
    inlineFragmentWhenExtension(
      baseTypeName: name,
      inlineFragments: inlineFragments,
      config: config,
      dataClassAliasMap: dataClassAliasMap,
    );

/// Builds the base class containing fields common to all fragment types.
///
/// This class implements the abstract root class and contains fields that
/// are present in all possible concrete implementations.
List<Spec> _buildBaseClass({
  required String name,
  required List<SelectionNode> baseClassSelections,
  required List<SelectionNode> selections,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required SourceNode docSource,
  required SourceNode schemaSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> superclassSelections,
  required List<InlineFragmentNode> inlineFragments,
  required Map<String, String> typeMap,
  required bool built,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
}) =>
    buildSelectionSetDataClasses(
      name: "${name}__base",
      selections: baseClassSelections,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      docSource: docSource,
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
    );

/// Builds type-specific classes for each inline fragment.
///
/// For each type condition (like "Human" or "Droid"), creates a specific class
/// that includes both the common fields and the type-specific fields.
List<Spec> _buildTypeSpecificClasses({
  required String name,
  required List<SelectionNode> baseClassSelections,
  required List<SelectionNode> selections,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required SourceNode docSource,
  required SourceNode schemaSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> superclassSelections,
  required List<InlineFragmentNode> inlineFragments,
  required bool built,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  required Map<String, String> typeMap,
}) {
  final List<Spec> result = [];

  // Process only inline fragments with type conditions that aren't overridden by aliases
  for (final inlineFragment in inlineFragments.where((frag) {
    if (frag.typeCondition == null) {
      return false;
    }
    final typeName =
        builtClassName("${name}__as${frag.typeCondition!.on.name.value}");
    return !dataClassAliasMap.containsKey(typeName);
  })) {
    final fragmentTypeName = inlineFragment.typeCondition!.on.name.value;
    final fragmentClassName = "${name}__as$fragmentTypeName";

    // Handle superclass hierarchy with the same logic as the original implementation
    final expandedSuperclassSelections = {...superclassSelections};

    // Process specialized interfaces
    for (final superName in superclassSelections.keys.toList()) {
      final specializedName = "${superName}__as$fragmentTypeName";

      // Check if specialized interface exists
      final hasSpecializedInterface = inlineFragments.any((f) =>
          f.typeCondition != null &&
          f.typeCondition!.on.name.value == fragmentTypeName);

      // Apply the same logic for interface implementation
      if (hasSpecializedInterface && superName != name) {
        expandedSuperclassSelections[specializedName] =
            superclassSelections[superName]!;

        if (superName != name) {
          expandedSuperclassSelections.remove(superName);
        }
      }
    }

    // Ensure the direct parent interface is included
    expandedSuperclassSelections[name] =
        SourceSelections(url: null, selections: selections);

    // Extract fragment-specific selections (excluding nested inline fragments)
    final fragmentSpecificSelections = inlineFragment.selectionSet.selections
        .where((s) => s is! InlineFragmentNode)
        .toList();

    // Build the classes for this specific fragment type
    result.addAll(buildSelectionSetDataClasses(
        name: fragmentClassName,
        selections: [
          ...baseClassSelections,
          ...fragmentSpecificSelections,
        ],
        fragmentMap: fragmentMap,
        dataClassAliasMap: dataClassAliasMap,
        docSource: docSource,
        schemaSource: schemaSource,
        type: fragmentTypeName,
        typeOverrides: typeOverrides,
        superclassSelections: expandedSuperclassSelections,
        built: built,
        whenExtensionConfig: whenExtensionConfig,
        fragmentTypeName: fragmentTypeName,
        parentInlineFragments: inlineFragments,
        typeMap: typeMap));
  }

  return result;
}
