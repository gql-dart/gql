import "dart:convert";

import "package:dio/dio.dart" as dio;
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";

import "_utils.dart";
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
  });

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
    required this.statusCode,
  });

  @override
  List<Object> get fieldsForEquality => [
        statusCode,
      ];
}

extension _CastDioResponse on dio.Response {
  dio.Response<T> castData<T>() => dio.Response<T>(
        data: data as T?,
        headers: headers,
        requestOptions: requestOptions,
        isRedirect: isRedirect,
        statusCode: statusCode,
        statusMessage: statusMessage,
        redirects: redirects,
        extra: extra,
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
    required this.client,
    this.defaultHeaders = const {},
    this.serializer = const RequestSerializer(),
    this.parser = const ResponseParser(),
  });

  @override
  Stream<Response> request(Request request, [forward]) async* {
    final dio.Response<Map<String, dynamic>> dioResponse =
        await _executeDioRequest(
      body: _prepareRequestBody(request),
      headers: <String, String>{
        dio.Headers.acceptHeader: "*/*",
        dio.Headers.contentTypeHeader: dio.Headers.jsonContentType,
        ...defaultHeaders,
        ..._getHttpLinkHeaders(request),
      },
    );

    if (dioResponse.statusCode! >= 300 ||
        (dioResponse.data!["data"] == null &&
            dioResponse.data!["errors"] == null)) {
      throw DioLinkServerException(
        response: dioResponse,
        parsedResponse: _parseDioResponse(dioResponse),
      );
    }

    final gqlResponse = _parseDioResponse(dioResponse);
    yield Response(
      data: gqlResponse.data,
      errors: gqlResponse.errors,
      response: gqlResponse.response,
      context: _updateResponseContext(gqlResponse, dioResponse),
    );
  }

  dynamic _prepareRequestBody(Request request) {
    final body = _encodeAttempter(
      request,
      serializer.serializeRequest,
    )(request);

    final fileMap = extractFlattenedFileMap(body);

    if (fileMap.isEmpty) return body;

    final encodedBody = _encodeAttempter(
      request,
      (Map body) => json.encode(
        body,
        toEncodable: (dynamic object) =>
            (object is dio.MultipartFile) ? null : object.toJson(),
      ),
    )(body);

    final formBody = dio.FormData.fromMap(
      <String, dynamic>{
        "operations": encodedBody,
      }..addAll(generateFileFormBody(fileMap)),
    );

    return formBody;
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

  Context _updateResponseContext(
    Response response,
    dio.Response httpResponse,
  ) {
    try {
      return response.context.withEntry(
        DioLinkResponseContext(
          statusCode: httpResponse.statusCode!,
        ),
      );
    } catch (e) {
      throw ContextWriteException(
        originalException: e,
      );
    }
  }

  Future<dio.Response<Map<String, dynamic>>> _executeDioRequest({
    required dynamic body,
    required Map<String, String> headers,
  }) async {
    try {
      final res = await client.post<dynamic>(
        endpoint,
        data: body,
        options: dio.Options(
          responseType: dio.ResponseType.json,
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
        case dio.DioErrorType.connectTimeout:
        case dio.DioErrorType.receiveTimeout:
        case dio.DioErrorType.sendTimeout:
          throw DioLinkTimeoutException(
            type: e.type,
            originalException: e,
          );
        case dio.DioErrorType.cancel:
          throw DioLinkCanceledException(originalException: e);
        case dio.DioErrorType.response:
          {
            final res = e.response!;
            final parsedResponse = (res.data is Map<String, dynamic>)
                ? parser.parseResponse(res.data as Map<String, dynamic>)
                : null;
            throw DioLinkServerException(
                response: res,
                parsedResponse: parsedResponse,
                originalException: e);
          }
        case dio.DioErrorType.other:
        default:
          throw DioLinkUnkownException(originalException: e);
      }
    } catch (e) {
      if (e is LinkException) rethrow;
      throw DioLinkUnkownException(originalException: e);
    }
  }

  Response _parseDioResponse(dio.Response<Map<String, dynamic>> dioResponse) {
    try {
      return parser.parseResponse(dioResponse.data!);
    } catch (e) {
      throw DioLinkParserException(
        originalException: e,
        response: dioResponse,
      );
    }
  }

  Map<String, String> _getHttpLinkHeaders(Request request) {
    try {
      final HttpLinkHeaders? linkHeaders = request.context.entry();
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
    client.close(force: force);
  }
}
