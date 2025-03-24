import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/inline_fragment_classes.dart";

import "../operation/data.dart";
import "field_utils.dart";
import "type_utils.dart";

/// Builds output classes from selections.
///
/// Creates the main classes needed to represent GraphQL selections.
///
/// Example: For a query, creates the main response class, handling
/// inline fragments when needed.
/// Builds output classes from GraphQL selections.
///
/// Creates the main classes needed to represent GraphQL selections based on the
/// presence of inline fragments, configuration options, and selection types.
///
/// Returns a list of Spec objects representing the generated classes.
List<Spec> buildOutputClasses(
  String name,
  List<SelectionNode> selections,
  List<Method> fieldGetters,
  List<InlineFragmentNode> inlineFragments,
  bool built,
  Map<String, Reference> dataClassAliasMap,
  Map<String, SourceSelections> nestedSuperclassSelections,
  String type,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  Map<String, SourceSelections> fragmentMap,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
) {
  if (inlineFragments.isNotEmpty) {
    return _buildClassesWithInlineFragments(
      name: name,
      fieldGetters: fieldGetters,
      selections: selections,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: nestedSuperclassSelections,
      inlineFragments: inlineFragments,
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    );
  } else if (!built && dataClassAliasMap[name] == null) {
    return [
      _buildInterfaceClass(
        name: name,
        nestedSuperclassSelections: nestedSuperclassSelections,
        fieldGetters: fieldGetters,
        dataClassAliasMap: dataClassAliasMap,
      )
    ];
  } else {
    return [
      _buildRegularBuiltClass(
        name: name,
        fieldGetters: fieldGetters,
        nestedSuperclassSelections: nestedSuperclassSelections,
        dataClassAliasMap: dataClassAliasMap,
        type: type,
      )
    ];
  }
}

/// Builds classes for a schema that uses inline fragments.
///
/// Delegates to the `buildInlineFragmentClasses` function to handle the complex
/// task of generating appropriate classes for inline fragments.
List<Spec> _buildClassesWithInlineFragments({
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
}) =>
    buildInlineFragmentClasses(
      name: name,
      fieldGetters: fieldGetters,
      selections: selections,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: superclassSelections,
      inlineFragments: inlineFragments,
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    );

/// Builds an interface class for abstract representations.
///
/// Creates an abstract class that defines the interface for GraphQL types
/// without providing a concrete implementation.
Class _buildInterfaceClass({
  required String name,
  required Map<String, SourceSelections> nestedSuperclassSelections,
  required List<Method> fieldGetters,
  required Map<String, Reference> dataClassAliasMap,
}) =>
    Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(name)
        ..implements.addAll(
          _getImplementedInterfaces(
            nestedSuperclassSelections: nestedSuperclassSelections,
            dataClassAliasMap: dataClassAliasMap,
          ),
        )
        ..methods.addAll([
          ...fieldGetters,
          buildToJsonGetter(
            builtClassName(name),
            implemented: false,
            isOverride: nestedSuperclassSelections.isNotEmpty,
          ),
        ]),
    );

/// Builds a regular built_value class.
///
/// Creates a concrete implementation class with all the necessary
/// methods and initializers for GraphQL data types.
Class _buildRegularBuiltClass({
  required String name,
  required List<Method> fieldGetters,
  required Map<String, SourceSelections> nestedSuperclassSelections,
  required Map<String, Reference> dataClassAliasMap,
  required String type,
}) =>
    builtClass(
      name: name,
      getters: fieldGetters,
      initializers: {
        "G__typename": literalString(type),
      },
      superclassSelections: nestedSuperclassSelections,
      dataClassAliasMap: dataClassAliasMap,
    );

/// Gets the list of interfaces that a class implements.
///
/// Filters out any interfaces that have been aliased to prevent
/// duplicate implementation declarations.
List<Reference> _getImplementedInterfaces({
  required Map<String, SourceSelections> nestedSuperclassSelections,
  required Map<String, Reference> dataClassAliasMap,
}) =>
    nestedSuperclassSelections.keys
        .where((superName) =>
            !dataClassAliasMap.containsKey(builtClassName(superName)))
        .map<Reference>(
          (superName) => refer(
            builtClassName(superName),
            (nestedSuperclassSelections[superName]?.url ?? "") + "#data",
          ),
        )
        .toList();

/// Builds classes for nested field selections.
///
/// Creates classes for fields that have subselections, supporting the
/// GraphQL response structure.
///
/// Example: For a field "friends" that has subfields, creates a class
/// to represent the "friends" data.
/// Builds classes for nested field selections with deduplication.
List<Spec> buildNestedFieldClasses(
  String name,
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
  Map<String, Reference> dataClassAliasMap,
  SourceNode schemaSource,
  String type,
  Map<String, Reference> typeOverrides,
  Map<String, SourceSelections> nestedSuperclassSelections,
  bool built,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  List<InlineFragmentNode> inlineFragments,
  String? parentFragmentPath,
) {
  // Track fragment sources to detect shared structures
  final fragmentSources = <String, String>{};
  final fragmentDeduplicationMap = <String, String>{};

  // First pass: gather information about fragment usage
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    final fragmentName = selection.name.value;
    fragmentSources[fragmentName] = name;
  }

  // Process field selections
  final result = <Spec>[];
  for (final field in selections.whereType<FieldNode>()) {
    if (field.selectionSet == null ||
        dataClassAliasMap.containsKey(builtClassName(
            "${name}_${field.alias?.value ?? field.name.value}"))) {
      continue;
    }

    final fieldName = field.alias?.value ?? field.name.value;
    final fieldClassName = "${name}_$fieldName";

    // Check if this field comes from a fragment spread
    final String? sourceFragment = _findSourceFragment(field, fragmentMap);
    if (sourceFragment != null && fragmentSources.containsKey(sourceFragment)) {
      // This field comes from a fragment used elsewhere - deduplicate
      final originalClassName =
          "${fragmentSources[sourceFragment]!}_$fieldName";

      if (fieldClassName != originalClassName) {
        // Add to deduplication map
        fragmentDeduplicationMap[fieldClassName] = originalClassName;

        // Add alias to dataClassAliasMap
        dataClassAliasMap[builtClassName(fieldClassName)] =
            refer(builtClassName(originalClassName));

        // Skip generating duplicate class
        continue;
      }
    }

    // Process this field normally
    result.addAll(_buildNestedFieldClass(
        name: name,
        field: field,
        fragmentMap: fragmentMap,
        dataClassAliasMap: dataClassAliasMap,
        schemaSource: schemaSource,
        type: type,
        typeOverrides: typeOverrides,
        nestedSuperclassSelections: nestedSuperclassSelections,
        built: built,
        whenExtensionConfig: whenExtensionConfig,
        inlineFragments: inlineFragments,
        parentFragmentPath: parentFragmentPath,
        fragmentDeduplicationMap: fragmentDeduplicationMap));
  }

  return result;
}

/// Finds the source fragment for a field, if any.
String? _findSourceFragment(
    FieldNode field, Map<String, SourceSelections> fragmentMap) {
  for (final entry in fragmentMap.entries) {
    if (entry.value.selections.any((s) =>
        s is FieldNode &&
        s.name.value == field.name.value &&
        s.selectionSet?.selections.isNotEmpty == true)) {
      return entry.key;
    }
  }
  return null;
}

/// Builds nested field class with deduplication awareness
List<Spec> _buildNestedFieldClass(
    {required String name,
    required FieldNode field,
    required Map<String, SourceSelections> fragmentMap,
    required Map<String, Reference> dataClassAliasMap,
    required SourceNode schemaSource,
    required String type,
    required Map<String, Reference> typeOverrides,
    required Map<String, SourceSelections> nestedSuperclassSelections,
    required bool built,
    required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
    required List<InlineFragmentNode> inlineFragments,
    required String? parentFragmentPath,
    required Map<String, String> fragmentDeduplicationMap}) {
  final fieldName = field.alias?.value ?? field.name.value;
  final fieldClassName = "${name}_$fieldName";

  // Check if this is an alias target and skip if it is
  if (fragmentDeduplicationMap.containsValue(fieldClassName)) {
    return [];
  }

  final fieldSelections = field.selectionSet?.selections ?? [];

  // Track current fragment path to properly set up nested interfaces
  String currentFragmentPath = parentFragmentPath ?? name;
  if (name.contains("__as")) {
    currentFragmentPath = name;
  }

  // Apply normal processing logic
  return buildSelectionSetDataClasses(
    name: fieldClassName,
    selections: fieldSelections,
    fragmentMap: fragmentMap,
    dataClassAliasMap: dataClassAliasMap,
    schemaSource: schemaSource,
    type: unwrapTypeNode(
      getFieldTypeNode(
        getTypeDefinitionNode(
          schemaSource.document,
          type,
        )!,
        field.name.value,
      ),
    ).name.value,
    typeOverrides: typeOverrides,
    superclassSelections: fragmentSelectionsForField(
      nestedSuperclassSelections,
      field,
    ),
    built: inlineFragments.isNotEmpty ? false : built,
    whenExtensionConfig: whenExtensionConfig,
    parentFragmentPath: currentFragmentPath,
  );
}
