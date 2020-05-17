import "package:code_builder/code_builder.dart";

/// Imports only the relevent references from the source, "show"
class PickAllocator implements Allocator {
  final List<String> doNotPick;
  final List<String> include;

  final Map<String, List<String>> _imports = {};

  PickAllocator({this.doNotPick, this.include}) {
    for (final url in include) {
      _imports[url] = null;
    }
  }

  static const _doNotImport = [
    "dart:core",
  ];

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;
    if (reference.url == null || _doNotImport.contains(reference.url)) {
      return symbol;
    }

    if (doNotPick.contains(reference.url) || include.contains(reference.url)) {
      _imports.putIfAbsent(reference.url, () => null);
      return symbol;
    }

    _imports.update(reference.url, (symbols) => symbols..add(reference.symbol),
        ifAbsent: () => [reference.symbol]);

    return symbol;
  }

  @override
  Iterable<Directive> get imports => _imports.entries.map(
        (u) => _imports[u.key] == null
            ? Directive.import(u.key)
            : Directive.import(u.key, show: u.value),
      );
}
