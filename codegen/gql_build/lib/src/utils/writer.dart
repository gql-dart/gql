import "dart:async";

import "package:build/build.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";

import "../allocators/gql_allocator.dart";
import "../config.dart";

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  Library library,
  BuildStep buildStep,
  String extension, [
  String? schemaUrl,
  Allocator? allocator,
]) {
  if (library.body.isEmpty) return Future.value(null);

  allocator ??= GqlAllocator(
    buildStep.inputId.uri.toString(),
    outputAssetId(buildStep.inputId, extension).uri.toString(),
    schemaUrl,
  );

  final generatedAsset = outputAssetId(buildStep.inputId, extension);

  final genSrc = _dartfmt.format("${library.accept(
    DartEmitter(
      allocator: allocator,
      orderDirectives: true,
      useNullSafetySyntax: true,
    ),
  )}");

  return buildStep.writeAsString(
    generatedAsset,
    "// GENERATED CODE - DO NOT MODIFY BY HAND\n"
            "// ignore_for_file: type=lint\n\n" +
        genSrc,
  );
}
