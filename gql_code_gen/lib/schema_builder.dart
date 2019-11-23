library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart";
import "package:gql_code_gen/src/builders/schema.dart";

const schemaExtension = ".gql.dart";

/// Builder factory for Schema Builder
Builder schemaBuilder(
  BuilderOptions options,
) =>
    _SchemaBuilder();

class _SchemaBuilder implements Builder {
  final DartFormatter _dartfmt = DartFormatter();

  @override
  Map<String, List<String>> get buildExtensions => {
        ".graphql": [schemaExtension],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final src = await buildStep.readAsString(buildStep.inputId);

    final doc = parseString(src, url: buildStep.inputId.path);

    final library = buildSchemaLibrary(
      doc,
      buildStep.inputId.changeExtension(".gql.g.dart").pathSegments.last,
    );

    final genSrc = _dartfmt.format("${library.accept(
      DartEmitter.scoped(),
    )}");

    return buildStep.writeAsString(
      buildStep.inputId.changeExtension(schemaExtension),
      genSrc,
    );
  }
}
