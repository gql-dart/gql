import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";

const typenameField = FieldDefinitionNode(
  name: NameNode(
    value: "__typename",
  ),
  type: NamedTypeNode(
    name: NameNode(
      value: "String",
    ),
    isNonNull: true,
  ),
);

class AddTypenameField extends TransformingVisitor {
  @override
  ObjectTypeDefinitionNode visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      ObjectTypeDefinitionNode(
        name: node.name,
        description: node.description,
        directives: node.directives,
        fields: [
          typenameField,
          ...node.fields,
        ],
        interfaces: node.interfaces,
        span: node.span,
      );

  @override
  InterfaceTypeDefinitionNode visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      InterfaceTypeDefinitionNode(
        name: node.name,
        fields: [
          typenameField,
          ...node.fields,
        ],
        directives: node.directives,
        description: node.description,
        span: node.span,
      );
}

DocumentNode _transform(DocumentNode doc) => transform(
      doc,
      [
        AddTypenameField(),
      ],
    );

SourceNode addTypenames(SourceNode source) => SourceNode(
      url: source.url,
      document: _transform(source.document),
      imports: source.imports.map(addTypenames).toSet(),
    );
