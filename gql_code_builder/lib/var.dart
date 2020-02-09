import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/var.dart";
import "package:gql_code_builder/src/source.dart";

Library buildVarLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildOperationVarClasses(
            docSource.flatDocument,
            schemaSource.flatDocument,
            schemaUrl,
          ),
        ),
    );
