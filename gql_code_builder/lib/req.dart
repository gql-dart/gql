import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/req.dart";
import "package:gql_code_builder/source.dart";

Library buildReqLibrary(
  SourceNode docSource,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildOperationReqClasses(
            docSource.flatDocument,
          ),
        ),
    );
