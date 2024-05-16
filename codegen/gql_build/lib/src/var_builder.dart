import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:gql_build/src/allocators/gql_allocator.dart";
import "package:gql_code_builder/var.dart";
import "package:path/path.dart";

import "./config.dart";
import "./utils/add_introspection.dart";
import "./utils/reader.dart";
import "./utils/writer.dart";

class VarBuilder implements Builder {
  final AssetId schemaId;
  final Map<String, Reference> typeOverrides;
  final TriStateValueConfig triStateValueConfig;
  final bool varsCreateFactoriesConfig;

  VarBuilder(
    this.schemaId,
    this.typeOverrides,
    this.triStateValueConfig,
    this.varsCreateFactoriesConfig,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        inputPattern: [outputPattern(varExtension)],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(varExtension))
        .uri
        .path;

    final schemaUrl = outputAssetId(schemaId, schemaExtension).uri.toString();
    final allocator = GqlAllocator(
      buildStep.inputId.uri.toString(),
      outputAssetId(buildStep.inputId, schemaExtension).uri.toString(),
      schemaUrl,
    );

    final library = buildVarLibrary(
      doc,
      addTypenames(schema),
      basename(generatedPartUrl),
      typeOverrides,
      allocator,
      triStateValueConfig,
      varsCreateFactoriesConfig,
    );

    return writeDocument(
      library,
      buildStep,
      varExtension,
      schemaUrl,
      allocator,
    );
  }
}
