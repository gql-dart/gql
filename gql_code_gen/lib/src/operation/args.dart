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
            schema,
            opDocUrl,
            schemaUrl,
          ),
        )
        .toList();

Class _buildOperationArgsClass(
  OperationDefinitionNode node,
  DocumentNode schema,
  String opDocUrl,
  String schemaUrl,
) =>
    Class(
      (b) => b
        ..name = node.name.value
        ..extend = refer(
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
        ..methods = _buildSetters(
          node.variableDefinitions,
          schema,
          opDocUrl,
          schemaUrl,
        ),
    );

ListBuilder<Method> _buildSetters(
  List<VariableDefinitionNode> nodes,
  DocumentNode schema,
  String opDocUrl,
  String schemaUrl,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(
        (VariableDefinitionNode node) => _buildSetter(
          node,
          schema,
          opDocUrl,
          schemaUrl,
        ),
      ),
    );

Method _buildSetter(
  VariableDefinitionNode node,
  DocumentNode schema,
  String opDocUrl,
  String schemaUrl,
) {
  final unwrappedTypeNode = _unwrapTypeNode(node.type);
  final typeName = unwrappedTypeNode.name.value;
  final argTypeDef = _getTypeDefinitionNode(
    schema,
    typeName,
  );

  final typeMap = {
    ...defaultTypeMap,
    if (argTypeDef != null) typeName: refer(typeName, schemaUrl),
  };

  final argType = typeRef(
    node.type,
    typeMap,
  );
  final unwrappedArgType = typeRef(
    unwrappedTypeNode,
    typeMap,
  );

  return Method(
    (b) => b
      ..name = node.variable.name.value
      ..type = MethodType.setter
      ..requiredParameters = ListBuilder<Parameter>(
        <Parameter>[
          Parameter(
            (b) => b
              ..type = argType
              ..name = "value",
          ),
        ],
      )
      ..lambda = true
      ..body = refer("variables")
          .index(
            literalString(node.variable.name.value),
          )
          .assign(
            (node.type is ListTypeNode &&
                    (argTypeDef is InputObjectTypeDefinitionNode ||
                        argTypeDef is ScalarTypeDefinitionNode ||
                        argTypeDef is EnumTypeDefinitionNode))
                ? refer("value")
                    .property("map")
                    .call(
                      [
                        Method(
                          (b) => b
                            ..requiredParameters = ListBuilder<Parameter>(
                              <Parameter>[
                                Parameter(
                                  (b) => b
                                    ..type = unwrappedArgType
                                    ..name = "e",
                                ),
                              ],
                            )
                            ..lambda = true
                            ..body = (argTypeDef
                                        is InputObjectTypeDefinitionNode
                                    ? refer("e").property("input")
                                    : argTypeDef is ScalarTypeDefinitionNode ||
                                            argTypeDef is EnumTypeDefinitionNode
                                        ? refer("e").property("value")
                                        : refer("e"))
                                .code,
                        ).closure,
                      ],
                    )
                    .property("toList")
                    .call([])
                : argTypeDef is InputObjectTypeDefinitionNode
                    ? refer("value").property("input")
                    : argTypeDef is ScalarTypeDefinitionNode ||
                            argTypeDef is EnumTypeDefinitionNode
                        ? refer("value").property("value")
                        : refer("value"),
          )
          .code,
  );
}

TypeDefinitionNode _getTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions.whereType<TypeDefinitionNode>().firstWhere(
          (node) => node.name.value == name,
          orElse: () => null,
        );

NamedTypeNode _unwrapTypeNode(
  TypeNode node,
) {
  if (node is NamedTypeNode) {
    return node;
  }

  if (node is ListTypeNode) {
    return _unwrapTypeNode(node.type);
  }

  return null;
}
