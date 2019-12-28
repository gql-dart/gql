library ast_builder;

import "dart:async";
import "package:path/path.dart" as p;
import "package:glob/glob.dart";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart";
import "package:pedantic/pedantic.dart";

const graphqlExtension = ".graphql";
const astExtension = ".gql.dart";

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
          path.endsWith(graphqlExtension) ? path : "$path$graphqlExtension",
        );
      }
    });
  }

  return imports;
}

Future<String> inlineImportsRecursively(BuildStep buildStep) async {
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

  await collectContentRecursivelyFrom(buildStep.inputId);

  seenImports
      .where(
        (i) => !importMap.containsKey(i),
      )
      .forEach(
        (missing) => log.warning("Could not import missing file $missing."),
      );

  return importMap.values.join("\n\n\n");
}

/// Builder factory for AST Builder
Builder astBuilder(
  BuilderOptions options,
) =>
    _AstBuilder();

class _AstBuilder implements Builder {
  final DartFormatter _dartfmt = DartFormatter();

  @override
  Map<String, List<String>> get buildExtensions => {
        graphqlExtension: [astExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final allContent = await inlineImportsRecursively(buildStep);
    final doc = parseString(
      allContent,
      url: buildStep.inputId.path,
    );

    final library = buildAstLibrary(doc);

    final genSrc = _dartfmt.format("${library.accept(
      DartEmitter.scoped(),
    )}");

    unawaited(
      buildStep.writeAsString(
        buildStep.inputId.changeExtension(astExtension),
        genSrc,
      ),
    );
  }
}
