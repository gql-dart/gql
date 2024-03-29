import "dart:async";

import "package:build/build.dart";
import "package:gql_code_builder/ast.dart";

import "./config.dart";
import "./utils/reader.dart";
import "./utils/writer.dart";

class AstBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        inputPattern: [outputPattern(astExtension)],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildAstLibrary(
      doc,
    );

    return writeDocument(
      library,
      buildStep,
      astExtension,
    );
  }
}
