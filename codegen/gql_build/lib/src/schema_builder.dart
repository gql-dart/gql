import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/schema.dart";
import "package:path/path.dart";

import "./config.dart";
import "./utils/reader.dart";
import "./utils/writer.dart";

class SchemaBuilder implements Builder {
  final Map<String, Reference> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;
  final bool generatePossibleTypesMap;

  SchemaBuilder(
    this.typeOverrides,
    this.enumFallbackConfig,
      this.generatePossibleTypesMap,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        inputPattern: [outputPattern(schemaExtension)],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(schemaExtension))
        .uri
        .path;

    final library = buildSchemaLibrary(
      doc,
      basename(generatedPartUrl),
      typeOverrides,
      enumFallbackConfig,
      generatePossibleTypesMap: generatePossibleTypesMap,
    );

    return writeDocument(
      library,
      buildStep,
      schemaExtension,
      outputAssetId(buildStep.inputId, schemaExtension).uri.toString(),
    );
  }
}
