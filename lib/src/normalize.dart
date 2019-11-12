import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './shared/resolve_data_id.dart';
import './shared/field_name_with_arguments.dart';
import './shared/defaults.dart';
import './shared/expand_fragments.dart';
import './classes/type_policy.dart';
import './shared/resolve_root_typename.dart';

/// Normalizes data for a given query
///
/// The [dataIdFromObject] argument accepts a custom [DataIdResolver] which
/// returns a custom ID to reference the normalized object. If none is
/// provided, the [defaultDataIdResolver] will be used.
///
/// The [referenceKey] is used to reference the ID of a normalized object. It
/// should begin with '$' since a graphl response object key cannot begin with
/// that symbol.
Map<String, Object> normalize(
    {@required DocumentNode query,
    @required Map<String, Object> data,
    Map<String, Object> variables,
    Map<String, TypePolicy> typePolicies,
    DataIdResolver dataIdFromObject,
    String referenceKey}) {
  // Set defaults if none are defined
  referenceKey ??= defaultReferenceKey;

  /// The AST Node of the GraphQL Operation
  ///
  /// Only the first operation in a document will be considered. See
  /// https://github.com/graphql/graphql-spec/issues/29
  final operationDefinition =
      query.definitions.whereType<OperationDefinitionNode>().first;

  final rootTypename = resolveRootTypename(operationDefinition, typePolicies);

  final Map<String, FragmentDefinitionNode> fragmentMap = {
    for (var fragmentDefinition
        in query.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  /// Returns a normalized object for a given node
  ///
  /// Accepts either the root [OperationDefinitionNode] or a [FieldNode]
  Object normalizeNode({
    @required Node node,
    @required Object dataForNode,
    @required Map<String, Map<String, Object>> normalizedMap,
  }) {
    SelectionSetNode selectionSet;
    if (node is OperationDefinitionNode)
      selectionSet = node.selectionSet;
    else if (node is FieldNode)
      selectionSet = node.selectionSet;
    else
      throw (Exception("Unexpected node type"));

    // If there is no data for this node, return null
    if (dataForNode == null) return null;

    if (dataForNode is List) {
      return dataForNode
          .map((data) => normalizeNode(
              node: node, dataForNode: data, normalizedMap: normalizedMap))
          .toList();
    }

    // If this is a leaf node, return the data
    if (selectionSet == null) return dataForNode;

    final subNodes = expandFragments(
        data: dataForNode,
        selectionSet: selectionSet,
        fragmentMap: fragmentMap);

    if (dataForNode is Map) {
      final dataToMerge = {
        for (var selection in subNodes)
          fieldNameWithArguments(selection, variables): normalizeNode(
              node: selection,
              dataForNode:
                  dataForNode[selection.alias?.value ?? selection.name.value],
              normalizedMap: normalizedMap)
      };

      final dataId = resolveDataId(
          data: dataForNode,
          typePolicies: typePolicies,
          dataIdFromObject: dataIdFromObject);

      if (node is OperationDefinitionNode) {
        (normalizedMap[rootTypename] ??= {}).addAll(dataToMerge);
        return normalizedMap;
      } else if (dataId != null) {
        (normalizedMap[dataId] ??= {}).addAll(dataToMerge);
        return {referenceKey: dataId};
      } else {
        return dataToMerge;
      }
    }

    throw (Exception(
        "There are sub-selections on this node, but the data is not null, an Array, or a Map"));
  }

  return normalizeNode(
      node: operationDefinition, dataForNode: data, normalizedMap: {});
}
