import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/gql_code_gen.dart";

Library buildSchemaLibrary(
  DocumentNode schema,
) =>
    buildSchema(schema) as Library;
