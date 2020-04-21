import "dart:async";

import "package:code_builder/code_builder.dart";
import "package:build/build.dart";
import "package:dart_style/dart_style.dart";
import "package:gql_build/src/config.dart";

final DartFormatter _dartfmt = DartFormatter();

Future<void> writeDocument(
  Library library,
  BuildStep buildStep,
  String extension, [
  String schemaUrl,
]) {
  if (library.body.isEmpty) return null;

  final generatedAsset = buildStep.inputId.changeExtension(extension);

  final genSrc = _dartfmt.format("${library.accept(
    DartEmitter(
      _GqlAllocator(
        buildStep.inputId.uri.toString(),
        generatedAsset.uri.toString(),
        schemaUrl,
      ),
    ),
  )}");

  return buildStep.writeAsString(
    generatedAsset,
    "// GENERATED CODE - DO NOT MODIFY BY HAND\n\n" + genSrc,
  );
}

class _GqlAllocator implements Allocator {
  static const _doNotPrefix = ["dart:core"];

  final String sourceUrl;
  final String currentUrl;
  final String schemaUrl;

  final _imports = <String, int>{};
  var _keys = 1;

  _GqlAllocator(
    this.sourceUrl,
    this.currentUrl,
    this.schemaUrl,
  );

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;

    if (reference.url == null || _doNotPrefix.contains(reference.url)) {
      return symbol;
    }

    final uri = Uri.parse(reference.url);

    if (uri.path.endsWith(sourceExtension)) {
      final replacedUrl = uri
          .replace(
            path: uri.path.replaceAll(
              RegExp(r".graphql$"),
              ".${uri.fragment}.gql.dart",
            ),
          )
          .removeFragment()
          .toString();

      if (replacedUrl == currentUrl) {
        return symbol;
      }

      return "_i${_imports.putIfAbsent(replacedUrl, _nextKey)}.$symbol";
    }

    if (uri.path.isEmpty && uri.fragment.isNotEmpty) {
      final replacedUrl = uri.fragment == "schema"
          ? schemaUrl
          : sourceUrl.replaceAll(
              RegExp(r".graphql$"),
              ".${uri.fragment}.gql.dart",
            );

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
