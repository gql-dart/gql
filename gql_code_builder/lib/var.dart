import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/src/operation/var.dart";
import "package:gql_code_builder/source.dart";

Library buildVarLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String generatedPartName,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(generatedPartName))
        ..body.addAll(
          buildOperationVarClasses(
            docSource,
            schemaSource,
          ),
        ),
    );
