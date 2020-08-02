import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/src/built_class.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/source.dart";

List<Class> buildOperationVarClasses(
  SourceNode docSource,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    docSource.document.definitions
        .whereType<OperationDefinitionNode>()
        .map(
          (op) => _buildOperationVarClass(
            op,
            schemaSource,
            typeOverrides,
          ),
        )
        .toList();

Class _buildOperationVarClass(
  OperationDefinitionNode node,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    builtClass(
      name: "${node.name.value}Vars",
      getters: node.variableDefinitions.map<Method>(
        (node) => buildGetter(
          nameNode: node.variable.name,
          typeNode: node.type,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
        ),
      ),
    );
