import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/builders/op.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Operation Builder
Builder opBuilder(
  BuilderOptions options,
) =>
    _OpBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

class _OpBuilder implements Builder {
  final AssetId schemaId;

  _OpBuilder(
    this.schemaId,
  );

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [opExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);
    final schema = await readDocument(buildStep, schemaId);

    final library = buildOpLibrary(
      doc,
      schema,
      buildStep.inputId.changeExtension(astExtension).pathSegments.last,
      schemaId.changeExtension(astExtension).pathSegments.last,
    );

    return writeDocument(
      library,
      buildStep,
      opExtension,
    );
  }
}
