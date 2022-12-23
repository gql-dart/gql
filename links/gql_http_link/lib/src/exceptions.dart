import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

/// Exception occurring when parsing fails.
@immutable
class HttpLinkParserException extends ResponseFormatException {
  /// Response which caused the exception
  final http.Response response;

  const HttpLinkParserException({
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
class HttpLinkServerException extends ServerException {
  /// Response which caused the exception
  final http.Response response;

  const HttpLinkServerException({
    required this.response,
    required Response parsedResponse,
    int? statusCode,
  }) : super(
          parsedResponse: parsedResponse,
          statusCode: statusCode,
        );
}
