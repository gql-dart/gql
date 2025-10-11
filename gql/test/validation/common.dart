import "package:gql/language.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

Matcher errorOfType<T extends ValidationError>() => predicate(
      (ValidationError error) => error is T,
    );

Iterable<ValidationError> Function(String) createValidator(
  Set<ValidationRule> rules,
) =>
    (String source) => validate(
          parseString(source),
          rules,
        );
