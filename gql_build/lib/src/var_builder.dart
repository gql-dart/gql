import "dart:async";

import "package:build/build.dart";
import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/var.dart";

class VarBuilder implements Builder {
  final AssetId schemaId;

  VarBuilder(
    this.schemaId,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [varExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = (await readDocument(buildStep)).flatDocument;
    final schema = (await readDocument(buildStep, schemaId)).flatDocument;

    final library = buildVarLibrary(
      doc,
      schema,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );

    return writeDocument(
      library,
      buildStep,
      varExtension,
    );
  }
}
