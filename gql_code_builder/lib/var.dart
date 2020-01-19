import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/operation/var.dart";

Library buildVarLibrary(
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildOperationVarClasses(
            doc,
            schema,
            schemaUrl,
          ),
        ),
    );
