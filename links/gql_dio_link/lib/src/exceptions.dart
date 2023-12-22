import "package:dio/dio.dart" as dio;
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";

/// Exception occurring when parsing fails.
@immutable
class DioLinkParserException extends ResponseFormatException {
  /// Response which caused the exception
  final dio.Response response;

  const DioLinkParserException({
    required Object? originalException,
    required StackTrace? originalStackTrace,
    required this.response,
  }) : super(
          originalException: originalException,
          originalStackTrace: originalStackTrace,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class DioLinkServerException extends ServerException {
  /// Response which caused the exception
  final dio.Response response;

  const DioLinkServerException({
    required this.response,
    required Response? parsedResponse,
    Object? originalException,
    StackTrace? originalStackTrace,
    int? statusCode,
  }) : super(
          parsedResponse: parsedResponse,
          statusCode: statusCode,
          originalException: originalException,
          originalStackTrace: originalStackTrace,
        );

  @override
  String toString() {
    final dynamic data = response.data;
    String plainResponse = "...";
    if (data is String) {
      plainResponse =
          data.length > 80 ? data.replaceRange(80, data.length, "...") : data;
    }
    return "DioLinkServerException(originalException: $originalException, status: ${response.statusCode}, response: ${parsedResponse ?? plainResponse}";
  }
}

@immutable
class DioLinkUnkownException extends LinkException {
  const DioLinkUnkownException({
    required Object? originalException,
    required StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);
}

@immutable
class DioLinkTimeoutException extends LinkException {
  /// Either a CONNECT_TIMEOUT, RECEIVE_TIMEOUT, or SEND_TIMEOUT
  final dio.DioExceptionType type;

  const DioLinkTimeoutException({
    required this.type,
    required Object? originalException,
    required StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);
}

@immutable
class DioLinkCanceledException extends LinkException {
  const DioLinkCanceledException({
    required Object? originalException,
    required StackTrace? originalStackTrace,
  }) : super(originalException, originalStackTrace);
}
