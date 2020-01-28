import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

List<Class> buildDataClasses(
  DocumentNode doc,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .expand(
          (op) => _buildOperationDataClasses(
            op,
            doc,
            fragmentsDocUrl,
            schema,
            schemaUrl,
          ),
        )
        .toList();

List<Class> _buildOperationDataClasses(
  OperationDefinitionNode op,
  DocumentNode doc,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
) =>
    buildSelectionSetDataClasses(
      "\$${op.name.value}",
      op.selectionSet.selections,
      {
        for (var def in doc.definitions.whereType<FragmentDefinitionNode>())
          def.name.value: def
      },
      {},
      fragmentsDocUrl,
      schema,
      schemaUrl,
      _operationType(
        schema,
        op,
      ),
    );

String _operationType(
  DocumentNode schema,
  OperationDefinitionNode op,
) {
  final schemaDefs = schema.definitions.whereType<SchemaDefinitionNode>();

  if (schemaDefs.isEmpty) return defaultRootTypes[op.type];

  return schemaDefs.first.operationTypes
      .firstWhere(
        (opType) => opType.operation == op.type,
      )
      .type
      .name
      .value;
}

List<Class> buildSelectionSetDataClasses(
  String name,
  List<SelectionNode> selections,
  Map<String, FragmentDefinitionNode> fragmentMap,
  Map<String, List<FieldNode>> fragmentSelections,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
  String type,
) =>
    _buildSelectionSetDataClasses(
      name,
      _mergeSelections(
        selections,
        fragmentMap,
      ),
      fragmentMap,
      fragmentSelections,
      fragmentsDocUrl,
      schema,
      schemaUrl,
      type,
    );

List<Class> _buildSelectionSetDataClasses(
  String name,
  List<SelectionNode> selections,
  Map<String, FragmentDefinitionNode> fragmentMap,
  Map<String, List<FieldNode>> fragmentSelections,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
  String type,
) {
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }
    fragmentSelections["\$${selection.name.value}"] = _mergeSelections(
      fragmentMap[selection.name.value].selectionSet.selections,
      fragmentMap,
    ).whereType<FieldNode>().toList();
  }

  return [
    Class(
      (b) => b
        ..name = name
        ..implements = ListBuilder(fragmentSelections.keys
            .map<Reference>((className) => refer(className, fragmentsDocUrl)))
        ..constructors = _buildConstructors()
        ..fields = _buildFields()
        ..methods = _buildGetters(
          schema,
          schemaUrl,
          selections,
          name,
          type,
        ),
    ),
    ...selections
        .whereType<FieldNode>()
        .where(
          (field) => field.selectionSet != null,
        )
        .expand(
          (field) => _buildSelectionSetDataClasses(
            "${name}\$${field.alias?.value ?? field.name.value}",
            field.selectionSet.selections,
            fragmentMap,
            _fragmentSelectionsForField(
              fragmentSelections,
              field,
            ),
            fragmentsDocUrl,
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
}

/// Deeply merges field nodes
List<SelectionNode> _mergeSelections(
  List<SelectionNode> selections,
  Map<String, FragmentDefinitionNode> fragmentMap,
) =>
    _expandSelections(selections, fragmentMap)
        .fold<Map<String, SelectionNode>>(
          {},
          (selectionMap, selection) {
            if (selection is FragmentSpreadNode) {
              selectionMap[selection.name.value] = selection;
            } else if (selection is FieldNode) {
              final key = selection.alias?.value ?? selection.name.value;
              if (selection.selectionSet == null) {
                selectionMap[key] = selection;
              } else {
                final existingNode = selectionMap[key];
                final existingSelections = existingNode is FieldNode &&
                        existingNode.selectionSet != null
                    ? existingNode.selectionSet.selections
                    : [];
                selectionMap[key] = FieldNode(
                    name: selection.name,
                    alias: selection.alias,
                    selectionSet: SelectionSetNode(
                        selections: _mergeSelections(
                      [
                        ...existingSelections,
                        ...selection.selectionSet.selections
                      ],
                      fragmentMap,
                    )));
              }
            }
            return selectionMap;
          },
        )
        .values
        .toList();

List<SelectionNode> _expandSelections(
  List<SelectionNode> selections,
  Map<String, FragmentDefinitionNode> fragmentMap, [
  bool retainFragmentSpreads = true,
]) =>
    selections.expand(
      (selection) {
        if (selection is FieldNode) {
          return [selection];
        }
        if (selection is InlineFragmentNode) {
          return _expandSelections(
            selection.selectionSet.selections,
            fragmentMap,
          );
        }
        if (selection is FragmentSpreadNode) {
          if (!fragmentMap.containsKey(selection.name.value)) {
            throw Exception(
                "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
          }
          return [
            if (retainFragmentSpreads) selection,
            ..._expandSelections(
              fragmentMap[selection.name.value].selectionSet.selections,
              fragmentMap,
              false,
            )
          ];
        }
      },
    ).toList();

Map<String, List<FieldNode>> _fragmentSelectionsForField(
  Map<String, List<FieldNode>> fragmentSelections,
  FieldNode field,
) =>
    {
      for (var selectionEntry in fragmentSelections.entries)
        for (var selection in selectionEntry.value.where(
          (selection) {
            final selectionKey = selection.alias?.value ?? selection.name.value;
            final fieldKey = field.alias?.value ?? field.name.value;

            return selectionKey == fieldKey;
          },
        ))
          if (selection.selectionSet != null)
            "${selectionEntry.key}\$${field.alias?.value ?? field.name.value}":
                selection.selectionSet.selections
                    .whereType<FieldNode>()
                    .toList()
    };

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
      nodes
          .map<Method>(
            (node) => _buildGetter(
              schema,
              schemaUrl,
              node,
              prefix,
              type,
            ),
          )
          .where(
            (getter) => getter != null,
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
        ..name = identifier(name)
        ..type = MethodType.getter
        ..lambda = true
        ..body = typeNode is ListTypeNode
            ? dataField
                .equalTo(refer("null"))
                .conditional(
                  refer("null"),
                  dataField
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
                                        refer("e")
                                            .asA(refer("Map<String, dynamic>")),
                                      ],
                                    ).code,
                          ).closure,
                        ],
                      )
                      .property("toList")
                      .call([]),
                )
                .code
            : node.selectionSet == null
                ? fieldTypeDef == null
                    ? returns.symbol == "double"
                        ? dataField.nullSafeProperty("toDouble").call([]).code
                        : dataField.asA(returns).code
                    : returns.call([
                        dataField.asA(refer("String")),
                      ]).code
                : dataField
                    .equalTo(refer("null"))
                    .conditional(
                      refer("null"),
                      returns.call([
                        dataField.asA(refer("Map<String, dynamic>")),
                      ]),
                    )
                    .code,
    );
  }
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
