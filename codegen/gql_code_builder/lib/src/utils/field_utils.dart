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

  final fieldName = selection.alias?.value ?? selection.name.value;

  // First, find the base interface name without any type conditions
  String? baseInterfaceName;
  for (final superName in superclassSelections.keys) {
    if (!superName.contains("__as")) {
      baseInterfaceName = superName;
      break;
    }
  }

  if (baseInterfaceName == null) return;

  // For each specialized interface
  for (final superName in superclassSelections.keys.toList()) {
    if (superName.contains("__as")) {
      // Extract the specialized type name
      final specializationType = superName.split("__as").last.split("_").first;

      // Create consistent nested interface name using base interface
      final nestedInterfaceName =
          "${baseInterfaceName}_${fieldName}_$specializationType";

      // Check if interface exists in fragment map
      final bool hasNestedInterface = fragmentMap.entries.any((entry) =>
          entry.key.contains(fieldName) && entry.value.selections.isNotEmpty);

      if (hasNestedInterface) {
        // Add nested interface with consistent naming
        nestedSuperclassSelections[nestedInterfaceName] =
            SourceSelections(url: null, selections: []);

        // Also add the specialized version for compatibility
        final specializedNestedName =
            "${baseInterfaceName}_${specializationType}_${fieldName}";
        if (specializedNestedName != nestedInterfaceName) {
          nestedSuperclassSelections[specializedNestedName] =
              SourceSelections(url: null, selections: []);
        }
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

  // Process fragments from fragmentMap - these are named fragments
  for (final entry in fragmentMap.entries) {
    final superName = entry.key;
    final sourceSelections = entry.value;

    // Look for matching fields in fragment selections
    for (final selection
        in sourceSelections.selections.whereType<FieldNode>()) {
      if (selection.selectionSet == null) continue;

      final selectionKey = selection.alias?.value ?? selection.name.value;

      if (selectionKey == fieldKey) {
        // Create nested fragment selection for named fragments
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

  // Only process specialized type fragments from fragmentMap that are from named fragments
  // This ensures we don't accidentally create interfaces for inline fragments
  for (final entry in fragmentMap.entries) {
    final superName = entry.key;
    final sourceSelections = entry.value;

    // Skip if this is from an inline fragment (they don't have URLs)
    if (sourceSelections.url == null) continue;

    if (superName.contains("__as")) {
      final baseFragmentName = superName.split("__as").first;
      final typeName = superName.split("__as").last.split("_").first;

      // Check for nested interface from named fragment
      final potentialNestedName =
          "${baseFragmentName}__as${typeName}_${fieldKey}";

      if (fragmentMap.containsKey(superName)) {
        result[potentialNestedName] = SourceSelections(
          url: sourceSelections.url,
          selections: [], // Empty since this is just for interface implementation
        );
      }
    }
  }

  return result;
}
