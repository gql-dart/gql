import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";

List<Class> buildInputClasses(
  DocumentNode doc,
) =>
    doc.definitions
        .whereType<InputObjectTypeDefinitionNode>()
        .map(buildInputClass)
        .toList();

Class buildInputClass(
  InputObjectTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = "${node.name.value}"
        ..fields = ListBuilder<Field>(
          <Field>[
            Field(
              (b) => b
                ..modifier = FieldModifier.final$
                ..type = refer(
                  "Map<String, dynamic>",
                )
                ..name = "input"
                ..assignment = literalMap(
                  {},
                  refer("String"),
                  refer("dynamic"),
                ).code,
            ),
          ],
        )
        ..methods = _buildSetters(node.fields),
    );

ListBuilder<Method> _buildSetters(
  List<InputValueDefinitionNode> nodes,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(_buildSetter),
    );

Method _buildSetter(
  InputValueDefinitionNode node,
) =>
    Method(
      (b) => b
        ..name = node.name.value
        ..type = MethodType.setter
        ..requiredParameters = ListBuilder<Parameter>(
          <Parameter>[
            Parameter(
              (b) => b
                ..type = typeRef(node.type)
                ..name = "value",
            )
          ],
        )
        ..lambda = true
        ..body = refer("input")
            .index(
              literalString(node.name.value),
            )
            .assign(
              refer("value"),
            )
            .code,
    );
