import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

List<Class> buildDataClasses(
  DocumentNode doc,
  DocumentNode schema, [
  String schemaUrl = "schema.dart",
]) =>
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
          ..fields = ListBuilder<Field>(selSet.selections.map<Field>(
            (SelectionNode sel) {
              if (sel is FieldNode) {
                return Field(
                  (b) => b
                    ..name = sel.alias?.value ?? sel.name.value
                    ..type =
                        refer("${name}\$${sel.alias?.value ?? sel.name.value}"),
                );
              }

              throw UnsupportedError("fragments are not yet supported");
            },
          )),
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
