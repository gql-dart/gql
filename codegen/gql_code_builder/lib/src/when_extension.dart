import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/data.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/utils/uncapitalize.dart";

// static building blocks for the generated code
final _genericTypeParam = TypeReference((b) => b..symbol = "_T");

final _orElseFunctionType =
    FunctionType((b) => b..returnType = _genericTypeParam);

String _getSchemaTypeName(InlineFragmentNode node) =>
    node.typeCondition!.on.name.value;

final _orElseFunctionRef = refer("orElse");
final _orElseInvocation = _orElseFunctionRef.call([]);
final _thisExpr = refer("this");

final _defaultCallOrElse = Block.of([
  Code("default:"),
  _orElseInvocation.returned.statement,
]);

final _switchTypeName = Code("switch(G__typename)");

final _curlyBracketOpen = Code("{");

final _curlyBracketClose = Code("}");

Code _caseStatement(InlineFragmentNode inlineFragment) =>
    Code("case '${_getSchemaTypeName(inlineFragment)}': ");

/// returns an Extension that implements the `when` method and/or the `maybeWhen` method
/// that makes it more convenient to use the union types or interfaces without resorting to
/// casting.
/// returns null if there are not inlineFragments with a typeCondition
/// or if both the `when` and `maybeWhen` methods are disabled in the config
Extension? inlineFragmentWhenExtension(
    {required String baseTypeName,
    required List<InlineFragmentNode> inlineFragments,
    required InlineFragmentSpreadWhenExtensionConfig config}) {
  final inlineFragmentsWithTypConditions = inlineFragments
      .where((inlineFragment) => inlineFragment.typeCondition != null)
      .toList();

  final nothingToDo = inlineFragmentsWithTypConditions.isEmpty ||
      (!config.generateWhenExtensionMethod &&
          !config.generateMaybeWhenExtensionMethod);

  if (nothingToDo) {
    return null;
  }

  /// returns the name of the concrete built class for the inlineFragment
  /// so we can refer to it in the generated code
  String getGeneratedTypeName(InlineFragmentNode node) =>
      builtClassName("${baseTypeName}__as${node.typeCondition!.on.name.value}");

  /// a pool of parameter names which have already been used
  /// so we can avoid name clashes
  final Set<String> usedParameterNames = {
    _orElseFunctionRef.symbol!,
    _genericTypeParam.symbol
  };

  final Map<InlineFragmentNode, String> parameterNamesPerInlineNode = {};

  /// stateful function that returns a unique parameter name for a given inlineFragment
  /// tries to pick the name of the type in the typeCondition first
  /// if that is not possible, it will will add "g" to the beginning of the name until it is unique
  /// example: if the typeCondition is "Human", the parameter name will be "human"
  /// if the typeCondition is "Human" and "human" is already taken, the parameter name will be "ghuman"
  /// if the typeCondition is "orElse", the parameter name will be "gorElse" because "orElse" is reserved
  String getParameterName(InlineFragmentNode node) =>
      parameterNamesPerInlineNode.putIfAbsent(node, () {
        var name = identifier(uncapitalize(_getSchemaTypeName(node)));

        while (usedParameterNames.contains(name)) {
          name = "g${name}";
        }
        usedParameterNames.add(name);
        return name;
      });

  /// return the body of a case: statement for the given inlineFragment for the maybeWhen method
  Code maybeWhenCaseBody(InlineFragmentNode node) {
    final functionParam = refer(getParameterName(node));
    final typeName = refer(getGeneratedTypeName(node));

    return functionParam
        .notEqualTo(literalNull)
        .conditional(
          functionParam.call([_thisExpr.asA(typeName)]),
          _orElseInvocation,
        )
        .returned
        .statement;
  }

  /// return the body of a case: statement for the given inlineFragment for the when method
  Code whenCaseBody(InlineFragmentNode node) {
    final functionParam = refer(getParameterName(node));
    final typeName = refer(getGeneratedTypeName(node));

    return functionParam.call([_thisExpr.asA(typeName)]).returned.statement;
  }

  return Extension((e) {
    e
      ..name = builtClassName(baseTypeName) + "WhenExtension"
      ..on = refer(builtClassName(baseTypeName));

    if (config.generateWhenExtensionMethod) {
      e.methods.add(
        Method((m) => m
          ..name = "when"
          ..returns = _genericTypeParam
          ..types.add(_genericTypeParam)
          ..optionalParameters.addAll(
            inlineFragmentsWithTypConditions.map(
              (inlineFragment) => Parameter((p) => p
                ..name = getParameterName(inlineFragment)
                ..type = FunctionType((b) => b
                  ..returnType = _genericTypeParam
                  ..requiredParameters
                      .add(Reference(getGeneratedTypeName(inlineFragment))))
                ..named = true
                ..required = true),
            ),
          )
          // todo: calculate if all possible types are covered by the when statement
          // if true, the orElse method can be removed
          ..optionalParameters.add(
            Parameter((p) => p
              ..name = _orElseFunctionRef.symbol!
              ..type = _orElseFunctionType
              ..named = true
              ..required = true),
          )
          ..body = Block.of([
            _switchTypeName,
            _curlyBracketOpen,
            ...inlineFragmentsWithTypConditions
                .map((inlineFragment) => Block.of([
                      _caseStatement(inlineFragment),
                      whenCaseBody(inlineFragment),
                    ])),
            _defaultCallOrElse,
            _curlyBracketClose,
          ])),
      );
    }
    if (config.generateMaybeWhenExtensionMethod) {
      e.methods.add(
        Method(
          (m) => m
            ..name = "maybeWhen"
            ..returns = _genericTypeParam
            ..types.add(_genericTypeParam)
            ..optionalParameters.addAll(
              inlineFragmentsWithTypConditions.map(
                (inlineFragment) => Parameter((p) => p
                  ..name = getParameterName(inlineFragment)
                  ..type = FunctionType((b) => b
                    ..returnType = _genericTypeParam
                    ..isNullable = true
                    ..requiredParameters.add(Reference(
                      getGeneratedTypeName(inlineFragment),
                    )))
                  ..named = true
                  ..required = false),
              ),
            )
            ..optionalParameters.add(
              Parameter((p) => p
                ..name = _orElseFunctionRef.symbol!
                ..type = _orElseFunctionType
                ..named = true
                ..required = true),
            )
            ..body = Block.of(
              [
                _switchTypeName,
                _curlyBracketOpen,
                ...inlineFragments
                    .where((element) => element.typeCondition != null)
                    .map((inlineFragment) => Block.of([
                          _caseStatement(inlineFragment),
                          maybeWhenCaseBody(inlineFragment),
                        ])),
                _defaultCallOrElse,
                _curlyBracketClose,
              ],
            ),
        ),
      );
    }
  });
}
