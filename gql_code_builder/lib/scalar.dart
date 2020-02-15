import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/schema/scalar.dart";
import "package:gql_code_builder/source.dart";

Library buildScalarLibrary(
  SourceNode source,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildScalarClasses(
            source.flatDocument,
          ),
        ),
    );
