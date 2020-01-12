import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/code_builders/scalar.dart";
import "package:gql_code_gen/src/builders/utils/reader.dart";
import "package:gql_code_gen/src/builders/utils/writer.dart";

class ScalarBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [scalarExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildScalarLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      scalarExtension,
    );
  }
}
