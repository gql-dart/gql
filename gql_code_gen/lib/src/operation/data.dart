import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

List<Class> buildDataClasses(
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .expand(
          (op) => _buildOperationDataClasses(
            op,
            doc,
            schema,
            schemaUrl,
          ),
        )
        .toList();

List<Class> _buildOperationDataClasses(
  OperationDefinitionNode op,
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    _buildSelectionSetDataClasses(
      "\$${op.name.value}",
      op.selectionSet,
      doc,
      schema,
      schemaUrl,
      "Query",
    );

List<Class> _buildSelectionSetDataClasses(
  String name,
  SelectionSetNode selSet,
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
  String type,
) =>
    [
      Class(
        (b) => b
          ..name = name
          ..constructors = _buildConstructors()
          ..fields = _buildFields()
          ..methods = _buildGetters(
            schema,
            schemaUrl,
            selSet.selections,
            name,
            type,
          ),
      ),
      ...selSet.selections
          .whereType<FieldNode>()
          .where(
            (field) => field.selectionSet != null,
          )
          .expand(
            (field) => _buildSelectionSetDataClasses(
              "${name}\$${field.alias?.value ?? field.name.value}",
              field.selectionSet,
              doc,
              schema,
              schemaUrl,
              _getTypeName(
                _getFieldTypeNode(
                  _getObjectTypeDefinitionNode(
                    schema,
                    type,
                  ),
                  field.name.value,
                ),
              ),
            ),
          ),
    ];

ListBuilder<Field> _buildFields() => ListBuilder<Field>(
      <Field>[
        Field(
          (b) => b
            ..name = "data"
            ..type = refer(
              "Map<String, dynamic>",
            )
            ..modifier = FieldModifier.final$,
        ),
      ],
    );

ListBuilder<Constructor> _buildConstructors() => ListBuilder<Constructor>(
      <Constructor>[
        Constructor(
          (b) => b
            ..requiredParameters = ListBuilder<Parameter>(
              <Parameter>[
                Parameter(
                  (b) => b
                    ..name = "data"
                    ..toThis = true,
                ),
              ],
            )
            ..constant = true,
        ),
      ],
    );

ListBuilder<Method> _buildGetters(
  DocumentNode schema,
  String schemaUrl,
  List<SelectionNode> nodes,
  String prefix,
  String type,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(
        (node) => _buildGetter(
          schema,
          schemaUrl,
          node,
          prefix,
          type,
        ),
      ),
    );

Method _buildGetter(
  DocumentNode schema,
  String schemaUrl,
  SelectionNode node,
  String prefix,
  String type,
) {
  if (node is FieldNode) {
    final name = node.alias?.value ?? node.name.value;
    final object = _getObjectTypeDefinitionNode(
      schema,
      type,
    );
    final typeNode = _getFieldTypeNode(
      object,
      node.name.value,
    );

    final fieldType = node.selectionSet == null ? "String" : "$prefix\$$name";

    final returns =
        typeNode is ListTypeNode ? refer("List<$fieldType>") : refer(fieldType);

    return Method(
      (b) => b
        ..returns = returns
        ..name = name
        ..type = MethodType.getter
        ..lambda = true
        ..body = typeNode is ListTypeNode
            ? node.selectionSet == null
                ? Code(
                    '(data["$name"] as List).map((dynamic e) => e as String).toList()',
                  )
                : Code(
                    '(data["$name"] as List).map((dynamic e) => $fieldType(e as Map<String, dynamic>)).toList()',
                  )
            : node.selectionSet == null
                ? Code(
                    'data["$name"] as String',
                  )
                : Code(
                    '$fieldType(data["$name"] as Map<String, dynamic>)',
                  ),
    );
  }

  throw UnsupportedError("fragments are not yet supported");
}

ObjectTypeDefinitionNode _getObjectTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions.whereType<ObjectTypeDefinitionNode>().firstWhere(
          (node) => node.name.value == name,
        );

TypeNode _getFieldTypeNode(
  ObjectTypeDefinitionNode node,
  String field,
) =>
    node.fields
        .firstWhere(
          (fieldNode) => fieldNode.name.value == field,
        )
        .type;

String _getTypeName(
  TypeNode node,
) {
  if (node is NamedTypeNode) {
    return node.name.value;
  }

  if (node is ListTypeNode) {
    return _getTypeName(node.type);
  }

  return null;
}
