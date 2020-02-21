import "dart:async";

import "package:build/build.dart";

import "package:gql_build/src/utils/reader.dart";
import "package:gql_build/src/utils/writer.dart";
import "package:gql_build/src/config.dart";
import "package:gql_code_builder/op.dart";

class OpBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [opExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildOpLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      opExtension,
    );
  }
}
