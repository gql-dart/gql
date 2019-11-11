import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './shared/typedefs.dart';
import './shared/defaultResolvers.dart';

/// Adds fragment fields to selections if type of data matches fragment type
List<FieldNode> _expandFragments(
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
        fieldNodes.addAll(_expandFragments(
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
        fieldNodes.addAll(_expandFragments(
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

/// Normalizes data for a given query
Map<String, Object> normalize(
    {@required DocumentNode query,
    @required Map<String, Object> data,
    Map<String, Object> variables,
    DataIdResolver dataIdFromObject,
    TypeResolver resolveType}) {
  // Set default resolvers if none are defined
  dataIdFromObject ??= defaultDataIdResolver;
  resolveType ??= defaultTypeResolver;

  /// The key used to store a reference to a normalized object.
  ///
  /// Starts with '$' since a graphl response object key cannot begin with that
  /// symbol
  final referenceKey = '\$ref';

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

    final subNodes = _expandFragments(
        resolveType: resolveType,
        data: dataForNode,
        selectionSet: selectionSet,
        fragmentMap: fragmentMap);

    if (dataForNode is Map) {
      final dataToMerge = {
        for (var selection in subNodes)
          selection.name.value: normalizeNode(
              node: selection,
              dataForNode: dataForNode[selection.name.value],
              normalizedMap: normalizedMap)
      };

      final String typeName = dataForNode['__typename'];

      if (node is OperationDefinitionNode) {
        final rootQueryName = typeName ?? operationTypeName;
        (normalizedMap[rootQueryName] ??= {}).addAll(dataToMerge);
        return normalizedMap;
      } else if (typeName == null) {
        return dataToMerge;
      } else {
        final dataId = dataIdFromObject(dataForNode);
        // TODO: should this be a deep merge?
        (normalizedMap[dataId] ??= {}).addAll(dataToMerge);
        return {referenceKey: dataId};
      }
    }

    throw (Exception(
        "There are sub-selections on this node, but the data is not null, an Array, or a Map"));
  }

  return normalizeNode(
      node: operationDefinition, dataForNode: data, normalizedMap: {});
}
