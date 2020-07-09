import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

import "./_utils.dart";
import "./exceptions.dart";

/// HTTP link headers
@immutable
class HttpLinkHeaders extends ContextEntry {
  /// Headers to be added to the request.
  ///
  /// May overrides Apollo Client awareness headers.
  final Map<String, String> headers;

  const HttpLinkHeaders({
    this.headers = const {},
  }) : assert(headers != null);

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

  /// HTTP response headers
  final Map<String, String> headers;

  const HttpLinkResponseContext({
    @required this.statusCode,
    @required this.headers,
  })  : assert(statusCode != null),
        assert(headers != null);

  @override
  List<Object> get fieldsForEquality => [
        statusCode,
        headers,
      ];
}

/// A simple HttpLink implementation.
///
/// To use non-standard [Request] and [Response] shapes
/// you can override [serializeRequest], [parseResponse],
/// [parseError] and [parseLocation].
///
/// To customize the request headers you can pass a custom
/// [http.Client] to the constructor.
class HttpLink extends Link {
  /// Endpoint of the GraphQL service
  final Uri uri;

  /// Default HTTP headers
  final Map<String, String> defaultHeaders;

  /// set to `true` to use the HTTP `GET` method for queries (but not for mutations)
  final bool useGETForQueries;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Parser used to parse response
  final ResponseParser parser;

  http.Client _httpClient;

  /// Construct the Link
  ///
  /// You can pass a [httpClient] to extend to customize the network request.
  HttpLink(
    String uri, {
    this.defaultHeaders = const {},
    this.useGETForQueries = false,
    http.Client httpClient,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  }) : uri = Uri.parse(uri) {
    _httpClient = httpClient ?? http.Client();
  }

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) async* {
    final httpResponse = await _executeRequest(request);

    final response = _parseHttpResponse(httpResponse);

    if (httpResponse.statusCode >= 300 ||
        (response.data == null && response.errors == null)) {
      throw HttpLinkServerException(
        response: httpResponse,
        parsedResponse: response,
      );
    }

    yield Response(
      data: response.data,
      errors: response.errors,
      context: _updateResponseContext(response, httpResponse),
    );
  }

  Context _updateResponseContext(
    Response response,
    http.Response httpResponse,
  ) {
    try {
      return response.context.withEntry(
        HttpLinkResponseContext(
          statusCode: httpResponse.statusCode,
          headers: httpResponse.headers,
        ),
      );
    } catch (e) {
      throw ContextWriteException(
        originalException: e,
      );
    }
  }

  Response _parseHttpResponse(http.Response httpResponse) {
    try {
      final dynamic responseBody = json.decode(
        utf8.decode(
          httpResponse.bodyBytes,
        ),
      );

      return parser.parseResponse(responseBody as Map<String, dynamic>);
    } catch (e) {
      throw HttpLinkParserException(
        originalException: e,
        response: httpResponse,
      );
    }
  }

  Future<http.Response> _executeRequest(Request request) async {
    final httpRequest = _prepareRequest(request);
    try {
      final response = await _httpClient.send(httpRequest);
      return http.Response.fromStream(response);
    } catch (e) {
      throw ServerException(
        originalException: e,
        parsedResponse: null,
      );
    }
  }

  http.BaseRequest _prepareRequest(Request request) {
    final body = _encodeAttempter(
      request,
      serializer.serializeRequest,
    )(request);

    final contextHeaders = _getHttpLinkHeaders(request);
    final headers = {
      "Content-type": "application/json",
      "Accept": "*/*",
      ...defaultHeaders,
      ...contextHeaders,
    };

    final fileMap = extractFlattenedFileMap(body);

    final useGetForThisRequest =
        fileMap.isEmpty && useGETForQueries && request.isQuery;

    if (useGetForThisRequest) {
      return http.Request(
        "GET",
        uri.replace(
          queryParameters: _encodeAttempter(
            request,
            _encodeAsUriParams,
          )(body),
        ),
      )..headers.addAll(headers);
    }

    final httpBody = _encodeAttempter(
      request,
      (Map body) => json.encode(
        body,
        toEncodable: (dynamic object) =>
            (object is http.MultipartFile) ? null : object.toJson(),
      ),
    )(body);

    if (fileMap.isNotEmpty) {
      return http.MultipartRequest("POST", uri)
        ..body = httpBody
        ..addAllFiles(fileMap)
        ..headers.addAll(headers);
    }
    return http.Request("POST", uri)
      ..body = httpBody
      ..headers.addAll(headers);
  }

  /// wrap an encoding transform in exception handling
  T Function(V) _encodeAttempter<T, V>(
    Request request,
    T Function(V) encoder,
  ) =>
      (V input) {
        try {
          return encoder(input);
        } catch (e) {
          throw RequestFormatException(
            originalException: e,
            request: request,
          );
        }
      };

  /// Closes the underlining [http.Client]
  void dispose() {
    _httpClient?.close();
  }
}

Map<String, String> _getHttpLinkHeaders(Request request) {
  try {
    final HttpLinkHeaders linkHeaders = request.context.entry();

    return {
      if (linkHeaders != null) ...linkHeaders.headers,
    };
  } catch (e) {
    throw ContextReadException(
      originalException: e,
    );
  }
}

Map<String, String> _encodeAsUriParams(Map<String, dynamic> serialized) =>
    serialized.map<String, String>(
      (k, dynamic v) => MapEntry(k, v is String ? v : json.encode(v)),
    );
