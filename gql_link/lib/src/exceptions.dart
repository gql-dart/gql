import "package:gql/execution.dart";
import "package:meta/meta.dart";

/// Exception occurring when serialization fails.
@immutable
class SerializerException implements Exception {
  /// The original exception causing this exception
  final Exception originalException;

  const SerializerException({
    @required this.originalException,
  });
}

/// Exception occurring when parsing fails.
@immutable
class ParserException implements Exception {
  /// The original exception causing this exception
  final Exception originalException;

  const ParserException({
    @required this.originalException,
  });
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class ServerException implements Exception {
  /// The parsed response
  final Response parsedResponse;

  const ServerException({
    @required this.parsedResponse,
  });
}
