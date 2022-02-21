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
    required this.message,
  }) : super(
          originalException: originalException,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class WebSocketLinkServerException extends ServerException {
  final GraphQLSocketMessage? requestMessage;

  const WebSocketLinkServerException({
    Object? originalException,
    Response? parsedResponse,
    this.requestMessage,
  }) : super(
          originalException: originalException,
          parsedResponse: parsedResponse,
        );
}
