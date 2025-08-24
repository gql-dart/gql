import "dart:async";

import "package:build/build.dart";
import "package:dart_style/dart_style.dart";
import "package:gql_code_builder/req.dart";
import "package:path/path.dart";

import "./config.dart";
import "./utils/reader.dart";
import "./utils/writer.dart";

class ReqBuilder implements Builder {
  final AssetId schemaId;
  final DartFormatter formatter;

  ReqBuilder(
    this.schemaId,
    this.formatter,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        inputPattern: [outputPattern(reqExtension)],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(reqExtension))
        .uri
        .path;

    final library = buildReqLibrary(
      doc,
      basename(generatedPartUrl),
    );

    return writeDocument(
      library,
      buildStep,
      reqExtension,
      formatter,
      outputAssetId(schemaId, schemaExtension).uri.toString(),
    );
  }
}
