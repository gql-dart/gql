import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";
import "../inline_fragment_classes.dart";

List<Class> buildOperationDataClasses(
  OperationDefinitionNode op,
  SourceNode docSource,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) {
  if (op.name == null) {
    throw Exception("Operations must be named");
  }

  final fragmentMap = _fragmentMap(docSource);
  return buildSelectionSetDataClasses(
    name: "${op.name!.value}Data",
    selections: mergeSelections(
      op.selectionSet.selections,
      fragmentMap,
    ),
    schemaSource: schemaSource,
    type: _operationType(
      schemaSource.document,
      op,
    ),
    typeOverrides: typeOverrides,
    fragmentMap: fragmentMap,
    superclassSelections: {},
  );
}

List<Class> buildFragmentDataClasses(
  FragmentDefinitionNode frag,
  SourceNode docSource,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) {
  final fragmentMap = _fragmentMap(docSource);
  final selections = mergeSelections(
    frag.selectionSet.selections,
    fragmentMap,
  );
  return [
    // abstract class that will implemented by any class that uses the fragment
    ...buildSelectionSetDataClasses(
      name: frag.name.value,
      selections: selections,
      schemaSource: schemaSource,
      type: frag.typeCondition.on.name.value,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      superclassSelections: {},
      built: false,
    ),
    // concrete built_value data class for fragment
    ...buildSelectionSetDataClasses(
      name: "${frag.name.value}Data",
      selections: selections,
      schemaSource: schemaSource,
      type: frag.typeCondition.on.name.value,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      superclassSelections: {
        frag.name.value: SourceSelections(
          url: docSource.url,
          selections: selections,
        )
      },
    ),
  ];
}

String _operationType(
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

Map<String, SourceSelections> _fragmentMap(SourceNode source) => {
      for (var def
          in source.document.definitions.whereType<FragmentDefinitionNode>())
        def.name.value: SourceSelections(
          url: source.url,
          selections: def.selectionSet.selections,
        ),
      for (var import in source.imports) ..._fragmentMap(import)
    };

/// Builds one or more data classes, with properties based on [selections].
///
/// For each selection that is a field with nested selections, a descendent
/// data class will also be created.
///
/// If this class is for a fragment definition or descendent, set [built] == `false`,
/// and it will be built as an abstract class which will be implemented by any
/// class that includes the fragment (or descendent) as a spread in its
/// [selections].
List<Class> buildSelectionSetDataClasses({
  required String name,
  required List<SelectionNode> selections,
  required SourceNode schemaSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, SourceSelections> superclassSelections,
  bool built = true,
}) {
  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }
    superclassSelections["${selection.name.value}"] = SourceSelections(
      url: fragmentMap[selection.name.value]!.url,
      selections: mergeSelections(
        fragmentMap[selection.name.value]!.selections,
        fragmentMap,
      ).whereType<FieldNode>().toList(),
    );
  }

  final superclassSelectionNodes = superclassSelections.values
      .expand((selections) => selections.selections)
      .toSet();

  final fieldGetters = selections.whereType<FieldNode>().map<Method>(
    (node) {
      final nameNode = node.alias ?? node.name;
      final typeDef = getTypeDefinitionNode(
        schemaSource.document,
        type,
      )!;
      final typeNode = _getFieldTypeNode(
        typeDef,
        node.name.value,
      );
      return buildGetter(
        nameNode: nameNode,
        typeNode: typeNode,
        schemaSource: schemaSource,
        typeOverrides: typeOverrides,
        typeRefPrefix: node.selectionSet != null ? builtClassName(name) : null,
        built: built,
        isOverride: superclassSelectionNodes.contains(node),
      );
    },
  ).toList();

  final inlineFragments = selections.whereType<InlineFragmentNode>().toList();

  return [
    if (inlineFragments.isNotEmpty)
      ...buildInlineFragmentClasses(
        name: name,
        fieldGetters: fieldGetters,
        selections: selections,
        schemaSource: schemaSource,
        type: type,
        typeOverrides: typeOverrides,
        fragmentMap: fragmentMap,
        superclassSelections: superclassSelections,
        inlineFragments: inlineFragments,
        built: built,
      )
    else if (!built)
      Class(
        (b) => b
          ..abstract = true
          ..name = builtClassName(name)
          ..implements.addAll(
            superclassSelections.keys.map<Reference>(
              (superName) => refer(
                builtClassName(superName),
                (superclassSelections[superName]?.url ?? "") + "#data",
              ),
            ),
          )
          ..methods.addAll([
            ...fieldGetters,
            buildToJsonGetter(
              builtClassName(name),
              implemented: false,
              isOverride: superclassSelections.isNotEmpty,
            ),
          ]),
      )
    else
      builtClass(
        name: name,
        getters: fieldGetters,
        initializers: {
          if (fieldGetters.any((getter) => getter.name == "G__typename"))
            "G__typename": literalString(type),
        },
        superclassSelections: superclassSelections,
      ),
    // Build classes for each field that includes selections
    ...selections
        .whereType<FieldNode>()
        .where(
          (field) => field.selectionSet != null,
        )
        .expand(
          (field) => buildSelectionSetDataClasses(
            name: "${name}_${field.alias?.value ?? field.name.value}",
            selections: field.selectionSet!.selections,
            fragmentMap: fragmentMap,
            schemaSource: schemaSource,
            type: unwrapTypeNode(
              _getFieldTypeNode(
                getTypeDefinitionNode(
                  schemaSource.document,
                  type,
                )!,
                field.name.value,
              ),
            ).name.value,
            typeOverrides: typeOverrides,
            superclassSelections: _fragmentSelectionsForField(
              superclassSelections,
              field,
            ),
            built: inlineFragments.isNotEmpty ? false : built,
          ),
        ),
  ];
}

/// Deeply merges field nodes
List<SelectionNode> mergeSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
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
                    ? existingNode.selectionSet!.selections
                    : <SelectionNode>[];
                selectionMap[key] = FieldNode(
                    name: selection.name,
                    alias: selection.alias,
                    selectionSet: SelectionSetNode(
                        selections: mergeSelections(
                      [
                        ...existingSelections,
                        ...selection.selectionSet!.selections
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
  Map<String, SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
]) =>
    selections.expand(
      (selection) {
        if (selection is FragmentSpreadNode) {
          if (!fragmentMap.containsKey(selection.name.value)) {
            throw Exception(
              "Couldn't find fragment definition for fragment spread '${selection.name.value}'",
            );
          }
          return [
            if (retainFragmentSpreads) selection,
            ..._expandFragmentSpreads(
              fragmentMap[selection.name.value]!.selections,
              fragmentMap,
              false,
            )
          ];
        }
        return [selection];
      },
    ).toList();

Map<String, SourceSelections> _fragmentSelectionsForField(
  Map<String, SourceSelections> fragmentMap,
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
            SourceSelections(
              url: entry.value.url,
              selections: selection.selectionSet!.selections
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
  if (node is UnionTypeDefinitionNode && field == "__typename") {
    return NamedTypeNode(
      isNonNull: true,
      name: NameNode(value: "String"),
    );
  }

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
