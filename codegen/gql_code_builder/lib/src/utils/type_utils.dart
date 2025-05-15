import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

/// Determines the root operation type (Query, Mutation, Subscription) from schema.
///
/// Looks up the operation type in the schema definition, falling back to
/// default root types if not specified.
///
/// Example: For a query operation, returns "Query" or a custom root type
/// name if defined in the schema.
String determineOperationType(
  DocumentNode schema,
  OperationDefinitionNode op,
) {
  final schemaDefs = schema.definitions.whereType<SchemaDefinitionNode>();

  if (schemaDefs.isEmpty) return defaultRootTypes[op.type]!;

  return schemaDefs.first.operationTypes
      .firstWhere(
        (opType) => opType.operation == op.type,
      )
      .type
      .name
      .value;
}

/// Gets the field type node from a type definition.
///
/// Handles special cases like __typename for union types.
///
/// Example: For a field "name" on a Character type, returns the TypeNode
/// representing String.
TypeNode getFieldTypeNode(
  TypeDefinitionNode node,
  String field,
) {
  if (node is UnionTypeDefinitionNode && field == "__typename") {
    return NamedTypeNode(
      isNonNull: true,
      name: NameNode(value: "String"),
    );
  }

  // Handle object and interface types
  List<FieldDefinitionNode> fields;
  if (node is ObjectTypeDefinitionNode) {
    fields = node.fields;
  } else if (node is InterfaceTypeDefinitionNode) {
    fields = node.fields;
  } else {
    throw Exception(
        "${node.name.value} is not an ObjectTypeDefinitionNode or InterfaceTypeDefinitionNode");
  }

  return fields
      .firstWhere(
        (fieldNode) => fieldNode.name.value == field,
      )
      .type;
}
