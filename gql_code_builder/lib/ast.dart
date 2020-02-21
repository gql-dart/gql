import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/ast.dart";
import "package:gql_code_builder/source.dart";

Library buildAstLibrary(
  SourceNode source,
) {
  final definitions = source.document.definitions.map(
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
            source.getRefs().map(
                  (ref) => Reference(
                    ref.symbol,
                    ref.url + "#ast",
                  ),
                ),
          ),
        },
      )
      .assignConst("document")
      .statement;

  return Library(
    (b) => b
      ..body = ListBuilder<Spec>(
        <Spec>[
          ...definitions,
          document,
        ],
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
