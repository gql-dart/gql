library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart";
import "package:gql_code_gen/src/builders/ast.dart";
import "package:pedantic/pedantic.dart";

const astExtension = ".gql.dart";

/// Builder factory for AST Builder
Builder astBuilder(
  BuilderOptions options,
) =>
    _AstBuilder();

class _AstBuilder implements Builder {
  final DartFormatter _dartfmt = DartFormatter();

  @override
  Map<String, List<String>> get buildExtensions => {
        ".graphql": [astExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final src = await buildStep.readAsString(buildStep.inputId);

    final doc = parseString(src, url: buildStep.inputId.path);

    final library = buildAstLibrary(doc);

    final genSrc = _dartfmt.format("${library.accept(
      DartEmitter.scoped(),
    )}");

    unawaited(
      buildStep.writeAsString(
        buildStep.inputId.changeExtension(astExtension),
        genSrc,
      ),
    );
  }
}
