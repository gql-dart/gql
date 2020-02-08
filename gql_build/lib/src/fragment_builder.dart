import "dart:async";

import "package:build/build.dart";
import "package:glob/glob.dart";
import "package:path/path.dart" as p;
import "package:gql/ast.dart";
import "package:code_builder/code_builder.dart";
import "package:build/build.dart";
import "package:dart_style/dart_style.dart";

import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/config.dart";
import "package:gql_code_builder/fragment.dart";

final DartFormatter _dartfmt = DartFormatter();

class FragmentBuilder implements Builder {
  final AssetId schemaId;

  FragmentBuilder(
    this.schemaId,
  );

  static final _graphqlFiles = new Glob("lib/**.graphql");

  static AssetId fragmentsFileOutput(BuildStep buildStep) => AssetId(
        buildStep.inputId.package,
        p.join("lib", fragmentsFilename),
      );

  @override
  Map<String, List<String>> get buildExtensions => {
        libSyntheticExtension: [fragmentsFilename],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final fragmentMap = <String, FragmentDefinitionNode>{};

    await for (final input in buildStep.findAssets(_graphqlFiles)) {
      final doc = await readDocument(buildStep, input);
      doc.definitions
          .whereType<FragmentDefinitionNode>()
          .forEach((def) => fragmentMap.putIfAbsent(def.name.value, () => def));
    }

    final schema = await readDocument(buildStep, schemaId);

    final library = buildFragmentLibrary(
      fragmentMap,
      FragmentBuilder.fragmentsFileOutput(buildStep).uri.toString(),
      schema,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );

    if (library.body.isEmpty) return null;

    final genSrc = _dartfmt.format("${library.accept(
      DartEmitter.scoped(),
    )}");

    return buildStep.writeAsString(
      FragmentBuilder.fragmentsFileOutput(buildStep),
      genSrc,
    );
  }
}
