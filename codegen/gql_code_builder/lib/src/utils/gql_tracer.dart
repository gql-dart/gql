// src/utils/gql_tracer.dart
import "package:gql/ast.dart";

class GqlTracer {
  static bool enabled = true;
  static int _indent = 0;
  static final Set<String> _fragmentStack = {};

  static void trace(String operation, {String? info}) {
    if (!enabled) return;
    final indent = "  " * _indent;
    print('${indent}GQL: $operation${info != null ? ' - $info' : ''}');
  }

  static T traceOperation<T>(String name, T Function() operation) {
    if (!enabled) return operation();

    trace("BEGIN $name");
    _indent++;
    try {
      final result = operation();
      _indent--;
      trace("END $name");
      return result;
    } catch (e) {
      _indent--;
      trace("ERROR $name", info: e.toString());
      rethrow;
    }
  }

  static bool beginFragmentExpansion(String fragmentName) {
    if (_fragmentStack.contains(fragmentName)) {
      trace("CYCLE DETECTED", info: fragmentName);
      trace('FRAGMENT STACK: ${_fragmentStack.join(' → ')}');
      return false;
    }
    _fragmentStack.add(fragmentName);
    return true;
  }

  static void endFragmentExpansion(String fragmentName) {
    _fragmentStack.remove(fragmentName);
  }

  static void dumpSelections(List<SelectionNode> selections, {String? label}) {
    if (!enabled) return;

    final indent = "  " * _indent;
    print('${indent}--- ${label ?? 'SELECTIONS'} (${selections.length}) ---');

    for (final selection in selections) {
      if (selection is FieldNode) {
        final name = selection.alias?.value ?? selection.name.value;
        print("${indent}${selection.runtimeType}: $name");
      } else if (selection is FragmentSpreadNode) {
        print("${indent}${selection.runtimeType}: ...${selection.name.value}");
      } else if (selection is InlineFragmentNode) {
        final typeName = selection.typeCondition?.on.name.value ?? "no-type";
        print("${indent}${selection.runtimeType}: ...on $typeName");
      } else {
        print("${indent}${selection.runtimeType}");
      }
    }
  }
}
