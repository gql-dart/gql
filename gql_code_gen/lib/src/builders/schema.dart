import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/gql_code_gen.dart";

Library buildSchemaLibrary(
  DocumentNode schema,
  String part,
) {
  final library = buildSchema(schema) as Library;

  if (library.body.isEmpty) return null;

  return library.rebuild(
    (b) => b
      ..body = ListBuilder<Spec>(<Spec>[
        Code(
          "part '${part}';",
        ),
        ...library.body,
      ]),
  );
}
