import "package:meta/meta.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:path/path.dart" as p;

import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/source.dart";

class _SourceSelections {
  final String url;
  final List<SelectionNode> selections;

  const _SourceSelections({
    this.url,
    this.selections,
  });
}

List<Class> buildOperationDataClasses(
  OperationDefinitionNode op,
  SourceNode docSource,
  SourceNode schemaSource,
) {
  final fragmentMap = _fragmentMap(docSource);
  return _buildSelectionSetDataClasses(
    name: "${op.name.value}Data",
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

List<Class> buildFragmentDataClasses(
  FragmentDefinitionNode frag,
  SourceNode docSource,
  SourceNode schemaSource,
) {
  final fragmentMap = _fragmentMap(docSource);
  return _buildSelectionSetDataClasses(
    name: "${frag.name.value}",
    selections: _mergeSelections(
      frag.selectionSet.selections,
      fragmentMap,
    ),
    schemaSource: schemaSource,
    type: frag.typeCondition.on.name.value,
    fragmentMap: fragmentMap,
    superclassSelections: {},
    built: false,
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
  bool built = true,
}) {
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }
    superclassSelections["${selection.name.value}"] = _SourceSelections(
      url: fragmentMap[selection.name.value].url,
      selections: _mergeSelections(
        fragmentMap[selection.name.value].selections,
        fragmentMap,
      ).whereType<FieldNode>().toList(),
    );
  }

  final fieldGetters = selections.whereType<FieldNode>().map<Method>(
    (node) {
      final nameNode = node.alias ?? node.name;
      final typeDef = getTypeDefinitionNode(
        schemaSource.document,
        type,
      );
      final typeNode = _getFieldTypeNode(
        typeDef,
        node.name.value,
      );
      return buildGetter(
        nameNode: nameNode,
        typeNode: typeNode,
        schemaSource: schemaSource,
        typeRefPrefix: node.selectionSet != null ? builtClassName(name) : null,
        built: built,
      );
    },
  );

  final baseClass = built
      ? builtClass(
          name: name,
          getters: fieldGetters,
          serializersUrl: "${p.dirname(schemaSource.url)}/serializers.gql.dart",
        )
      : Class(
          (b) => b
            ..abstract = true
            ..name = builtClassName(name)
            ..methods.addAll(fieldGetters),
        );

  return [
    baseClass.rebuild(
      (b) => b
        ..implements.addAll(
          superclassSelections.keys.map<Reference>(
            (superName) => refer(
              builtClassName(superName),
              (superclassSelections[superName].url ?? "") + "#data",
            ),
          ),
        ),
    ),
    ...selections
        .whereType<FieldNode>()
        .where(
          (field) => field.selectionSet != null,
        )
        .expand(
          (field) => _buildSelectionSetDataClasses(
            name: "${name}_${field.alias?.value ?? field.name.value}",
            selections: field.selectionSet.selections,
            fragmentMap: fragmentMap,
            schemaSource: schemaSource,
            type: unwrapTypeNode(
              _getFieldTypeNode(
                getTypeDefinitionNode(
                  schemaSource.document,
                  type,
                ),
                field.name.value,
              ),
            ).name.value,
            superclassSelections: _fragmentSelectionsForField(
              superclassSelections,
              field,
            ),
            built: built,
          ),
        ),
    ...selections.whereType<InlineFragmentNode>().expand(
          (inlineFragment) => _buildSelectionSetDataClasses(
            name: "${name}_as${inlineFragment.typeCondition.on.name.value}",
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
            built: built,
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
            "${entry.key}_${field.alias?.value ?? field.name.value}",
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
