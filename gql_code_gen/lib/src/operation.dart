import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";

Class buildOperationArgsClass(
  OperationDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = "${node.name.value}Args"
        ..fields = _buildFields(node.variableDefinitions)
        ..methods = ListBuilder<Method>(<Method>[
          Method(
            (b) => b
              ..name = "toJson"
              ..returns = refer("Map<String, dynamic>")
              ..lambda = true
              ..body = Code("_\$${node.name.value}ToJson(this)"),
          ),
        ])
        ..constructors = ListBuilder<Constructor>(<Constructor>[
          _buildConstructor(node),
          fromJson(node.name.value),
        ])
        ..annotations = ListBuilder<Expression>(<Expression>[
          jsonAnnotation("JsonSerializable"),
        ]),
    );

ListBuilder<Field> _buildFields(
  List<VariableDefinitionNode> nodes,
) =>
    ListBuilder<Field>(
      nodes.map<Field>(_buildField),
    );

Field _buildField(
  VariableDefinitionNode node,
) =>
    Field(
      (b) => b
        ..name = node.variable.name.value
        ..type = typeRef(node.type)
        ..modifier = FieldModifier.final$
        ..annotations = ListBuilder<Expression>(<Expression>[
          jsonAnnotation(
            "JsonKey",
            [],
            {
              "disallowNullValue": literalBool(
                node.type.isNonNull,
              ),
              "required": literalBool(
                node.type.isNonNull,
              ),
              "nullable": literalBool(
                !node.type.isNonNull,
              ),
              "includeIfNull": literalBool(
                false,
              ),
            },
          ),
        ]),
    );

Constructor _buildConstructor(
  OperationDefinitionNode node,
) =>
    Constructor(
      (b) => b
        ..optionalParameters = ListBuilder<Parameter>(
          node.variableDefinitions.map<Parameter>(_buildParameter),
        )
        ..constant = true,
    );

Parameter _buildParameter(
  VariableDefinitionNode node,
) =>
    Parameter(
      (b) => b
        ..name = node.variable.name.value
        ..toThis = true
        ..named = true,
    );
