library ast_builder;

import "dart:async";

import "package:build/build.dart";
import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:gql_code_gen/gql_code_gen.dart";

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
      final library = buildSchema(schema) as Library;

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
    } else {
      print("--------> [not-schema] = ${buildStep.inputId}");
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

      return buildStep.writeAsString(
        buildStep.inputId.changeExtension(schemaExtension),
        genSrc,
      );
    }
  }
}

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
