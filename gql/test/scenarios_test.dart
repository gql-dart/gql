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
  }) {
    final parsed = lang.parse(
      SourceFile.fromString(source),
    );

    final transformed = ast.transform(
      parsed,
      [
        IdentityTransformer(),
      ],
    );

    transformed.accept(
      RecursiveVisitor(),
    );

    return lang.parse(
      SourceFile.fromString(
        lang.printNode(transformed),
      ),
    );
  }

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
  //{
  // final rules = validationRules.map(
  //   (rule) {
  //     switch (rule) {
  //       case "ExecutableDefinitions":
  //         return ValidationRule.executableDefinitions;
  //       default:
  //         return null;
  //     }
  //   },
  // );
  // final validator = Validator(
  //   rules: Set.from(rules),
  // );

  // return validator
  //     .validate(
  //       query: query,
  //     )
  //     .map(
  //       (error) => DriverError(
  //         message: error.message,
  //       ),
  //     );
  //}
}

void main() {
  CatRunner(
    driver: MyDriver(),
  ).runSuite("./test/scenarios");
}
