import "dart:async";

import "package:build/build.dart";

import "package:gql_build/src/config.dart";
import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_code_builder/schema.dart";

class SchemaBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [schemaExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildSchemaLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      schemaExtension,
    );
  }
}
