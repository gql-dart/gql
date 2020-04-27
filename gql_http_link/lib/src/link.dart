import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:meta/meta.dart";

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

  const HttpLinkResponseContext({
    @required this.statusCode,
  }) : assert(statusCode != null);

  @override
  List<Object> get fieldsForEquality => [
        statusCode,
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
  final String uri;

  /// Default HTTP headers
  final Map<String, String> defaultHeaders;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Parser used to parse response
  final ResponseParser parser;

  http.Client _httpClient;

  /// Construct the Link
  ///
  /// You can pass a [httpClient] to extend to customize the network request.
  HttpLink(
    this.uri, {
    this.defaultHeaders = const {},
    http.Client httpClient,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  }) {
    _httpClient = httpClient ?? http.Client();
  }

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) async* {
    final httpResponse = await _executeRequest(
      _getHttpLinkHeaders(request),
      _serializeRequest(request),
    );

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

  Future<http.Response> _executeRequest(
    Map<String, String> contextHeaders,
    dynamic body,
  ) async {
    try {
      return await _httpClient.post(
        uri,
        headers: {
          "Content-type": "application/json",
          "Accept": "*/*",
          ...defaultHeaders,
          ...contextHeaders,
        },
        body: body,
      );
    } catch (e) {
      throw ServerException(
        originalException: e,
        parsedResponse: null,
      );
    }
  }

  dynamic _serializeRequest(Request request) {
    try {
      return json.encode(
        serializer.serializeRequest(request),
      );
    } catch (e) {
      throw RequestFormatException(
        originalException: e,
        request: request,
      );
    }
  }

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
