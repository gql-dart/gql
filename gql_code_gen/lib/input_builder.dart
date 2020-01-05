import "dart:async";

import "package:build/build.dart";
import "package:gql_code_gen/src/builders/input.dart";
import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for Schema Builder
Builder inputBuilder(
  BuilderOptions options,
) =>
    _InputBuilder();

class _InputBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [inputExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildInputLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      inputExtension,
    );
  }
}
