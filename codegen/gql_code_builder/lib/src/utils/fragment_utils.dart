import "package:gql/ast.dart";

/// Determines if a selection represents a nested type fragment by examining
/// its AST structure rather than name patterns.
///
/// A nested type fragment is a field selection that appears within an inline fragment
/// that has a type condition.
bool isNestedTypeFragment(SelectionNode selection, DocumentNode document) {
  if (selection is! FieldNode) return false;

  // Check if this field appears within an inline fragment
  final parentSelections = _findParentSelections(selection, document);
  if (parentSelections == null) return false;

  // Look for an inline fragment with type condition in the parent chain
  return parentSelections.any(
      (parent) => parent is InlineFragmentNode && parent.typeCondition != null);
}

/// Finds all parent selections that contain the given selection node
/// Returns null if the selection is not found in the document
List<SelectionNode>? _findParentSelections(
  SelectionNode targetSelection,
  DocumentNode document,
) {
  final result = <SelectionNode>[];

  bool findInSelectionSet(SelectionSetNode selectionSet) {
    for (final selection in selectionSet.selections) {
      if (selection == targetSelection) {
        return true;
      }

      if (selection is FieldNode && selection.selectionSet != null) {
        if (findInSelectionSet(selection.selectionSet!)) {
          result.add(selection);
          return true;
        }
      }

      if (selection is InlineFragmentNode) {
        if (findInSelectionSet(selection.selectionSet)) {
          result.add(selection);
          return true;
        }
      }
    }
    return false;
  }

  // Search through all operation and fragment definitions
  for (final def in document.definitions) {
    if (def is OperationDefinitionNode || def is FragmentDefinitionNode) {
      final selectionSet = def is OperationDefinitionNode
          ? def.selectionSet
          : (def as FragmentDefinitionNode).selectionSet;

      if (findInSelectionSet(selectionSet)) {
        return result;
      }
    }
  }

  return null;
}

/// Gets the inline fragment that contains this selection, if any
InlineFragmentNode? getContainingInlineFragment(
  SelectionNode selection,
  DocumentNode document,
) {
  final parents = _findParentSelections(selection, document);
  if (parents == null) return null;

  return parents
      .whereType<InlineFragmentNode>()
      .firstWhere((fragment) => fragment.typeCondition != null);
}

/// Gets the type condition name for a nested fragment
String? getNestedFragmentTypeName(
  SelectionNode selection,
  DocumentNode document,
) {
  final inlineFragment = getContainingInlineFragment(selection, document);
  return inlineFragment?.typeCondition?.on.name.value;
}
