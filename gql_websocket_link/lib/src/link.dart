import "dart:async";

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/src/get_from_ast.dart";
import "package:gql_websocket_link/src/socket_client.dart";
import "package:gql_websocket_link/src/messages.dart";
import "package:gql/language.dart";
import "package:gql/ast.dart";

/// A Universal WebSocket [Link] implementation to support the WebSocket-GraphQL transport.
/// It supports subscriptions, query and mutation operations as well.
///
/// NOTE: the actual socket connection will only get established after a [Request] is handled by this [WSLink].
/// If you'd like to connect to the socket server instantly, call the [connectOrReconnect] method after creating this [WSLink] instance.
class WSLink extends Link {
  final String url;
  SocketClient _client;
  final SocketClientConfig config;

  ResponseParser parser;

  WSLink(this.url, {this.config, this.parser = const ResponseParser()});

  @override
  Stream<Response> request(Request request, [forward]) async* {
    if (_client == null) {
      await connectOrReconnect();
    }

    yield* _client
        .subscribe(
          QueryPayload(
              operationName: request.operation.operationName,
              query: printNode(request.operation.document),
              variables: request.variables),
          waitForConnection:
              true, // TODO: expose the option to not wait for connection
          isSubscription: isOfType(
            OperationType.subscription,
            request.operation.document,
            request.operation.operationName,
          ),
        )
        .map(
          (data) => parser.parseResponse(data.toJson()),
        );
  }

  /// Connects or reconnects to the server with the specified headers.
  Future<void> connectOrReconnect() async {
    await _client?.dispose();
    _client = SocketClient(url, config: config);
  }

  /// Disposes the underlying socket client explicitly. Only use this, if you want to disconnect from
  /// the current server in favour of another one. If that's the case, create a new [WSLink] instance.
  Future<void> dispose() async {
    await _client?.dispose();
    _client = null;
  }
}
