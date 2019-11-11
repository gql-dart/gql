import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './shared/typedefs.dart';
import './shared/field_name_with_arguments.dart';
import './shared/defaults.dart';
import './shared/expand_fragments.dart';

/// Normalizes data for a given query
///
/// The [referenceKey] is used to reference normalized objects. It should start
/// with '$' since a graphl response object key cannot begin with that symbol
Map<String, Object> normalize(
    {@required DocumentNode query,
    @required Map<String, Object> data,
    Map<String, Object> variables,
    DataIdResolver dataIdFromObject,
    String referenceKey}) {
  // Set defaults if none are defined
  dataIdFromObject ??= defaultDataIdResolver;
  referenceKey ??= defaultReferenceKey;

  /// The AST Node of the GraphQL Operation
  ///
  /// Only the first operation in a document will be considered. See
  /// https://github.com/graphql/graphql-spec/issues/29
  final operationDefinition =
      query.definitions.whereType<OperationDefinitionNode>().first;

  String operationTypeName;
  switch (operationDefinition.type) {
    case OperationType.query:
      operationTypeName = 'Query';
      break;
    case OperationType.mutation:
      operationTypeName = 'Mutation';
      break;
    case OperationType.subscription:
      operationTypeName = 'Subscription';
      break;
  }

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

      final bool shouldNormalize = dataForNode['__typename'] != null &&
          dataIdFromObject(dataForNode) != null;

      if (node is OperationDefinitionNode) {
        final rootQueryName = dataForNode['__typename'] ?? operationTypeName;
        (normalizedMap[rootQueryName] ??= {}).addAll(dataToMerge);
        return normalizedMap;
      } else if (shouldNormalize) {
        final dataId = dataIdFromObject(dataForNode);
        // TODO: should this be a deep merge?
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
