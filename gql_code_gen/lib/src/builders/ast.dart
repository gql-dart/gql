import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/gql_code_gen.dart";
import "package:gql_code_gen/src/operation/args.dart";

Library buildAstLibrary(
  DocumentNode doc, [
  DocumentNode schema,
]) {
  final definitions = doc.definitions.map(
    (def) => fromNode(def).assignConst(_getName(def)).statement,
  );

  final document = refer(
    "DocumentNode",
    "package:gql/ast.dart",
  )
      .call(
        [],
        {
          "definitions": literalList(
            doc.definitions.map(
              (def) => refer(
                _getName(def),
              ),
            ),
          ),
        },
      )
      .assignConst("document")
      .statement;

  return Library(
    (b) => b.body
      ..addAll(definitions)
      ..add(document)
      ..addAll(
        schema != null ? buildOperationArgsClasses(doc) : [],
      ),
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
