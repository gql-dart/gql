import "dart:async";

import "package:build/build.dart";

import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/data.dart";
import "package:gql_build/src/fragment_builder.dart";

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
      FragmentBuilder.fragmentsFileOutput(buildStep).uri.toString(),
      schema,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );

    return writeDocument(
      library,
      buildStep,
      dataExtension,
    );
  }
}
