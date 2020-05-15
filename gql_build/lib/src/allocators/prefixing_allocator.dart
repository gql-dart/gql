import "package:code_builder/code_builder.dart";

class PrefixingAllocator implements Allocator {
  final List<String> doNotPrefix;

  PrefixingAllocator(this.doNotPrefix);

  static const _doNotImport = [
    "dart:core",
  ];

  final _imports = <String, int>{};
  var _keys = 1;

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;
    if (reference.url == null || _doNotImport.contains(reference.url)) {
      return symbol;
    }

    if (doNotPrefix.contains(reference.url)) {
      _imports.putIfAbsent(reference.url, () => null);
      return symbol;
    }
    return "_i${_imports.putIfAbsent(reference.url, _nextKey)}.$symbol";
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => _imports[u] == null
            ? Directive.import(u)
            : Directive.import(u, as: "_i${_imports[u]}"),
      );
}
