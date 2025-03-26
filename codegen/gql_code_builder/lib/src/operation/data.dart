import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";
import "../inline_fragment_classes.dart";

/// Builds data classes for GraphQL operation (query/mutation/subscription).
///
/// Generates Dart classes that mirror the structure of the GraphQL operation
/// result, with properties for each selected field and nested objects for
/// nested selections.
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

  return buildSelectionSetDataClasses(
    name: "${op.name!.value}Data",
    selections: selections,
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

/// Builds data classes for GraphQL fragments.
///
/// For each fragment, builds both:
/// 1. An abstract interface class that defines the fragment's shape
/// 2. A concrete implementation class that can hold fragment data directly
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

/// Determines the root operation type (Query, Mutation, Subscription) from schema.
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

/// Builds data classes for a GraphQL selection set.
///
/// This is the core function for generating data classes. For a set of GraphQL
/// selections, it creates:
/// 1. A class representing those selections
/// 2. Classes for any nested selection sets
/// 3. Classes for any inline fragments (different object types) in the selections
///
/// When built=false, creates abstract classes (interfaces) instead of concrete classes.
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
  // Parameters for type-specific fragments
  bool isBaseClass = false,
  String? fragmentTypeName,
  List<InlineFragmentNode>? parentInlineFragments,
  Map<String, String>? typeMap,
  // Parameter for nested selections
  String? parentFragmentPath,
}) {
  // Process superclass selections and fragment spreads
  final nestedSuperclassSelections = _processSuperclassSelections(
    name,
    selections,
    superclassSelections,
    fragmentMap,
  );

  // Get all already processed fields to check for duplicates
  final superclassSelectionNodes = nestedSuperclassSelections.values
      .expand((selections) => selections.selections)
      .toSet();

  // Build field getters
  final fieldGetters = _buildFieldGetters(
    selections,
    schemaSource,
    type,
    typeOverrides,
    dataClassAliasMap,
    name,
    built,
    superclassSelectionNodes,
  );

  // Get inline fragments
  final inlineFragments = selections.whereType<InlineFragmentNode>().toList();

  // Build output classes
  final result = _buildOutputClasses(
    name,
    selections,
    fieldGetters,
    inlineFragments,
    built,
    dataClassAliasMap,
    nestedSuperclassSelections,
    type,
    schemaSource,
    typeOverrides,
    fragmentMap,
    whenExtensionConfig,
  );

  // Build classes for nested fields
  result.addAll(_buildNestedFieldClasses(
    name,
    selections,
    fragmentMap,
    dataClassAliasMap,
    schemaSource,
    type,
    typeOverrides,
    nestedSuperclassSelections,
    built,
    whenExtensionConfig,
    inlineFragments,
    parentFragmentPath,
  ));

  return result;
}

/// Remove redundant selections when using fragments.
///
/// When a fragment spread is used, fields that are already in that fragment
/// don't need to be duplicated in the selection set.
List<SelectionNode> shrinkSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  final unmerged = [...selections];

  // First, handle recursive structures (fields with selections and inline fragments)
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

  // Remove fields that are already included in spread fragments
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

/// Merge selections from multiple sources, combining fields and fragments.
///
/// This function:
/// 1. Ensures __typename is present
/// 2. Expands fragment spreads to include their fields
/// 3. Merges fields with the same name but different selections
/// 4. Merges inline fragments with the same type condition
List<SelectionNode> mergeSelections(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
) {
  // Expand fragment spreads
  final expandedSelections = _expandFragmentSpreads(selections, fragmentMap);

  // Perform the merge
  final result = expandedSelections
      .fold<Map<String, SelectionNode>>(
        {},
        (selectionMap, selection) {
          if (selection is FieldNode) {
            final key = selection.alias?.value ?? selection.name.value;

            if (selection.selectionSet == null) {
              selectionMap[key] = selection;
            } else {
              final existingNode = selectionMap[key];
              final existingSelections =
                  existingNode is FieldNode && existingNode.selectionSet != null
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
            final key = selection.typeCondition!.on.name.value;

            /// TODO: Handle inline fragments without a type condition
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

  return result;
}

/// Recursively expands fragment spreads into their component selections.
///
/// This replaces fragment spreads (e.g., "...MyFragment") with the fields
/// from those fragments, handling nested fragments recursively.
List<SelectionNode> _expandFragmentSpreads(
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap, [
  bool retainFragmentSpreads = true,
  Set<String> visitedFragments = const {},
  String fragmentPath = "", // Track path to detect recursive fragments
]) {
  final result = <SelectionNode>[];
  final newVisitedFragments = {...visitedFragments};

  for (final selection in selections) {
    if (selection is FragmentSpreadNode) {
      final fragmentName = selection.name.value;

      if (!fragmentMap.containsKey(fragmentName)) {
        throw Exception(
          "Couldn't find fragment definition for fragment spread '$fragmentName'",
        );
      }

      // Create context-aware fragment identifier using the path
      final contextualFragmentId = "$fragmentPath/$fragmentName";

      // Check for recursive fragments
      if (newVisitedFragments.contains(contextualFragmentId)) {
        // Skip this fragment to avoid infinite recursion
        continue;
      }
      newVisitedFragments.add(contextualFragmentId);

      final fragmentSelections = fragmentMap[fragmentName]!.selections;

      if (retainFragmentSpreads) {
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

      result.addAll(expandedFragmentSelections);
    } else if (selection is FieldNode && selection.selectionSet != null) {
      final fieldName = selection.alias?.value ?? selection.name.value;

      // Process fields with selections - recursively expand any fragments they contain
      final expandedSelections = _expandFragmentSpreads(
        selection.selectionSet!.selections,
        fragmentMap,
        true,
        newVisitedFragments,
        "$fragmentPath/field:$fieldName", // Track field path
      );

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

      // Process inline fragments - recursively expand any nested fragments
      final expandedSelections = _expandFragmentSpreads(
        selection.selectionSet.selections,
        fragmentMap,
        true,
        newVisitedFragments,
        "$fragmentPath/inline:$typeName", // Track inline fragment path
      );

      // Create a new inline fragment node with the expanded selections
      result.add(InlineFragmentNode(
        typeCondition: selection.typeCondition,
        directives: selection.directives,
        selectionSet: SelectionSetNode(selections: expandedSelections),
      ));
    } else {
      result.add(selection);
    }
  }

  return result;
}

Map<String, SourceSelections> _processSuperclassSelections(
  String name,
  List<SelectionNode> selections,
  Map<String, SourceSelections> superclassSelections,
  Map<String, SourceSelections> fragmentMap,
) {
  final Map<String, SourceSelections> nestedSuperclassSelections = {
    ...superclassSelections
  };

  // If this is a nested selection like __asHuman_friends, add corresponding fragment interfaces
  if (name.contains("_") && name.contains("__as")) {
    final parts = name.split("_");
    final fieldName = parts.last;
    final typeNamePart = name.split("__as").last.split("_").first;

    // Check for corresponding fragment interfaces for this nested field
    for (final superName in superclassSelections.keys.toList()) {
      if (superName.contains("__as$typeNamePart")) {
        // Parent fragment with same type condition
        final baseFragmentName = superName.split("__as").first;
        final potentialNestedInterface =
            "${baseFragmentName}__as${typeNamePart}_$fieldName";

        // Check if interface exists
        bool hasNestedInterface = false;
        for (final entry in fragmentMap.entries) {
          if (entry.key.contains(fieldName) &&
              entry.value.selections.isNotEmpty) {
            hasNestedInterface = true;
            break;
          }
        }

        if (hasNestedInterface) {
          // Add nested interface
          nestedSuperclassSelections[potentialNestedInterface] =
              SourceSelections(url: null, selections: []);
        }
      }
    }
  }

  // Add fragment spreads to superclass selections
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

  return nestedSuperclassSelections;
}

List<Method> _buildFieldGetters(
  List<SelectionNode> selections,
  SourceNode schemaSource,
  String type,
  Map<String, Reference> typeOverrides,
  Map<String, Reference> dataClassAliasMap,
  String name,
  bool built,
  Set<SelectionNode> superclassSelectionNodes,
) {
  // Track fields we've already processed to avoid duplicates
  final processedFieldsMap = <String, Method>{};

  return selections
      .whereType<FieldNode>()
      .map<Method?>(
        (node) {
          final nameNode = node.alias ?? node.name;
          final fieldName = nameNode.value;

          // Skip fields we've already processed
          if (processedFieldsMap.containsKey(fieldName)) {
            return null;
          }

          final typeDef = getTypeDefinitionNode(
            schemaSource.document,
            type,
          )!;
          final typeNode = _getFieldTypeNode(
            typeDef,
            node.name.value,
          );

          // Check if this field should override a superclass field
          final bool isOverride = superclassSelectionNodes.any((s) =>
              s is FieldNode && (s.alias?.value ?? s.name.value) == fieldName);

          final method = buildGetter(
            nameNode: nameNode,
            typeNode: typeNode,
            schemaSource: schemaSource,
            typeOverrides: typeOverrides,
            typeRefAlias:
                dataClassAliasMap[builtClassName("${name}_${nameNode.value}")],
            typeRefPrefix:
                node.selectionSet != null ? builtClassName(name) : null,
            built: built,
            isOverride: isOverride,
          );

          // Store the method in our map to track it and avoid duplicates
          processedFieldsMap[fieldName] = method;
          return method;
        },
      )
      .where((method) => method != null)
      .cast<Method>()
      .toList();
}

List<Spec> _buildOutputClasses(
  String name,
  List<SelectionNode> selections,
  List<Method> fieldGetters,
  List<InlineFragmentNode> inlineFragments,
  bool built,
  Map<String, Reference> dataClassAliasMap,
  Map<String, SourceSelections> nestedSuperclassSelections,
  String type,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  Map<String, SourceSelections> fragmentMap,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
) {
  final List<Spec> result = [];

  if (inlineFragments.isNotEmpty) {
    // Using existing buildInlineFragmentClasses method
    result.addAll(buildInlineFragmentClasses(
      name: name,
      fieldGetters: fieldGetters,
      selections: selections,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      fragmentMap: fragmentMap,
      dataClassAliasMap: dataClassAliasMap,
      superclassSelections: nestedSuperclassSelections,
      inlineFragments: inlineFragments,
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    ));
  } else if (!built && dataClassAliasMap[name] == null) {
    // For abstract (non-built) classes without an alias, create interface
    result.add(Class(
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
                  (nestedSuperclassSelections[superName]?.url ?? "") + "#data",
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
    ));
  } else {
    // Otherwise, create a regular built_value class
    result.add(builtClass(
      name: name,
      getters: fieldGetters,
      initializers: {
        "G__typename": literalString(type),
      },
      superclassSelections: nestedSuperclassSelections,
      dataClassAliasMap: dataClassAliasMap,
    ));
  }

  return result;
}

List<Spec> _buildNestedFieldClasses(
  String name,
  List<SelectionNode> selections,
  Map<String, SourceSelections> fragmentMap,
  Map<String, Reference> dataClassAliasMap,
  SourceNode schemaSource,
  String type,
  Map<String, Reference> typeOverrides,
  Map<String, SourceSelections> nestedSuperclassSelections,
  bool built,
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  List<InlineFragmentNode> inlineFragments,
  String? parentFragmentPath,
) =>
    selections
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

        final fieldSelections = field.selectionSet != null
            ? field.selectionSet!.selections
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
          selections: fieldSelections,
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
    ).toList();

// Helper method to build fragment selections for a field
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

// Helper method to get the field type node
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
