import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/var.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";

List<Class> buildInputClasses(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  Allocator allocator,
) =>
    schemaSource.document.definitions
        .whereType<InputObjectTypeDefinitionNode>()
        .expand((InputObjectTypeDefinitionNode node) {
      final inputClass = buildInputClass(
        node,
        schemaSource,
        typeOverrides,
      );
      final serializer = nullAwareJsonSerializerClass(
          inputClass, allocator, schemaSource, typeOverrides);
      return [inputClass, serializer];
    }).toList();

Class buildInputClass(
  InputObjectTypeDefinitionNode node,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    builtClass(
      name: node.name.value,
      getters: node.fields.map<Method>(
        (node) => buildGetter(
          nameNode: node.name,
          typeNode: node.type,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
        ),
      ),
      hasCustomSerializer: true,
      methods: [
        nullAwareJsonSerializerField(node, "G${node.name.value}"),
      ],
    );
