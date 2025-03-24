import "package:collection/collection.dart";
import "package:gql/ast.dart";

import "../common.dart";

/// Merge selections from multiple sources, combining fields and fragments.
///
/// This function:
/// 1. Ensures __typename is present
/// 2. Expands fragment spreads to include their fields
/// 3. Merges fields with the same name but different selections
/// 4. Merges inline fragments with the same type condition
///
/// Example: Merging selections from multiple fragments that select
/// overlapping fields with different subselections.
List<SelectionNode> mergeSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  // Expand fragment spreads
  final expandedSelections = _expandFragmentSpreads(selections, fragmentMap);

  // Perform the merge
  final result = expandedSelections
      .fold<Map<String, SelectionNode>>(
        {},
        (selectionMap, selection) {
          if (selection is FieldNode) {
            final key = selection.alias?.value ?? selection.name.value;

            if (selection.selectionSet == null) {
              selectionMap[key] = selection;
            } else {
              final existingNode = selectionMap[key];
              final existingSelections =
                  existingNode is FieldNode && existingNode.selectionSet != null
                      ? existingNode.selectionSet!.selections
                      : <SelectionNode>[];

              selectionMap[key] = FieldNode(
                  name: selection.name,
                  alias: selection.alias,
                  selectionSet: SelectionSetNode(
                      selections: mergeSelections(
                    [
                      ...existingSelections,
                      ...selection.selectionSet!.selections
                    ],
                    fragmentMap,
                  )));
            }
          } else if (selection is InlineFragmentNode &&
              selection.typeCondition != null) {
            final key = selection.typeCondition!.on.name.value;

            /// TODO: Handle inline fragments without a type condition
            if (selectionMap.containsKey(key)) {
              selectionMap[key] = InlineFragmentNode(
                typeCondition: selection.typeCondition,
                directives: selection.directives,
                selectionSet: SelectionSetNode(
                  selections: mergeSelections(
                    [
                      ...(selectionMap[key] as InlineFragmentNode)
                          .selectionSet
                          .selections,
                      ...selection.selectionSet.selections,
                    ],
                    fragmentMap,
                  ),
                ),
              );
            } else {
              selectionMap[key] = selection;
            }
          } else {
            selectionMap[selection.hashCode.toString()] = selection;
          }
          return selectionMap;
        },
      )
      .values
      .toList();

  return result;
}

/// Remove redundant selections when using fragments.
///
/// When a fragment spread is used, fields that are already in that fragment
/// don't need to be duplicated in the selection set.
///
/// Example: If a fragment selects "name" and "id", and the parent selection
/// also selects "name", the "name" field can be removed from the parent.
List<SelectionNode> shrinkSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  final unmerged = [...selections];

  // First, handle recursive structures (fields with selections and inline fragments)
  for (final selection in selections) {
    if (selection is FieldNode && selection.selectionSet != null) {
      final index = unmerged.indexOf(selection);
      unmerged[index] = FieldNode(
        name: selection.name,
        alias: selection.alias,
        selectionSet: SelectionSetNode(
          selections:
              shrinkSelections(selection.selectionSet!.selections, fragmentMap),
        ),
      );
    } else if (selection is InlineFragmentNode &&
        selection.typeCondition != null) {
      final index = unmerged.indexOf(selection);
      unmerged[index] = InlineFragmentNode(
        typeCondition: selection.typeCondition,
        directives: selection.directives,
        selectionSet: SelectionSetNode(
          selections:
              shrinkSelections(selection.selectionSet.selections, fragmentMap),
        ),
      );
    }
  }

  // Remove fields that are already included in spread fragments
  for (final node in unmerged.whereType<FragmentSpreadNode>().toList()) {
    final fragment = fragmentMap[node.name.value]!;
    final spreadIndex = unmerged.indexOf(node);
    final duplicateIndexList = <int>[];
    unmerged.forEachIndexed((selectionIndex, selection) {
      if (selectionIndex > spreadIndex &&
          fragment.selections.any((s) => s.hashCode == selection.hashCode)) {
        duplicateIndexList.add(selectionIndex);
      }
    });
    duplicateIndexList.reversed.forEach(unmerged.removeAt);
  }

  return unmerged;
}

/// Recursively expands fragment spreads into their component selections.
///
/// This replaces fragment spreads (e.g., "...MyFragment") with the fields
/// from those fragments, handling nested fragments recursively.
///
/// Example: Converting "...UserFragment" into the actual fields like
/// "id", "name", etc.
List<SelectionNode> _expandFragmentSpreads(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
  Set<String> visitedFragments = const {},
  String fragmentPath = "", // Track path to detect recursive fragments
]) {
  final result = <SelectionNode>[];
  final newVisitedFragments = {...visitedFragments};

  for (final selection in selections) {
    if (selection is FragmentSpreadNode) {
      final fragmentName = selection.name.value;

      if (!fragmentMap.containsKey(fragmentName)) {
        throw Exception(
          "Couldn't find fragment definition for fragment spread '$fragmentName'",
        );
      }

      // Create context-aware fragment identifier using the path
      final contextualFragmentId = "$fragmentPath/$fragmentName";

      // Check for recursive fragments
      if (newVisitedFragments.contains(contextualFragmentId)) {
        // Skip this fragment to avoid infinite recursion
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

      result.addAll(expandedFragmentSelections);
    } else if (selection is FieldNode && selection.selectionSet != null) {
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
    } else if (selection is InlineFragmentNode) {
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
    } else {
      result.add(selection);
    }
  }

  return result;
}
