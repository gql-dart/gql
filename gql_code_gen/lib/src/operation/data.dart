import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

List<Class> buildDataClasses(
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .expand(
          (op) => _buildOperationDataClasses(
            op,
            doc,
            schema,
            schemaUrl,
          ),
        )
        .toList();

List<Class> _buildOperationDataClasses(
  OperationDefinitionNode op,
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    _buildSelectionSetDataClasses(
      "\$${op.name.value}",
      op.selectionSet,
      doc,
      schema,
      schemaUrl,
    );

List<Class> _buildSelectionSetDataClasses(
  String name,
  SelectionSetNode selSet,
  DocumentNode doc,
  DocumentNode schema,
  String schemaUrl,
) =>
    [
      Class(
        (b) => b
          ..name = name
          ..constructors = ListBuilder<Constructor>(<Constructor>[
            Constructor(
              (b) => b
                ..requiredParameters = ListBuilder<Parameter>(<Parameter>[
                  Parameter(
                    (b) => b
                      ..name = "data"
                      ..toThis = true,
                  )
                ])
                ..constant = true,
            ),
          ])
          ..fields = ListBuilder<Field>(
            <Field>[
              Field(
                (b) => b
                  ..name = "data"
                  ..type = refer(
                    "Map<String, dynamic>",
                  )
                  ..modifier = FieldModifier.final$,
              ),
            ],
          )
          ..methods = _buildGetters(
            selSet.selections,
            name,
          ),
      ),
      ...selSet.selections
          .whereType<FieldNode>()
          .where(
            (field) => field.selectionSet != null,
          )
          .expand(
            (field) => _buildSelectionSetDataClasses(
              "${name}\$${field.alias?.value ?? field.name.value}",
              field.selectionSet,
              doc,
              schema,
              schemaUrl,
            ),
          ),
    ];

ListBuilder<Method> _buildGetters(
  List<SelectionNode> nodes,
  String prefix,
) =>
    ListBuilder<Method>(
      nodes.map<Method>(
        (node) => _buildSetter(
          node,
          prefix,
        ),
      ),
    );

Method _buildSetter(
  SelectionNode node,
  String prefix,
) {
  if (node is FieldNode) {
    final name = node.alias?.value ?? node.name.value;
    final returns = "$prefix\$$name";

    return Method(
      (b) => b
        ..returns = node.selectionSet == null
            ? refer(
                "String",
              )
            : refer(
                returns,
              )
        ..name = name
        ..type = MethodType.getter
        ..lambda = true
        ..body = node.selectionSet == null
            ? Code(
                'data["$name"] as String',
              )
            : Code(
                '$returns(data["$name"] as Map<String, dynamic>)',
              ),
    );
  }

  throw UnsupportedError("fragments are not yet supported");
}
