import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/tristate_optionals.dart";

import "../schema.dart";
import "../source.dart";
import "./schema/enum.dart";
import "./schema/input.dart";
import "./schema/scalar.dart";

/// Build input types, enums and scalars from schema
Spec? buildSchema(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  EnumFallbackConfig enumFallbackConfig,
  Allocator allocator,
  TriStateValueConfig triStateValueConfig,
) =>
    schemaSource.document
        .accept(
          _SchemaBuilderVisitor(
            schemaSource,
            typeOverrides,
            enumFallbackConfig,
            allocator,
            triStateValueConfig,
          ),
        )
        ?.first;

class _SchemaBuilderVisitor extends SimpleVisitor<List<Spec>?> {
  final SourceNode schemaSource;
  final Map<String, Reference> typeOverrides;
  final EnumFallbackConfig enumFallbackConfig;

  final Allocator allocator;
  final TriStateValueConfig triStateValueConfig;

  const _SchemaBuilderVisitor(this.schemaSource, this.typeOverrides,
      this.enumFallbackConfig, this.allocator, this.triStateValueConfig);

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
    final inputClass =
        buildInputClass(node, schemaSource, typeOverrides, triStateValueConfig);

    return switch (triStateValueConfig) {
      TriStateValueConfig.never => [inputClass],
      TriStateValueConfig.onAllNullableFields => [
          inputClass,
          nullAwareJsonSerializerClass(
              inputClass, allocator, schemaSource, typeOverrides)
        ],
    };
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
