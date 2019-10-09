import "package:gql/execution.dart";
import "package:meta/meta.dart";

/// A base class for exceptions thrown by links
@immutable
abstract class LinkException implements Exception {
  /// The original exception causing this exception
  final dynamic originalException;

  const LinkException(
    this.originalException,
  );
}

/// Exception occurring when a terminating link
/// tries to serialize the request
@immutable
class RequestFormatException extends LinkException {
  /// The request being serialized when the error occurred
  final Request request;

  const RequestFormatException({
    @required this.request,
    dynamic originalException,
  }) : super(originalException);
}

/// Exception occurring when a terminating link
/// tries to parse the response
@immutable
class ResponseFormatException extends LinkException {
  const ResponseFormatException({
    dynamic originalException,
  }) : super(originalException);
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class ServerException extends LinkException {
  /// The parsed response
  final Response parsedResponse;

  const ServerException({
    @required this.parsedResponse,
    dynamic originalException,
  }) : super(originalException);
}
