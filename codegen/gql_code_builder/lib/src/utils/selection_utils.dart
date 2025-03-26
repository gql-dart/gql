import "package:collection/collection.dart";
import "package:gql/ast.dart";

import "../common.dart";
import "gql_tracer.dart";

/// Merge selections from multiple sources, combining fields and fragments.
///
/// This function:
/// 1. Ensures __typename is present
/// 2. Expands fragment spreads to include their fields
/// 3. Merges fields with the same name but different selections
/// 4. Merges inline fragments with the same type condition
List<SelectionNode> mergeSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) =>
    GqlTracer.traceOperation("mergeSelections", () {
      GqlTracer.dumpSelections(selections, label: "INPUT");

      // Expand fragment spreads first
      final expandedSelections =
          _expandFragmentSpreads(selections, fragmentMap);
      GqlTracer.dumpSelections(expandedSelections, label: "AFTER_EXPANSION");

      // Create a map to merge duplicate selections
      final selectionMap = <String, SelectionNode>{};

      // Process each expanded selection and handle merging
      for (final selection in expandedSelections) {
        if (selection is FieldNode) {
          _processFieldNode(selection, selectionMap, fragmentMap);
        } else if (selection is InlineFragmentNode &&
            selection.typeCondition != null) {
          _processInlineFragment(selection, selectionMap, fragmentMap);
        } else {
          // Handle other selection types
          selectionMap[selection.hashCode.toString()] = selection;
        }
      }

      final result = selectionMap.values.toList();
      GqlTracer.dumpSelections(result, label: "RESULT");
      return result;
    });

/// Process a field node during selection merging.
///
/// Handles fields, including those with nested selections, and ensures
/// that fields with the same name have their selections merged.
void _processFieldNode(
  FieldNode selection,
  Map<String, SelectionNode> selectionMap,
  Map<String, SourceSelections> fragmentMap,
) {
  final key = selection.alias?.value ?? selection.name.value;

  if (selection.selectionSet == null) {
    // Simple field with no selections
    selectionMap[key] = selection;
  } else {
    // Field with selections - merge if exists
    final existingNode = selectionMap[key];

    if (existingNode is FieldNode && existingNode.selectionSet != null) {
      // Merge with existing field node
      selectionMap[key] = _mergeFieldNodes(
        existingNode,
        selection,
        fragmentMap,
      );
    } else {
      // New field node
      selectionMap[key] = selection;
    }
  }
}

/// Merges two field nodes with the same name.
///
/// Creates a new field node that combines the selections from both input nodes.
FieldNode _mergeFieldNodes(
  FieldNode existing,
  FieldNode incoming,
  Map<String, SourceSelections> fragmentMap,
) {
  final existingSelections = existing.selectionSet?.selections ?? [];
  final incomingSelections = incoming.selectionSet?.selections ?? [];

  return FieldNode(
    name: incoming.name,
    alias: incoming.alias,
    arguments: incoming.arguments,
    directives: incoming.directives,
    selectionSet: SelectionSetNode(
      selections: mergeSelections(
        [...existingSelections, ...incomingSelections],
        fragmentMap,
      ),
    ),
  );
}

/// Process an inline fragment during selection merging.
///
/// Handles inline fragments with type conditions, merging those with
/// the same type condition.
void _processInlineFragment(
  InlineFragmentNode selection,
  Map<String, SelectionNode> selectionMap,
  Map<String, SourceSelections> fragmentMap,
) {
  final typeCondition = selection.typeCondition!;
  final key = typeCondition.on.name.value;

  if (selectionMap.containsKey(key)) {
    // Merge with existing inline fragment of same type
    final existing = selectionMap[key] as InlineFragmentNode;

    selectionMap[key] = InlineFragmentNode(
      typeCondition: typeCondition,
      directives: selection.directives,
      selectionSet: SelectionSetNode(
        selections: mergeSelections(
          [
            ...existing.selectionSet.selections,
            ...selection.selectionSet.selections,
          ],
          fragmentMap,
        ),
      ),
    );
  } else {
    // New inline fragment
    selectionMap[key] = selection;
  }
}

/// Remove redundant selections when using fragments.
///
/// When a fragment spread is used, fields that are already in that fragment
/// don't need to be duplicated in the selection set.
List<SelectionNode> shrinkSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  // Clone the selections to avoid modifying the original
  final unmerged = [...selections];

  // First, handle recursive structures (fields with selections and inline fragments)
  _processNestedSelections(unmerged, fragmentMap);

  // Remove fields covered by fragment spreads
  _removeDuplicateFields(unmerged, fragmentMap);

  return unmerged;
}

/// Processes nested selections in fields and inline fragments.
///
/// Recursively processes selections within fields and inline fragments
/// to ensure they are properly shrunk.
void _processNestedSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  for (int i = 0; i < selections.length; i++) {
    final selection = selections[i];

    if (selection is FieldNode && selection.selectionSet != null) {
      // Process field with selections
      selections[i] = FieldNode(
        name: selection.name,
        alias: selection.alias,
        arguments: selection.arguments,
        directives: selection.directives,
        selectionSet: SelectionSetNode(
          selections: shrinkSelections(
            selection.selectionSet!.selections,
            fragmentMap,
          ),
        ),
      );
    } else if (selection is InlineFragmentNode) {
      // Process inline fragment
      selections[i] = InlineFragmentNode(
        typeCondition: selection.typeCondition,
        directives: selection.directives,
        selectionSet: SelectionSetNode(
          selections: shrinkSelections(
            selection.selectionSet.selections,
            fragmentMap,
          ),
        ),
      );
    }
  }
}

/// Removes fields that are already covered by fragment spreads.
///
/// Identifies and removes fields that are redundant because they are
/// already included in fragment spreads earlier in the selection list.
void _removeDuplicateFields(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  // Find all fragment spreads
  final spreadNodes = selections.whereType<FragmentSpreadNode>().toList();

  for (final node in spreadNodes) {
    final fragment = fragmentMap[node.name.value]!;
    final spreadIndex = selections.indexOf(node);
    final duplicateIndices = <int>[];

    // Find selections that appear after the spread and are duplicated in the fragment
    selections.forEachIndexed((selectionIndex, selection) {
      if (selectionIndex > spreadIndex &&
          fragment.selections.any((s) => s.hashCode == selection.hashCode)) {
        duplicateIndices.add(selectionIndex);
      }
    });

    // Remove duplicates in reverse order to avoid index shifting
    duplicateIndices.reversed.forEach(selections.removeAt);
  }
}

/// Recursively expands fragment spreads into their component selections.
///
/// This replaces fragment spreads (e.g., "...MyFragment") with the fields
/// from those fragments, handling nested fragments recursively.
/// Recursively expands fragment spreads into their component selections.
///
/// This replaces fragment spreads (e.g., "...MyFragment") with the fields
/// from those fragments, handling nested fragments recursively.
List<SelectionNode> _expandFragmentSpreads(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
  Set<String> visitedFragments = const {},
  String fragmentPath = "", // Track path to detect recursive fragments
]) =>
    GqlTracer.traceOperation("_expandFragmentSpreads", () {
      GqlTracer.trace("Fragment path: $fragmentPath");
      GqlTracer.trace('Visited fragments: ${visitedFragments.join(', ')}');
      GqlTracer.dumpSelections(selections, label: "SELECTIONS_TO_EXPAND");

      final result = <SelectionNode>[];
      final newVisitedFragments = {...visitedFragments};

      for (final selection in selections) {
        if (selection is FragmentSpreadNode) {
          final fragmentName = selection.name.value;
          GqlTracer.trace("Processing fragment spread", info: fragmentName);

          if (!fragmentMap.containsKey(fragmentName)) {
            GqlTracer.trace("ERROR: Fragment not found", info: fragmentName);
            throw Exception(
                "Couldn't find fragment definition for fragment spread '$fragmentName'");
          }

          // Use tracer to detect cycles
          if (!GqlTracer.beginFragmentExpansion(fragmentName)) {
            GqlTracer.trace("Skipping fragment due to cycle",
                info: fragmentName);
            // Still add the fragment spread if retain is true
            if (retainFragmentSpreads) {
              result.add(selection);
            }
            continue;
          }

          try {
            // Create context-aware fragment identifier using the path
            final contextualFragmentId = "$fragmentPath/$fragmentName";

            // Check for recursive fragments
            if (newVisitedFragments.contains(contextualFragmentId)) {
              GqlTracer.trace("Detected recursive fragment",
                  info: "$contextualFragmentId already in visited set");
              // Skip this fragment to avoid infinite recursion
              if (retainFragmentSpreads) {
                result.add(selection);
              }
              continue;
            }

            newVisitedFragments.add(contextualFragmentId);

            final fragmentSelections = fragmentMap[fragmentName]!.selections;

            if (retainFragmentSpreads) {
              result.add(selection);
            }

            // Recursively process the fragment selections
            final expandedFragmentSelections = _expandFragmentSpreads(
              fragmentSelections,
              fragmentMap,
              false,
              newVisitedFragments,
              "$fragmentPath/$fragmentName", // Track path for nested context
            );

            GqlTracer.trace("Adding expanded selections",
                info: "${expandedFragmentSelections.length} items");
            result.addAll(expandedFragmentSelections);
          } finally {
            GqlTracer.endFragmentExpansion(fragmentName);
          }
        } else if (selection is FieldNode && selection.selectionSet != null) {
          final fieldName = selection.alias?.value ?? selection.name.value;
          GqlTracer.trace("Processing field with selections", info: fieldName);

          // Process fields with selections - recursively expand any fragments they contain
          final expandedSelections = _expandFragmentSpreads(
            selection.selectionSet!.selections,
            fragmentMap,
            true,
            newVisitedFragments,
            "$fragmentPath/field:$fieldName", // Track field path
          );

          // Create a new field node with the expanded selections
          result.add(FieldNode(
            name: selection.name,
            alias: selection.alias,
            arguments: selection.arguments,
            directives: selection.directives,
            selectionSet: SelectionSetNode(selections: expandedSelections),
          ));
        } else if (selection is InlineFragmentNode) {
          final typeName =
              selection.typeCondition?.on.name.value ?? "no-type-condition";
          GqlTracer.trace("Processing inline fragment",
              info: "...on $typeName");

          // Process inline fragments - recursively expand any nested fragments
          final expandedSelections = _expandFragmentSpreads(
            selection.selectionSet.selections,
            fragmentMap,
            true,
            newVisitedFragments,
            "$fragmentPath/inline:$typeName", // Track inline fragment path
          );

          // Create a new inline fragment node with the expanded selections
          result.add(InlineFragmentNode(
            typeCondition: selection.typeCondition,
            directives: selection.directives,
            selectionSet: SelectionSetNode(selections: expandedSelections),
          ));
        } else {
          GqlTracer.trace("Adding simple selection",
              info: selection.runtimeType.toString());
          result.add(selection);
        }
      }

      GqlTracer.dumpSelections(result, label: "EXPANDED_RESULT");
      return result;
    });

/// Processes a fragment spread node during expansion.
///
/// Handles the expansion of a fragment spread, adding its fields
/// to the result list and managing recursive fragment detection.
void _processFragmentSpread(
  FragmentSpreadNode selection,
  Map<String, SourceSelections> fragmentMap,
  List<SelectionNode> result,
  Set<String> newVisitedFragments,
  bool retainFragmentSpreads,
  String fragmentPath,
) {
  final fragmentName = selection.name.value;

  if (!fragmentMap.containsKey(fragmentName)) {
    throw Exception(
        "Couldn't find fragment definition for fragment spread '$fragmentName'");
  }

  // Create context-aware fragment identifier using the path
  final contextualFragmentId = "$fragmentPath/$fragmentName";

  // Check for recursive fragments
  if (newVisitedFragments.contains(contextualFragmentId)) {
    // Skip this fragment to avoid infinite recursion
    return;
  }

  newVisitedFragments.add(contextualFragmentId);

  final fragmentSelections = fragmentMap[fragmentName]!.selections;

  if (retainFragmentSpreads) {
    result.add(selection);
  }

  // Recursively process the fragment selections
  final expandedFragmentSelections = _expandFragmentSpreads(
    fragmentSelections,
    fragmentMap,
    false,
    newVisitedFragments,
    "$fragmentPath/$fragmentName", // Track path for nested context
  );

  result.addAll(expandedFragmentSelections);
}

/// Processes a field with selections during expansion.
///
/// Handles fields that have their own selection sets, recursively
/// expanding any fragments they contain.
void _processFieldWithSelections(
  FieldNode selection,
  Map<String, SourceSelections> fragmentMap,
  List<SelectionNode> result,
  Set<String> newVisitedFragments,
  String fragmentPath,
) {
  final fieldName = selection.alias?.value ?? selection.name.value;

  // Process fields with selections - recursively expand any fragments they contain
  final expandedSelections = _expandFragmentSpreads(
    selection.selectionSet!.selections,
    fragmentMap,
    true,
    newVisitedFragments,
    "$fragmentPath/field:$fieldName", // Track field path
  );

  // Create a new field node with the expanded selections
  result.add(FieldNode(
    name: selection.name,
    alias: selection.alias,
    arguments: selection.arguments,
    directives: selection.directives,
    selectionSet: SelectionSetNode(selections: expandedSelections),
  ));
}

/// Processes an inline fragment during expansion.
///
/// Handles inline fragments, recursively expanding any nested
/// fragments they contain.
void _processInlineFragmentExpansion(
  InlineFragmentNode selection,
  Map<String, SourceSelections> fragmentMap,
  List<SelectionNode> result,
  Set<String> newVisitedFragments,
  String fragmentPath,
) {
  final typeName =
      selection.typeCondition?.on.name.value ?? "no-type-condition";

  // Process inline fragments - recursively expand any nested fragments
  final expandedSelections = _expandFragmentSpreads(
    selection.selectionSet.selections,
    fragmentMap,
    true,
    newVisitedFragments,
    "$fragmentPath/inline:$typeName", // Track inline fragment path
  );

  // Create a new inline fragment node with the expanded selections
  result.add(InlineFragmentNode(
    typeCondition: selection.typeCondition,
    directives: selection.directives,
    selectionSet: SelectionSetNode(selections: expandedSelections),
  ));
}
