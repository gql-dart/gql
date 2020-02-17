import "dart:async";

import "package:build/build.dart";

import "package:gql_code_builder/source.dart";
import "package:gql/language.dart";

import "package:gql_build/src/config.dart";

Set<AssetId> _getImports(
  String source, {
  AssetId from,
}) {
  final imports = <String>{};

  final patterns = [
    RegExp(r'^#\s*import\s+"([^"]+)"', multiLine: true),
    RegExp(r"^#\s*import\s+'([^']+)'", multiLine: true),
  ];

  for (final pattern in patterns) {
    pattern.allMatches(source)?.forEach(
      (match) {
        final path = match?.group(1);
        if (path != null) {
          imports.add(
            path.endsWith(sourceExtension) ? path : "$path$sourceExtension",
          );
        }
      },
    );
  }

  return imports
      .map(
        (import) => AssetId.resolve(
          import,
          from: from,
        ),
      )
      .toSet();
}

Future<SourceNode> _assetToSourceNode(
  BuildStep buildStep,
  AssetId assetId,
) async {
  final sourceString = await buildStep.readAsString(assetId);

  final imports = _getImports(
    sourceString,
    from: assetId,
  );

  final url = assetId.uri.toString();

  return SourceNode(
    url: url,
    document: parseString(
      sourceString,
      url: url,
    ),
    imports: await Stream.fromIterable(imports)
        .asyncMap(
          (importedAssetId) => _assetToSourceNode(
            buildStep,
            importedAssetId,
          ),
        )
        .toSet(),
  );
}

Future<SourceNode> readDocument(
  BuildStep buildStep, [
  AssetId rootId,
]) =>
    _assetToSourceNode(
      buildStep,
      rootId ?? buildStep.inputId,
    );
