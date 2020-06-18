import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";
import 'package:gql_websocket_link/gql_websocket_link.dart';

/// Exception occurring when parsing fails
@immutable
class WebSocketLinkParserException extends ResponseFormatException {
  final SubscriptionData message;
  const WebSocketLinkParserException({
    @required this.message,
    @required dynamic originalException,
  }) : super(
          originalException: originalException,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class WebSocketLinkServerException extends ServerException {
  const WebSocketLinkServerException({
    @required dynamic originalException,
    @required Response parsedResponse,
  }) : super(
          originalException: originalException,
          parsedResponse: parsedResponse,
        );
}
