import "dart:async";

import "package:build/build.dart";
import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/add_introspection.dart";
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
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final library = buildVarLibrary(
      doc,
      addTypenames(schema),
    );

    return writeDocument(
      library,
      buildStep,
      varExtension,
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );
  }
}
