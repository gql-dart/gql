import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/operation/req.dart";

Library buildReqLibrary(
  SourceNode docSource,
  String partUrl,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partUrl))
        ..body.addAll(
          buildOperationReqClasses(
            docSource,
          ),
        ),
    );
