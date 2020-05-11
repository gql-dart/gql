import "package:meta/meta.dart";
import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/source.dart";

class _SourceSelections {
  final String url;
  final List<SelectionNode> selections;

  const _SourceSelections({
    this.url,
    this.selections,
  });
}

List<Class> buildDataClasses(
  SourceNode docSource,
  SourceNode schemaSource,
) =>
    [
      ...docSource.document.definitions
          .whereType<OperationDefinitionNode>()
          .expand(
            (op) => _buildOperationDataClasses(
              op,
              docSource,
              schemaSource,
            ),
          )
          .toList(),
      ...docSource.document.definitions
          .whereType<FragmentDefinitionNode>()
          .expand(
            (frag) => _buildFragmentDataClasses(
              frag,
              docSource,
              schemaSource,
            ),
          )
          .toList(),
    ];

List<Class> _buildOperationDataClasses(
  OperationDefinitionNode op,
  SourceNode docSource,
  SourceNode schemaSource,
) {
  final fragmentMap = _fragmentMap(docSource);
  return _buildSelectionSetDataClasses(
    name: "\$${op.name.value}",
    selections: _mergeSelections(
      op.selectionSet.selections,
      fragmentMap,
    ),
    schemaSource: schemaSource,
    type: _operationType(
      schemaSource.document,
      op,
    ),
    fragmentMap: fragmentMap,
    superclassSelections: {},
  );
}

List<Class> _buildFragmentDataClasses(
  FragmentDefinitionNode frag,
  SourceNode docSource,
  SourceNode schemaSource,
) {
  final fragmentMap = _fragmentMap(docSource);
  return _buildSelectionSetDataClasses(
    name: "\$${frag.name.value}",
    selections: _mergeSelections(
      frag.selectionSet.selections,
      fragmentMap,
    ),
    schemaSource: schemaSource,
    type: frag.typeCondition.on.name.value,
    fragmentMap: fragmentMap,
    superclassSelections: {},
  );
}

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

Map<String, _SourceSelections> _fragmentMap(SourceNode source) => {
      for (var def
          in source.document.definitions.whereType<FragmentDefinitionNode>())
        def.name.value: _SourceSelections(
          url: source.url,
          selections: def.selectionSet.selections,
        ),
      for (var import in source.imports) ..._fragmentMap(import)
    };

List<Class> _buildSelectionSetDataClasses({
  @required String name,
  @required List<SelectionNode> selections,
  @required SourceNode schemaSource,
  @required String type,
  @required Map<String, _SourceSelections> fragmentMap,
  @required Map<String, _SourceSelections> superclassSelections,
}) {
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }
    superclassSelections["\$${selection.name.value}"] = _SourceSelections(
      url: fragmentMap[selection.name.value].url,
      selections: _mergeSelections(
        fragmentMap[selection.name.value].selections,
        fragmentMap,
      ).whereType<FieldNode>().toList(),
    );
  }

  return [
    Class(
      (b) => b
        ..name = name
        ..implements = ListBuilder(
          superclassSelections.keys.map<Reference>(
            (superName) => refer(
              superName,
              (superclassSelections[superName].url ?? "") + "#data",
            ),
          ),
        )
        ..constructors = _buildConstructors(
          name,
          selections.whereType<InlineFragmentNode>().toList(),
        )
        ..fields = _buildFields()
        ..methods = _buildGetters(
          schemaSource,
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
            name: "${name}\$${field.alias?.value ?? field.name.value}",
            selections: field.selectionSet.selections,
            fragmentMap: fragmentMap,
            schemaSource: schemaSource,
            type: _getTypeName(
              _getFieldTypeNode(
                _getTypeDefinitionNode(
                  schemaSource.document,
                  type,
                ),
                field.name.value,
              ),
            ),
            superclassSelections: _fragmentSelectionsForField(
              superclassSelections,
              field,
            ),
          ),
        ),
    ...selections.whereType<InlineFragmentNode>().expand(
          (inlineFragment) => _buildSelectionSetDataClasses(
            name: "$name\$as${inlineFragment.typeCondition.on.name.value}",
            selections: _mergeSelections(
              [
                ...selections.whereType<FieldNode>(),
                ...selections.whereType<FragmentSpreadNode>(),
                ...inlineFragment.selectionSet.selections,
              ],
              fragmentMap,
            ),
            fragmentMap: fragmentMap,
            schemaSource: schemaSource,
            type: inlineFragment.typeCondition.on.name.value,
            superclassSelections: {
              name: _SourceSelections(url: null, selections: selections)
            },
          ),
        ),
  ];
}

/// Deeply merges field nodes
List<SelectionNode> _mergeSelections(
  List<SelectionNode> selections,
  Map<String, _SourceSelections> fragmentMap,
) =>
    _expandFragmentSpreads(selections, fragmentMap)
        .fold<Map<String, SelectionNode>>(
          {},
          (selectionMap, selection) {
            if (selection is FieldNode) {
              final key = selection.alias?.value ?? selection.name.value;
              if (selection.selectionSet == null) {
                selectionMap[key] = selection;
              } else {
                final existingNode = selectionMap[key];
                final existingSelections = existingNode is FieldNode &&
                        existingNode.selectionSet != null
                    ? existingNode.selectionSet.selections
                    : <SelectionNode>[];
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
            } else {
              selectionMap[selection.hashCode.toString()] = selection;
            }
            return selectionMap;
          },
        )
        .values
        .toList();

List<SelectionNode> _expandFragmentSpreads(
  List<SelectionNode> selections,
  Map<String, _SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
]) =>
    selections.expand(
      (selection) {
        if (selection is FragmentSpreadNode) {
          if (!fragmentMap.containsKey(selection.name.value)) {
            throw Exception(
                "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
          }
          return [
            if (retainFragmentSpreads) selection,
            ..._expandFragmentSpreads(
              fragmentMap[selection.name.value].selections,
              fragmentMap,
              false,
            )
          ];
        }
        return [selection];
      },
    ).toList();

Map<String, _SourceSelections> _fragmentSelectionsForField(
  Map<String, _SourceSelections> fragmentMap,
  FieldNode field,
) =>
    Map.fromEntries(
      fragmentMap.entries.expand(
        (entry) => entry.value.selections.whereType<FieldNode>().where(
          (selection) {
            if (selection.selectionSet == null) return false;

            final selectionKey = selection.alias?.value ?? selection.name.value;
            final fieldKey = field.alias?.value ?? field.name.value;

            return selectionKey == fieldKey;
          },
        ).map(
          (selection) => MapEntry(
            "${entry.key}\$${field.alias?.value ?? field.name.value}",
            _SourceSelections(
              url: entry.value.url,
              selections: selection.selectionSet.selections
                  .whereType<FieldNode>()
                  .toList(),
            ),
          ),
        ),
      ),
    );

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

ListBuilder<Constructor> _buildConstructors(
  String name,
  List<InlineFragmentNode> inlineFragments,
) =>
    ListBuilder<Constructor>(
      <Constructor>[
        Constructor(
          (b) => b
            ..name = inlineFragments.isEmpty ? null : "fromData"
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = "data"
                  ..toThis = true,
              ),
            )
            ..constant = true,
        ),
        if (inlineFragments.isNotEmpty)
          Constructor(
            (b) => b
              ..factory = true
              ..requiredParameters.add(
                Parameter(
                  (b) => b..name = "data",
                ),
              )
              ..body = Code(
                [
                  "switch (data['__typename']) {",
                  ...inlineFragments.map((inlineFragment) => """
                  case "${inlineFragment.typeCondition.on.name.value}":
                    return ${'$name\$as${inlineFragment.typeCondition.on.name.value}'}(data);
                """),
                  "default: return $name.fromData(data); }"
                ].join(),
              ),
          ),
      ],
    );

ListBuilder<Method> _buildGetters(
  SourceNode schemaSource,
  List<SelectionNode> nodes,
  String prefix,
  String type,
) =>
    ListBuilder<Method>(
      nodes
          .map<Method>(
            (node) => _buildGetter(
              schemaSource,
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
  SourceNode schemaSource,
  SelectionNode node,
  String prefix,
  String type,
) {
  if (node is FieldNode) {
    final name = node.alias?.value ?? node.name.value;
    final typeDef = _getTypeDefinitionNode(
      schemaSource.document,
      type,
    );
    final typeNode = _getFieldTypeNode(
      typeDef,
      node.name.value,
    );
    final unwrappedTypeNode = _unwrapTypeNode(typeNode);
    final typeName = unwrappedTypeNode.name.value;
    final fieldTypeDef = _getTypeDefinitionNode(
      schemaSource.document,
      typeName,
    );
    final typeMap = {
      ...defaultTypeMap,
      if (node.selectionSet != null)
        typeName: refer("$prefix\$$name")
      else if (fieldTypeDef != null)
        typeName: refer(
          typeName,
          schemaSource.url + "#schema",
        )
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

  return null;
}

TypeDefinitionNode _getTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions.whereType<TypeDefinitionNode>().firstWhere(
          (node) => node.name.value == name,
          orElse: () => null,
        );

TypeNode _getFieldTypeNode(
  TypeDefinitionNode node,
  String field,
) {
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
