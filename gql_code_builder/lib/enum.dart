import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/schema/enum.dart";
import "package:gql_code_builder/source.dart";

Library buildEnumLibrary(
  SourceNode source,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildEnumClasses(
            source.flatDocument,
          ),
        ),
    );
