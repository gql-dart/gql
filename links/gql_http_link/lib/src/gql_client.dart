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

  List<Object> get _props => [
        method,
        uri,
        body,
        headers,
        fileMapping,
        files,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is GqlClientRequest &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(o._props, _props));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(_props);
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

  List<Object> get _props => [
        statusCode,
        body,
        headers,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is GqlClientResponse &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(o._props, _props));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(_props);
}

abstract class GqlClient {
  Future<GqlClientResponse> send(GqlClientRequest request);

  void close();

  bool checkFileType(dynamic file);
}
