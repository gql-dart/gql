import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/schema.dart";
import "package:gql_code_builder/source.dart";

Library buildSchemaLibrary(
  SourceNode schemaSource,
  String partUrl,
) {
  final lib = buildSchema(schemaSource) as Library;

  return lib.rebuild(
    (b) => b
      ..directives.add(
        Directive.part(partUrl),
      ),
  );
}
