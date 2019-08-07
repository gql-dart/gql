import "package:gql/src/ast/ast.dart";
import "package:gql/src/validation/rules/executable_definitions.dart";
import "package:gql/src/validation/validating_visitor.dart";

class ValidationError {
  String message;
  Node node;

  ValidationError({
    this.message,
    this.node,
  });
}

enum ValidationRule {
  executableDefinitions,
}

ValidatingVisitor _mapRule(ValidationRule rule) {
  switch (rule) {
    case ValidationRule.executableDefinitions:
      return ExecutableDefinitions();
  }
}

class Validator {
  Set<ValidationRule> rules;

  Validator({
    this.rules,
  });

  List<ValidationError> validate({
    DocumentNode query,
  }) {
    final visitor = ParallelVisitor(visitors: rules.map(_mapRule));

    visitor.visitDocumentNode(query);

    return visitor.errors;
  }
}
