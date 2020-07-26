import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";
import "package:meta/meta.dart";

/// Context for configuring JSON [Request] serialization
@immutable
class RequestSerializationInclusions extends ContextEntry {
  /// Whether to include the query document in the request. Default `true`
  final bool query;

  /// Whether to include the operation name in the request. Default `true`
  final bool operationName;

  /// Whether to include the variables in the request. Default `true`
  final bool variables;

  /// Whether to include present [RequestExtensionsThunk] results in the request. Default `true`
  final bool extensions;

  const RequestSerializationInclusions({
    this.query = true,
    this.operationName = true,
    this.variables = true,
    this.extensions = true,
  });

  static const defaults = RequestSerializationInclusions();

  @override
  List<Object> get fieldsForEquality => [
        query,
        operationName,
        variables,
        extensions,
      ];
}

/// JSON [Request] serializer.
class RequestSerializer {
  const RequestSerializer();

  /// Serializes the request
  ///
  /// Extend this to add non-standard behavior
  Map<String, dynamic> serializeRequest(Request request) {
    final RequestExtensionsThunk thunk = request.context.entry();

    final RequestSerializationInclusions include = request.context.entry(
      RequestSerializationInclusions.defaults,
    );

    return <String, dynamic>{
      if (include.operationName)
        "operationName": request.operation.operationName,
      if (include.variables) "variables": request.variables,
      if (include.query) "query": printNode(request.operation.document),
      if (include.extensions && thunk != null)
        "extensions": thunk.getRequestExtensions(request),
    };
  }
}
