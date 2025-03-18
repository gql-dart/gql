import "dart:io";
import 'dart:convert';

import "package:args/args.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart";
import "package:gql_code_builder/data.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_debug_tools/visualize_ast.dart";
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption("schema", abbr: "s", help: "Path to schema file")
    ..addOption("query", abbr: "q", help: "Path to query file")
    ..addFlag("typenames",
        abbr: "t", help: "Add __typename to queries", defaultsTo: true)
    ..addFlag("when", help: "Generate when extension methods", defaultsTo: true)
    ..addFlag("maybeWhen",
        help: "Generate maybeWhen extension methods", defaultsTo: true)
    ..addFlag("reuseFragments",
        help: "Reuse fragments in generated classes", defaultsTo: false)
    ..addFlag("output",
        abbr: "o", help: "Write output to file", defaultsTo: false);

  final results = parser.parse(args);

  if (results["schema"] == null || results["query"] == null) {
    print("Both schema and query paths are required");
    print(parser.usage);
    exit(1);
  }

  final schemaPath = results["schema"] as String;
  final queryPath = results["query"] as String;
  //final addTypenames = results["typenames"] as bool;
  final generateWhen = results["when"] as bool;
  final generateMaybeWhen = results["maybeWhen"] as bool;
  final reuseFragments = results["reuseFragments"] as bool;
  final writeOutput = results["output"] as bool;

  // Read the GraphQL schema and query file
  final schemaContent = await File(schemaPath).readAsString();
  final queryContent = await File(queryPath).readAsString();

  // Parse the schema and query
  final schemaDoc = parseString(schemaContent);
  final queryDoc = parseString(queryContent);

  // Create source nodes
  final schemaSource = SourceNode(url: schemaPath, document: schemaDoc);
  final querySource = SourceNode(url: queryPath, document: queryDoc);

  analyzeGraphQL(querySource.document, diagramOutputPath: 'mermaid.mmd');

  // Define type overrides and config
  final typeOverrides = <String, Reference>{};
  final whenExtensionConfig = InlineFragmentSpreadWhenExtensionConfig(
    generateWhenExtensionMethod: generateWhen,
    generateMaybeWhenExtensionMethod: generateMaybeWhen,
  );
  final dataClassConfig = DataClassConfig(reuseFragments: reuseFragments);

  final outputFileName =
      path.basenameWithoutExtension(queryPath) + ".data.gql.g.dart";

  // Generate the library
  final library = buildDataLibrary(
    querySource,
    schemaSource,
    outputFileName,
    typeOverrides,
    whenExtensionConfig,
    dataClassConfig,
  );

  // Format and output the generated code
  final emitter = DartEmitter(useNullSafetySyntax: true);
  final formatter = DartFormatter();
  final code = formatter.format("${library.accept(emitter)}");

  if (writeOutput) {
    final outputPath = path.join(path.dirname(queryPath), "__generated__",
        path.basenameWithoutExtension(queryPath) + ".data.gql.dart");

    // Ensure directory exists
    Directory(path.dirname(outputPath)).createSync(recursive: true);

    // Write the generated code
    File(outputPath).writeAsStringSync(code);
    print("Generated code written to $outputPath");
  } else {
    print(code);
  }
}
