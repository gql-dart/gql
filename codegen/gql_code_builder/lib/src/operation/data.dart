import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";

import "package:gql/ast.dart";

import "package:gql_code_builder/src/config/when_extension_config.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";
import "../inline_fragment_classes.dart";

List<Spec> buildOperationDataClasses(
  OperationDefinitionNode op,
  SourceNode docSource,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  Map<String, SourceSelections> fragmentMap,
  Map<String, Reference> dataClassAliasMap,
) {
  if (op.name == null) {
    throw Exception("Operations must be named");
  }

  final fragmentMap = _fragmentMap(docSource);

  final collectedFields = collectFields(
    docSource,
    schemaSource,
    getTypeDefinitionNode(
      schemaSource.flatDocument,
      _operationType(
        schemaSource.document,
        op,
      ),
    )!,
    op.selectionSet.selections,
    {},
  );

  final mergedFields = mergeWithSkipsOrIncludes(collectedFields);

  return buildSelectionSetDataClasses(
    name: "${op.name!.value}Data",
    selections: mergeSelections(
      op.selectionSet.selections,
      fragmentMap,
    ),
    schemaSource: schemaSource,
    docSource: docSource,
    type: _operationType(
      schemaSource.document,
      op,
    ),
    typeOverrides: typeOverrides,
    fragmentMap: fragmentMap,
    dataClassAliasMap: dataClassAliasMap,
    superclassSelections: {},
    whenExtensionConfig: whenExtensionConfig,
  );
}

List<Spec> buildFragmentDataClasses(
  FragmentDefinitionNode frag,
  SourceNode docSource,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  Map<String, SourceSelections> fragmentMap,
  Map<String, Reference> dataClassAliasMap,
) {
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
      docSource: docSource,
      type: frag.typeCondition.on.name.value,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: {},
      built: false,
      whenExtensionConfig: whenExtensionConfig,
    ),
    // concrete built_value data class for fragment
    ...buildSelectionSetDataClasses(
      name: "${frag.name.value}Data",
      selections: selections,
      schemaSource: schemaSource,
      docSource: docSource,
      type: frag.typeCondition.on.name.value,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: {
        frag.name.value: SourceSelections(
          url: docSource.url,
          selections: selections,
        )
      },
      whenExtensionConfig: whenExtensionConfig,
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
      for (final def
          in source.document.definitions.whereType<FragmentDefinitionNode>())
        def.name.value: SourceSelections(
          url: source.url,
          selections: def.selectionSet.selections,
        ),
      for (final import in source.imports) ..._fragmentMap(import)
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
List<Spec> buildSelectionSetDataClasses({
  required String name,
  required List<SelectionNode> selections,
  required SourceNode schemaSource,
  required SourceNode docSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> superclassSelections,
  bool built = true,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
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

  final fields = collectFields(docSource, schemaSource,
      getTypeDefinitionNode(schemaSource.flatDocument, type)!, selections, {});

  final mergedFields = mergeWithSkipsOrIncludes(fields);


  if(fields.values.any((element) => element.any((element) => element.hasSkipOrInlcude))) {
    print("has skip or include");
    print("$name \n $fields \n\n $mergedFields");
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
      final hasSkipOrInclude = node.directives.any(
        (directive) =>
            directive.name.value == "skip" || directive.name.value == "include",
      );
      return buildGetter(
        nameNode: nameNode,
        typeNode: typeNode,
        schemaSource: schemaSource,
        typeOverrides: typeOverrides,
        typeRefAlias:
            dataClassAliasMap[builtClassName("${name}_${nameNode.value}")],
        typeRefPrefix: node.selectionSet != null ? builtClassName(name) : null,
        built: built,
        isOverride: superclassSelectionNodes.contains(node),
        forceNullable: hasSkipOrInclude,
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
        documentSource: docSource,
        type: type,
        typeOverrides: typeOverrides,
        fragmentMap: fragmentMap,
        dataClassAliasMap: dataClassAliasMap,
        superclassSelections: superclassSelections,
        inlineFragments: inlineFragments,
        built: built,
        whenExtensionConfig: whenExtensionConfig,
      )
    else if (!built && dataClassAliasMap[name] == null)
      Class(
        (b) => b
          ..abstract = true
          ..name = builtClassName(name)
          ..implements.addAll(
            superclassSelections.keys
                .where((superName) =>
                    !dataClassAliasMap.containsKey(builtClassName(superName)))
                .map<Reference>(
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
        dataClassAliasMap: dataClassAliasMap,
      ),
    // Build classes for each field that includes selections
    ...selections
        .whereType<FieldNode>()
        .where(
          (field) =>
              field.selectionSet != null &&
              !dataClassAliasMap.containsKey(builtClassName(
                  "${name}_${field.alias?.value ?? field.name.value}")),
        )
        .expand(
          (field) => buildSelectionSetDataClasses(
            name: "${name}_${field.alias?.value ?? field.name.value}",
            selections: field.selectionSet!.selections,
            fragmentMap: fragmentMap,
            dataClassAliasMap: dataClassAliasMap,
            schemaSource: schemaSource,
            docSource: docSource,
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
            whenExtensionConfig: whenExtensionConfig,
          ),
        ),
  ];
}

/// Shrink merged fields nodes based on FragmentMap
List<SelectionNode> shrinkSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  final unmerged = [...selections];

  for (final selection in selections) {
    if (selection is FieldNode && selection.selectionSet != null) {
      final index = unmerged.indexOf(selection);
      unmerged[index] = FieldNode(
        name: selection.name,
        alias: selection.alias,
        selectionSet: SelectionSetNode(
          selections:
              shrinkSelections(selection.selectionSet!.selections, fragmentMap),
        ),
      );
    } else if (selection is InlineFragmentNode &&
        selection.typeCondition != null) {
      /// TODO: Handle inline fragments without a type condition
      final index = unmerged.indexOf(selection);
      unmerged[index] = InlineFragmentNode(
        typeCondition: selection.typeCondition,
        directives: selection.directives,
        selectionSet: SelectionSetNode(
          selections:
              shrinkSelections(selection.selectionSet.selections, fragmentMap),
        ),
      );
    }
  }

  for (final node in unmerged.whereType<FragmentSpreadNode>().toList()) {
    final fragment = fragmentMap[node.name.value]!;
    final spreadIndex = unmerged.indexOf(node);
    final duplicateIndexList = <int>[];
    unmerged.forEachIndexed((selectionIndex, selection) {
      if (selectionIndex > spreadIndex &&
          fragment.selections.any((s) => s.hashCode == selection.hashCode)) {
        duplicateIndexList.add(selectionIndex);
      }
    });
    duplicateIndexList.reversed.forEach(unmerged.removeAt);
  }

  return unmerged;
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
            } else if (selection is InlineFragmentNode &&
                selection.typeCondition != null) {
              /// TODO: Handle inline fragments without a type condition
              final key = selection.typeCondition!.on.name.value;
              if (selectionMap.containsKey(key)) {
                selectionMap[key] = InlineFragmentNode(
                  typeCondition: selection.typeCondition,
                  directives: selection.directives,
                  selectionSet: SelectionSetNode(
                    selections: mergeSelections(
                      [
                        ...(selectionMap[key] as InlineFragmentNode)
                            .selectionSet
                            .selections,
                        ...selection.selectionSet.selections,
                      ],
                      fragmentMap,
                    ),
                  ),
                );
              } else {
                selectionMap[key] = selection;
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

          final fragmentSelections =
              fragmentMap[selection.name.value]!.selections;

          return [
            if (retainFragmentSpreads) selection,
            ..._expandFragmentSpreads(
              [
                ...fragmentSelections.whereType<FieldNode>(),
                ...fragmentSelections.whereType<FragmentSpreadNode>(),
              ],
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

typedef FieldNodeWithSkipOrInclude = ({FieldNode fieldNode, bool hasSkipOrInlcude});

//https://spec.graphql.org/draft/#CollectFields()
Map<String, List<FieldNodeWithSkipOrInclude>> collectFields(
  SourceNode document,
  SourceNode schema,
  TypeDefinitionNode objectType,
  List<SelectionNode> selectionSet,
  Set<String> visitedFragments,
) {

  if(visitedFragments.isEmpty || true) {
    print("collectFields: ${document.url} ${selectionSet}");
  }

  //Initialize groupedFields to an empty ordered map of lists.
  final groupedFields = <String, List<FieldNodeWithSkipOrInclude>>{};
  //For each selection in selectionSet:
  for (final selection in selectionSet) {
    final isSelectionSkipped = selection.directives.any(
      (directive) => const {"skip", "include"}.contains(directive.name.value),
    );

    //If the selection is a field:
    if (selection is FieldNode) {

        //Append the field to groupedFields under the response name of the aliased field or the field name.
        groupedFields
            .putIfAbsent(
                selection.alias?.value ?? selection.name.value, () => [])
            .add((fieldNode: selection, hasSkipOrInlcude: isSelectionSkipped));

    }
    //If the selection is an inline fragment:
    else if (selection is InlineFragmentNode) {
      //Let fragmentType be the type condition on selection.
      final fragmentType = selection.typeCondition;
      //If fragmentType is not null and DoesFragmentTypeApply(objectType, fragmentType) is false, continue with the next selection in selectionSet.
      if (fragmentType != null &&
          !doesFragmentTypeApply(
              objectType, fragmentType, schema.flatDocument)) {
        print("fragmentType is not null and DoesFragmentTypeApply(objectType, fragmentType) is false, continue with the next selection in selectionSet.");
        continue;
      }
      //Let fragmentSelectionSet be the top-level selection set of selection.
      final fragmentSelectionSet = selection.selectionSet;
      //Let fragmentGroupedFieldSet be the result of calling CollectFields(objectType, fragmentSelectionSet, variableValues, visitedFragments).
      final fragmentGroupedFieldSet = collectFields(document, schema,
          objectType, fragmentSelectionSet.selections, visitedFragments);
      //For each fragmentGroup in fragmentGroupedFieldSet:
      for (final fragmentGroup in fragmentGroupedFieldSet.entries) {
          //Let responseKey be the response key shared by all fields in fragmentGroup.
          final responseKey = fragmentGroup.key;
          //Let groupForResponseKey be the list in groupedFields for responseKey; if no such list exists, create it as an empty list.
          final groupForResponseKey =
              groupedFields.putIfAbsent(responseKey, () => []);
          //Append all items in fragmentGroup to groupForResponseKey.
          groupForResponseKey.addAll(fragmentGroup.value.map((e) => (fieldNode: e.fieldNode, hasSkipOrInlcude: isSelectionSkipped || e.hasSkipOrInlcude)));
        }

    }

    //If the selection is a fragment spread:
    else if (selection is FragmentSpreadNode) {
      //Let fragmentSpreadName be the name of selection.
      final fragmentSpreadName = selection.name.value;
      //If fragmentSpreadName is in visitedFragments, continue with the next selection in selectionSet.
      if (visitedFragments.contains(fragmentSpreadName)) {
        continue;
      }
      //Add fragmentSpreadName to visitedFragments.
      visitedFragments.add(fragmentSpreadName);
      //Let fragment be the Fragment in the current Document whose name is fragmentSpreadName.
      final fragment = document.flatDocument.definitions.firstWhereOrNull(
              (definition) =>
                  definition is FragmentDefinitionNode &&
                  definition.name.value == fragmentSpreadName)
          as FragmentDefinitionNode?;
      //If no such fragment exists, continue with the next selection in selectionSet.
      if (fragment == null) {
        continue;
      }
      //Let fragmentType be the type condition on fragment.
      final fragmentType = fragment.typeCondition;
      //If DoesFragmentTypeApply(objectType, fragmentType) is false, continue with the next selection in selectionSet.
      if (!doesFragmentTypeApply(
          objectType, fragmentType, schema.flatDocument)) {
        print("DoesFragmentTypeApply(objectType, fragmentType) is false, continue with the next selection in selectionSet.");
        continue;
      }
      //Let fragmentSelectionSet be the top-level selection set of fragment.
      final fragmentSelectionSet = fragment.selectionSet;
      //Let fragmentGroupedFieldSet be the result of calling CollectFields(objectType, fragmentSelectionSet, variableValues, visitedFragments).
      final fragmentGroupedFieldSet = collectFields(document, schema,
          objectType, fragmentSelectionSet.selections, visitedFragments);
      //For each fragmentGroup in fragmentGroupedFieldSet:
      for (final fragmentGroup in fragmentGroupedFieldSet.entries) {
        //Let responseKey be the response key shared by all fields in fragmentGroup.
        final responseKey = fragmentGroup.key;
        //Let groupForResponseKey be the list in groupedFields for responseKey; if no such list exists, create it as an empty list.
        final groupForResponseKey =
            groupedFields.putIfAbsent(responseKey, () => []);
        //Append all items in fragmentGroup to groupForResponseKey.
        groupForResponseKey.addAll(fragmentGroup.value.map((e) => (fieldNode: e.fieldNode, hasSkipOrInlcude: isSelectionSkipped || e.hasSkipOrInlcude)));
      }
    }
  }
  //Return groupedFields.
  return groupedFields;
}

/// detects field nodes with the same response key, and merges them into one
/// considering skip and include directives;
/// if a field node has skip or include directive on all of its selections,
/// it is potentially skipped and must be made nullable
Map<String, List<FieldNodeWithSkipOrInclude>> mergeWithSkipsOrIncludes(
  Map<String, List<FieldNodeWithSkipOrInclude>> groupedFields,
) {

final result = <String, List<FieldNodeWithSkipOrInclude>>{};

  for (final group in groupedFields.entries) {
    final responseKey = group.key;
    final fields = group.value;

    //group fields by alias or name and merge them
    final merged =
    fields.groupFoldBy<String, FieldNodeWithSkipOrInclude>((element) => element.fieldNode.alias?.value ?? element.fieldNode.name.value, (previous, element) {
      if(previous == null) {
        return element;
      }
      if(element.hasSkipOrInlcude) {
        print("gggggg \n previous: $previous, element: $element merge!");
      }
      return (fieldNode: element.fieldNode, hasSkipOrInlcude: previous.hasSkipOrInlcude && element.hasSkipOrInlcude);
    });

    result[responseKey] = merged.values.toList();

}

    return result;
  }

//https://spec.graphql.org/draft/#DoesFragmentTypeApply()
bool doesFragmentTypeApply(TypeDefinitionNode objectType,
    TypeConditionNode fragmentConditionType, DocumentNode schema) {
  final fragmentType = schema.definitions.firstWhereOrNull((definition) =>
          definition is TypeDefinitionNode &&
          definition.name.value == fragmentConditionType.on.name.value)
      as TypeDefinitionNode?;

  if (fragmentType is UnionTypeDefinitionNode) {
    return fragmentType.types
        .any((type) => type.name.value == objectType.name.value);
  } else if (fragmentType is InterfaceTypeDefinitionNode) {
    return objectType is ObjectTypeDefinitionNode &&
        objectType.interfaces
            .any((type) => type.name.value == fragmentType.name.value);
  } else if (fragmentType is ObjectTypeDefinitionNode) {
    return objectType.name.value == fragmentType.name.value;
  } else {
    throw Exception("Unknown fragment type ${fragmentType.runtimeType}");
  }
}
