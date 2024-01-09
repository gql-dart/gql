import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:gql_build/src/allocators/gql_allocator.dart";
import "package:gql_code_builder/schema.dart";
import "package:path/path.dart";

import "./config.dart";
import "./utils/reader.dart";
import "./utils/writer.dart";

class SchemaBuilder implements Builder {
  final Map<String, Reference> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;
  final bool generatePossibleTypesMap;
  final TriStateValueConfig triStateValueConfig;

  SchemaBuilder(this.typeOverrides, this.enumFallbackConfig,
      this.generatePossibleTypesMap, this.triStateValueConfig);

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

    final schemaUrl =
        outputAssetId(buildStep.inputId, schemaExtension).uri.toString();
    final allocator = GqlAllocator(
      buildStep.inputId.uri.toString(),
      outputAssetId(buildStep.inputId, schemaExtension).uri.toString(),
      schemaUrl,
    );

    final library = buildSchemaLibrary(
      doc,
      basename(generatedPartUrl),
      typeOverrides,
      enumFallbackConfig,
      generatePossibleTypesMap: generatePossibleTypesMap,
      allocator: allocator,
      triStateValueConfig: triStateValueConfig,
    );

    return writeDocument(
        library, buildStep, schemaExtension, schemaUrl, allocator);
  }
}
