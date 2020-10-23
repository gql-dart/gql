import "package:gql/ast.dart";
import "package:gql_exec/gql_exec.dart" as gql;

typedef MultiPartFileTypeCheck = bool Function(dynamic file);

extension WithType on gql.Request {
  OperationType get type {
    final definitions = operation.document.definitions
        .whereType<OperationDefinitionNode>()
        .toList();
    if (operation.operationName != null) {
      definitions.removeWhere(
        (node) => node.name.value != operation.operationName,
      );
    }
    // TODO differentiate error types, add exception
    assert(definitions.length == 1);
    return definitions.first.type;
  }

  bool get isQuery => type == OperationType.query;
}

/// Recursively extract files and return them as a normalized map of [path] => [file]
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
Map<String, dynamic> extractFlattenedFileMap(
  dynamic body,
  MultiPartFileTypeCheck typeCheck, {
  Map<String, dynamic> currentMap,
  List<String> currentPath = const <String>[],
}) {
  currentMap ??= <String, dynamic>{};
  if (body is Map<String, dynamic>) {
    final Iterable<MapEntry<String, dynamic>> entries = body.entries;
    for (final MapEntry<String, dynamic> element in entries) {
      currentMap.addAll(extractFlattenedFileMap(
        element.value,
        typeCheck,
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
        typeCheck,
        currentMap: currentMap,
        currentPath: List<String>.from(currentPath)..add(i.toString()),
      ));
    }
    return currentMap;
  }

  if (typeCheck(body)) {
    return currentMap
      ..addAll(<String, dynamic>{
        currentPath.join("."): body,
      });
  }

  return currentMap;
}