import "dart:convert";

import "package:gql_http_link/gql_http_link.dart";
import "package:dio/dio.dart" as dio;
import "package:gql_link/gql_link.dart";

class DioGqlClient extends GqlClient {
  final dio.Dio _httpClient;

  DioGqlClient([
    dio.Dio httpClient,
  ]) : _httpClient = httpClient ?? dio.Dio();

  @override
  Future<GqlClientResponse> send(GqlClientRequest request) async {
    final Uri uri = request.uri;
    final dio.Options options = _getOptions(request);
    final dynamic data = _getData(request);
    final httpRes = await _executeRequest(uri, options, data);
    return _mapResponse(httpRes);
  }

  dio.Options _getOptions(GqlClientRequest request) => dio.Options(
        method: request.method,
        headers: request.headers,
        responseType: dio.ResponseType.json,
        validateStatus: (statusCode) => true,
      );

  dynamic _getData(GqlClientRequest request) {
    if (request.isMultipartRequest) {
      final httpBody = json.encode(
        request.body,
        toEncodable: (dynamic object) =>
            checkFileType(object) ? null : object.toJson(),
      );
      final data = dio.FormData();
      data.fields.addAll([
        MapEntry("operations", httpBody),
        MapEntry("map", json.encode(request.fileMapping)),
      ]);
      data.files.addAll(
        request.files.entries.cast<MapEntry<String, dio.MultipartFile>>(),
      );
      return data;
    }
    return request.body;
  }

  Future<dio.Response> _executeRequest(
    Uri uri,
    dio.Options options,
    dynamic data,
  ) async {
    try {
      return _httpClient.requestUri<dynamic>(
        uri,
        options: options,
        data: data,
      );
    } catch (e) {
      throw ServerException(
        originalException: e,
        parsedResponse: null,
      );
    }
  }

  Future<GqlClientResponse> _mapResponse(dio.Response httpResponse) async {
    try {
      return GqlClientResponse(
        body: httpResponse.data as Map<String, dynamic>,
        headers: httpResponse.headers?.map?.map(
              (key, value) => MapEntry(key, value.join(" ")),
            ) ??
            {},
        statusCode: httpResponse.statusCode,
      );
    } catch (e) {
      throw HttpLinkParserException(
        originalException: e,
        response: httpResponse,
      );
    }
  }

  @override
  void close() {
    _httpClient?.close();
  }

  @override
  bool checkFileType(dynamic file) => file is dio.MultipartFile;
}
