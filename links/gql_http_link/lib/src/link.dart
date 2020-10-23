import "dart:async";
import "dart:convert";

import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/src/gql_client.dart";
import "package:gql_http_link/src/http_gql_client.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as httplib;
//import "package:http/http.dart" as http;
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

  final GqlClient _client;

  /// Construct the Link
  ///
  /// You can pass a [httpClient] to extend to customize the network request.
  HttpLink(
    String uri, {
    this.defaultHeaders = const {},
    this.useGETForQueries = false,
    httplib.Client httpClient,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  })  : uri = Uri.parse(uri),
        _client = HttpGqlClient(httpClient ?? httplib.Client());

  HttpLink.customClient(
    String uri, {
    this.defaultHeaders = const {},
    this.useGETForQueries = false,
    @required GqlClient client,
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  })  : uri = Uri.parse(uri),
        assert(client != null),
        _client = client;

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) async* {
    final clientResponse = await _executeRequest(request);

    final response = _parseHttpResponse(clientResponse);

    if (clientResponse.statusCode >= 300 ||
        (response.data == null && response.errors == null)) {
      throw HttpLinkServerException(
        response: clientResponse,
        parsedResponse: response,
      );
    }

    yield Response(
      data: response.data,
      errors: response.errors,
      context: _updateResponseContext(response, clientResponse),
    );
  }

  Context _updateResponseContext(
    Response response,
    GqlClientResponse httpResponse,
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

  Response _parseHttpResponse(GqlClientResponse clientResponse) {
    try {
      return parser.parseResponse(clientResponse.body);
    } catch (e) {
      throw HttpLinkParserException(
        originalException: e,
        response: clientResponse,
      );
    }
  }

  Future<GqlClientResponse> _executeRequest(Request request) async {
    final clientRequest = _prepareRequest(request);
    final response = await _client.send(clientRequest);
    return response;
  }

  GqlClientRequest _prepareRequest(Request request) {
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

    final fileMap = extractFlattenedFileMap(body, _client.checkFileType);

    final useGetForThisRequest =
        fileMap.isEmpty && useGETForQueries && request.isQuery;

    if (useGetForThisRequest) {
      return GqlClientRequest(
        method: "GET",
        uri: uri.replace(
          queryParameters: _encodeAttempter(
            request,
            _encodeAsUriParams,
          )(body),
        ),
        headers: headers,
      );
    }

    // final httpBody = _encodeAttempter(
    //   request,
    //   (Map body) => json.encode(
    //     body,
    //     toEncodable: (dynamic object) =>
    //         (object is http.MultipartFile) ? null : object.toJson(),
    //   ),
    // )(body);

    if (fileMap.isNotEmpty) {
      return GqlClientRequest.multipart(
        method: "POST",
        uri: uri,
        body: body,
        headers: headers,
        fileMap: fileMap,
      );
    }
    return GqlClientRequest(
      method: "POST",
      uri: uri,
      body: body,
      headers: headers,
    );
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
    _client?.close();
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
