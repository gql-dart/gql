/// [DocumentNode]-based GraphQL execution interface.
@experimental
library link;

import "package:gql/execution.dart";
import "package:gql/language.dart";
import "package:meta/meta.dart";

/// Type of the `forward` function
typedef NextLink = Stream<Response> Function(
  Request request,
);

/// [DocumentNode]-based GraphQL execution interface
abstract class Link {
  /// Create a `Link`
  Link();

  /// Create `Link` by chaining multiple [links]
  factory Link.from(
    List<Link> links,
  ) =>
      _LinkChain(links);

  /// A function called when a [request] reaches this [Link]
  Stream<Response> request(
    /// An incoming [Request]
    Request request, [

    /// Function that invokes the [request] function of
    ///   the next [Link]
    ///
    /// Terminating [Link]s do not call this function.
    NextLink forward,
  ]);
}

class _LinkChain extends Link {
  final List<Link> links;

  _LinkChain(this.links);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      links.reversed.fold<NextLink>(
        forward,
        (fw, link) => (op) => link.request(op, fw),
      )(request);
}

/// JSON [Response] parser
class ResponseParser {
  const ResponseParser();

  /// Parses the response body
  ///
  /// Extend this to add non-standard behavior
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
  ErrorLocation parseLocation(Map<String, dynamic> location) => ErrorLocation(
        line: location["line"] as int,
        column: location["column"] as int,
      );
}

/// JSON [Request] serializer.
class RequestSerializer {
  const RequestSerializer();

  /// Serializes the request
  ///
  /// Extend this to add non-standard behavior
  @visibleForOverriding
  Map<String, dynamic> serializeRequest(Request request) => <String, dynamic>{
        "operationName": request.operation.operationName,
        "variables": request.operation.variables,
        "query": printNode(request.operation.document),
      };
}
