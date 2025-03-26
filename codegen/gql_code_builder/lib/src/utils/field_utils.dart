import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/utils/fragment_utils.dart";

import "selection_utils.dart";
import "type_utils.dart";

/// Builds field getters for a selection set.
///
/// Creates Method objects that represent getters for each field in the selection.
/// Handles duplicate fields and manages overrides for inheritance.
List<Method> buildFieldGetters(
  List<SelectionNode> selections,
  SourceNode schemaSource,
  String type,
  Map<String, Reference> typeOverrides,
  Map<String, Reference> dataClassAliasMap,
  String name,
  bool built,
  Set<SelectionNode> superclassSelectionNodes,
) {
  // Track fields we've already processed to avoid duplicates
  final processedFieldsMap = <String, Method>{};

  for (final selection in selections.whereType<FieldNode>()) {
    final nameNode = selection.alias ?? selection.name;
    final fieldName = nameNode.value;

    // Skip fields we've already processed
    if (processedFieldsMap.containsKey(fieldName)) {
      continue;
    }

    final typeDef = getTypeDefinitionNode(
      schemaSource.document,
      type,
    )!;

    final typeNode = getFieldTypeNode(
      typeDef,
      selection.name.value,
    );

    // Check if this field should override a superclass field
    final isOverride = superclassSelectionNodes.any(
        (s) => s is FieldNode && (s.alias?.value ?? s.name.value) == fieldName);

    final method = buildGetter(
      nameNode: nameNode,
      typeNode: typeNode,
      schemaSource: schemaSource,
      typeOverrides: typeOverrides,
      typeRefAlias:
          dataClassAliasMap[builtClassName("${name}_${nameNode.value}")],
      typeRefPrefix:
          selection.selectionSet != null ? builtClassName(name) : null,
      built: built,
      isOverride: isOverride,
    );

    // Store the method in our map to track it and avoid duplicates
    processedFieldsMap[fieldName] = method;
  }

  return processedFieldsMap.values.toList();
}

/// Process superclass selections and fragment spreads.
///
/// Creates a map of superclass selections based on the current selections and
/// any fragment spreads. Handles nested fragment interfaces appropriately.
Map<String, SourceSelections> processSuperclassSelections(
  List<SelectionNode> selections,
  DocumentNode document,
  Map<String, SourceSelections> superclassSelections,
  Map<String, SourceSelections> fragmentMap,
) {
  final Map<String, SourceSelections> nestedSuperclassSelections = {
    ...superclassSelections
  };

  // Handle nested interfaces for fields with type conditions
  for (final selection in selections) {
    if (isNestedTypeFragment(selection, document)) {
      _processNestedTypeInterfaces(
        selection,
        document,
        superclassSelections,
        nestedSuperclassSelections,
        fragmentMap,
      );
    }
  }

  // Process fragment spreads
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }

    nestedSuperclassSelections[selection.name.value] = SourceSelections(
      url: fragmentMap[selection.name.value]!.url,
      selections: mergeSelections(
        fragmentMap[selection.name.value]!.selections,
        fragmentMap,
      ).whereType<FieldNode>().toList(),
    );
  }

  return nestedSuperclassSelections;
}

/// Processes nested type interfaces to maintain inheritance hierarchy.
///
/// For nested interfaces like "__asHuman_friends", this adds the appropriate
/// superclass relationships based on type conditions.
void _processNestedTypeInterfaces(
  SelectionNode selection,
  DocumentNode document,
  Map<String, SourceSelections> superclassSelections,
  Map<String, SourceSelections> nestedSuperclassSelections,
  Map<String, SourceSelections> fragmentMap,
) {
  if (selection is! FieldNode) return;

  final containingFragment = getContainingInlineFragment(selection, document);
  if (containingFragment == null) return;

  final typeName = getInlineFragmentTypeName(containingFragment);
  if (typeName == null) return;

  // Check for corresponding fragment interfaces for this nested field
  for (final superName in superclassSelections.keys.toList()) {
    if (superName.contains("__as$typeName")) {
      // Found a parent fragment with same type condition
      final baseFragmentName = superName.split("__as").first;
      final fieldName = selection.alias?.value ?? selection.name.value;
      final potentialNestedInterface =
          "${baseFragmentName}__as${typeName}_$fieldName";

      // Check if interface exists in fragment map
      final bool hasNestedInterface = fragmentMap.entries.any((entry) =>
          entry.key.contains(fieldName) && entry.value.selections.isNotEmpty);

      if (hasNestedInterface) {
        // Add nested interface
        nestedSuperclassSelections[potentialNestedInterface] =
            SourceSelections(url: null, selections: []);
      }
    }
  }
}

/// Build fragment selections for a field.
///
/// Creates a map of fragment selections specific to a field, supporting
/// nested fragment implementations.
Map<String, SourceSelections> fragmentSelectionsForField(
  Map<String, SourceSelections> fragmentMap,
  FieldNode field,
) {
  final result = <String, SourceSelections>{};
  final fieldKey = field.alias?.value ?? field.name.value;

  // Process regular field selections
  for (final entry in fragmentMap.entries) {
    final superName = entry.key;
    final sourceSelections = entry.value;

    // Look for matching fields in fragment selections
    for (final selection
        in sourceSelections.selections.whereType<FieldNode>()) {
      if (selection.selectionSet == null) continue;

      final selectionKey = selection.alias?.value ?? selection.name.value;

      if (selectionKey == fieldKey) {
        // Create nested fragment selection
        final nestedName = "${superName}_${fieldKey}";
        result[nestedName] = SourceSelections(
          url: sourceSelections.url,
          selections: selection.selectionSet!.selections
              .whereType<FieldNode>()
              .toList(),
        );
      }
    }
  }

  // Process specialized type fragments (e.g., __asHuman)
  for (final superName
      in fragmentMap.keys.where((name) => name.contains("__as"))) {
    final baseFragmentName = superName.split("__as").first;
    final typeName = superName.split("__as").last.split("_").first;

    // Check if there's a specialized nested interface
    final potentialNestedName =
        "${baseFragmentName}__as${typeName}_${fieldKey}";

    // Add as a potential interface for implementation
    if (!result.containsKey(potentialNestedName)) {
      result[potentialNestedName] = SourceSelections(
        url: fragmentMap[superName]?.url,
        selections: [], // Empty selections since this is just for interface implementation
      );
    }
  }

  return result;
}
