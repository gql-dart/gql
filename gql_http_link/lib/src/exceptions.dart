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
    @required dynamic originalException,
    @required this.response,
  }) : super(
          originalException: originalException,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class HttpLinkServerException extends ServerException {
  /// Response which caused the exception
  final http.Response response;

  const HttpLinkServerException({
    @required this.response,
    @required Response parsedResponse,
  }) : super(
          parsedResponse: parsedResponse,
        );
}
