import "dart:async";

import "package:code_builder/code_builder.dart";
import "package:build/build.dart";
import "package:dart_style/dart_style.dart";

import "../allocators/gql_allocator.dart";

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  Library library,
  BuildStep buildStep,
  String extension, [
  String? schemaUrl,
]) {
  if (library.body.isEmpty) return Future.value(null);

  final generatedAsset = buildStep.inputId.changeExtension(extension);

  final genSrc = _dartfmt.format("${library.accept(
    DartEmitter(
      allocator: GqlAllocator(
        buildStep.inputId.uri.toString(),
        generatedAsset.uri.toString(),
        schemaUrl,
      ),
      orderDirectives: true,
      useNullSafetySyntax: true,
    ),
  )}");

  return buildStep.writeAsString(
    generatedAsset,
    "// GENERATED CODE - DO NOT MODIFY BY HAND\n\n" + genSrc,
  );
}
