/// GQL Terminating Link to execute requests via HTTP using JSON.
library gql_http_link;

import "dart:async";
import "dart:convert";

import "package:gql/execution.dart";
import "package:gql/language.dart";
import "package:gql/link.dart";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

/// A simple HttpLink implementation.
///
/// To use non-standard [Request] and [Response] shapes
/// you can override [serializeRequest], [parseResponse],
/// [parseError] and [parseLocation].
///
/// To customize the request headers you can pass a custom
/// [http.Client] to the constructor.
class HttpLink implements Link {
  /// Endpoint of the GraphQL service
  final String graphQLEndpoint;

  http.Client _httpClient;

  /// Construct the Link
  ///
  /// You can pass a [httpClient] to extend to customize the network request.
  HttpLink(
    this.graphQLEndpoint, {
    http.Client httpClient,
  }) {
    _httpClient = httpClient ?? http.Client();
  }

  /// Serializes the request
  ///
  /// Extend this to add non-standard behavior
  @visibleForOverriding
  Map<String, dynamic> serializeRequest(Request request) => <String, dynamic>{
        "operationName": request.operation.operationName,
        "variables": request.operation.variables,
        "query": printNode(request.operation.document),
      };

  /// Parses the response body
  ///
  /// Extend this to add non-standard behavior
  @visibleForOverriding
  Response parseResponse(Map<String, dynamic> body) => Response(
        errors: (body["errors"] as List)
            ?.map(
              (dynamic error) => parseError(error as Map<String, dynamic>),
            )
            ?.toList(),
        data: body["data"] as Map<String, dynamic>,
      );

  /// Parses a response error
  ///
  /// Extend this to add non-standard behavior
  @visibleForOverriding
  GraphQLError parseError(Map<String, dynamic> error) => GraphQLError(
        message: error["message"] as String,
        path: error["path"] as List,
        locations: (error["locations"] as List)
            ?.map(
              (dynamic error) => parseLocation(error as Map<String, dynamic>),
            )
            ?.toList(),
        extensions: error["extensions"] as Map<String, dynamic>,
      );

  /// Parses a response error location
  ///
  /// Extend this to add non-standard behavior
  @visibleForOverriding
  ErrorLocation parseLocation(Map<String, dynamic> location) => ErrorLocation(
        line: location["line"] as int,
        column: location["column"] as int,
      );

  Future<Response> _post(Request request) async {
    final response = await _httpClient.post(
      graphQLEndpoint,
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(
        serializeRequest(request),
      ),
    );

    final dynamic body = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    return parseResponse(body as Map<String, dynamic>);
  }

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      Stream.fromFuture(
        _post(request),
      );
}
