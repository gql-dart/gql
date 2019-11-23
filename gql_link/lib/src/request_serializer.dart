import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";

/// JSON [Request] serializer.
class RequestSerializer {
  const RequestSerializer();

  /// Serializes the request
  ///
  /// Extend this to add non-standard behavior
  Map<String, dynamic> serializeRequest(Request request) {
    final RequestExtensionsThunk thunk = request.context.entry();

    return <String, dynamic>{
      "operationName": request.operation.operationName,
      "variables": request.variables,
      "query": printNode(request.operation.document),
      if (thunk != null) "extensions": thunk.getRequestExtensions(request),
    };
  }
}
