import "package:gql_exec/gql_exec.dart" show GraphQLError, Request, Response;
import "package:gql_link/gql_link.dart" show ResponseParser;

/// The WebSocket sub-protocol used for the [GraphQL over WebSocket Protocol](/PROTOCOL.md).
///
/// @category Common
const graphQLTransportWSProtocol = "graphql-transport-ws";

/// `graphql-ws` expected and standard close codes of the [GraphQL over WebSocket Protocol](/PROTOCOL.md).
///
/// @category Common
enum CloseCode {
  internalServerError,
  internalClientError,
  badRequest,
  badResponse,

  /// Tried subscribing before connect ack
  unauthorized,
  forbidden,
  subprotocolNotAcceptable,
  connectionInitialisationTimeout,
  connectionAcknowledgementTimeout,

  /// Subscriber distinction is very important
  subscriberAlreadyExists,
  tooManyInitialisationRequests,
}

/// Converts a [CloseCode] to an integer used to close a web socket connection.
int closeCodeInteger(CloseCode code) => const {
      CloseCode.internalServerError: 4500,
      CloseCode.internalClientError: 4005,
      CloseCode.badRequest: 4400,
      CloseCode.badResponse: 4004,
      CloseCode.unauthorized: 4401,
      CloseCode.forbidden: 4403,
      CloseCode.subprotocolNotAcceptable: 4406,
      CloseCode.connectionInitialisationTimeout: 4408,
      CloseCode.connectionAcknowledgementTimeout: 4504,
      CloseCode.subscriberAlreadyExists: 4409,
      CloseCode.tooManyInitialisationRequests: 4429,
    }[code]!;

/// Types of messages allowed to be sent by the client/server over the WS protocol.
///
/// @category Common
enum TransportWsMessageType {
  // ignore: constant_identifier_names
  connection_init, // Client -> Server
  // ignore: constant_identifier_names
  connection_ack, // Server -> Client

  ping, // bidirectional
  pong, // bidirectional

  subscribe, // Client -> Server
  next, // Server -> Client
  error, // Server -> Client
  complete, // bidirectional
}

/// @category Common */
class ConnectionInitMessage extends TransportWsMessage {
  const ConnectionInitMessage(this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.connection_init;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common */
class ConnectionAckMessage extends TransportWsMessage {
  const ConnectionAckMessage(this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.connection_ack;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common
class PingMessage extends TransportWsMessage {
  const PingMessage(this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.ping;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() =>
      {"type": type.name, if (payload != null) "payload": payload};
}

/// @category Common
class PongMessage extends TransportWsMessage {
  const PongMessage(this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.pong;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() =>
      {"type": type.name, if (payload != null) "payload": payload};
}

/// @category Common
class SubscribeMessage extends TransportWsMessage {
  const SubscribeMessage(this.id, this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.subscribe;
  @override
  final String id;

  /// Serialized [Request]
  final Map<String, Object?> payload;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload,
      };
}

/// @category Common
class NextMessage extends TransportWsMessage {
  const NextMessage(this.id, this.payload);

  @override
  TransportWsMessageType get type => TransportWsMessageType.next;
  @override
  final String id;
  final Response payload;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload.data,
      };
}

/// @category Common
class ErrorMessage extends TransportWsMessage {
  const ErrorMessage(this.id, this.payload);

  @override
  final String id;
  final List<GraphQLError> payload;
  @override
  TransportWsMessageType get type => TransportWsMessageType.error;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload.map(_errorToJson).toList()
      };
}

Map<String, Object?> _errorToJson(GraphQLError x) => {
      "extensions": x.extensions,
      "locations": x.locations
          ?.map((e) => {"column": e.column, "line": e.line})
          .toList(),
      "message": x.message,
      "path": x.path,
    };

/// @category Common
class CompleteMessage extends TransportWsMessage {
  const CompleteMessage(this.id);

  @override
  TransportWsMessageType get type => TransportWsMessageType.complete;
  @override
  final String id;
  @override
  Map<String, Object?> toJson() => {"id": id, "type": type.name};
}

abstract class TransportWsMessage {
  const TransportWsMessage();

  /// The type of the message.
  TransportWsMessageType get type;

  /// The id of the message.
  String? get id => null;

  /// Converts the message to a JSON object.
  Map<String, Object?> toJson();
}

/// Checks if the provided value is a message.
///
/// @category Common
TransportWsMessage? castMessage(Object val, ResponseParser parser) {
  if (val is TransportWsMessage) return val;
  if (val is! Map<String, Object?>) {
    return null;
  }
  final typeStr = val["type"];
  // all messages must have the `type` prop
  if (!TransportWsMessageType.values.map((v) => v.name).contains(typeStr)) {
    return null;
  }

  final type = TransportWsMessageType.values.byName(typeStr as String);

  // validate other properties depending on the `type`
  switch (type) {
    case TransportWsMessageType.connection_init:
    case TransportWsMessageType.connection_ack:
    case TransportWsMessageType.ping:
    case TransportWsMessageType.pong:
      {
        // the connection ack, ping and pong messages can have optional payload object too
        final payload = val["payload"];
        if (payload is Map<String, Object?>?) {
          switch (type) {
            case TransportWsMessageType.connection_init:
              return ConnectionInitMessage(payload);
            case TransportWsMessageType.connection_ack:
              return ConnectionAckMessage(payload);
            case TransportWsMessageType.ping:
              return PingMessage(payload);
            case TransportWsMessageType.pong:
              return PongMessage(payload);
            default:
          }
        }
        return null;
      }
    case TransportWsMessageType.subscribe:
      final id = val["id"];
      final payload = val["payload"];
      if (id is! String || payload is! Map<String, Object?>) return null;
      final query = payload["query"];
      final extensions = payload["extensions"];
      final operationName = payload["operationName"];
      final variables = payload["variables"];

      if ((operationName is! String?) ||
          query is! String ||
          (extensions is! Map<String, Object?>?) ||
          (variables is! Map<String, Object?>?)) {
        return null;
      }
      return SubscribeMessage(id, payload);
    case TransportWsMessageType.next:
      final id = val["id"];
      final payload = val["payload"];

      try {
        return NextMessage(
          id as String,
          parser.parseResponse(payload as Map<String, Object?>),
        );
      } catch (_) {
        return null;
      }
    case TransportWsMessageType.error:
      final id = val["id"];
      final payload = val["payload"];

      try {
        return ErrorMessage(
          id as String,
          (payload as List<Object?>)
              .map((x) =>
                  const ResponseParser().parseError(x as Map<String, Object?>))
              .toList(),
        );
      } catch (_) {
        return null;
      }
    case TransportWsMessageType.complete:
      final id = val["id"];
      return id is String ? CompleteMessage(id) : null;
  }
}

/// Parses the raw websocket message data to a valid message.
///
/// @category Common
TransportWsMessage parseMessage(
  Map<String, Object?> data,
  ResponseParser parser,
) {
  final msg = castMessage(data, parser);
  if (msg == null) {
    throw Exception("Invalid message: $data");
  }
  return msg;
}

/// Limits the WebSocket close event reason to not exceed a length of one frame.
/// Reference: https://datatracker.ietf.org/doc/html/rfc6455#section-5.2.
///
/// @private
String limitCloseReason(String reason, String whenTooLong) =>
    reason.length < 124 ? reason : whenTooLong;
