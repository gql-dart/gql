import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;

import "./_utils.dart";
import "./exceptions.dart";

typedef HttpResponseDecoder = FutureOr<Map<String, dynamic>?> Function(
    http.Response httpResponse);

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

  /// A function that decodes the incoming http response to `Map<String, dynamic>`,
  /// the decoded map will be then passes to the `RequestSerializer`.
  /// It is recommended for performance to decode the response using `compute` function.
  /// ```
  /// httpResponseDecoder : (http.Response httpResponse) async => await compute(jsonDecode, httpResponse.body) as Map<String, dynamic>,
  /// ```
  HttpResponseDecoder httpResponseDecoder;

  static Map<String, dynamic>? _defaultHttpResponseDecoder(
          http.Response httpResponse) =>
      json.decode(
        utf8.decode(
          httpResponse.bodyBytes,
        ),
      ) as Map<String, dynamic>?;

  http.Client? _httpClient;

  /// Construct the Link
  ///
  /// You can pass a [httpClient] to extend to customize the network request.
  HttpLink(
    String uri, {
    this.defaultHeaders = const {},
    this.useGETForQueries = false,
    http.Client? httpClient,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
    this.httpResponseDecoder = _defaultHttpResponseDecoder,
  }) : uri = Uri.parse(uri) {
    _httpClient = httpClient ?? http.Client();
  }

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) async* {
    final httpResponse = await _executeRequest(request);

    final response = await _parseHttpResponse(httpResponse);

    if (httpResponse.statusCode >= 300 ||
        (response.data == null && response.errors == null)) {
      throw HttpLinkServerException(
        response: httpResponse,
        parsedResponse: response,
        statusCode: httpResponse.statusCode,
      );
    }

    yield Response(
      data: response.data,
      errors: response.errors,
      response: response.response,
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
    } catch (e, stackTrace) {
      throw ContextWriteException(
        originalException: e,
        originalStackTrace: stackTrace,
      );
    }
  }

  Future<Response> _parseHttpResponse(http.Response httpResponse) async {
    try {
      final responseBody = await httpResponseDecoder(httpResponse);
      return parser.parseResponse(responseBody!);
    } catch (e, stackTrace) {
      throw HttpLinkParserException(
        originalException: e,
        originalStackTrace: stackTrace,
        response: httpResponse,
      );
    }
  }

  Future<http.Response> _executeRequest(Request request) async {
    final httpRequest = _prepareRequest(request);
    try {
      final response = await _httpClient!.send(httpRequest);
      return http.Response.fromStream(response);
    } catch (e, stackTrace) {
      throw ServerException(
        originalException: e,
        originalStackTrace: stackTrace,
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
        } catch (e, stackTrace) {
          throw RequestFormatException(
            originalException: e,
            originalStackTrace: stackTrace,
            request: request,
          );
        }
      };

  /// Closes the underlining [http.Client]
  @override
  Future<void> dispose() async {
    _httpClient?.close();
  }
}

Map<String, String> _getHttpLinkHeaders(Request request) {
  try {
    final HttpLinkHeaders? linkHeaders = request.context.entry();

    return {
      if (linkHeaders != null) ...linkHeaders.headers,
    };
  } catch (e, stackTrace) {
    throw ContextReadException(
      originalException: e,
      originalStackTrace: stackTrace,
    );
  }
}

Map<String, String> _encodeAsUriParams(Map<String, dynamic> serialized) =>
    serialized.map<String, String>(
      (k, dynamic v) => MapEntry(k, v is String ? v : json.encode(v)),
    );
