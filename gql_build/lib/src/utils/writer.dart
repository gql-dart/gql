import "dart:async";

import "package:code_builder/code_builder.dart";
import "package:build/build.dart";
import "package:dart_style/dart_style.dart";

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  Library library,
  BuildStep buildStep,
  String extension,
) {
  if (library.body.isEmpty) return null;

  final genSrc = _dartfmt.format("${library.accept(
    DartEmitter.scoped(),
  )}");

  return buildStep.writeAsString(
    buildStep.inputId.changeExtension(extension),
    genSrc,
  );
}
