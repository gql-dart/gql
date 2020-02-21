import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";

Library buildOpLibrary(
  SourceNode docSource,
) {
  final doc = docSource.flatDocument;

  final operations = doc.definitions.whereType<OperationDefinitionNode>().map(
        (def) => refer(
          "Operation",
          "package:gql_exec/gql_exec.dart",
        )
            .call(
              [],
              {
                "document": refer("document", "#ast"),
                "operationName": literalString(
                  def.name?.value,
                ),
              },
            )
            .assignConst(
              _getName(def),
            )
            .statement,
      );

  return Library(
    (b) => b.body..addAll(operations),
  );
}

String _getName(DefinitionNode def) {
  if (def.name != null && def.name.value != null) return def.name.value;

  if (def is SchemaDefinitionNode) return "schema";

  if (def is OperationDefinitionNode) {
    if (def.type == OperationType.query) return "query";
    if (def.type == OperationType.mutation) return "mutation";
    if (def.type == OperationType.subscription) return "subscription";
  }

  return null;
}
