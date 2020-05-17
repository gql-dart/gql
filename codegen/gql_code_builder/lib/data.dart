import "package:code_builder/code_builder.dart";
import "package:built_collection/built_collection.dart";
import "package:gql/ast.dart";

import "./source.dart";
import "./src/operation/data.dart";

Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
) {
  final operationDataClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .expand(
        (op) => buildOperationDataClasses(
          op,
          docSource,
          schemaSource,
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
        ),
      )
      .toList();

  return Library(
    (b) => b
      ..directives = ListBuilder(<Directive>[
        if (operationDataClasses.isNotEmpty) Directive.part(partUrl),
      ])
      ..body = ListBuilder(<Spec>[
        ...operationDataClasses,
        ...fragmentDataClasses,
      ]),
  );
}
