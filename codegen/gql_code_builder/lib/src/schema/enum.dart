import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:recase/recase.dart";

import "package:gql_code_builder/src/common.dart";

List<Class> buildEnumClasses(
  DocumentNode doc,
) =>
    doc.definitions
        .whereType<EnumTypeDefinitionNode>()
        .map(buildEnumClass)
        .toList();

Class buildEnumClass(
  EnumTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = builtClassName(node.name.value)
        ..extend = refer("EnumClass", "package:built_value/built_value.dart")
        ..constructors = _buildConstructors()
        ..fields = _buildFields(
          node.values,
          builtClassName(node.name.value),
        )
        ..methods = _buildMethods(builtClassName(node.name.value)),
    );

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
            ..body = Code("_\$${enumName.camelCase}Serializer"),
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
            ..body = Code("_\$${enumName.camelCase}Values"),
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
            ..body = refer("_\$${enumName.camelCase}ValueOf")
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

Field _buildConst(
  EnumValueDefinitionNode node,
  String enumName,
) =>
    Field(
      (b) => b
        ..static = true
        ..modifier = FieldModifier.constant
        ..type = refer(enumName)
        ..name = identifier(node.name.value)
        ..assignment =
            Code("_\$${enumName.camelCase}${identifier(node.name.value)}"),
    );
