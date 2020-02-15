import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/data.dart";
import "package:gql_code_builder/source.dart";

Library buildDataLibrary(
  SourceNode docSource,
  String fragmentsDocUrl,
  SourceNode schemaSource,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildDataClasses(
            docSource.flatDocument,
            fragmentsDocUrl,
            schemaSource.flatDocument,
            schemaUrl,
          ),
        ),
    );
