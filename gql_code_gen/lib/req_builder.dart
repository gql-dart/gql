import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/builders/req.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Operation Builder
Builder reqBuilder(
  BuilderOptions options,
) =>
    _ReqBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

class _ReqBuilder implements Builder {
  final AssetId schemaId;

  _ReqBuilder(
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
      buildStep.inputId.changeExtension(opExtension).pathSegments.last,
      schemaId.changeExtension(opExtension).pathSegments.last,
    );

    return writeDocument(
      library,
      buildStep,
      reqExtension,
    );
  }
}
