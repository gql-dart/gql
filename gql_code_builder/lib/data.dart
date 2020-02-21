import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/data.dart";
import "package:gql_code_builder/source.dart";

Library buildDataLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildDataClasses(
            docSource,
            schemaSource,
          ),
        ),
    );
