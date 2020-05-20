import "dart:async";

import "package:build/build.dart";
import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/add_introspection.dart" as introspection;
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/data.dart";
import "package:path/path.dart";

class DataBuilder implements Builder {
  final AssetId schemaId;
  final bool addTypenames;

  DataBuilder(
    this.schemaId,
    this.addTypenames,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [dataExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(dataExtension))
        .uri
        .path;

    final library = buildDataLibrary(
      addTypenames ? introspection.addTypenames(doc) : doc,
      introspection.addTypenames(schema),
      basename(generatedPartUrl),
    );

    return writeDocument(
      library,
      buildStep,
      dataExtension,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );
  }
}
