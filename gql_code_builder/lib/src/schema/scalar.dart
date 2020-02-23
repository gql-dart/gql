import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/common.dart";

List<Class> buildScalarClasses(
  DocumentNode doc,
) =>
    doc.definitions
        .whereType<ScalarTypeDefinitionNode>()
        .map(buildScalarClass)
        .toList();

Class buildScalarClass(
  ScalarTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = identifier(node.name.value)
        ..constructors = _buildConstructors(identifier(node.name.value))
        ..fields = _buildFields(
          identifier(node.name.value),
        )
        ..methods = _buildMethods(identifier(node.name.value)),
    );

ListBuilder<Constructor> _buildConstructors(
  String scalarName,
) =>
    ListBuilder<Constructor>(
      <Constructor>[
        Constructor(
          (b) => b
            ..constant = true
            ..requiredParameters = ListBuilder<Parameter>(
              <Parameter>[
                Parameter(
                  (b) => b
                    ..name = "value"
                    ..toThis = true,
                )
              ],
            ),
        )
      ],
    );

ListBuilder<Method> _buildMethods(
  String scalarName,
) =>
    ListBuilder<Method>(
      <Method>[
        Method(
          (b) => b
            ..annotations = ListBuilder<Expression>(
              <Expression>[
                refer("override"),
              ],
            )
            ..returns = refer("int")
            ..name = "hashCode"
            ..lambda = true
            ..type = MethodType.getter
            ..body = refer("value").property("hashCode").code,
        ),
        Method(
          (b) => b
            ..annotations = ListBuilder<Expression>(
              <Expression>[
                refer("override"),
              ],
            )
            ..returns = refer("bool")
            ..name = "operator =="
            ..lambda = true
            ..requiredParameters = ListBuilder<Parameter>(
              <Parameter>[
                Parameter(
                  (b) => b
                    ..type = refer("Object")
                    ..name = "o",
                )
              ],
            )
            ..body = refer("o")
                .isA(refer(scalarName))
                .and(refer("o").property("value").equalTo(refer("value")))
                .code,
        )
      ],
    );

ListBuilder<Field> _buildFields(
  String scalarName,
) =>
    ListBuilder<Field>(
      <Field>[
        _buildValueField(),
      ],
    );

Field _buildValueField() => Field(
      (b) => b
        ..modifier = FieldModifier.final$
        ..type = refer("String")
        ..name = "value",
    );
