import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "./source.dart";
import "./src/operation/data.dart";

Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides,
) {
  final operationDataClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .expand(
        (op) => buildOperationDataClasses(
          op,
          docSource,
          schemaSource,
          typeOverrides,
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
