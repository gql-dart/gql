import "package:gql/language.dart";
import "package:gql/src/validation/validator.dart";

abstract class ValidatingVisitor
    extends SimpleVisitor<Iterable<ValidationError>> {}

class ParallelVisitor extends RecursiveVisitor {
  Iterable<ValidatingVisitor> visitors;
  List<ValidationError> errors = [];

  ParallelVisitor({
    this.visitors = const [],
  });

  @override
  visitDocumentNode(DocumentNode node) {
    errors.addAll(
      visitors.expand(
        (visitor) => visitor.visitDocumentNode(node) ?? <ValidationError>[],
      ),
    );
  }
}
