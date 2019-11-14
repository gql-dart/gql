import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";
import "package:gql_code_gen/src/schema/input.dart";
import "package:gql_code_gen/src/schema/scalar.dart";
import "package:meta/meta.dart";
import "package:recase/recase.dart";

/// Build input types, enums and scalars from schema
Spec buildSchema(
  Node node, [
  BuildOptions options,
]) =>
    node.accept(
      _SchemaBuilderVisitor(options),
    );

@immutable
class BuildOptions {
  final Map<String, Reference> typeMap;

  const BuildOptions({
    this.typeMap = const {},
  });
}

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final Map<String, Reference> _typeMap;

  _SchemaBuilderVisitor(BuildOptions options)
      : _typeMap = {
          ...defaultTypeMap,
          if (options != null) ...options.typeMap,
        };

  Reference _getTypeRef(
    String type,
  ) =>
      getTypeRef(
        type,
        _typeMap,
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
      buildInputClass(node);

  @override
  Spec visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      buildScalarClass(node);

  @override
  Spec visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      Block(
        (b) => b
          ..statements = ListBuilder<Code>(<Code>[
            Code("enum ${node.name.value} {"),
            ..._acceptMany(node.values).cast<Code>(),
            Code("}"),
          ]),
      );

  @override
  Spec visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) =>
      Block.of(<Code>[
        Code("${identifier(ReCase(node.name.value).camelCase)},"),
      ]);
}
