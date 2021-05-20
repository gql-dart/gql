import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

Class buildScalarClass(
  ScalarTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(node.name.value)
        ..implements.add(
          TypeReference(
            (b) => b
              ..url = "package:built_value/built_value.dart"
              ..symbol = "Built"
              ..types = ListBuilder(
                <Reference>[
                  refer(builtClassName(node.name.value)),
                  refer("${builtClassName(node.name.value)}Builder"),
                ],
              ),
          ),
        )
        ..constructors = _buildConstructors(builtClassName(node.name.value))
        ..methods = _buildMethods(builtClassName(node.name.value)),
    );

ListBuilder<Constructor> _buildConstructors(
  String scalarName,
) =>
    ListBuilder(
      <Constructor>[
        Constructor((b) => b..name = "_"),
        Constructor(
          (b) => b
            ..factory = true
            ..optionalParameters.add(
              Parameter(
                (b) => b
                  ..name = "value"
                  ..type = TypeReference(
                    (b) => b
                      ..symbol = "String"
                      ..isNullable = true,
                  ),
              ),
            )
            ..body = refer("_\$${scalarName}").call([
              Method(
                (b) => b
                  ..lambda = true
                  ..requiredParameters.add(Parameter((b) => b..name = "b"))
                  ..body = refer("value")
                      .notEqualTo(refer("null"))
                      .conditional(
                        CodeExpression(Code("(b..value = value)")),
                        refer("b"),
                      )
                      .code,
              ).closure
            ]).code,
        ),
      ],
    );

ListBuilder<Method> _buildMethods(
  String scalarName,
) =>
    ListBuilder<Method>(
      <Method>[
        Method(
          (b) => b
            ..returns = refer("String")
            ..type = MethodType.getter
            ..name = "value",
        ),
        Method(
          (b) => b
            ..annotations.add(refer(
              "BuiltValueSerializer",
              "package:built_value/built_value.dart",
            ).call([], {"custom": literalBool(true)}))
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..url = "package:built_value/serializer.dart"
                ..symbol = "Serializer"
                ..types.add(
                  refer(scalarName),
                ),
            )
            ..type = MethodType.getter
            ..name = "serializer"
            ..lambda = true
            ..body = TypeReference((b) => b
              ..symbol = "DefaultScalarSerializer"
              ..url =
                  "package:gql_code_builder/src/serializers/default_scalar_serializer.dart"
              ..types.add(refer(scalarName))).call([
              Method(
                (b) => b
                  ..requiredParameters.add(
                    Parameter(
                      (b) => b
                        ..type = refer("Object")
                        ..name = "serialized",
                    ),
                  )
                  ..lambda = true
                  ..body = refer(scalarName).call([
                    refer("serialized").asA(
                      TypeReference(
                        (b) => b
                          ..symbol = "String"
                          ..isNullable = true,
                      ),
                    )
                  ]).code,
              ).closure
            ]).code,
        ),
      ],
    );
