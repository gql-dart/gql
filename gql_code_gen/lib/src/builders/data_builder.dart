import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/code_builders/data.dart";
import "package:gql_code_gen/src/builders/utils/reader.dart";
import "package:gql_code_gen/src/builders/utils/writer.dart";

class DataBuilder implements Builder {
  final AssetId schemaId;

  DataBuilder(
    this.schemaId,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [dataExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final library = buildDataLibrary(
      doc,
      schema,
      schemaId.changeExtension(schemaExtension).pathSegments.last,
    );

    return writeDocument(
      library,
      buildStep,
      dataExtension,
    );
  }
}
