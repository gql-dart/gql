import "package:gql/execution.dart";
import "package:http/http.dart" as http;
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

  /// Response which caused the exception
  final http.Response response;

  const ParserException({
    @required this.originalException,
    @required this.response,
  });
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class ServerException implements Exception {
  /// Response which caused the exception
  final http.Response response;

  /// The parsed response
  final Response parsedResponse;

  const ServerException({
    @required this.response,
    @required this.parsedResponse,
  });
}
