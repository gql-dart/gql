import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/operation/data.dart";

Library buildDataLibrary(
  DocumentNode doc,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildDataClasses(
            doc,
            fragmentsDocUrl,
            schema,
            schemaUrl,
          ),
        ),
    );
