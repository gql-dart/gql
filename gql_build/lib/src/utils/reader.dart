import "dart:async";

import "package:path/path.dart" as p;
import "package:glob/glob.dart";
import "package:build/build.dart";

import "package:gql/ast.dart";
import "package:gql/language.dart";

import "package:gql_build/src/config.dart";

Set<String> allRelativeImports(String doc) {
  final imports = <String>{};
  for (final pattern in [
    RegExp(r'^#\s*import\s+"([^"]+)"', multiLine: true),
    RegExp(r"^#\s*import\s+'([^']+)'", multiLine: true)
  ]) {
    pattern.allMatches(doc)?.forEach((m) {
      final path = m?.group(1);
      if (path != null) {
        imports.add(
          path.endsWith(sourceExtension) ? path : "$path$sourceExtension",
        );
      }
    });
  }

  return imports;
}

Future<DocumentNode> readDocument(
  BuildStep buildStep, [
  AssetId rootId,
]) async =>
    parseString(
      await readCombinedSource(buildStep, rootId),
      url: (rootId ?? buildStep.inputId).path,
    );

Future<String> readCombinedSource(
  BuildStep buildStep, [
  AssetId rootId,
]) async {
  final Map<String, String> importMap = {};
  final Set<String> seenImports = {};

  void collectContentRecursivelyFrom(AssetId id) async {
    importMap[id.path] = await buildStep.readAsString(id);
    final segments = id.pathSegments..removeLast();

    final imports = allRelativeImports(importMap[id.path])
        .map((i) => p.normalize(p.joinAll([...segments, i])))
        .where((i) => !importMap.containsKey(i)) // avoid duplicates/cycles
        .toSet();

    seenImports.addAll(imports);

    final assetIds = await Stream.fromIterable(imports)
        .asyncExpand(
          (relativeImport) => buildStep.findAssets(Glob(relativeImport)),
        )
        .toSet();

    for (final assetId in assetIds) {
      await collectContentRecursivelyFrom(assetId);
    }
  }

  await collectContentRecursivelyFrom(rootId ?? buildStep.inputId);

  seenImports
      .where(
        (i) => !importMap.containsKey(i),
      )
      .forEach(
        (missing) => log.warning("Could not import missing file $missing."),
      );

  return importMap.values.join("\n\n\n");
}
