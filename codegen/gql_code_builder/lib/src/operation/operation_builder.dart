import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "../common.dart";
import "../utils/selection_utils.dart";
import "../utils/type_utils.dart";
import "selection_builder.dart";

/// Builds data classes for GraphQL operation (query/mutation/subscription).
///
/// Generates Dart classes that mirror the structure of the GraphQL operation
/// result, with properties for each selected field and nested objects for
/// nested selections.
///
/// Example:
/// ```graphql
/// query GetHero($episode: Episode) {
///   hero(episode: $episode) {
///     name
///     friends {
///       name
///     }
///   }
/// }
/// ```
/// Will generate classes like `GGetHeroData`, `GGetHeroData_hero`, etc.
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
    docSource: docSource,
    schemaSource: schemaSource,
    type: determineOperationType(
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
