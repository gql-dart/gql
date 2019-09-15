library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/ast.dart";
import "package:gql/dart.dart";
import "package:gql/language.dart";
import "package:pedantic/pedantic.dart";

const astExtension = ".ast.g.dart";

/// Builder factory for AST Builder
Builder astBuilder(
  BuilderOptions options,
) =>
    _AstBuilder();

String _getName(DefinitionNode def) {
  if (def.name != null && def.name.value != null) return def.name.value;

  if (def is SchemaDefinitionNode) return "schema";

  if (def is OperationDefinitionNode) {
    if (def.type == OperationType.query) return "query";
    if (def.type == OperationType.mutation) return "mutation";
    if (def.type == OperationType.subscription) return "subscription";
  }

  return null;
}

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

    final definitions = doc.definitions.map(
      (def) => fromNode(def).assignConst(_getName(def)).statement,
    );

    final document = refer(
      "DocumentNode",
      "package:gql/ast.dart",
    )
        .call(
          [],
          {
            "definitions": literalList(
              doc.definitions.map(
                (def) => refer(
                  _getName(def),
                ),
              ),
            ),
          },
        )
        .assignConst("document")
        .statement;

    final library = Library(
      (b) => b.body
        ..addAll(definitions)
        ..add(document),
    );

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
