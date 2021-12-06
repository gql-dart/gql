import "package:gql/cats/cats.dart";
import "package:test/test.dart";

abstract class CatDriver<Doc> {
  Doc parse({
    required String source,
  });

  Iterable<DriverError> validate({
    Doc? schema,
    Doc? query,
    Iterable<String?>? validationRules,
  });

  dynamic execute({
    Doc? schema,
    dynamic testData,
    Doc? query,
    String? operation,
    Map<String, dynamic>? variables,
  });
}

class CatRunner<Doc> {
  final _builder = CatBuilder();
  CatDriver<Doc>? driver;
  List? whitelist;

  CatRunner({
    this.driver,
    this.whitelist,
  });

  void runSuite(String suitePath) {
    final suite = _builder.buildSuite(suitePath);

    suite.scenarios!.forEach(_runScenario);
  }

  void _runScenario(Scenario scenario) {
    if (whitelist != null && !whitelist!.contains(scenario.file)) return;
    group(scenario.name, () {
      scenario.tests!.forEach(
        (test) => _runTest(test, scenario),
      );
    });
  }

  void _runTest(TestCase testCase, Scenario scenario) {
    final passesAssertion = testCase.assertions!.firstWhere(
      (a) => a is PassesAssertion,
      orElse: () => null,
    ) as PassesAssertion?;
    final syntaxAssertion = testCase.assertions!.firstWhere(
      (a) => a is SyntaxErrorAssertion,
      orElse: () => null,
    ) as SyntaxErrorAssertion?;
    // ignore: unused_local_variable
    final errorCountAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorCountAssertion,
      orElse: () => null,
    ) as ErrorCountAssertion?;
    // ignore: unused_local_variable
    final errorCodeAssertions =
        testCase.assertions!.whereType<ErrorCodeAssertion>();
    // ignore: unused_local_variable
    final errorContainsAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorContainsAssertion,
      orElse: () => null,
    ) as ErrorContainsAssertion?;
    // ignore: unused_local_variable
    final errorRegexAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorRegexAssertion,
      orElse: () => null,
    ) as ErrorRegexAssertion?;

    group(testCase.name, () {
      Doc? queryDoc;
      Object? queryParsingError;

      Doc? schemaDoc;
      Object? schemaParsingError;

      // ignore: unused_local_variable
      Iterable<DriverError> validationErrors;

      // ignore: unused_local_variable
      dynamic executionResult;
      // ignore: unused_local_variable
      dynamic executionError;

      setUp(() {
        try {
          queryDoc = driver!.parse(
            source: testCase.query,
          );
        } catch (e) {
          queryParsingError = e;
        }

        if (testCase.action is! ParsingAction) {
          final schema = testCase.schema ?? scenario.schema;

          if (schema != null) {
            try {
              schemaDoc = driver!.parse(
                source: schema,
              );
            } catch (e) {
              schemaParsingError = e;
            }
          }

          final validationRules = testCase.action is ValidationAction
              ? (testCase.action as ValidationAction).validationRules
              : null;

          validationErrors = driver!.validate(
            schema: schemaDoc,
            query: queryDoc,
            validationRules: validationRules,
          );
        }

        if (testCase.action is ExecutionAction) {
          final action = testCase.action as ExecutionAction;
          final testData = testCase.testData ?? scenario.testData;

          try {
            executionResult = driver!.execute(
              query: queryDoc,
              schema: schemaDoc,
              testData:
                  testData != null && testData.containsKey(action.testValue)
                      ? testData[action.testValue!]
                      : testData,
              operation: action.operationName,
              variables: action.variables,
            );
          } catch (e) {
            executionError = e;
          }
        }
      });

      group("Query parsing", () {
        if (testCase.action is! ParsingAction) {
          test("parses successfuly", () {
            expect(queryDoc, isNotNull);
            expect(queryParsingError, isNull);
          });
        } else {
          if ((passesAssertion == null || passesAssertion.passes!) &&
              !(syntaxAssertion != null && syntaxAssertion.syntaxError!)) {
            test("parses successfuly", () {
              expect(queryDoc, isNotNull);
              expect(queryParsingError, isNull);
            });
          }
          if (syntaxAssertion != null && syntaxAssertion.syntaxError!) {
            test("throws syntax error", () {
              expect(queryDoc, isNull);
              expect(queryParsingError, isNotNull);
            });
          }
        }
      });

      if (testCase.action is! ParsingAction) {
        group("Schema parsing", () {
          test("parses successfuly", () {
            expect(schemaDoc, isNotNull);
            expect(schemaParsingError, isNull);
          });
        });

//        if (testCase.action is ValidationAction) {
//          group("Validation", () {
//            if (passesAssertion != null && passesAssertion.passes) {
//              test("validates without errors", () {
//                expect(validationErrors, isNotNull);
//                expect(validationErrors, isEmpty);
//              });
//            }
//            if (errorCountAssertion != null) {
//              test("returns expected count of errors", () {
//                expect(validationErrors.length, errorCountAssertion.count);
//              });
//            }
//            if (errorCodeAssertions.isNotEmpty) {
//              errorCodeAssertions.forEach(
//                (errorCodeAssertion) {
//                  test(
//                    "returns error code ${errorCodeAssertion.errorCode}",
//                    () {
//                      expect(
//                        "error message",
//                        errorCodeAssertion.errorCode,
//                      );
//                      expect(
//                        "locations",
//                        errorCodeAssertion.locations,
//                      );
//                    },
//                  );
//                },
//              );
//            }
//          });
//        }
      }
    });
  }
}
