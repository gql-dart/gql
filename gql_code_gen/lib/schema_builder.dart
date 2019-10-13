library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart";
import "package:gql_code_gen/gql_code_gen.dart";

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

    final library = buildSchema(doc) as Library;

    final libraryWithPart = library.rebuild(
      (b) => b
        ..body = ListBuilder<Spec>(<Spec>[
          Code(
            "part '${buildStep.inputId.changeExtension(".gql.g.dart").pathSegments.last}';",
          ),
          ...library.body,
        ]),
    );

    final genSrc = _dartfmt.format("${libraryWithPart.accept(
      DartEmitter.scoped(),
    )}");

    return buildStep.writeAsString(
      buildStep.inputId.changeExtension(schemaExtension),
      genSrc,
    );
  }
}
