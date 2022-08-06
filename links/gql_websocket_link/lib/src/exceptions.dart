import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import "package:meta/meta.dart";

/// Exception occurring when response parsing fails
@immutable
class WebSocketLinkParserException extends ResponseFormatException {
  final GraphQLSocketMessage message;

  const WebSocketLinkParserException({
    Object? originalException,
    StackTrace? originalStackTrace,
    required this.message,
  }) : super(
          originalException: originalException,
          originalStackTrace: originalStackTrace,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class WebSocketLinkServerException extends ServerException {
  final GraphQLSocketMessage? requestMessage;

  const WebSocketLinkServerException({
    Object? originalException,
    StackTrace? originalStackTrace,
    Response? parsedResponse,
    this.requestMessage,
  }) : super(
          originalException: originalException,
          originalStackTrace: originalStackTrace,
          parsedResponse: parsedResponse,
        );
}
