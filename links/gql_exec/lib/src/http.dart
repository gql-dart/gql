import "package:gql_exec/gql_exec.dart";
import "package:meta/meta.dart";

/// HTTP link headers
@immutable
class HttpLinkHeaders extends ContextEntry {
  /// Headers to be added to the request.
  ///
  /// May overrides Apollo Client awareness headers.
  final Map<String, String> headers;

  const HttpLinkHeaders({
    this.headers = const {},
  });

  @override
  List<Object> get fieldsForEquality => [
        headers,
      ];
}

/// HTTP link Response Context
@immutable
class HttpLinkResponseContext extends ContextEntry {
  /// HTTP status code of the response
  final int statusCode;

  final Map<String, String>? _headers;

  final Map<String, List<String>>? _rawHeaders;

  /// HTTP headers of the response. if you need repeated headers, use [rawHeaders]
  Map<String, String>? get headers =>
      _headers ??
      _rawHeaders?.map((key, valueList) =>
          MapEntry(key, valueList.isEmpty ? "" : valueList.last));

  /// HTTP headers, including repeated headers, of the response.
  Map<String, List<String>>? get rawHeaders =>
      _rawHeaders ?? _headers?.map((key, value) => MapEntry(key, [value]));

  const HttpLinkResponseContext({
    required this.statusCode,
    Map<String, String>? headers,
    Map<String, List<String>>? rawHeaders,
  })  : _headers = headers,
        _rawHeaders = rawHeaders;

  @override
  List<Object?> get fieldsForEquality => [
        statusCode,
        _headers,
        _rawHeaders,
      ];
}
