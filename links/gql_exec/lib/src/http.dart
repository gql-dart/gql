import "package:gql_exec/gql_exec.dart";
import "package:meta/meta.dart";

/// HTTP link headers
@immutable
class BaseHttpLinkHeaders extends ContextEntry {
  /// Headers to be added to the request.
  ///
  /// May overrides Apollo Client awareness headers.
  final Map<String, String> headers;

  const BaseHttpLinkHeaders({
    this.headers = const {},
  });

  @override
  List<Object> get fieldsForEquality => [
        headers,
      ];
}

/// HTTP link Response Context
@immutable
class BaseHttpLinkResponseContext extends ContextEntry {
  /// HTTP status code of the response
  final int statusCode;

  const BaseHttpLinkResponseContext({
    required this.statusCode,
  });

  @override
  List<Object> get fieldsForEquality => [
        statusCode,
      ];
}
