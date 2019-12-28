import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/builders/ast.dart";
import "package:gql_code_gen/src/builders/schema.dart";
import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Schema Builder
Builder builder(
  BuilderOptions options,
) =>
    _SchemaBuilder(options.config["schema"] as String);

class _SchemaBuilder implements Builder {
  final AssetId schemaAsset;

  _SchemaBuilder(String schemaDescription)
      : schemaAsset = AssetId.parse(schemaDescription);

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [genExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final schema = await readDocument(buildStep, schemaAsset);

    if (buildStep.inputId == schemaAsset) {
      print("--------> [schema] = ${buildStep.inputId}");
      final library = buildSchemaLibrary(
        schema,
        buildStep.inputId.changeExtension(".gql.g.dart").pathSegments.last,
      );

      if (library == null) return Future.value();

      return writeDocument(
        library,
        buildStep,
        genExtension,
      );
    } else {
      print("--------> [not-schema] = ${buildStep.inputId}");
      final doc = await readDocument(buildStep);

      final library = buildAstLibrary(
        doc,
        schema,
      );

      return writeDocument(
        library,
        buildStep,
        genExtension,
      );
    }
  }
}
