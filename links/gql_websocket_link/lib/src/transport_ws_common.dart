import "package:gql_exec/gql_exec.dart" show GraphQLError;
import "package:gql_link/gql_link.dart" show ResponseParser;

///
/// common
///

// import { GraphQLError } from 'graphql';
// import {
//   isObject,
//   areGraphQLErrors,
//   hasOwnProperty,
//   hasOwnObjectProperty,
//   hasOwnStringProperty,
// } from './utils';

/// The WebSocket sub-protocol used for the [GraphQL over WebSocket Protocol](/PROTOCOL.md).
///
/// @category Common
const graphQLTransportWSProtocol = "graphql-transport-ws";

// /// The deprecated subprotocol used by [subscriptions-transport-ws](https://github.com/apollographql/subscriptions-transport-ws).
// ///
// /// @private
// const DEPRECATED_GRAPHQL_WS_PROTOCOL = "graphql-ws";

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

/**
 * ID is a string type alias representing
 * the globally unique ID used for identifying
 * subscriptions established by the client.
 *
 * @category Common
 */
// typedef ID = String;

// /// @category Common */
// abstract class Disposable {
//   /// Dispose of the instance and clear up resources. */
//   FutureOr<void> dispose();
// }

// /// A representation of any set of values over any amount of time.
// ///
// /// @category Common
// abstract class Sink<T> {
//   /// Next value arriving. */
//   void next(T value);

//   /// An error that has occured. Calling this function "closes" the sink.
//   /// Besides the errors being `Error` and `readonly GraphQLError[]`, it
//   /// can also be a `CloseEvent`, but to avoid bundling DOM typings because
//   /// the client can run in Node env too, you should assert the close event
//   /// type during implementation.
//   void error(Object error);

//   /// The sink has completed. This function "closes" the sink. */
//   void complete();
// }

/// Types of messages allowed to be sent by the client/server over the WS protocol.
///
/// @category Common
enum MessageType {
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
class ConnectionInitMessage extends Message {
  const ConnectionInitMessage(this.payload);

  @override
  MessageType get type => MessageType.connection_init;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common */
class ConnectionAckMessage extends Message {
  const ConnectionAckMessage(this.payload);

  @override
  MessageType get type => MessageType.connection_ack;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common */
class PingMessage extends Message {
  const PingMessage(this.payload);

  @override
  MessageType get type => MessageType.ping;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common */
class PongMessage extends Message {
  const PongMessage(this.payload);

  @override
  MessageType get type => MessageType.pong;
  final Map<String, Object?>? payload;
  @override
  Map<String, Object?> toJson() => {"type": type.name, "payload": payload};
}

/// @category Common */
class SubscribeMessage extends Message {
  const SubscribeMessage(this.id, this.payload);

  @override
  MessageType get type => MessageType.subscribe;
  @override
  final String id;
  final SubscribePayload payload;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload.toJson(),
      };
}

/// @category Common */
class SubscribePayload {
  final String? operationName;
  final String query;
  final Map<String, Object?>? variables;
  final Map<String, Object?>? extensions;

  SubscribePayload({
    this.operationName,
    required this.query,
    this.variables,
    this.extensions,
  });

  Map<String, Object?> toJson() => {
        "operationName": operationName,
        "query": query,
        "variables": variables,
        "extensions": extensions,
      };
}

/// @category Common */
class ExecutionResult {
  // <Data, Extensions>
  final List<GraphQLError>? errors;
  final Map<String, Object?>? data;
  final bool? hasNext;
  final Map<String, Object?>? extensions;
  final List<
      String // | number
      >? path;
  final String? label;
  final Map<String, Object?> rawResponse;

  ExecutionResult({
    this.errors,
    this.data,
    this.hasNext,
    this.extensions,
    this.path,
    this.label,
    required this.rawResponse,
  });

  Map<String, Object?> toJson() => {
        "errors": errors?.map(_errorToJson).toList(),
        "data": data,
        "hasNext": hasNext,
        "extensions": extensions,
        "path": path,
        "label": label,
      };

  factory ExecutionResult.fromJson(Map<String, Object?> map) => ExecutionResult(
        errors: map["errors"] != null
            ? (map["errors"] as List<Object?>)
                .map((x) => const ResponseParser()
                    .parseError(x as Map<String, Object?>))
                .toList()
            : null,
        data: map["data"] as Map<String, Object?>?,
        hasNext: map["hasNext"] as bool?,
        extensions: map["extensions"] as Map<String, Object?>?,
        path: (map["path"] as List?)?.cast<String>(),
        label: map["label"] as String?,
        rawResponse: map,
      );
}

Map<String, Object?> _errorToJson(GraphQLError x) => {
      "extensions": x.extensions,
      "locations": x.locations
          ?.map((e) => {"column": e.column, "line": e.line})
          .toList(),
      "message": x.message,
      "path": x.path,
    };

// /// @category Common
// class ExecutionPatchResult<Data, Extensions>
//     extends ExecutionResult<Data, Extensions> {
//   @override
//   final List<GraphQLError>? errors;
//   @override
//   final Data? data;
//   final List<
//       String // | number
//       >? path;
//   final String? label;
//   @override
//   final bool hasNext;
//   @override
//   final Extensions? extensions;
// }

/// @category Common
class NextMessage extends Message {
  const NextMessage(this.id, this.payload);

  @override
  MessageType get type => MessageType.next;
  @override
  final String id;
  final ExecutionResult payload;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload.toJson(),
      };
}

/// @category Common
class ErrorMessage extends Message {
  const ErrorMessage(this.id, this.payload);

  @override
  final String id;
  final List<GraphQLError> payload;
  @override
  MessageType get type => MessageType.error;
  @override
  Map<String, Object?> toJson() => {
        "id": id,
        "type": type.name,
        "payload": payload.map(_errorToJson).toList()
      };
}

/// @category Common
class CompleteMessage extends Message {
  const CompleteMessage(this.id);

  @override
  MessageType get type => MessageType.complete;
  @override
  final String id;
  @override
  Map<String, Object?> toJson() => {"id": id, "type": type.name};
}

/// @category Common
// export type Message<T extends MessageType = MessageType> =
//   T extends MessageType.ConnectionAck
//     ? ConnectionAckMessage
//     : T extends MessageType.ConnectionInit
//     ? ConnectionInitMessage
//     : T extends MessageType.Ping
//     ? PingMessage
//     : T extends MessageType.Pong
//     ? PongMessage
//     : T extends MessageType.Subscribe
//     ? SubscribeMessage
//     : T extends MessageType.Next
//     ? NextMessage
//     : T extends MessageType.Error
//     ? ErrorMessage
//     : T extends MessageType.Complete
//     ? CompleteMessage
//     : never;

abstract class Message {
  const Message();
  MessageType get type;
  String? get id => null;

  Map<String, Object?> toJson();
}

/// Checks if the provided value is a message.
///
/// @category Common
Message? castMessage(Object val) {
  if (val is Message) return val;
  if (val is! Map<String, Object?>) {
    return null;
  }
  final typeStr = val["type"];
  // all messages must have the `type` prop
  if (!MessageType.values.map((v) => v.name).contains(typeStr)) {
    return null;
  }

  final type = MessageType.values.byName(typeStr as String);

  // validate other properties depending on the `type`
  switch (type) {
    case MessageType.connection_init:
    case MessageType.connection_ack:
    case MessageType.ping:
    case MessageType.pong:
      {
        // the connection ack, ping and pong messages can have optional payload object too
        final payload = val["payload"];
        if (payload is Map<String, Object?>?) {
          switch (type) {
            case MessageType.connection_init:
              return ConnectionInitMessage(payload);
            case MessageType.connection_ack:
              return ConnectionAckMessage(payload);
            case MessageType.ping:
              return PingMessage(payload);
            case MessageType.pong:
              return PongMessage(payload);
            default:
          }
        }
        return null;
      }
    case MessageType.subscribe:
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
      return SubscribeMessage(
        id,
        SubscribePayload(
          query: query,
          extensions: extensions,
          operationName: operationName,
          variables: variables,
        ),
      );
    case MessageType.next:
      final id = val["id"];
      final payload = val["payload"];

      try {
        return NextMessage(
          id as String,
          ExecutionResult.fromJson(payload as Map<String, Object?>),
        );
      } catch (_) {
        return null;
      }
    case MessageType.error:
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
    case MessageType.complete:
      final id = val["id"];
      return id is String ? CompleteMessage(id) : null;
  }
}

// /// Function for transforming values within a message during JSON parsing
// /// The values are produced by parsing the incoming raw JSON.
// ///
// /// Read more about using it:
// /// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse#using_the_reviver_parameter
// ///
// /// @category Common
// typedef JSONMessageReviver = Object? Function(String key, Object? value);

/// Parses the raw websocket message data to a valid message.
///
/// @category Common
Message parseMessage(Map<String, Object?> data) {
  final msg = castMessage(data);
  if (msg == null) {
    throw Exception("Invalid message");
  }
  return msg;
}

// /// Function that allows customization of the produced JSON string
// /// for the elements of an outgoing `Message` object.
// ///
// /// Read more about using it:
// /// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify#the_replacer_parameter
// ///
// /// @category Common
// typedef JSONMessageReplacer = Object? Function(
//     // Object this_, String key,
//     Object? value);

// /// Stringifies a valid message ready to be sent through the socket.
// ///
// /// @category Common
// String stringifyMessage(
//   Message msg, {
//   JSONMessageReplacer? replacer,
// }) =>
//     json.encode(msg, toEncodable: replacer);

/// Limits the WebSocket close event reason to not exceed a length of one frame.
/// Reference: https://datatracker.ietf.org/doc/html/rfc6455#section-5.2.
///
/// @private
String limitCloseReason(String reason, String whenTooLong) =>
    reason.length < 124 ? reason : whenTooLong;
