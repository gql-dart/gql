import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/var.dart";

import "./schema/enum.dart";
import "./schema/input.dart";
import "./schema/scalar.dart";
import "../schema.dart";
import "../source.dart";

/// Build input types, enums and scalars from schema
Spec? buildSchema(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  EnumFallbackConfig enumFallbackConfig,
  Allocator allocator,
) =>
    schemaSource.document
        .accept(
          _SchemaBuilderVisitor(
            schemaSource,
            typeOverrides,
            enumFallbackConfig,
            allocator,
          ),
        )
        ?.first;

class _SchemaBuilderVisitor extends SimpleVisitor<List<Spec>?> {
  final SourceNode schemaSource;
  final Map<String, Reference> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;

  final Allocator allocator;

  const _SchemaBuilderVisitor(this.schemaSource, this.typeOverrides,
      this.enumFallbackConfig, this.allocator);

  @override
  List<Spec> visitDocumentNode(
    DocumentNode node,
  ) =>
      [
        Library(
          (b) => b.body.addAll(
            node.definitions.expand(
              (node) => node.accept(this) ?? [],
            ),
          ),
        )
      ];

  @override
  List<Spec> visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) {
    final inputClass = buildInputClass(
      node,
      schemaSource,
      typeOverrides,
    );
    final serializer = nullAwareJsonSerializerClass(
        inputClass, allocator, schemaSource, typeOverrides);
    return [inputClass, serializer];
  }

  @override
  List<Spec> visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      typeOverrides.containsKey(node.name.value)
          ? []
          : [buildScalarClass(node)];

  @override
  List<Spec> visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      [buildEnumClass(node, enumFallbackConfig)];
}
