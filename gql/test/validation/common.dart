import "package:gql/language.dart";
import "package:gql/src/validation/validator.dart";
import "package:test/test.dart";

Matcher errorOfType<T extends ValidationError>() => predicate(
      (ValidationError error) => error is T,
    );

Matcher errorOfTypeWithMessage<T extends ValidationError>(String message) =>
    predicate(
      (ValidationError error) => error is T && message == error.message,
    );

Iterable<ValidationError> Function(String) createValidator(
  Set<ValidationRule> rules,
) =>
    (String source) => validate(
          parseString(source),
          rules,
        );
