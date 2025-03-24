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
  final List<Spec> result = [];

  if (inlineFragments.isNotEmpty) {
    // Using existing buildInlineFragmentClasses method
    result.addAll(buildInlineFragmentClasses(
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
    ));
  } else if (!built && dataClassAliasMap[name] == null) {
    // For abstract (non-built) classes without an alias, create interface
    result.add(Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(name)
        ..implements.addAll(
          nestedSuperclassSelections.keys
              .where((superName) =>
                  !dataClassAliasMap.containsKey(builtClassName(superName)))
              .map<Reference>(
                (superName) => refer(
                  builtClassName(superName),
                  (nestedSuperclassSelections[superName]?.url ?? "") + "#data",
                ),
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
    ));
  } else {
    // Otherwise, create a regular built_value class
    result.add(builtClass(
      name: name,
      getters: fieldGetters,
      initializers: {
        "G__typename": literalString(type),
      },
      superclassSelections: nestedSuperclassSelections,
      dataClassAliasMap: dataClassAliasMap,
    ));
  }

  return result;
}

/// Builds classes for nested field selections.
///
/// Creates classes for fields that have subselections, supporting the
/// GraphQL response structure.
///
/// Example: For a field "friends" that has subfields, creates a class
/// to represent the "friends" data.
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
) =>
    selections
        .whereType<FieldNode>()
        .where(
          (field) =>
              field.selectionSet != null &&
              !dataClassAliasMap.containsKey(builtClassName(
                  "${name}_${field.alias?.value ?? field.name.value}")),
        )
        .expand(
      (field) {
        // Preserve the fragment context in the field name
        final String fieldName =
            "${name}_${field.alias?.value ?? field.name.value}";

        final fieldSelections = field.selectionSet != null
            ? field.selectionSet!.selections
            : <SelectionNode>[];

        // Track current fragment path to properly set up nested interfaces
        String currentFragmentPath = parentFragmentPath ?? name;
        if (name.contains("__as")) {
          currentFragmentPath = name;
        }

        // Pass parent inline fragments to nested fields
        List<InlineFragmentNode>? fieldParentInlineFragments;
        Map<String, String>? fieldTypeMap;

        // If the field is within a fragment's selections,
        // track nested fragments properly
        if (field.selectionSet != null &&
            fieldSelections.whereType<InlineFragmentNode>().isNotEmpty) {
          fieldParentInlineFragments =
              fieldSelections.whereType<InlineFragmentNode>().toList();

          // Create type map for the field's inline fragments
          fieldTypeMap = {};
          for (final frag in fieldParentInlineFragments) {
            if (frag.typeCondition != null) {
              final typeName = frag.typeCondition!.on.name.value;
              fieldTypeMap[typeName] =
                  builtClassName("${fieldName}__as$typeName");
            }
          }
        }

        return buildSelectionSetDataClasses(
          name: fieldName,
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
          parentInlineFragments: fieldParentInlineFragments,
          typeMap: fieldTypeMap,
          parentFragmentPath: currentFragmentPath,
        );
      },
    ).toList();
