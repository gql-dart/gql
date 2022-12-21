import "package:gql_exec/gql_exec.dart";
import "package:meta/meta.dart";

/// A base class for exceptions thrown by links
@immutable
abstract class LinkException implements Exception {
  /// The original exception causing this exception
  final Object? originalException;
  final StackTrace? originalStackTrace;

  const LinkException(
    this.originalException,
    this.originalStackTrace,
  );

  @override
  String toString() => "LinkException($originalException, $originalStackTrace)";
}

/// Exception occurring when a terminating link
/// tries to serialize the request
@immutable
class RequestFormatException extends LinkException {
  /// The request being serialized when the error occurred
  final Request request;

  const RequestFormatException({
    required this.request,
    Object? originalException,
    StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);

  @override
  String toString() =>
      "RequestFormatException(originalException: $originalException, originalStackTrace: $originalStackTrace, request: $request)";
}

/// Exception occurring when a terminating link
/// tries to parse the response
@immutable
class ResponseFormatException extends LinkException {
  const ResponseFormatException({
    Object? originalException,
    StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);

  @override
  String toString() =>
      "ResponseFormatException(originalException: $originalException, originalStackTrace: $originalStackTrace)";
}

/// Exception occurring when reading from the context
@immutable
class ContextReadException extends LinkException {
  const ContextReadException({
    Object? originalException,
    StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);

  @override
  String toString() =>
      "ContextReadException(originalException: $originalException, originalStackTrace: $originalStackTrace)";
}

/// Exception occurring when writing to the context
@immutable
class ContextWriteException extends LinkException {
  const ContextWriteException({
    Object? originalException,
    StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);

  @override
  String toString() =>
      "ContextWriteException(originalException: $originalException, originalStackTrace: $originalStackTrace)";
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class ServerException extends LinkException {
  /// The parsed response
  final Response? parsedResponse;

  /// The status code of the request, if available
  final int? statusCode;

  const ServerException({
    this.parsedResponse,
    this.statusCode,
    Object? originalException,
    StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);

  @override
  String toString() =>
      "ServerException(originalException: $originalException, originalStackTrace: $originalStackTrace, parsedResponse: $parsedResponse)";
}
