import "dart:async";

import "package:build/build.dart";
import "package:gql_code_gen/src/builders/utils/reader.dart";
import "package:gql_code_gen/src/builders/utils/writer.dart";
import "package:gql_code_gen/src/code_builders/req.dart";
import "package:gql_code_gen/src/config.dart";

class ReqBuilder implements Builder {
  final AssetId schemaId;

  ReqBuilder(
    this.schemaId,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [reqExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final library = buildReqLibrary(
      doc,
      schema,
      buildStep.inputId.changeExtension(opExtension).uri.toString(),
      schemaId.changeExtension(schemaExtension).uri.toString(),
    );

    return writeDocument(
      library,
      buildStep,
      reqExtension,
    );
  }
}
