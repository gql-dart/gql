import "dart:io";

import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:source_span/source_span.dart";

main() async {
  [
    await File("./example/fixtures/schema-kitchen-sink.graphql").readAsString(),
    await File("./example/fixtures/kitchen-sink.graphql").readAsString(),
  ]
      .map(
        (src) => SourceFile.fromString(src),
      )
      .forEach(cover);
}

cover(sourceFile) {
  final DocumentNode document = parse(sourceFile);

  final DocumentNode transformedDocument = transform(
    document,
    [
      IdentityTransformer(),
    ],
  );

  transformedDocument.accept(
    RecurseVisitor(),
  );

  final String printed = printNode(
    transformedDocument,
  );

  print(printed);
}

class RecurseVisitor extends RecursiveVisitor {}

class IdentityTransformer extends TransformingVisitor {}

class MyTransformer extends TransformingVisitor {
  @override
  visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) =>
      ObjectTypeDefinitionNode(
        description: node.description,
        interfaces: node.interfaces,
        directives: node.directives,
        name: node.name,
        fields: node.fields.followedBy([
          FieldDefinitionNode(
            name: NameNode(value: "myExtraField"),
            type: NamedTypeNode(
              isNonNull: true,
              name: NameNode(value: "MyExtraFieldType"),
            ),
          )
        ]).toList(),
      );
}

class MyOtherTransformer extends TransformingVisitor {
  @override
  visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) =>
      ObjectTypeDefinitionNode(
        description: node.description,
        interfaces: node.interfaces,
        directives: node.directives,
        name: node.name,
        fields: node.fields.followedBy([
          FieldDefinitionNode(
            name: NameNode(value: "myOtherExtraField"),
            type: NamedTypeNode(
              isNonNull: true,
              name: NameNode(value: "MyOtherExtraFieldType"),
            ),
          )
        ]).toList(),
      );
}
