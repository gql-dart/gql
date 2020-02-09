import "dart:async";

import "package:code_builder/code_builder.dart";
import "package:build/build.dart";
import "package:dart_style/dart_style.dart";
import "package:gql_build/src/config.dart";

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  Library library,
  BuildStep buildStep,
  String extension,
) {
  if (library.body.isEmpty) return null;

  final generatedAsset = buildStep.inputId.changeExtension(extension);

  final genSrc = _dartfmt.format("${library.accept(
    DartEmitter(
      _GqlAllocator(
        generatedAsset.uri.toString(),
        extension,
      ),
    ),
  )}");

  return buildStep.writeAsString(
    generatedAsset,
    genSrc,
  );
}

class _GqlAllocator implements Allocator {
  static const _doNotPrefix = ["dart:core"];

  final _imports = <String, int>{};
  final String extension;
  final String currentUrl;
  var _keys = 1;

  _GqlAllocator(
    this.currentUrl,
    this.extension,
  );

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;

    if (reference.url == null || _doNotPrefix.contains(reference.url)) {
      return symbol;
    }

    if (reference.url.endsWith(sourceExtension)) {
      final replacedUrl = reference.url.replaceAll(RegExp(r".graphql$"), extension);

      if (replacedUrl == currentUrl) {
        return symbol;
      }

      return "_i${_imports.putIfAbsent(replacedUrl, _nextKey)}.$symbol";
    }

    return "_i${_imports.putIfAbsent(reference.url, _nextKey)}.$symbol";
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: "_i${_imports[u]}"),
      );
}
