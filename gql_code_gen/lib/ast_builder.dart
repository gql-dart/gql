import "dart:async";

import "package:build/build.dart";

import "package:gql_code_gen/src/config.dart";
import "package:gql_code_gen/src/builders/ast.dart";
import "package:gql_code_gen/src/reader/reader.dart";
import "package:gql_code_gen/src/writer/writer.dart";

/// Builder factory for AST Builder
Builder astBuilder(
  BuilderOptions options,
) =>
    _AstBuilder();

class _AstBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        sourceExtension: [astExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final doc = await readDocument(buildStep);

    final library = buildAstLibrary(doc);

    return writeDocument(
      library,
      buildStep,
      astExtension,
    );
  }
}
