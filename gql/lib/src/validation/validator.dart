import "package:gql/ast.dart" as ast;
import "package:gql/src/validation/rules/lone_schema_definition.dart";
import "package:gql/src/validation/rules/unique_directive_names.dart";
import "package:gql/src/validation/rules/unique_enum_value_names.dart";
import "package:gql/src/validation/rules/unique_field_definition_names.dart";
import "package:gql/src/validation/rules/unique_operation_types.dart";
import "package:gql/src/validation/validating_visitor.dart";
import "package:meta/meta.dart";

/// Validates a [schema]
Iterable<ValidationError> validateSchema(
  ast.Node schema,
) {
  final validator = _Validator(
    rules: {
      ValidationRule.uniqueDirectiveNames,
      ValidationRule.uniqueFieldDefinitionNames,
      ValidationRule.uniqueEnumValueNames,
      ValidationRule.loneSchemaDefinition,
      ValidationRule.uniqueOperationTypes,
    },
  );

  return validator.validate(
    node: schema,
  );
}

/// Validates an [operation] without knowing anything
/// about the schema
Iterable<ValidationError> validateOperation(
  ast.Node operation,
) {
  final validator = _Validator(
    rules: {},
  );

  return validator.validate(
    node: operation,
  );
}

/// Validates a [node] given a [Set] of [ValidationRule]s
Iterable<ValidationError> validate(
  ast.Node node,
  Set<ValidationRule> rules,
) {
  final validator = _Validator(
    rules: rules,
  );

  return validator.validate(
    node: node,
  );
}

/// Validates an [operation] in the context of [schema]
///
/// Assumes valid [schema]
Iterable<ValidationError> validateRequest(
  ast.DocumentNode schema,
  ast.DocumentNode operation,
) {
  final validator = _Validator(
    rules: {},
  );

  return validator.validate(
    node: operation,
  );
}

/// A base class for validation errors
@immutable
abstract class ValidationError {
  final String message;
  final ast.Node node;

  const ValidationError({
    this.message,
    this.node,
  });
}

/// Available validation rules
enum ValidationRule {
  uniqueDirectiveNames,
  uniqueFieldDefinitionNames,
  uniqueEnumValueNames,
  loneSchemaDefinition,
  uniqueOperationTypes,
}

ValidatingVisitor _mapRule(ValidationRule rule) {
  switch (rule) {
    case ValidationRule.uniqueDirectiveNames:
      return UniqueDirectiveNames();
    case ValidationRule.uniqueEnumValueNames:
      return UniqueEnumValueNames();
    case ValidationRule.uniqueFieldDefinitionNames:
      return UniqueFieldDefinitionNames();
    case ValidationRule.loneSchemaDefinition:
      return LoneSchemaDefinition();
    case ValidationRule.uniqueOperationTypes:
      return UniqueOperationTypes();
    default:
      return null;
  }
}

class _Validator {
  Set<ValidationRule> rules;

  _Validator({
    this.rules,
  });

  Iterable<ValidationError> validate({
    ast.Node node,
  }) {
    final visitor = ast.AccumulatingVisitor<ValidationError>(
      visitors: rules.map(_mapRule).toList(),
    );

    node.accept(visitor);

    return visitor.accumulator;
  }
}
