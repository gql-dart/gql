import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

List<Class> buildOperationVarClasses(
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(
          (op) => _buildOperationVarClass(
            op,
            schema,
            schemaUrl,
          ),
        )
        .toList();

Class _buildOperationVarClass(
  OperationDefinitionNode node,
  DocumentNode schema,
  String schemaUrl,
) =>
    Class(
      (b) => b
        ..name = "${node.name.value}VarBuilder"
        ..fields = ListBuilder<Field>(
          <Field>[
            Field(
              (b) => b
                ..modifier = FieldModifier.final$
                ..type = refer(
                  "Map<String, dynamic>",
                )
                ..name = "variables"
                ..assignment = literalMap(
                  {},
                  refer("String"),
                  refer("dynamic"),
                ).code,
            ),
          ],
        )
        ..methods = _buildSetters(
          node.variableDefinitions,
          schema,
          schemaUrl,
        ),
    );

ListBuilder<Method> _buildSetters(
  List<VariableDefinitionNode> nodes,
  DocumentNode schema,
  String schemaUrl,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(
        (VariableDefinitionNode node) => _buildSetter(
          node,
          schema,
          schemaUrl,
        ),
      ),
    );

Method _buildSetter(
  VariableDefinitionNode node,
  DocumentNode schema,
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
