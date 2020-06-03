import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/schema/enum.dart";
import "package:gql_code_builder/src/schema/input.dart";
import "package:gql_code_builder/src/schema/scalar.dart";
import "package:meta/meta.dart";

/// Build input types, enums and scalars from schema
Spec buildSchema(
  DocumentNode schema,
) =>
    schema.accept(
      _SchemaBuilderVisitor(
        schema: schema,
      ),
    );

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final DocumentNode schema;

  _SchemaBuilderVisitor({
    @required this.schema,
  });

  Spec _acceptOne(
    Node node,
  ) =>
      node != null ? node.accept(this) : literalNull;

  List<Spec> _acceptMany(
    List<Node> nodes,
  ) =>
      nodes.map(_acceptOne).toList(
            growable: false,
          );

  @override
  Spec visitDocumentNode(
    DocumentNode node,
  ) =>
      Library(
        (b) => b.body.addAll(
          _acceptMany(node.definitions).where((d) => d != null),
        ),
      );

  @override
  Spec visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      buildInputClass(
        node,
        schema,
      );

  @override
  Spec visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      buildScalarClass(node);

  @override
  Spec visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      buildEnumClass(node);
}
