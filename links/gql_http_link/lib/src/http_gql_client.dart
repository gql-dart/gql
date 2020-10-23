import "dart:convert";

import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;

class HttpGqlClient extends GqlClient {
  final http.Client _httpClient;

  HttpGqlClient(
    http.Client httpClient,
  ) : _httpClient = httpClient ?? http.Client();

  @override
  Future<GqlClientResponse> send(GqlClientRequest request) async {
    final httpReq = _mapRequest(request);
    final httpRes = await _executeRequest(httpReq);
    return _mapResponse(httpRes);
  }

  http.BaseRequest _mapRequest(GqlClientRequest request) {
    final httpBody = json.encode(
      request.body,
      toEncodable: (dynamic object) =>
          checkFileType(object) ? null : object.toJson(),
    );
    if (request.isMultipartRequest) {
      final multiPartRequest = http.MultipartRequest(
        request.method,
        request.uri,
      );
      multiPartRequest.headers.addAll(request.headers);
      multiPartRequest.fields.addAll({
        "operations": httpBody,
        "map": json.encode(request.fileMapping),
      });
      multiPartRequest.files.addAll(
        request.files.entries.map((entry) {
          final field = entry.key;
          final file = entry.value as http.MultipartFile;
          return http.MultipartFile(
            field,
            file.finalize(),
            file.length,
            contentType: file.contentType,
            filename: file.filename,
          );
        }).toList(),
      );
      return multiPartRequest;
    }
    return http.Request(
      request.method,
      request.uri,
    )
      ..body = httpBody
      ..headers.addAll(request.headers);
  }

  Future<http.Response> _executeRequest(http.BaseRequest httpRequest) async {
    try {
      final httpStreamedResponse = await _httpClient.send(httpRequest);
      return http.Response.fromStream(httpStreamedResponse);
    } catch (e) {
      throw ServerException(
        originalException: e,
        parsedResponse: null,
      );
    }
  }

  Future<GqlClientResponse> _mapResponse(
    http.Response httpResponse,
  ) async {
    try {
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
  bool checkFileType(dynamic file) => file is http.MultipartFile;
}
