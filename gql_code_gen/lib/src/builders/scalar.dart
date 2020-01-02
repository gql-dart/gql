import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/schema/scalar.dart";

Library buildScalarLibrary(
  DocumentNode doc,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildScalarClasses(
            doc,
          ),
        ),
    );
