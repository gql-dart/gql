import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

/// Exception occurring when parsing fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class HttpLinkParserException extends ResponseFormatException {
  /// Response which caused the exception
  final http.Response httpResponse;

  const HttpLinkParserException({
    @required dynamic originalException,
    @required Response parsedResponse,
    @required this.httpResponse,
  }) : super(
          originalException: originalException,
          parsedResponse: parsedResponse,
        );
}

/// Exception occurring when network fails.
@immutable
class HttpLinkServerException extends ServerException {
  /// Response which caused the exception
  final http.Response httpResponse;

  const HttpLinkServerException({
    @required dynamic originalException,
    @required this.httpResponse,
  }) : super(
          originalException: originalException,
        );
}
