import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/operation/args.dart";

Library buildReqLibrary(
  DocumentNode doc,
  DocumentNode schema,
  String opDocUrl,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildOperationArgsClasses(
            doc,
            schema,
            opDocUrl,
            schemaUrl,
          ),
        ),
    );
