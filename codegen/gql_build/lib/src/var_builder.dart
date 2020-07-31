import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:path/path.dart";

import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/add_introspection.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/var.dart";

class VarBuilder implements Builder {
  final AssetId schemaId;
  final Map<String, Reference> typeOverrides;

  VarBuilder(
    this.schemaId,
    this.typeOverrides,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [varExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(varExtension))
        .uri
        .path;

    final library = buildVarLibrary(
      doc,
      addTypenames(schema),
      basename(generatedPartUrl),
      typeOverrides,
    );

    return writeDocument(
      library,
      buildStep,
      varExtension,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );
  }
}
