import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/schema/enum.dart";
import "package:gql_code_builder/src/schema/input.dart";
import "package:gql_code_builder/src/schema/scalar.dart";
import "package:gql_code_builder/source.dart";

/// Build input types, enums and scalars from schema
Spec buildSchema(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    schemaSource.document.accept(
      _SchemaBuilderVisitor(
        schemaSource,
        typeOverrides,
      ),
    );

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final SourceNode schemaSource;
  final Map<String, Reference> typeOverrides;

  _SchemaBuilderVisitor(
    this.schemaSource,
    this.typeOverrides,
  );

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
        schemaSource,
        typeOverrides,
      );

  @override
  Spec visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      buildScalarClass(
        node,
        typeOverrides,
      );

  @override
  Spec visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      buildEnumClass(node);
}
