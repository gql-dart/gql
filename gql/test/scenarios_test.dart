import "package:gql/language.dart" as lang;
import "package:source_span/source_span.dart";

import "package:cats/cats.dart";

class IdentityTransformer extends lang.TransformingVisitor {}

class RecursiveVisitor extends lang.RecursiveVisitor {}

class MyDriver extends CatDriver {
  @override
  parse({
    String source,
  }) {
    final parsed = lang.parse(
      SourceFile.fromString(source),
    );

    final transformed = lang.transform(
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
  execute({
    schema,
    testData,
    query,
    String operation,
    Map<String, dynamic> variables,
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

main() {
  CatRunner(
    driver: MyDriver(),
  ).runSuite("./test/scenarios");
}
