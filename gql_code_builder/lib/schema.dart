import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/schema.dart";
import "package:gql_code_builder/source.dart";

Library buildSchemaLibrary(
  SourceNode schemaSource,
) =>
    buildSchema(schemaSource.flatDocument) as Library;
