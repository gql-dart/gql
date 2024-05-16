import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/tristate_optionals_config.dart";
import "package:gql_code_builder/src/required_vars_constructor.dart";
import "package:gql_code_builder/src/tristate_optionals.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";

List<Class> buildInputClasses(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  Allocator allocator,
  TriStateValueConfig triStateValueConfig,
  bool generateVarsCreateFactories,
) =>
    schemaSource.document.definitions
        .whereType<InputObjectTypeDefinitionNode>()
        .expand((InputObjectTypeDefinitionNode node) {
      final inputClass = buildInputClass(
        node,
        schemaSource,
        typeOverrides,
        triStateValueConfig,
        generateVarsCreateFactories,
      );
      final serializer = nullAwareJsonSerializerClass(
          inputClass, allocator, schemaSource, typeOverrides);
      return [inputClass, serializer];
    }).toList();

Class buildInputClass(
  InputObjectTypeDefinitionNode node,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  TriStateValueConfig triStateValueConfig,
  bool generateVarsCreateFactories,
) =>
    builtClass(
      name: node.name.value,
      getters: node.fields.map<Method>(
        (node) => buildOptionalGetter(
          nameNode: node.name,
          typeNode: node.type,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
          useTriStateValueForNullableTypes: triStateValueConfig,
        ),
      ),
      hasCustomSerializer:
          triStateValueConfig == TriStateValueConfig.onAllNullableFields,
      constructors: [
        if (generateVarsCreateFactories)
          builtCreateConstructor(
            name: node.name.value,
            getters: node.fields.map<Method>(
              (node) => buildOptionalGetter(
                nameNode: node.name,
                typeNode: node.type,
                schemaSource: schemaSource,
                typeOverrides: typeOverrides,
                useTriStateValueForNullableTypes: triStateValueConfig,
              ),
            ),
            schemaSource: schemaSource,
            typeOverrides: typeOverrides,
          ),
      ],
      initializers: {
        if (triStateValueConfig == TriStateValueConfig.onAllNullableFields)
          ..._inputClassValueInitializers(node)
      },
      methods: [
        if (triStateValueConfig == TriStateValueConfig.onAllNullableFields)
          nullAwareJsonSerializerField(node, "G${node.name.value}"),
      ],
    );

Map<String, Expression> _inputClassValueInitializers(
        InputObjectTypeDefinitionNode op) =>
    {
      for (final node in op.fields.where((element) => !element.type.isNonNull))
        identifier(node.name.value): absentValueConstructorInvocation()
    };
