import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "../utils/class_utils.dart";
import "../utils/field_utils.dart";

/// Builds data classes for a GraphQL selection set.
///
/// This is the core function for generating data classes. For a set of GraphQL
/// selections, it creates:
/// 1. A class representing those selections
/// 2. Classes for any nested selection sets
/// 3. Classes for any inline fragments (different object types) in the selections
///
/// When built=false, creates abstract classes (interfaces) instead of concrete classes.
///
/// Example: For a selection set with fields "name" and "friends",
/// creates appropriate classes to hold that data structure.
List<Spec> buildSelectionSetDataClasses({
  required String name,
  required List<SelectionNode> selections,
  required SourceNode docSource,
  required SourceNode schemaSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, Reference> dataClassAliasMap,
  required Map<String, SourceSelections> superclassSelections,
  bool built = true,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  bool isBaseClass = false,
  String? fragmentTypeName,
  List<InlineFragmentNode>? parentInlineFragments,
  Map<String, String>? typeMap,
  String? parentFragmentPath,
}) {
  // Process superclass selections and fragment spreads
  final nestedSuperclassSelections = processSuperclassSelections(
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
  final fieldGetters = buildFieldGetters(
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
  final result = buildOutputClasses(
    name,
    selections,
    fieldGetters,
    inlineFragments,
    built,
    dataClassAliasMap,
    nestedSuperclassSelections,
    type,
    docSource,
    schemaSource,
    typeOverrides,
    fragmentMap,
    whenExtensionConfig,
  );

  // Build classes for nested fields
  result.addAll(buildNestedFieldClasses(
    name,
    selections,
    fragmentMap,
    dataClassAliasMap,
    docSource,
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
