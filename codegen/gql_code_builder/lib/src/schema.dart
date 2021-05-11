import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/schema.dart";
import "package:gql_code_builder/src/schema/enum.dart";
import "package:gql_code_builder/src/schema/input.dart";
import "package:gql_code_builder/src/schema/scalar.dart";
import "package:gql_code_builder/source.dart";

/// Build input types, enums and scalars from schema
Spec? buildSchema(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  EnumFallbackConfig enumFallbackConfig,
) =>
    schemaSource.document.accept(
      _SchemaBuilderVisitor(
        schemaSource,
        typeOverrides,
        enumFallbackConfig,
      ),
    );

class _SchemaBuilderVisitor extends SimpleVisitor<Spec?> {
  final SourceNode schemaSource;
  final Map<String, Reference> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;

  _SchemaBuilderVisitor(
    this.schemaSource,
    this.typeOverrides,
    this.enumFallbackConfig,
  );

  Spec? _acceptOne(
    Node? node,
  ) =>
      node != null ? node.accept(this) : literalNull;

  List<Spec?> _acceptMany(
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
          _acceptMany(node.definitions).whereType<Spec>(),
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
  Spec? visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      typeOverrides.containsKey(node.name.value)
          ? null
          : buildScalarClass(node);

  @override
  Spec visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      buildEnumClass(node, enumFallbackConfig);
}
