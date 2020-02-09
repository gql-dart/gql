import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/req.dart";
import "package:gql_code_builder/src/source.dart";

Library buildReqLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String opDocUrl,
  String varDocUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          buildOperationReqClasses(
            docSource.flatDocument,
            schemaSource.flatDocument,
            opDocUrl,
            varDocUrl,
          ),
        ),
    );
