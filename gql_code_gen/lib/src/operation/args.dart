import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";

List<Class> buildOperationArgsClasses(
  DocumentNode doc,
  DocumentNode schema,
  String opDocUrl,
  String schemaUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(
          (op) => _buildOperationArgsClass(
            op,
            opDocUrl,
            schemaUrl,
          ),
        )
        .toList();

Class _buildOperationArgsClass(
  OperationDefinitionNode node,
  String opDocUrl,
  String schemaUrl,
) =>
    Class(
      (b) => b
        ..name = node.name.value
        ..extend = Reference(
          "Request",
          "package:gql_exec/gql_exec.dart",
        )
        ..constructors = ListBuilder<Constructor>(<Constructor>[
          Constructor(
            (b) => b
              ..initializers = ListBuilder<Code>(<Code>[
                refer(
                  "super",
                ).call(
                  [],
                  {
                    "operation": refer(
                      node.name.value,
                      opDocUrl,
                    ),
                    "variables": literalMap(
                      {},
                      refer("String"),
                      refer("dynamic"),
                    )
                  },
                ).code,
              ]),
          ),
        ])
        ..methods = _buildSetters(node.variableDefinitions),
    );

ListBuilder<Method> _buildSetters(
  List<VariableDefinitionNode> nodes,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(_buildSetter),
    );

Method _buildSetter(
  VariableDefinitionNode node,
) =>
    Method(
      (b) => b
        ..name = node.variable.name.value
        ..type = MethodType.setter
        ..requiredParameters = ListBuilder<Parameter>(<Parameter>[
          Parameter(
            (b) => b
              ..type = typeRef(node.type)
              ..name = "value",
          )
        ])
        ..lambda = true
        ..body = Code("variables[\"${node.variable.name.value}\"] = value"),
    );
