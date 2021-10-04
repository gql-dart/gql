import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "./source.dart";
import "./src/built_class.dart";
import "./src/common.dart";
import "./src/frag_vars.dart";

Library buildVarLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides,
) {
  final operationVarClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .map(
        (op) => builtClass(
          name: "${op.name!.value}Vars",
          getters: op.variableDefinitions.map<Method>(
            (node) => buildGetter(
              nameNode: node.variable.name,
              typeNode: node.type,
              schemaSource: schemaSource,
              typeOverrides: typeOverrides,
            ),
          ),
        ),
      )
      .toList();

  Map<String, FragmentDefinitionNode> _fragmentMap(SourceNode source) => {
        for (var def
            in source.document.definitions.whereType<FragmentDefinitionNode>())
          def.name.value: def,
        for (var import in source.imports) ..._fragmentMap(import)
      };

  final fragmentVarClasses = docSource.document.definitions
      .whereType<FragmentDefinitionNode>()
      .map((frag) {
    final varTypes = fragmentVarTypes(
      fragment: frag,
      fragmentMap: _fragmentMap(docSource),
      schema: schemaSource.document,
    );
    return builtClass(
      name: "${frag.name.value}Vars",
      getters: varTypes.entries.map<Method>(
        (entry) => buildGetter(
          nameNode: entry.key,
          typeNode: entry.value,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
        ),
      ),
    );
  }).toList();

  return Library(
    (b) => b
      ..directives.add(Directive.part(partUrl))
      ..body.addAll([
        ...operationVarClasses,
        ...fragmentVarClasses,
      ]),
  );
}
