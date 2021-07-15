import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "../../schema.dart";
import "../common.dart";
import "../utils/to_camel_case.dart";

Class buildEnumClass(
  EnumTypeDefinitionNode node,
  EnumFallbackConfig enumFallbackConfig,
) =>
    Class(
      (b) => b
        ..name = builtClassName(node.name.value)
        ..extend = refer("EnumClass", "package:built_value/built_value.dart")
        ..constructors = _buildConstructors()
        ..fields = _buildFields(
          [
            ...node.values.map((enumValue) {
              if (enumFallbackConfig.fallbackValueMap[node.name.value] ==
                  enumValue.name.value) {
                return EnumValueDefinitionNode(
                    name: enumValue.name,
                    fallback: true,
                    span: enumValue.span,
                    directives: enumValue.directives,
                    description: enumValue.description);
              }
              return enumValue;
            }),
            if (enumFallbackConfig.generateFallbackValuesGlobally &&
                !enumFallbackConfig.fallbackValueMap
                    .containsKey(node.name.value))
              EnumValueDefinitionNode(
                  name: NameNode(
                    value: _ensureNoNameClashes(
                      enumFallbackConfig.globalEnumFallbackName!,
                      node,
                    ),
                  ),
                  fallback: true)
          ],
          builtClassName(node.name.value),
        )
        ..methods = _buildMethods(builtClassName(node.name.value)),
    );

String _ensureNoNameClashes(
    String globalEnumFallbackName, EnumTypeDefinitionNode node) {
  String currentFallbackName = globalEnumFallbackName;

  while (node.values
      .map((e) => e.name.value)
      .any((element) => currentFallbackName == element)) {
    //TODO emit warning or throw error when this happens?
    currentFallbackName = "g$currentFallbackName";
  }

  return currentFallbackName;
}

ListBuilder<Constructor> _buildConstructors() => ListBuilder<Constructor>(
      <Constructor>[
        Constructor(
          (b) => b
            ..constant = true
            ..name = "_"
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = "name"
                  ..type = refer("String"),
              ),
            )
            ..initializers.add(refer("super").call([refer("name")]).code),
        ),
      ],
    );

ListBuilder<Method> _buildMethods(
  String enumName,
) =>
    ListBuilder<Method>(
      <Method>[
        Method(
          (b) => b
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..url = "package:built_value/serializer.dart"
                ..symbol = "Serializer"
                ..types.add(
                  refer(enumName),
                ),
            )
            ..type = MethodType.getter
            ..name = "serializer"
            ..lambda = true
            ..body = Code("_\$${toCamelCase(enumName)}Serializer"),
        ),
        Method(
          (b) => b
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..url = "package:built_collection/built_collection.dart"
                ..symbol = "BuiltSet"
                ..types.add(
                  refer(enumName),
                ),
            )
            ..type = MethodType.getter
            ..name = "values"
            ..lambda = true
            ..body = Code("_\$${toCamelCase(enumName)}Values"),
        ),
        Method(
          (b) => b
            ..static = true
            ..returns = refer(enumName)
            ..name = "valueOf"
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = "name"
                  ..type = refer("String"),
              ),
            )
            ..lambda = true
            ..body = refer("_\$${toCamelCase(enumName)}ValueOf")
                .call([refer("name")]).code,
        ),
      ],
    );

ListBuilder<Field> _buildFields(
  List<EnumValueDefinitionNode> nodes,
  String enumName,
) =>
    ListBuilder<Field>(
      nodes.map<Field>(
        (node) => _buildConst(
          node,
          enumName,
        ),
      ),
    );

const _enumConstReserved = <String>[
  /// "name" can't be used as a const value since "name" is a member of the extended BuiltEnum class from BuiltValue
  "name",
];

String _escapeConstName(String raw) =>
    _enumConstReserved.contains(identifier(raw))
        ? identifier("G$raw")
        : identifier(raw);

Field _buildConst(
  EnumValueDefinitionNode node,
  String enumName,
) =>
    Field(
      (b) => b
        ..annotations = ListBuilder(<Expression>[
          if (_escapeConstName(node.name.value) != node.name.value ||
              node.fallback)
            refer("BuiltValueEnumConst", "package:built_value/built_value.dart")
                .call([], {
              "wireName": literalString(node.name.value),
              if (node.fallback) "fallback": literalBool(true)
            }),
        ])
        ..static = true
        ..modifier = FieldModifier.constant
        ..type = refer(enumName)
        ..name = _escapeConstName(node.name.value)
        ..assignment = Code(
            "_\$${toCamelCase(enumName)}${_escapeConstName(node.name.value)}"),
    );
