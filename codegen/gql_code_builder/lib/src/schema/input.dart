import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:path/path.dart" as p;

import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/source.dart";

List<Class> buildInputClasses(
  SourceNode schemaSource,
) =>
    schemaSource.document.definitions
        .whereType<InputObjectTypeDefinitionNode>()
        .map(
          (InputObjectTypeDefinitionNode node) => buildInputClass(
            node,
            schemaSource,
          ),
        )
        .toList();

Class buildInputClass(
  InputObjectTypeDefinitionNode node,
  SourceNode schemaSource,
) =>
    builtClass(
      name: node.name.value,
      getters: node.fields.map<Method>(
        (node) => buildGetter(
          nameNode: node.name,
          typeNode: node.type,
          schemaSource: schemaSource,
        ),
      ),
      serializersUrl: "${p.dirname(schemaSource.url)}/serializers.gql.dart",
    );
