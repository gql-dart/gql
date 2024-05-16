import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/tristate_optionals_config.dart";
import "package:gql_code_builder/src/tristate_optionals.dart";

import "./source.dart";
import "./src/built_class.dart";
import "./src/common.dart";
import "./src/frag_vars.dart";
import "./src/required_vars_constructor.dart";

export "./src/config/tristate_optionals_config.dart";

Library buildVarLibrary(
    SourceNode docSource,
    SourceNode schemaSource,
    String partUrl,
    Map<String, Reference> typeOverrides,
    Allocator allocator,
    TriStateValueConfig useTriStateValueForNullableTypes,
    bool generateVarsCreateFactories) {
  final hasCustomSerializer = useTriStateValueForNullableTypes ==
      TriStateValueConfig.onAllNullableFields;

  final operationVarClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .map((op) => builtClass(
            name: "${op.name!.value}Vars",
            getters: op.variableDefinitions.map<Method>(
              (node) => buildOptionalGetter(
                nameNode: node.variable.name,
                typeNode: node.type,
                schemaSource: schemaSource,
                typeOverrides: typeOverrides,
                useTriStateValueForNullableTypes:
                    useTriStateValueForNullableTypes,
              ),
            ),
            hasCustomSerializer: hasCustomSerializer,
            constructors: [
              if (generateVarsCreateFactories)
                builtCreateConstructor(
                  name: "${op.name!.value}Vars",
                  getters: op.variableDefinitions.map<Method>(
                    (node) => buildOptionalGetter(
                      nameNode: node.variable.name,
                      typeNode: node.type,
                      schemaSource: schemaSource,
                      typeOverrides: typeOverrides,
                      useTriStateValueForNullableTypes:
                          useTriStateValueForNullableTypes,
                    ),
                  ),
                  schemaSource: schemaSource,
                  typeOverrides: typeOverrides,
                ),
            ],
            initializers: switch (useTriStateValueForNullableTypes) {
              TriStateValueConfig.onAllNullableFields =>
                _varClassValueInitializers(op),
              TriStateValueConfig.never => {},
            },
            methods: [
              if (hasCustomSerializer)
                nullAwareJsonSerializerField(op, "G${op.name!.value}Vars"),
            ],
          ))
      .toList();

  Map<String, FragmentDefinitionNode> _fragmentMap(SourceNode source) => {
        for (final def
            in source.document.definitions.whereType<FragmentDefinitionNode>())
          def.name.value: def,
        for (final import in source.imports) ..._fragmentMap(import)
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
        (entry) => buildOptionalGetter(
          nameNode: entry.key,
          typeNode: entry.value,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
        ),
      ),
      hasCustomSerializer: hasCustomSerializer,
      methods: [
        if (hasCustomSerializer)
          nullAwareJsonSerializerField(frag, "G${frag.name.value}Vars"),
      ],
      constructors: [
        if (generateVarsCreateFactories)
          builtCreateConstructor(
            name: "${frag.name.value}Vars",
            getters: varTypes.entries.map<Method>(
              (entry) => buildOptionalGetter(
                nameNode: entry.key,
                typeNode: entry.value,
                schemaSource: schemaSource,
                typeOverrides: typeOverrides,
              ),
            ),
            schemaSource: schemaSource,
          ),
      ],
    );
  }).toList();

  return Library(
    (b) => b
      ..directives.add(Directive.part(partUrl))
      ..body.addAll([
        ...operationVarClasses,
        ...fragmentVarClasses,
        if (hasCustomSerializer) ...[
          for (final op in operationVarClasses)
            nullAwareJsonSerializerClass(
              op,
              allocator,
              schemaSource,
              typeOverrides,
            ),
          for (final frag in fragmentVarClasses)
            nullAwareJsonSerializerClass(
              frag,
              allocator,
              schemaSource,
              typeOverrides,
            ),
        ]
      ]),
  );
}

Map<String, Expression> _varClassValueInitializers(
        OperationDefinitionNode op) =>
    {
      for (final node
          in op.variableDefinitions.where((element) => !element.type.isNonNull))
        identifier(node.variable.name.value): absentValueConstructorInvocation()
    };
