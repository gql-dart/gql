import "package:dio/dio.dart" as dio;
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";

import "exceptions.dart";

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

/// Dio link Response Context
@immutable
class DioLinkResponseContext extends ContextEntry {
  /// Dio status code of the response
  final int statusCode;

  const DioLinkResponseContext({
    @required this.statusCode,
  }) : assert(statusCode != null);

  @override
  List<Object> get fieldsForEquality => [
        statusCode,
      ];
}

extension _CastDioResponse on dio.Response {
  dio.Response<T> castData<T>() => dio.Response<T>(
        data: data as T,
        headers: headers,
        request: request,
        isRedirect: isRedirect,
        statusCode: statusCode,
        statusMessage: statusMessage,
        redirects: redirects,
      );
}

/// A simple HttpLink implementation using Dio.
///
/// To use non-standard [Request] and [Response] shapes
/// you can override [serializeRequest], [parseResponse]
class DioLink extends Link {
  /// Endpoint of the GraphQL service
  final String endpoint;

  /// Default HTTP headers
  final Map<String, String> defaultHeaders;

  /// Serializer used to serialize request
  final RequestSerializer serializer;

  /// Parser used to parse response
  final ResponseParser parser;

  /// Dio client instance.
  final dio.Dio client;

  DioLink(
    this.endpoint, {
    @required this.client,
    this.defaultHeaders = const {},
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  }) : assert(client != null);

  @override
  Stream<Response> request(Request request, [forward]) async* {
    final dio.Response<Map<String, dynamic>> dioResponse =
        await _excuteDioRequest(
      body: _serializeRequest(request),
      headers: <String, String>{
        "Content-type": "application/json",
        "Accept": "*/*",
        ...defaultHeaders,
        ..._getHttpLinkHeaders(request),
      },
    );

    if (dioResponse.statusCode >= 300 ||
        (dioResponse.data["data"] == null &&
            dioResponse.data["errors"] == null)) {
      throw DioLinkServerException(
        response: dioResponse,
        parsedResponse: _parseDioResponse(dioResponse),
      );
    }

    final gqlResponse = _parseDioResponse(dioResponse);
    yield Response(
      data: gqlResponse.data,
      errors: gqlResponse.errors,
      context: _updateResponseContext(gqlResponse, dioResponse),
    );
  }

  Context _updateResponseContext(
    Response response,
    dio.Response httpResponse,
  ) {
    try {
      return response.context.withEntry(
        DioLinkResponseContext(
          statusCode: httpResponse.statusCode,
        ),
      );
    } catch (e) {
      throw ContextWriteException(
        originalException: e,
      );
    }
  }

  Future<dio.Response<Map<String, dynamic>>> _excuteDioRequest({
    @required Map<String, dynamic> body,
    @required Map<String, String> headers,
  }) async {
    try {
      final res = await client.post<dynamic>(
        endpoint,
        data: body,
        options: dio.Options(
          responseType: dio.ResponseType.json,
          contentType: "application/json",
          headers: headers,
        ),
      );
      if (res.data is Map<String, dynamic> == false) {
        throw DioLinkParserException(
            // ignore: prefer_adjacent_string_concatenation
            originalException: "Expected response data to be of type " +
                "'Map<String, dynamic>' but found ${res.data.runtimeType}",
            response: res);
      }
      return res.castData<Map<String, dynamic>>();
    } on dio.DioError catch (e) {
      switch (e.type) {
        case dio.DioErrorType.CONNECT_TIMEOUT:
        case dio.DioErrorType.RECEIVE_TIMEOUT:
        case dio.DioErrorType.SEND_TIMEOUT:
          throw DioLinkTimeoutException(
            type: e.type,
            originalException: e,
          );
        case dio.DioErrorType.CANCEL:
          throw DioLinkCanceledException(originalException: e);
        case dio.DioErrorType.RESPONSE:
          {
            final res = e.response;
            final parsedResponse = (res.data is Map<String, dynamic>)
                ? parser.parseResponse(res.data as Map<String, dynamic>)
                : null;
            throw DioLinkServerException(
                response: res, parsedResponse: parsedResponse);
          }
        case dio.DioErrorType.DEFAULT:
        default:
          throw DioLinkUnkownException(originalException: e);
      }
    } catch (e) {
      throw DioLinkUnkownException(originalException: e);
    }
  }

  Response _parseDioResponse(dio.Response<Map<String, dynamic>> dioResponse) {
    try {
      return parser.parseResponse(dioResponse.data);
    } catch (e) {
      throw DioLinkParserException(
        originalException: e,
        response: dioResponse,
      );
    }
  }

  Map<String, dynamic> _serializeRequest(Request request) {
    try {
      return serializer.serializeRequest(request);
    } catch (e) {
      throw RequestFormatException(
        originalException: e,
        request: request,
      );
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

  /// Closes the underlining Dio client
  void close({bool force = false}) {
    client?.close(force: force);
  }
}
