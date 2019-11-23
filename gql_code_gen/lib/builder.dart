library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:gql_code_gen/src/builders/ast.dart";
import "package:gql_code_gen/src/builders/schema.dart";

const schemaExtension = ".gql.dart";

/// Builder factory for Schema Builder
Builder builder(
  BuilderOptions options,
) =>
    _SchemaBuilder(options.config["schema"] as String);

class _SchemaBuilder implements Builder {
  final AssetId schemaAsset;

  final DartFormatter _dartfmt = DartFormatter();

  _SchemaBuilder(String schemaDescription)
      : schemaAsset = AssetId.parse(schemaDescription);

  @override
  Map<String, List<String>> get buildExtensions => {
        ".graphql": [schemaExtension],
      };

  Future<DocumentNode> readSchema(BuildStep buildStep) async => parseString(
        await buildStep.readAsString(schemaAsset),
        url: schemaAsset.uri.path,
      );

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final schema = await readSchema(buildStep);

    if (buildStep.inputId == schemaAsset) {
      print("--------> [schema] = ${buildStep.inputId}");
      final library = buildSchemaLibrary(
        schema,
        buildStep.inputId.changeExtension(".gql.g.dart").pathSegments.last,
      );

      if (library == null) return Future.value();

      final genSrc = _dartfmt.format("${library.accept(
        DartEmitter.scoped(),
      )}");

      return buildStep.writeAsString(
        buildStep.inputId.changeExtension(schemaExtension),
        genSrc,
      );
    } else {
      print("--------> [not-schema] = ${buildStep.inputId}");
      final src = await buildStep.readAsString(buildStep.inputId);

      final doc = parseString(src, url: buildStep.inputId.path);

      final library = buildAstLibrary(doc, schema);

      final genSrc = _dartfmt.format("${library.accept(
        DartEmitter.scoped(),
      )}");

      return buildStep.writeAsString(
        buildStep.inputId.changeExtension(schemaExtension),
        genSrc,
      );
    }
  }
}
