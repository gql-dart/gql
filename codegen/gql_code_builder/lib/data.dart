import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";

import "./source.dart";
import "./src/operation/data.dart";

export "package:gql_code_builder/src/config/when_extension_config.dart";

Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides, [
  InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig =
      const InlineFragmentSpreadWhenExtensionConfig(
    generateWhenExtensionMethod: false,
    generateMaybeWhenExtensionMethod: false,
  ),
]) {
  final operationDataClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .expand(
        (op) => buildOperationDataClasses(
          op,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
        ),
      )
      .toList();

  final fragmentDataClasses = docSource.document.definitions
      .whereType<FragmentDefinitionNode>()
      .expand(
        (frag) => buildFragmentDataClasses(
          frag,
          docSource,
          schemaSource,
          typeOverrides,
          whenExtensionConfig,
        ),
      )
      .toList();

  return Library(
    (b) => b
      ..directives.add(Directive.part(partUrl))
      ..body = ListBuilder(<Spec>[
        ...operationDataClasses,
        ...fragmentDataClasses,
      ]),
  );
}
