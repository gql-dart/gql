import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './helpers/field_name_with_arguments.dart';
import './helpers/expand_fragments.dart';
import './classes/type_policy.dart';
import './helpers/resolve_root_typename.dart';

/// Denormalizes data for a given query
///
/// IDs are generated for each entity based on the following:
/// 1. If no __typename field exists, the entity will not be normalized.
/// 2. If a [TypePolicy] is provided for the given type, it's [TypePolicy.keyFields] are used.
/// 3. If a [dataIdFromObject] funciton is provided, the result is used.
/// 4. The 'id' or '_id' field (respectively) are used.
///
/// The [referenceKey] is used to reference the ID of a normalized object. It
/// should begin with '$' since a graphl response object key cannot begin with
/// that symbol.
Map<String, Object> denormalize(
    {@required DocumentNode query,
    @required Map<String, Map<String, Object>> normalizedMap,
    Map<String, Object> variables,
    Map<String, TypePolicy> typePolicies,
    String referenceKey}) {
  // Set defaults if none are defined
  referenceKey ??= '\$ref';

  /// The AST Node of the GraphQL Operation
  ///
  /// Only the first operation in a document will be considered. See
  /// https://github.com/graphql/graphql-spec/issues/29.
  final operationDefinition =
      query.definitions.whereType<OperationDefinitionNode>().first;

  final rootTypename = resolveRootTypename(operationDefinition, typePolicies);

  final Map<String, FragmentDefinitionNode> fragmentMap = {
    for (var fragmentDefinition
        in query.definitions.whereType<FragmentDefinitionNode>())
      fragmentDefinition.name.value: fragmentDefinition
  };

  /// Returns a denormalized object for a given node.
  ///
  /// This is called recursively as the AST is traversed. Accepts either the
  /// root [OperationDefinitionNode] or a [FieldNode].
  Object denormalizeNode({
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

    if (dataForNode == null) return null;

    if (dataForNode is List) {
      return dataForNode
          .map((data) => denormalizeNode(
              node: node, dataForNode: data, normalizedMap: normalizedMap))
          .toList();
    }

    // If this is a leaf node, return the data
    if (selectionSet == null) return dataForNode;

    if (dataForNode is Map) {
      final denormalizedData = dataForNode.containsKey(referenceKey)
          ? normalizedMap[dataForNode[referenceKey]]
          : dataForNode;
      final typename = denormalizedData['__typename'];
      final typePolicy = (typePolicies ?? const {})[typename];

      final subNodes = expandFragments(
          data: denormalizedData,
          selectionSet: selectionSet,
          fragmentMap: fragmentMap);

      return {
        for (var selection in subNodes)
          selection.alias?.value ?? selection.name.value: denormalizeNode(
              node: selection,
              dataForNode: denormalizedData[
                  fieldNameWithArguments(selection, variables, typePolicy)],
              normalizedMap: normalizedMap)
      };
    }

    throw (Exception(
        "There are sub-selections on this node, but the data is not null, an Array, or a Map"));
  }

  return denormalizeNode(
      node: operationDefinition,
      dataForNode: normalizedMap[rootTypename],
      normalizedMap: normalizedMap);
}
