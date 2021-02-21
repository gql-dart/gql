import "dart:convert";

import "package:http/http.dart";
import "package:gql/ast.dart";
import "package:gql_exec/gql_exec.dart" as gql;

extension WithType on gql.Request {
  OperationType get type {
    final definitions = operation.document.definitions
        .whereType<OperationDefinitionNode>()
        .toList();
    if (operation.operationName != null) {
      definitions.removeWhere(
        (node) => node.name!.value != operation.operationName,
      );
    }
    // TODO differentiate error types, add exception
    assert(definitions.length == 1);
    return definitions.first.type;
  }

  bool get isQuery => type == OperationType.query;
}

/// Recursively extract [MultipartFile]s and return them as a normalized map of [path] => [file]
/// From the given request body
///
/// ```dart
/// {
///   "foo": [ { "bar": MultipartFile("blah.txt") } ]
///  }
/// // =>
/// {
///   "foo.0.bar": MultipartFile("blah.txt")
/// }
/// ```
Map<String, MultipartFile> extractFlattenedFileMap(
  dynamic body, {
  Map<String, MultipartFile>? currentMap,
  List<String> currentPath = const <String>[],
}) {
  currentMap ??= <String, MultipartFile>{};
  if (body is Map<String, dynamic>) {
    final Iterable<MapEntry<String, dynamic>> entries = body.entries;
    for (final MapEntry<String, dynamic> element in entries) {
      currentMap.addAll(extractFlattenedFileMap(
        element.value,
        currentMap: currentMap,
        currentPath: List<String>.from(currentPath)..add(element.key),
      ));
    }
    return currentMap;
  }
  if (body is List<dynamic>) {
    for (int i = 0; i < body.length; i++) {
      currentMap.addAll(extractFlattenedFileMap(
        body[i],
        currentMap: currentMap,
        currentPath: List<String>.from(currentPath)..add(i.toString()),
      ));
    }
    return currentMap;
  }

  if (body is MultipartFile) {
    return currentMap
      ..addAll({
        currentPath.join("."): body,
      });
  }

  return currentMap;
}

extension AddAllFiles on MultipartRequest {
  void addAllFiles(Map<String, MultipartFile> fileMap) {
    final Map<String, List<String>> fileMapping = <String, List<String>>{};
    final List<MultipartFile> fileList = <MultipartFile>[];

    final List<MapEntry<String, MultipartFile>> fileMapEntries =
        fileMap.entries.toList(growable: false);

    for (int i = 0; i < fileMapEntries.length; i++) {
      final MapEntry<String, MultipartFile> entry = fileMapEntries[i];
      final String indexString = i.toString();
      fileMapping.addAll(<String, List<String>>{
        indexString: <String>[entry.key],
      });
      final MultipartFile f = entry.value;
      fileList.add(MultipartFile(
        indexString,
        f.finalize(),
        f.length,
        contentType: f.contentType,
        filename: f.filename,
      ));
    }

    fields["map"] = json.encode(fileMapping);

    files.addAll(fileList);
  }

  set body(String body) => fields["operations"] = body;
}
