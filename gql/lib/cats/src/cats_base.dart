import "package:gql/cats/cats.dart";

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
