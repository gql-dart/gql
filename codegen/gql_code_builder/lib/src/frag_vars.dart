import "package:gql/ast.dart";

import "./common.dart";

/// Recursively traverses a fragment and returns a map of variable types from the schema
Map<NameNode, TypeNode> fragmentVarTypes({
  required FragmentDefinitionNode fragment,
  required Map<String, FragmentDefinitionNode> fragmentMap,
  required DocumentNode schema,
}) =>
    _varTypesForSelections(
      fragmentMap: fragmentMap,
      selections: fragment.selectionSet.selections,
      parentType: fragment.typeCondition.on,
      schema: schema,
    );

Map<NameNode, TypeNode> _varTypesForSelections({
  required List<SelectionNode> selections,
  required Map<String, FragmentDefinitionNode> fragmentMap,
  required NamedTypeNode parentType,
  required DocumentNode schema,
}) =>
    selections.fold({}, (argMap, selection) {
      if (selection is FieldNode) {
        return {
          ...argMap,
          ..._varTypesForField(
            field: selection,
            parentType: parentType,
            schema: schema,
          ),
          if (selection.selectionSet != null)
            ..._varTypesForSelections(
              selections: selection.selectionSet!.selections,
              fragmentMap: fragmentMap,
              parentType: unwrapTypeNode(
                _fieldDefinition(
                  field: selection,
                  parentType: parentType,
                  schema: schema,
                ).type,
              ),
              schema: schema,
            )
        };
      } else if (selection is InlineFragmentNode) {
        return {
          ...argMap,
          ..._varTypesForSelections(
            selections: selection.selectionSet.selections,
            fragmentMap: fragmentMap,
            parentType: selection.typeCondition?.on ?? parentType,
            schema: schema,
          ),
        };
      } else if (selection is FragmentSpreadNode) {
        final fragment = fragmentMap[selection.name.value];
        if (fragment == null) {
          throw Exception(
              "Missing fragment definition for ${selection.name.value}");
        }
        return {
          ...argMap,
          ..._varTypesForSelections(
            fragmentMap: fragmentMap,
            selections: fragment.selectionSet.selections,
            parentType: fragment.typeCondition.on,
            schema: schema,
          ),
        };
      }
      throw Exception("Unrecognized SelectionNode Type");
    });

/// Returns a map of a field's argument variables to their respective types from the schema
Map<NameNode, TypeNode> _varTypesForField({
  required FieldNode field,
  required NamedTypeNode parentType,
  required DocumentNode schema,
}) {
  if (field.arguments.isEmpty) {
    return {};
  }
  final fieldDef = _fieldDefinition(
    field: field,
    parentType: parentType,
    schema: schema,
  );
  return {
    for (final arg in field.arguments)
      if (arg.value is VariableNode)
        arg.name: fieldDef.args
            .firstWhere((inputVal) => inputVal.name == arg.name)
            .type
      else if (arg.value is ObjectValueNode)
        ..._varTypesForObjectValue(
          argName: arg.name,
          objectValue: arg.value as ObjectValueNode,
          schema: schema,
          parentType: unwrapTypeNode(fieldDef.args
              .firstWhere((inputVal) => inputVal.name == arg.name)
              .type),
        )
  };
}

/// Returns a map of a field's argument variables from a nested object to their respective types from the schema
/// e.g. when used like this: { foo(bar: { baz: $baz }) }
/// the returned map would be { baz: <type> }
Map<NameNode, TypeNode> _varTypesForObjectValue({
  required NameNode argName,
  required ObjectValueNode objectValue,
  required DocumentNode schema,
  required NamedTypeNode parentType,
}) {
  final parentTypeDef = getTypeDefinitionNode(schema, parentType.name.value);

  if (parentTypeDef is InputObjectTypeDefinitionNode) {
    return {
      for (final field in objectValue.fields)
        if (field.value is VariableNode)
          (field.value as VariableNode).name: parentTypeDef.fields
              .firstWhere((inputVal) => inputVal.name == field.name)
              .type
        else if (field.value is ObjectValueNode)
          ..._varTypesForObjectValue(
            argName: field.name,
            objectValue: field.value as ObjectValueNode,
            schema: schema,
            parentType: unwrapTypeNode(parentTypeDef.fields
                .firstWhere((inputVal) => inputVal.name == field.name)
                .type),
          )
    };
  } else {
    return {};
  }
}

/// Given a field from a query, fetches the field's definition from the schema
FieldDefinitionNode _fieldDefinition({
  required FieldNode field,
  required NamedTypeNode parentType,
  required DocumentNode schema,
}) {
  final parentTypeDef = getTypeDefinitionNode(schema, parentType.name.value);

  if (parentTypeDef is ObjectTypeDefinitionNode) {
    return parentTypeDef.fields.firstWhere((node) => node.name == field.name);
  } else if (parentTypeDef is InterfaceTypeDefinitionNode) {
    return parentTypeDef.fields.firstWhere((node) => node.name == field.name);
  }
  throw Exception(
      "Parent type definition '${parentTypeDef.runtimeType}' is not an ObjectTypeDefinitionNode or InterfaceTypeDefinitionNode");
}
