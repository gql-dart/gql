import "dart:convert";

import "package:collection/collection.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "./_utils.dart";

class GqlClientRequest {
  final String method;
  final Uri uri;
  final Map<String, dynamic> body;
  final Map<String, String> headers;
  final Map<String, dynamic> fileMap;

  GqlClientRequest({
    this.method,
    this.uri,
    this.body,
    this.headers,
    this.fileMap,
  });

  bool get isMultipartRequest => fileMap != null && fileMap.isNotEmpty;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return o is GqlClientRequest &&
        o.method == method &&
        o.uri == uri &&
        mapEquals(o.body, body) &&
        mapEquals(o.headers, headers) &&
        mapEquals(o.fileMap, fileMap);
  }

  @override
  int get hashCode =>
      method.hashCode ^
      uri.hashCode ^
      body.hashCode ^
      headers.hashCode ^
      fileMap.hashCode;
}

class GqlClientResponse {
  final int statusCode;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  GqlClientResponse({
    this.statusCode,
    this.headers,
    this.body,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return o is GqlClientResponse &&
        o.statusCode == statusCode &&
        mapEquals(o.headers, headers) &&
        o.body == body;
  }

  @override
  int get hashCode => statusCode.hashCode ^ headers.hashCode ^ body.hashCode;
}

abstract class GqlClient {
  Future<GqlClientResponse> send(GqlClientRequest request);

  void close();
}

class HttpGqlClient extends GqlClient {
  final http.Client _httpClient;

  HttpGqlClient(
    http.Client httpClient,
  ) : _httpClient = httpClient ?? http.Client();

  @override
  Future<GqlClientResponse> send(GqlClientRequest request) async {
    try {
      final httpResponse = await _httpClient.send(_mapRequest(request));
      return _mapResponse(httpResponse);
    } catch (e) {
      throw ServerException(
        originalException: e,
        parsedResponse: null,
      );
    }
  }

  Future<GqlClientResponse> _mapResponse(
    http.StreamedResponse httpStreamedResponse,
  ) async {
    final httpResponse = await http.Response.fromStream(httpStreamedResponse);
    final responseBody = json.decode(
      utf8.decode(
        httpResponse.bodyBytes,
      ),
    ) as Map<String, dynamic>;

    return GqlClientResponse(
      body: responseBody,
      headers: httpResponse.headers,
      statusCode: httpResponse.statusCode,
    );
  }

  http.BaseRequest _mapRequest(GqlClientRequest request) {
    final httpBody = json.encode(
      request.body,
      toEncodable: (dynamic object) =>
          (object is http.MultipartFile) ? null : object.toJson(),
    );
    if (request.isMultipartRequest) {
      return http.MultipartRequest(
        request.method,
        request.uri,
      )
        ..body = httpBody
        ..addAllFiles(request.fileMap as Map<String, http.MultipartFile>)
        ..headers.addAll(request.headers);
    }
    return http.Request(
      request.method,
      request.uri,
    )
      ..body = httpBody
      ..headers.addAll(request.headers);
  }

  @override
  void close() {
    _httpClient?.close();
  }
}
