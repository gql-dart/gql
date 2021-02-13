class Suite {
  Iterable<Scenario>? scenarios;

  Map<String, ErrorDefinition>? errorMapping;

  Suite({
    this.scenarios,
    this.errorMapping,
  });
}

class Scenario {
  String? folder;
  String? file;

  String? name;

  String? schema;
  Map<String, dynamic>? testData;

  Iterable<TestCase>? tests;

  Scenario({
    this.folder,
    this.file,
    this.name,
    this.schema,
    this.testData,
    this.tests,
  });
}

class TestCase {
  String? name;

  String query;
  String? schema;
  Map<String, dynamic>? testData;

  Action? action;

  Iterable<Assertion?>? assertions;

  TestCase({
    this.name,
    required this.query,
    this.schema,
    this.testData,
    this.action,
    this.assertions,
  });
}

abstract class Action {}

class ParsingAction extends Action {}

class ValidationAction extends Action {
  Iterable<String?> validationRules;

  ValidationAction(this.validationRules);
}

class ExecutionAction extends Action {
  String? operationName;
  Map<String, dynamic>? variables;
  bool? validateQuery;
  String? testValue;

  ExecutionAction({
    this.operationName,
    this.variables,
    this.validateQuery = true,
    this.testValue,
  });
}

abstract class Assertion {}

class PassesAssertion extends Assertion {
  bool? passes;

  PassesAssertion({
    this.passes,
  });
}

class SyntaxErrorAssertion extends Assertion {
  bool? syntaxError;

  SyntaxErrorAssertion({
    this.syntaxError,
  });
}

class DataAssertion extends Assertion {
  Map<String, dynamic>? data;
}

class ErrorCountAssertion extends Assertion {
  int? count;

  ErrorCountAssertion({
    this.count,
  });
}

class ErrorCodeAssertion extends Assertion {
  String? errorCode;
  Map<String, String>? args;
  Iterable<Location>? locations;

  ErrorCodeAssertion({
    this.errorCode,
    this.args,
    this.locations,
  });
}

class ErrorContainsAssertion extends Assertion {
  String? error;
  Iterable<Location>? locations;
}

class ErrorRegexAssertion extends Assertion {
  String? errorRegex;
  Iterable<Location>? locations;
}

class ExecutionExceptionContainsAssertion extends Assertion {
  String? exception;
}

class ExecutionExceptionRegexAssertion extends Assertion {
  String? errorRegex;
}

class Location {
  int? line;
  int? column;
}

class ErrorDefinition {
  String? message;
  String? specReference;
  String? implementationReference;
}

class DriverError {
  String? code;
  String? message;
  Location? location;

  DriverError({
    this.code,
    this.message,
    this.location,
  });
}

class DriverException {
  String? message;
}
