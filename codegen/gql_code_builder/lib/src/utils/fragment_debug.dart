// A debug utility for tracking fragment and selection merging
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../common.dart";

class FragmentDebugger {
  static const bool _enabled = true;
  static int _indentLevel = 0;
  static const String _indentStr = "  ";

  static void log(String message) {
    if (_enabled) {
      print("${_indent()}$message");
    }
  }

  static void enterScope(String scope) {
    if (_enabled) {
      log("Entering: $scope");
      _indentLevel++;
    }
  }

  static void exitScope(String scope) {
    if (_enabled) {
      _indentLevel--;
      log("Exiting: $scope");
    }
  }

  static String _indent() => _indentStr * _indentLevel;

  static void dumpSelections(String context, List<SelectionNode> selections) {
    if (!_enabled) return;

    enterScope("Selections for $context");

    for (final selection in selections) {
      if (selection is FieldNode) {
        final name = selection.alias?.value ?? selection.name.value;
        log("Field: $name (${selection.name.value})");

        if (selection.selectionSet != null) {
          enterScope("Nested selections");
          dumpSelections(
              "$context > $name", selection.selectionSet!.selections);
          exitScope("Nested selections");
        }
      } else if (selection is FragmentSpreadNode) {
        log("FragmentSpread: ${selection.name.value}");
      } else if (selection is InlineFragmentNode) {
        final typeName =
            selection.typeCondition?.on.name.value ?? "no-type-condition";
        log("InlineFragment: on $typeName");

        enterScope("Inline fragment selections");
        dumpSelections(
            "$context > $typeName", selection.selectionSet.selections);
        exitScope("Inline fragment selections");
      }
    }

    exitScope("Selections for $context");
  }

  static void dumpFragmentMap(
      String context, Map<String, dynamic> fragmentMap) {
    if (!_enabled) return;

    enterScope("Fragment map for $context");

    fragmentMap.forEach((key, value) {
      log("Fragment: $key");
      if (value is SourceSelections) {
        enterScope("Selections");
        dumpSelections("fragment $key", value.selections);
        exitScope("Selections");
      } else {
        log("Value: $value");
      }
    });

    exitScope("Fragment map for $context");
  }

  static void dumpMethod(String className, Method method) {
    if (!_enabled) return;

    final returnType = method.returns != null ? "${method.returns}" : "unknown";
    log("Class $className has method: ${method.name} -> $returnType");
  }

  static void dumpFieldGetters(String className, List<Method> methods) {
    if (!_enabled) return;

    enterScope("Field getters for $className");
    for (final method in methods) {
      dumpMethod(className, method);
    }
    exitScope("Field getters for $className");
  }

  static void dumpProcessedFields(
      String className, Set<String> processedFields) {
    if (!_enabled) return;

    log("Processed fields for $className: ${processedFields.join(', ')}");
  }

  static void dumpExpandedFragments(
      String context, List<SelectionNode> before, List<SelectionNode> after) {
    if (!_enabled) return;

    enterScope("Fragment expansion for $context");
    log("Before expansion: ${before.length} selections");
    log("After expansion: ${after.length} selections");

    final beforeFields =
        before.whereType<FieldNode>().map((f) => f.name.value).toSet();
    final afterFields =
        after.whereType<FieldNode>().map((f) => f.name.value).toSet();

    final newFields = afterFields.difference(beforeFields);
    if (newFields.isNotEmpty) {
      log("New fields after expansion: ${newFields.join(', ')}");
    }

    exitScope("Fragment expansion for $context");
  }

  static void dumpMergeResult(String context, List<SelectionNode> result) {
    if (!_enabled) return;

    enterScope("Merge result for $context");

    final fields =
        result.whereType<FieldNode>().map((f) => f.name.value).toList();
    log("Fields: ${fields.join(', ')}");

    final inlineFragments = result.whereType<InlineFragmentNode>().length;
    log("Inline fragments: $inlineFragments");

    final fragmentSpreads = result.whereType<FragmentSpreadNode>().length;
    log("Fragment spreads: $fragmentSpreads");

    exitScope("Merge result for $context");
  }
}
