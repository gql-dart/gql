import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";
import "package:gql_code_gen/src/schema/enum.dart";
import "package:gql_code_gen/src/schema/input.dart";
import "package:gql_code_gen/src/schema/scalar.dart";

/// Build input types, enums and scalars from schema
Spec buildSchema(
  Node node,
) =>
    node.accept(
      _SchemaBuilderVisitor(),
    );

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final Map<String, Reference> _typeMap = defaultTypeMap;

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
      buildEnumClass(node);
}
