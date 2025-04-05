import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/when_extension.dart";

import "../source.dart";
import "./common.dart";
import "./operation/data.dart";
import "utils/fragment_utils.dart";

/// Helper class to manage interface hierarchy and specialization
class _InterfaceContext {
  final Map<String, Set<String>> hierarchy = {};
  final Map<String, String> specializations = {};

  void addInterface(String name) {
    final parts = name.split("__");
    final base = parts[0];
    hierarchy.putIfAbsent(base, () => {});
    if (parts.length > 1) {
      hierarchy[base]!.add(name);
    }
  }

  String specialize(String baseName, String type) {
    final key = "$baseName:$type";
    return specializations.putIfAbsent(key, () => "${baseName}__as$type");
  }
}

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
  // Validate all fragment types exist in schema
  validateFragmentTypes(inlineFragments, schemaSource.document);

  // Create mapping of GraphQL type names to generated class names
  final typeMap = buildInlineFragmentTypeMap(name, inlineFragments);

  // Filter out inline fragments for the base class
  final baseClassSelections =
      selections.where((s) => s is! InlineFragmentNode).toList();

  final List<Spec> result = [
    // Abstract root class that all concrete classes implement
    _buildRootClass(
      name: name,
      fieldGetters: fieldGetters,
      superclassSelections: superclassSelections,
      dataClassAliasMap: dataClassAliasMap,
      inlineFragments: inlineFragments,
      typeMap: typeMap,
      built: built,
    ),

    // Optional when extension for pattern matching on concrete types
    if (whenExtensionConfig.generateWhenExtensionMethod ||
        whenExtensionConfig.generateMaybeWhenExtensionMethod)
      _buildWhenExtension(
        name: name,
        inlineFragments: inlineFragments,
        config: whenExtensionConfig,
        dataClassAliasMap: dataClassAliasMap,
      )!,

    // Base class with fields common to all types
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

    // Type-specific classes for each inline fragment
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
  required Map<String, String> typeMap,
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
              typeMap: typeMap,
              dataClassAliasMap: dataClassAliasMap,
            ),
        ]),
    );

List<Method> _buildRootSerializationMethods({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
  required Map<String, String> typeMap,
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
                for (final entry in typeMap.entries)
                  entry.key:
                      dataClassAliasMap[entry.value] ?? refer(entry.value)
              },
            ),
          ]).code,
      ),
      buildToJsonGetter(name),
      buildFromJsonGetter(name),
    ];

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
  final context = _InterfaceContext();
  final baseName = name.split("__").first;

  // First pass: Build interface hierarchy from superclass selections
  for (final superName in superclassSelections.keys) {
    context.addInterface(superName);
  }

  // Process fragments with type conditions
  for (final inlineFragment in inlineFragments.where((frag) =>
      frag.typeCondition != null &&
      !dataClassAliasMap.containsKey(builtClassName(
          context.specialize(baseName, frag.typeCondition!.on.name.value))))) {
    final fragmentTypeName = inlineFragment.typeCondition!.on.name.value;
    final fragmentClassName = "${name}__as$fragmentTypeName";

    // Initialize expanded selections with original superclass selections
    final expandedSuperclassSelections = {...superclassSelections};
    final nestedInterfaceMap = <String, String>{};

    // Process each base interface found in the hierarchy
    for (final baseInterfaceName in context.hierarchy.keys) {
      final specializedName =
          context.specialize(baseInterfaceName, fragmentTypeName);

      // Add base interface selection if not already present
      if (!expandedSuperclassSelections.containsKey(baseInterfaceName)) {
        expandedSuperclassSelections[baseInterfaceName] =
            superclassSelections[baseInterfaceName] ??
                SourceSelections(url: null, selections: selections);
      }

      // Process specialized interfaces if the current fragment matches the type condition
      final hasSpecializedInterface = inlineFragments.any((f) =>
          f.typeCondition != null &&
          f.typeCondition!.on.name.value == fragmentTypeName);

      if (hasSpecializedInterface) {
        // Track specialized interface names
        nestedInterfaceMap[baseInterfaceName] = specializedName;

        // Add specialized interface selection, merging with base and fragment selections
        expandedSuperclassSelections[specializedName] = SourceSelections(
          url: superclassSelections[baseInterfaceName]?.url,
          selections: [
            ...superclassSelections[baseInterfaceName]?.selections ?? [],
            ...inlineFragment.selectionSet.selections,
          ],
        );

        // Process nested specialized interfaces (e.g., for fields like 'friends')
        for (final specializedInterface
            in context.hierarchy[baseInterfaceName] ?? {}) {
          final nestedBaseName = specializedInterface.split("__").first;
          final nestedSpecializedName =
              context.specialize(nestedBaseName, fragmentTypeName);

          // Add selections for nested specialized interfaces
          expandedSuperclassSelections[nestedSpecializedName] =
              SourceSelections(
            url: superclassSelections[specializedInterface]?.url,
            selections: [
              ...superclassSelections[specializedInterface]?.selections ?? [],
              ...inlineFragment.selectionSet.selections,
            ],
          );

          // Map nested interfaces
          nestedInterfaceMap[specializedInterface] = nestedSpecializedName;
        }
      }
    }

    // Ensure the direct parent interface is included
    expandedSuperclassSelections[name] =
        SourceSelections(url: null, selections: selections);

    // Extract fragment-specific selections, processing nested fields
    final fragmentSpecificSelections = inlineFragment.selectionSet.selections
        .where((s) => s is! InlineFragmentNode)
        .map((s) {
      if (s is FieldNode && s.selectionSet != null) {
        // Create new field node with properly named nested selections
        return FieldNode(
          name: s.name,
          alias: s.alias,
          arguments: s.arguments,
          directives: s.directives,
          selectionSet: SelectionSetNode(
            selections: s.selectionSet!.selections.map((nested) {
              if (nested is FieldNode) {
                final nestedFieldName =
                    nested.alias?.value ?? nested.name.value;
                // Use consistent naming for nested interface fields based on the current fragment context
                final consistentNestedName = "${name}_${nestedFieldName}";
                if (nestedInterfaceMap.containsKey(consistentNestedName)) {
                  // Return the FieldNode as is, letting buildSelectionSetDataClasses handle the type
                  return FieldNode(
                    name: nested.name,
                    alias: nested.alias,
                    arguments: nested.arguments,
                    directives: nested.directives,
                    selectionSet: nested.selectionSet,
                  );
                }
              }
              return nested;
            }).toList(),
          ),
        );
      }
      return s;
    }).toList();

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
