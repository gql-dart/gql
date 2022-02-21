import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/src/common.dart";

List<Class> buildOperationReqClasses(
  SourceNode docSource,
) =>
    docSource.document.definitions
        .whereType<OperationDefinitionNode>()
        .map(_buildOperationReqClass)
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
) =>
    builtClass(
      name: node.name!.value,
      getters: [
        Method(
          (b) => b
            ..returns = refer(
              "${builtClassName(node.name!.value)}Vars",
              "#var",
            )
            ..type = MethodType.getter
            ..name = "vars",
        ),
        Method(
          (b) => b
            ..returns = refer(
              "Operation",
              "package:gql_exec/gql_exec.dart",
            )
            ..type = MethodType.getter
            ..name = "operation",
        )
      ],
      initializers: {
        "operation": refer("Operation", "package:gql_exec/gql_exec.dart").call(
          [],
          {
            "document": refer("document", "#ast"),
            "operationName": literalString(node.name!.value),
          },
        ),
      },
    );
