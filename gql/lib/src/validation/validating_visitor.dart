import "package:gql/ast.dart";
import "package:gql/src/validation/validator.dart";

abstract class ValidatingVisitor extends SimpleVisitor<List<ValidationError>> {
  const ValidatingVisitor();
}
