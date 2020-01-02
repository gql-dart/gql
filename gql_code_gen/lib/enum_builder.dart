import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/builders/enum.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Schema Builder
Builder enumBuilder(
  BuilderOptions options,
) =>
    _EnumBuilder();

class _EnumBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [enumExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildEnumLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      enumExtension,
    );
  }
}
