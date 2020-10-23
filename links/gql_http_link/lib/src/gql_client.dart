import "package:collection/collection.dart";

class GqlClientRequest {
  final String method;
  final Uri uri;
  final Map<String, dynamic> body;
  final Map<String, String> headers;
  final Map<String, dynamic> files;
  final Map<String, List<String>> fileMapping;

  GqlClientRequest({
    this.method,
    this.uri,
    this.body,
    this.headers,
    this.files,
    this.fileMapping,
  });

  factory GqlClientRequest.multipart({
    String method,
    Uri uri,
    Map<String, dynamic> body,
    Map<String, String> headers,
    Map<String, dynamic> fileMap,
  }) {
    final Map<String, List<String>> fileMapping = <String, List<String>>{};
    final Map<String, dynamic> files = <String, dynamic>{};

    final List<MapEntry<String, dynamic>> fileMapEntries =
        fileMap.entries.toList(growable: false);

    for (int i = 0; i < fileMapEntries.length; i++) {
      final MapEntry<String, dynamic> entry = fileMapEntries[i];
      final String indexString = i.toString();
      fileMapping.addAll(<String, List<String>>{
        indexString: <String>[entry.key],
      });
      files[indexString] = entry.value;
    }

    return GqlClientRequest(
      method: method,
      uri: uri,
      body: body,
      headers: headers,
      fileMapping: fileMapping,
      files: files,
    );
  }

  bool get isMultipartRequest => files != null && files.isNotEmpty;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return o is GqlClientRequest &&
        o.method == method &&
        o.uri == uri &&
        mapEquals(o.body, body) &&
        mapEquals(o.headers, headers) &&
        mapEquals(o.files, files) &&
        mapEquals(o.fileMapping, fileMapping);
  }

  @override
  int get hashCode =>
      method.hashCode ^
      uri.hashCode ^
      body.hashCode ^
      headers.hashCode ^
      files.hashCode ^
      fileMapping.hashCode;
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

  bool checkFileType(dynamic file);
}
