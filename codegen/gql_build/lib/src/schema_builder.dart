import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:path/path.dart";

import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/schema.dart";

class SchemaBuilder implements Builder {
  final Map<String, Reference> typeOverrides;

  SchemaBuilder(this.typeOverrides);

  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [schemaExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final generatedPartUrl = buildStep.inputId
        .changeExtension(generatedFileExtension(schemaExtension))
        .uri
        .path;

    final library = buildSchemaLibrary(
      doc,
      basename(generatedPartUrl),
      typeOverrides,
    );

    return writeDocument(
      library,
      buildStep,
      schemaExtension,
      buildStep.inputId.uri.toString(),
    );
  }
}
