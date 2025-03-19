import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";
import "../inline_fragment_classes.dart";
import "../utils/fragment_debug.dart";

// Helper function to ensure __typename is present in selections
List<SelectionNode> ensureTypenameField(List<SelectionNode> selections) {
  // Check if __typename is already in the selections
  final bool hasTypename = selections
      .whereType<FieldNode>()
      .any((node) => (node.alias?.value ?? node.name.value) == "__typename");

  if (!hasTypename) {
    // Add __typename field if not present
    return [
      ...selections,
      FieldNode(
        name: NameNode(value: "__typename"),
        selectionSet: null,
        arguments: const [],
        directives: const [],
      ),
    ];
  }
  return selections;
}

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

  final selections = mergeSelections(
    op.selectionSet.selections,
    fragmentMap,
  );

  // Ensure __typename is present in the selections
  final enhancedSelections = ensureTypenameField(selections);

  return buildSelectionSetDataClasses(
    name: "${op.name!.value}Data",
    selections: enhancedSelections,
    schemaSource: schemaSource,
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

  // Ensure __typename is present in the selections
  final enhancedSelections = ensureTypenameField(selections);

  return [
    // abstract class that will implemented by any class that uses the fragment
    ...buildSelectionSetDataClasses(
      name: frag.name.value,
      selections: enhancedSelections,
      schemaSource: schemaSource,
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
      selections: enhancedSelections,
      schemaSource: schemaSource,
      type: frag.typeCondition.on.name.value,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: {
        frag.name.value: SourceSelections(
          url: docSource.url,
          selections: enhancedSelections,
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

// Helper to create a G__typename getter
Method createTypenameGetter(String type, {bool isOverride = false}) =>
    Method((b) => b
      ..annotations.addAll([
        if (isOverride) refer("override"),
        refer("BuiltValueField", "package:built_value/built_value.dart")
            .call([], {"wireName": literalString("__typename")}),
      ])
      ..returns = refer("String")
      ..type = MethodType.getter
      ..name = "G__typename");

// Add this debugging to the buildSelectionSetDataClasses function
void debugFieldGetters(String name, List<Method> fieldGetters) {
  FragmentDebugger.enterScope("fieldGetters for $name");
  for (final getter in fieldGetters) {
    FragmentDebugger.log("- ${getter.name}: ${getter.returns}");
  }
  FragmentDebugger.exitScope("fieldGetters for $name");
}

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
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> superclassSelections,
  bool built = true,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  // New parameters to track fragment context
  bool isBaseClass = false,
  String? fragmentTypeName,
  List<InlineFragmentNode>? parentInlineFragments,
  Map<String, String>? typeMap,
  // Track parent fragment path for nested selections
  String? parentFragmentPath,
}) {
// Add this near the beginning of buildSelectionSetDataClasses
  FragmentDebugger.enterScope("buildSelectionSetDataClasses: $name");
  FragmentDebugger.log("Type: $type, Built: $built, isBaseClass: $isBaseClass");
  FragmentDebugger.dumpSelections("Input selections", selections);

  if (superclassSelections.isNotEmpty) {
    FragmentDebugger.log(
        "Superclass selections count: ${superclassSelections.length}");
    for (final entry in superclassSelections.entries) {
      FragmentDebugger.log(
          "Superclass: ${entry.key} with ${entry.value.selections.length} selections");
    }
  }

  // CRITICAL FIX: Always ensure __typename is in our selections
  final enhancedSelections = ensureTypenameField(selections);

  // For nested fields, check if they should implement fragment interfaces
  final Map<String, SourceSelections> nestedSuperclassSelections = {
    ...superclassSelections
  };

  // If this is a nested selection like __asHuman_friends, we need to add corresponding fragment interfaces
  if (name.contains("_") && name.contains("__as")) {
    final parts = name.split("_");
    final fieldName = parts.last;
    final typeNamePart = name.split("__as").last.split("_").first;

    // Check if there are corresponding fragment interfaces for this nested field
    for (final superName in superclassSelections.keys.toList()) {
      if (superName.contains("__as$typeNamePart")) {
        // This is a parent fragment with the same type condition
        final baseFragmentName = superName.split("__as").first;
        final potentialNestedInterface =
            "${baseFragmentName}__as${typeNamePart}_$fieldName";

        // Check if the interface exists in our fragments
        bool hasNestedInterface = false;
        for (final entry in fragmentMap.entries) {
          if (entry.key.contains(fieldName) &&
              entry.value.selections.isNotEmpty) {
            hasNestedInterface = true;
            break;
          }
        }

        if (hasNestedInterface) {
          // Add the nested interface
          nestedSuperclassSelections[potentialNestedInterface] =
              SourceSelections(url: null, selections: []);
          print("ADDING NESTED INTERFACE: $potentialNestedInterface to $name");
        }
      }
    }
  }

  for (final selection in selections.whereType<FragmentSpreadNode>()) {
    if (!fragmentMap.containsKey(selection.name.value)) {
      throw Exception(
          "Couldn't find fragment definition for fragment spread '${selection.name.value}'");
    }
    nestedSuperclassSelections["${selection.name.value}"] = SourceSelections(
      url: fragmentMap[selection.name.value]!.url,
      selections: mergeSelections(
        fragmentMap[selection.name.value]!.selections,
        fragmentMap,
      ).whereType<FieldNode>().toList(),
    );
  }

  final superclassSelectionNodes = nestedSuperclassSelections.values
      .expand((selections) => selections.selections)
      .toSet();

  // Track fields we've already processed to avoid duplicates
  final processedFields = <String>{};

  final fieldGetters = selections
      .whereType<FieldNode>()
      .map<Method?>(
        (node) {
          final nameNode = node.alias ?? node.name;

          // Skip duplicate fields, but make sure we keep __typename
          // FIXED: We want to process __typename even if it's in a superclass
          if (processedFields.contains(nameNode.value) ||
              (nameNode.value == "__typename" &&
                  superclassSelectionNodes.any((s) =>
                      s is FieldNode &&
                      (s.alias?.value ?? s.name.value) == "__typename") &&
                  built)) {
            // Only skip in built classes, keep in interfaces
            return null;
          }
          processedFields.add(nameNode.value);

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
            typeRefAlias:
                dataClassAliasMap[builtClassName("${name}_${nameNode.value}")],
            typeRefPrefix:
                node.selectionSet != null ? builtClassName(name) : null,
            built: built,
            isOverride: superclassSelectionNodes.contains(node),
          );
        },
      )
      .where((method) => method != null)
      .cast<Method>()
      .toList();

  // CRITICAL FIX: Ensure G__typename getter is present
  // Don't add to processed fields to ensure it's always included
  if (!fieldGetters.any((getter) => getter.name == "G__typename")) {
    // Check if it should be an override (if in superclass)
    final bool isOverride = superclassSelectionNodes.any((s) =>
        s is FieldNode && (s.alias?.value ?? s.name.value) == "__typename");

    fieldGetters.add(createTypenameGetter(type, isOverride: isOverride));
  }

  final inlineFragments = selections.whereType<InlineFragmentNode>().toList();

  // Generate helper methods for asHuman/asDroid getters with the correct type prefixes
  List<Method> typeCastMethods = [];
  if (isBaseClass &&
      parentInlineFragments != null &&
      parentInlineFragments.isNotEmpty &&
      typeMap != null) {
    typeCastMethods = parentInlineFragments
        .where((frag) => frag.typeCondition != null)
        .map((frag) {
      final typeName = frag.typeCondition!.on.name.value;
      final methodName = "as$typeName";
      // Always use full class name with G prefix
      final returnTypeName = typeMap[typeName]!;

      return Method((b) => b
        ..annotations.add(refer("override"))
        ..type = MethodType.getter
        ..returns = TypeReference((tr) => tr
          ..symbol = returnTypeName
          ..isNullable = true)
        ..name = methodName
        ..lambda = true
        ..body = Code("null"));
    }).toList();
  }

  // Generate implementation for asHuman/asDroid getters for specific fragment types
  if (fragmentTypeName != null &&
      parentInlineFragments != null &&
      parentInlineFragments.isNotEmpty &&
      typeMap != null) {
    typeCastMethods = parentInlineFragments
        .where((frag) => frag.typeCondition != null)
        .map((frag) {
      final typeName = frag.typeCondition!.on.name.value;
      final methodName = "as$typeName";
      // Always use full class name with G prefix
      final returnTypeName = typeMap[typeName]!;

      return Method((b) => b
        ..annotations.add(refer("override"))
        ..type = MethodType.getter
        ..returns = TypeReference((tr) => tr
          ..symbol = returnTypeName
          ..isNullable = true)
        ..name = methodName
        ..lambda = true
        ..body = Code(typeName == fragmentTypeName ? "this" : "null"));
    }).toList();
  }

  // Add the type cast methods to field getters
  fieldGetters.addAll(typeCastMethods);

  // At the end of buildSelectionSetDataClasses before returning
  debugFieldGetters(name, fieldGetters);
  FragmentDebugger.exitScope("buildSelectionSetDataClasses: $name");

  return [
    if (inlineFragments.isNotEmpty)
      ...buildInlineFragmentClasses(
        name: name,
        fieldGetters: fieldGetters,
        selections: enhancedSelections, // Pass already enhanced selections
        schemaSource: schemaSource,
        type: type,
        typeOverrides: typeOverrides,
        fragmentMap: fragmentMap,
        dataClassAliasMap: dataClassAliasMap,
        superclassSelections: nestedSuperclassSelections,
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
            nestedSuperclassSelections.keys
                .where((superName) =>
                    !dataClassAliasMap.containsKey(builtClassName(superName)))
                .map<Reference>(
                  (superName) => refer(
                    builtClassName(superName),
                    (nestedSuperclassSelections[superName]?.url ?? "") +
                        "#data",
                  ),
                ),
          )
          ..methods.addAll([
            ...fieldGetters,
            buildToJsonGetter(
              builtClassName(name),
              implemented: false,
              isOverride: nestedSuperclassSelections.isNotEmpty,
            ),
          ]),
      )
    else
      builtClass(
        name: name,
        getters: fieldGetters,
        initializers: {
          // CRITICAL FIX: Always add G__typename initializer
          "G__typename": literalString(type),
        },
        superclassSelections: nestedSuperclassSelections,
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
      (field) {
        // Preserve the fragment context in the field name
        final String fieldName =
            "${name}_${field.alias?.value ?? field.name.value}";

        // IMPORTANT: Ensure __typename is included in nested field selections
        final fieldSelections = field.selectionSet != null
            ? ensureTypenameField(field.selectionSet!.selections)
            : <SelectionNode>[];

        // Track current fragment path to properly set up nested interfaces
        String currentFragmentPath = parentFragmentPath ?? name;
        if (name.contains("__as")) {
          currentFragmentPath = name;
        }

        // Pass parent inline fragments to nested fields
        List<InlineFragmentNode>? fieldParentInlineFragments;
        Map<String, String>? fieldTypeMap;

        // If the field is within a fragment's selections,
        // track nested fragments properly
        if (field.selectionSet != null &&
            fieldSelections.whereType<InlineFragmentNode>().isNotEmpty) {
          fieldParentInlineFragments =
              fieldSelections.whereType<InlineFragmentNode>().toList();

          // Create type map for the field's inline fragments
          fieldTypeMap = {};
          for (final frag in fieldParentInlineFragments) {
            if (frag.typeCondition != null) {
              final typeName = frag.typeCondition!.on.name.value;
              fieldTypeMap[typeName] =
                  builtClassName("${fieldName}__as$typeName");
            }
          }
        }

        return buildSelectionSetDataClasses(
          name: fieldName,
          selections:
              fieldSelections, // Use enhanced selections with __typename
          fragmentMap: fragmentMap,
          dataClassAliasMap: dataClassAliasMap,
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
            nestedSuperclassSelections,
            field,
          ),
          built: inlineFragments.isNotEmpty ? false : built,
          whenExtensionConfig: whenExtensionConfig,
          parentInlineFragments: fieldParentInlineFragments,
          typeMap: fieldTypeMap,
          parentFragmentPath: currentFragmentPath,
        );
      },
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

// Replace the mergeSelections method with this version
List<SelectionNode> mergeSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  // Debug: Log entry point and selections
  FragmentDebugger.enterScope("mergeSelections");
  FragmentDebugger.log("Input selections count: ${selections.length}");

  // IMPORTANT FIX: Make sure __typename is in all selections
  final enhancedSelectionsWithTypename = ensureTypenameField(selections);
  FragmentDebugger.log(
      "After ensuring __typename: ${enhancedSelectionsWithTypename.length} selections");

  // Debug: Show what's going into the expansion
  FragmentDebugger.dumpSelections(
      "Pre-expansion", enhancedSelectionsWithTypename);

  // Expand fragment spreads
  final expandedSelections =
      _expandFragmentSpreads(enhancedSelectionsWithTypename, fragmentMap);

  // Debug: Compare before and after expansion
  FragmentDebugger.dumpExpandedFragments("After fragment expansion",
      enhancedSelectionsWithTypename, expandedSelections);

  // Perform the merge
  final result = expandedSelections
      .fold<Map<String, SelectionNode>>(
        {},
        (selectionMap, selection) {
          if (selection is FieldNode) {
            final key = selection.alias?.value ?? selection.name.value;
            FragmentDebugger.log("Processing field: $key");

            if (selection.selectionSet == null) {
              selectionMap[key] = selection;
            } else {
              final existingNode = selectionMap[key];
              final existingSelections =
                  existingNode is FieldNode && existingNode.selectionSet != null
                      ? existingNode.selectionSet!.selections
                      : <SelectionNode>[];

              FragmentDebugger.log(
                  "Field $key has nested selections: ${selection.selectionSet!.selections.length}");
              if (existingSelections.isNotEmpty) {
                FragmentDebugger.log(
                    "Field $key already has ${existingSelections.length} selections");
              }

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
            FragmentDebugger.log("Processing inline fragment for type: $key");

            if (selectionMap.containsKey(key)) {
              FragmentDebugger.log(
                  "Merging with existing inline fragment for $key");
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

  // Debug: Log the result
  FragmentDebugger.dumpMergeResult("mergeSelections result", result);
  FragmentDebugger.exitScope("mergeSelections");

  return result;
}

// Replace the _expandFragmentSpreads method with this version
List<SelectionNode> _expandFragmentSpreads(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
  Set<String> visitedFragments = const {},
  String fragmentPath = "", // Add a path parameter to track context
]) {
  // Debug logging
  FragmentDebugger.enterScope("_expandFragmentSpreads");
  FragmentDebugger.log(
      "Input selections: ${selections.length}, retainFragmentSpreads: $retainFragmentSpreads");
  if (visitedFragments.isNotEmpty) {
    FragmentDebugger.log(
        "Already visited fragments: ${visitedFragments.join(', ')}");
  }

  // IMPORTANT FIX: Make sure __typename is present
  final enhancedSelectionsWithTypename = ensureTypenameField(selections);

  final result = <SelectionNode>[];
  final newVisitedFragments = {...visitedFragments};

  for (final selection in enhancedSelectionsWithTypename) {
    if (selection is FragmentSpreadNode) {
      final fragmentName = selection.name.value;
      FragmentDebugger.log("Processing fragment spread: $fragmentName");

      if (!fragmentMap.containsKey(fragmentName)) {
        FragmentDebugger.log(
            "ERROR: Fragment $fragmentName not found in fragmentMap!");
        throw Exception(
          "Couldn't find fragment definition for fragment spread '$fragmentName'",
        );
      }

      // Create context-aware fragment identifier using the path
      final contextualFragmentId = "$fragmentPath/$fragmentName";

      // Check for recursive fragments
      if (newVisitedFragments.contains(contextualFragmentId)) {
        FragmentDebugger.log(
            "Skipping recursive fragment: $contextualFragmentId");
        // Skip this fragment to avoid infinite recursion
        continue;
      }
      newVisitedFragments.add(contextualFragmentId);

      final fragmentSelections = fragmentMap[fragmentName]!.selections;
      FragmentDebugger.log(
          "Fragment $fragmentName has ${fragmentSelections.length} selections");
      FragmentDebugger.dumpSelections(
          "Fragment $fragmentName selections", fragmentSelections);

      if (retainFragmentSpreads) {
        FragmentDebugger.log("Retaining fragment spread for $fragmentName");
        result.add(selection);
      }

      // Recursively process the fragment selections
      final expandedFragmentSelections = _expandFragmentSpreads(
        fragmentSelections,
        fragmentMap,
        false,
        newVisitedFragments,
        "$fragmentPath/$fragmentName", // Track path for nested context
      );

      FragmentDebugger.log(
          "Adding ${expandedFragmentSelections.length} expanded selections from $fragmentName");
      result.addAll(expandedFragmentSelections);
    } else if (selection is FieldNode && selection.selectionSet != null) {
      final fieldName = selection.alias?.value ?? selection.name.value;
      FragmentDebugger.log("Processing field with selection set: $fieldName");

      // Process fields with selections - recursively expand any fragments they contain
      final expandedSelections = _expandFragmentSpreads(
        selection.selectionSet!.selections,
        fragmentMap,
        true,
        newVisitedFragments,
        "$fragmentPath/field:$fieldName", // Track field path for nested context
      );

      FragmentDebugger.log(
          "Field $fieldName yielded ${expandedSelections.length} expanded selections");

      // Create a new field node with the expanded selections
      result.add(FieldNode(
        name: selection.name,
        alias: selection.alias,
        arguments: selection.arguments,
        directives: selection.directives,
        selectionSet: SelectionSetNode(selections: expandedSelections),
      ));
    } else if (selection is InlineFragmentNode) {
      final typeName =
          selection.typeCondition?.on.name.value ?? "no-type-condition";
      FragmentDebugger.log("Processing inline fragment for type: $typeName");

      // Process inline fragments - recursively expand any nested fragments
      final expandedSelections = _expandFragmentSpreads(
        selection.selectionSet.selections,
        fragmentMap,
        true,
        newVisitedFragments,
        "$fragmentPath/inline:$typeName", // Track inline fragment path
      );

      FragmentDebugger.log(
          "Inline fragment for $typeName yielded ${expandedSelections.length} expanded selections");

      // Create a new inline fragment node with the expanded selections
      result.add(InlineFragmentNode(
        typeCondition: selection.typeCondition,
        directives: selection.directives,
        selectionSet: SelectionSetNode(selections: expandedSelections),
      ));
    } else {
      if (selection is FieldNode) {
        FragmentDebugger.log("Adding simple field: ${selection.name.value}");
      } else {
        FragmentDebugger.log(
            "Adding other selection type: ${selection.runtimeType}");
      }
      result.add(selection);
    }
  }

  FragmentDebugger.log("Final result count: ${result.length} selections");
  FragmentDebugger.exitScope("_expandFragmentSpreads");
  return result;
}

Map<String, SourceSelections> _fragmentSelectionsForField(
  Map<String, SourceSelections> fragmentMap,
  FieldNode field,
) {
  final result = <String, SourceSelections>{};

  for (final entry in fragmentMap.entries) {
    final superName = entry.key;
    final sourceSelections = entry.value;

    // Process regular field selections
    for (final selection
        in sourceSelections.selections.whereType<FieldNode>()) {
      if (selection.selectionSet == null) continue;

      final selectionKey = selection.alias?.value ?? selection.name.value;
      final fieldKey = field.alias?.value ?? field.name.value;

      if (selectionKey == fieldKey) {
        // Create nested fragment selection
        final nestedName = "${superName}_${fieldKey}";
        result[nestedName] = SourceSelections(
          url: sourceSelections.url,
          selections: selection.selectionSet!.selections
              .whereType<FieldNode>()
              .toList(),
        );
      }
    }

    // Look for specialized variants if this is an asType field
    if (superName.contains("__as")) {
      final baseFragmentName = superName.split("__as").first;
      final typeName = superName.split("__as").last.split("_").first;
      final fieldKey = field.alias?.value ?? field.name.value;

      // Check if there's a specialized nested interface
      final potentialNestedName =
          "${baseFragmentName}__as${typeName}_${fieldKey}";

      // Add as a potential interface that might need to be implemented
      // Even if we don't have selections for it yet
      if (!result.containsKey(potentialNestedName)) {
        result[potentialNestedName] = SourceSelections(
          url: sourceSelections.url,
          selections: [], // Empty selections since this is just for interface implementation
        );
      }
    }
  }

  return result;
}

// Helper function to identify all fragment interfaces that should be implemented
List<String> identifyFragmentInterfaces(
    String className,
    Map<String, SourceSelections> superclassSelections,
    Map<String, SourceSelections> fragmentMap) {
  final interfaces = <String>[];

  // Check for class name patterns:
  // 1. If it's a pattern like GheroFieldsFragmentData__asHuman_friends
  if (className.contains("__as") && className.contains("_")) {
    final parts = className.split("_");
    final basePart = parts.first; // GheroFieldsFragmentData__asHuman
    final fieldPart = parts.last; // friends

    if (basePart.contains("__as")) {
      final baseFragmentName =
          basePart.split("__as").first; // GheroFieldsFragmentData
      final typePart = basePart.split("__as").last; // Human

      // Look for interfaces like GheroFieldsFragment__asHuman_friends
      for (final entry in fragmentMap.entries) {
        final fragmentName = entry.key;
        // Check if there's a base fragment (without Data)
        if (baseFragmentName.endsWith("Data") &&
            fragmentName ==
                baseFragmentName.substring(0, baseFragmentName.length - 4)) {
          // Add the potential interface
          interfaces.add("${fragmentName}__as${typePart}_${fieldPart}");
        }
      }
    }
  }

  return interfaces;
}

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
