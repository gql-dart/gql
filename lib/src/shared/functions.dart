import 'dart:convert';
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

Object resolveValueNode(ValueNode valueNode, Map<String, Object> variables) {
  if (valueNode is VariableNode)
    return variables[valueNode.name.value];
  else if (valueNode is ListValueNode)
    return valueNode.values
        .map((node) => resolveValueNode(node, variables))
        .toList();
  else if (valueNode is ObjectValueNode) {
    return {
      for (var field in valueNode.fields)
        field.name.value: resolveValueNode(field.value, variables)
    };
  } else if (valueNode is IntValueNode)
    return valueNode.value;
  else if (valueNode is FloatValueNode)
    return valueNode.value;
  else if (valueNode is StringValueNode)
    return valueNode.value;
  else if (valueNode is BooleanValueNode)
    return valueNode.value;
  else if (valueNode is EnumValueNode)
    return valueNode.name.value;
  else
    return null;
}

String fieldNameWithArguments(
    FieldNode fieldNode, Map<String, Object> variables) {
  if (fieldNode.arguments.isEmpty) return fieldNode.name.value;
  final Map<String, Object> argumentsObject = {
    for (var argumentNode in fieldNode.arguments)
      argumentNode.name.value: resolveValueNode(argumentNode.value, variables)
  };
  final hashedArgs = json.encode(argumentsObject);
  return '${fieldNode.name.value}($hashedArgs)';
}

final DataIdResolver defaultDataIdResolver = (Map<String, Object> object) {
  assert(object['id'] != null);
  assert(object['__typename'] != null);
  return '${object['__typename']}:${object['id']}';
};

final TypeResolver defaultTypeResolver = (Map<String, Object> object) {
  assert(object['__typename'] != null);
  return object['__typename'];
};
