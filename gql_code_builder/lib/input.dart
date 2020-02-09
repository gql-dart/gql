import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/schema/input.dart";
import "package:gql_code_builder/src/source.dart";

Library buildInputLibrary(
  SourceNode source,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildInputClasses(
            source.flatDocument,
          ),
        ),
    );
