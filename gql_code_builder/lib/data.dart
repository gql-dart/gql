import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/operation/data.dart";

Library buildDataLibrary(
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildDataClasses(
            doc,
            schema,
            schemaUrl,
          ),
        ),
    );
