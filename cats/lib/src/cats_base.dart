import 'package:test/test.dart';
import './cat_builder.dart';
import './cat_model.dart';

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
    var suite = _builder.buildSuite(suitePath);

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
    var passesAssertion = testCase.assertions!.firstWhere(
      (a) => a is PassesAssertion,
      orElse: () => null,
    ) as PassesAssertion?;
    var syntaxAssertion = testCase.assertions!.firstWhere(
      (a) => a is SyntaxErrorAssertion,
      orElse: () => null,
    ) as SyntaxErrorAssertion?;
    var errorCountAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorCountAssertion,
      orElse: () => null,
    ) as ErrorCountAssertion?;
    var errorCodeAssertions =
        testCase.assertions!.whereType<ErrorCodeAssertion>();
    var errorContainsAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorContainsAssertion,
      orElse: () => null,
    ) as ErrorContainsAssertion?;
    var errorRegexAssertion = testCase.assertions!.firstWhere(
      (a) => a is ErrorRegexAssertion,
      orElse: () => null,
    ) as ErrorRegexAssertion?;

    group(testCase.name, () {
      var queryDoc;
      var queryParsingError;

      var schemaDoc;
      var schemaParsingError;

      Iterable<DriverError> validationErrors;

      var executionResult;
      var executionError;

      setUp(() {
        try {
          queryDoc = driver!.parse(
            source: testCase.query,
          );
        } catch (e) {
          queryParsingError = e;
        }

        if (testCase.action is! ParsingAction) {
          var schema = testCase.schema ?? scenario.schema;

          if (schema != null) {
            try {
              schemaDoc = driver!.parse(
                source: schema,
              );
            } catch (e) {
              schemaParsingError = e;
            }
          }

          var validationRules = testCase.action is ValidationAction
              ? (testCase.action as ValidationAction).validationRules
              : null;

          validationErrors = driver!.validate(
            schema: schemaDoc,
            query: queryDoc,
            validationRules: validationRules,
          );
        }

        if (testCase.action is ExecutionAction) {
          var action = testCase.action as ExecutionAction;
          var testData = (testCase.testData ?? scenario.testData);

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

      group('Query parsing', () {
        if (testCase.action is! ParsingAction) {
          test('parses successfuly', () {
            expect(queryDoc, isNotNull);
            expect(queryParsingError, isNull);
          });
        } else {
          if ((passesAssertion == null || passesAssertion.passes!) &&
              !(syntaxAssertion != null && syntaxAssertion.syntaxError!)) {
            test('parses successfuly', () {
              expect(queryDoc, isNotNull);
              expect(queryParsingError, isNull);
            });
          }
          if (syntaxAssertion != null && syntaxAssertion.syntaxError!) {
            test('throws syntax error', () {
              expect(queryDoc, isNull);
              expect(queryParsingError, isNotNull);
            });
          }
        }
      });

      if (testCase.action is! ParsingAction) {
        group('Schema parsing', () {
          test('parses successfuly', () {
            expect(schemaDoc, isNotNull);
            expect(schemaParsingError, isNull);
          });
        });

//        if (testCase.action is ValidationAction) {
//          group('Validation', () {
//            if (passesAssertion != null && passesAssertion.passes) {
//              test('validates without errors', () {
//                expect(validationErrors, isNotNull);
//                expect(validationErrors, isEmpty);
//              });
//            }
//            if (errorCountAssertion != null) {
//              test('returns expected count of errors', () {
//                expect(validationErrors.length, errorCountAssertion.count);
//              });
//            }
//            if (errorCodeAssertions.isNotEmpty) {
//              errorCodeAssertions.forEach(
//                (errorCodeAssertion) {
//                  test(
//                    'returns error code ${errorCodeAssertion.errorCode}',
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
