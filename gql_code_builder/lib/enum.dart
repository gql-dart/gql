import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/schema/enum.dart";

Library buildEnumLibrary(
  DocumentNode doc,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildEnumClasses(
            doc,
          ),
        ),
    );
