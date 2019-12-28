import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/builders/schema.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Schema Builder
Builder schemaBuilder(
  BuilderOptions options,
) =>
    _SchemaBuilder();

class _SchemaBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [genExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildSchemaLibrary(
      doc,
      buildStep.inputId.changeExtension(".gql.g.dart").pathSegments.last,
    );

    return writeDocument(
      library,
      buildStep,
      genExtension,
    );
  }
}
