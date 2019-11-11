import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './typedefs.dart';

/// Adds fragment fields to selections if type of data matches fragment type
List<FieldNode> expandFragments(
    {@required TypeResolver resolveType,
    @required Map<String, Object> data,
    @required SelectionSetNode selectionSet,
    @required Map<String, FragmentDefinitionNode> fragmentMap}) {
  final List<FieldNode> fieldNodes = [];

  for (var selectionNode in selectionSet.selections) {
    if (selectionNode is FieldNode) {
      fieldNodes.add(selectionNode);
    } else if (selectionNode is InlineFragmentNode) {
      final typeName = resolveType(data);
      // Only include this fragment if the type name matches
      if (selectionNode.typeCondition.on.name.value == typeName) {
        fieldNodes.addAll(expandFragments(
            resolveType: resolveType,
            data: data,
            selectionSet: selectionNode.selectionSet,
            fragmentMap: fragmentMap));
      }
    } else if (selectionNode is FragmentSpreadNode) {
      final fragment = fragmentMap[selectionNode.name.value];
      final typeName = resolveType(data);
      // Only include this fragment if the type name matches
      if (fragment.typeCondition.on.name.value == typeName) {
        fieldNodes.addAll(expandFragments(
            resolveType: resolveType,
            data: data,
            selectionSet: fragment.selectionSet,
            fragmentMap: fragmentMap));
      }
    } else {
      throw (FormatException("Unknown selection node type"));
    }
  }
  return fieldNodes;
}
