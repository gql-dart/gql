import "package:gql/ast.dart" as ast;
import "package:gql/cats/cats.dart";
import "package:gql/language.dart" as lang;

import "cats_base/cats_runner.dart";

class IdentityTransformer extends ast.TransformingVisitor {
  const IdentityTransformer();
}

class RecursiveVisitor extends ast.RecursiveVisitor {
  const RecursiveVisitor();
}

class MyDriver extends CatDriver<ast.DocumentNode> {
  @override
  ast.DocumentNode parse({
    required source,
  }) =>
      lang.parseString(source);

  @override
  void execute({
    schema,
    dynamic testData,
    query,
    String? operation,
    variables,
  }) =>
      null;

  @override
  Iterable<DriverError> validate({
    schema,
    query,
    validationRules,
  }) =>
      [];
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
