import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";

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
    final unwrappedTypeNode = _unwrapTypeNode(typeNode);
    final typeName = unwrappedTypeNode.name.value;
    final fieldTypeDef = _getTypeDefinitionNode(
      schema,
      typeName,
    );
    final typeMap = {
      ...defaultTypeMap,
      if (node.selectionSet != null)
        typeName: refer("$prefix\$$name")
      else if (fieldTypeDef != null)
        typeName: refer(typeName, schemaUrl)
    };

    final returns = typeRef(
      typeNode,
      typeMap,
    );
    final unwrappedReturns = typeRef(
      unwrappedTypeNode,
      typeMap,
    );

    final dataField = refer("data").index(
      literalString(name),
    );

    return Method(
      (b) => b
        ..returns = returns
        ..name = name
        ..type = MethodType.getter
        ..lambda = true
        ..body = typeNode is ListTypeNode
            ? dataField
                .asA(refer("List"))
                .property("map")
                .call(
                  [
                    Method(
                      (b) => b
                        ..requiredParameters = ListBuilder<Parameter>(
                          <Parameter>[
                            Parameter(
                              (b) => b
                                ..type = refer("dynamic")
                                ..name = "e",
                            ),
                          ],
                        )
                        ..lambda = true
                        ..body = node.selectionSet == null
                            ? fieldTypeDef == null
                                ? refer("e").asA(unwrappedReturns).code
                                : unwrappedReturns.call([
                                    refer("e").asA(refer("String")),
                                  ]).code
                            : unwrappedReturns.call(
                                [
                                  refer("e").asA(refer("Map<String, dynamic>")),
                                ],
                              ).code,
                    ).closure,
                  ],
                )
                .property("toList")
                .call([])
                .code
            : node.selectionSet == null
                ? fieldTypeDef == null
                    ? dataField.asA(returns).code
                    : returns.call([
                        dataField.asA(refer("String")),
                      ]).code
                : returns.call([
                    dataField.asA(refer("Map<String, dynamic>")),
                  ]).code,
    );
  }

  throw UnsupportedError("fragments are not yet supported");
}

TypeDefinitionNode _getTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions.whereType<TypeDefinitionNode>().firstWhere(
          (node) => node.name.value == name,
          orElse: () => null,
        );

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

NamedTypeNode _unwrapTypeNode(
  TypeNode node,
) {
  if (node is NamedTypeNode) {
    return node;
  }

  if (node is ListTypeNode) {
    return _unwrapTypeNode(node.type);
  }

  return null;
}

String _getTypeName(
  TypeNode node,
) =>
    _unwrapTypeNode(node).name.value;
