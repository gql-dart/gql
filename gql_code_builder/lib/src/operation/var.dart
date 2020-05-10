import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

List<Class> buildOperationVarClasses(
  DocumentNode doc,
  DocumentNode schema,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(
          (op) => _buildOperationVarClass(
            op,
            schema,
          ),
        )
        .toList();

Class _buildOperationVarClass(
  OperationDefinitionNode node,
  DocumentNode schema,
) =>
    builtClass(
      name: "${node.name.value}Vars",
      getters: node.variableDefinitions.map<Method>(
        (node) => _buildGetter(
          node,
          schema,
        ),
      ),
    );

Method _buildGetter(
  VariableDefinitionNode node,
  DocumentNode schema,
) {
  final unwrappedTypeNode = unwrapTypeNode(node.type);
  final typeName = unwrappedTypeNode.name.value;
  final nullable = !unwrappedTypeNode.isNonNull;
  final argTypeDef = getTypeDefinitionNode(
    schema,
    typeName,
  );

  final typeMap = {
    ...defaultTypeMap,
    if (argTypeDef != null) typeName: refer(identifier(typeName), "#schema"),
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
      ..annotations = ListBuilder(<Expression>[
        if (nullable) CodeExpression(Code("nullable")),
      ])
      ..returns = argType
      ..type = MethodType.getter
      ..name = identifier(node.variable.name.value)
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
