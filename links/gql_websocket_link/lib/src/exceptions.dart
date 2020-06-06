import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:meta/meta.dart';

/// Exception occurring when parsing fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class WebSocketLinkParserException extends ResponseFormatException {
  final SubscriptionData message;

  const WebSocketLinkParserException({
    @required dynamic originalException,
    @required Response parsedResponse,
    @required this.message,
  }) : super(
          originalException: originalException,
          parsedResponse: parsedResponse,
        );
}

/// Exception occurring when network fails.
@immutable
class WebSocketLinkServerException extends ServerException {
  const WebSocketLinkServerException({
    @required dynamic originalException,
  }) : super(
          originalException: originalException,
        );
}
