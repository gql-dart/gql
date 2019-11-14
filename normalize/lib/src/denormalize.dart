import "package:gql/ast.dart";
import "package:meta/meta.dart";

import "./classes/type_policy.dart";
import "./helpers/expand_fragments.dart";
import "./helpers/field_name_with_arguments.dart";
import "./helpers/resolve_root_typename.dart";

/// Denormalizes data for a given query
///
/// If any [TypePolicy]s were used to normalize the data, they must be provided
/// to ensure that the appropriate normalized entity can be found.
///
/// Likewise, if a custom [referenceKey] was used to normalize the data, it
/// must be provided. Otherwise, the default '$ref' key will be used.
Map<String, Object> denormalize(
    {@required DocumentNode query,
    @required Map<String, Map<String, Object>> normalizedMap,
    Map<String, Object> variables,
    Map<String, TypePolicy> typePolicies,
    String referenceKey}) {
  // Set defaults if none are defined
  referenceKey ??= "\$ref";

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
    if (node is OperationDefinitionNode) {
      selectionSet = node.selectionSet;
    } else if (node is FieldNode) {
      selectionSet = node.selectionSet;
    } else {
      throw Exception("Unexpected node type");
    }

    if (dataForNode == null) return null;

    if (dataForNode is List) {
      return dataForNode
          .map((Object data) => denormalizeNode(
              node: node, dataForNode: data, normalizedMap: normalizedMap))
          .toList();
    }

    // If this is a leaf node, return the data
    if (selectionSet == null) return dataForNode;

    if (dataForNode is Map) {
      final denormalizedData = dataForNode.containsKey(referenceKey)
          ? normalizedMap[dataForNode[referenceKey]]
          : dataForNode;
      final typename = denormalizedData["__typename"] as String;
      final typePolicy = (typePolicies ?? const {})[typename];

      final subNodes = expandFragments(
          data: denormalizedData as Map<String, Object>,
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

    throw Exception(
        "There are sub-selections on this node, but the data is not null, an Array, or a Map");
  }

  return denormalizeNode(
      node: operationDefinition,
      dataForNode: normalizedMap[rootTypename],
      normalizedMap: normalizedMap) as Map<String, Object>;
}
