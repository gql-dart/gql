import "package:gql/ast.dart" as ast;
import "package:gql/language.dart" as lang;
import "package:source_span/source_span.dart";

import "package:cats/cats.dart";

class IdentityTransformer extends ast.TransformingVisitor {}

class RecursiveVisitor extends ast.RecursiveVisitor {}

class MyDriver extends CatDriver<ast.DocumentNode> {
  @override
  parse({
    source,
  }) =>
      lang.parse(
        SourceFile.fromString(source),
      );

  @override
  void execute({
    schema,
    dynamic testData,
    query,
    String operation,
    variables,
  }) =>
      null;

  @override
  validate({
    schema,
    query,
    validationRules,
  }) =>
      null;
}

void main() {
  CatRunner(
    driver: MyDriver(),
    whitelist: <String>[
      "./test/scenarios/parsing/Exceptions.yaml",
      "./test/scenarios/parsing/SchemaParser.yaml",
      "./test/scenarios/parsing/QueryParser.yaml",
    ],
  ).runSuite("./test/scenarios");
}
