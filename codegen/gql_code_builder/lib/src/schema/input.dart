import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/tristate_optionals_config.dart";
import "package:gql_code_builder/src/tristate_optionals.dart";

import "../../source.dart";
import "../built_class.dart";
import "../common.dart";

List<Class> buildInputClasses(
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
  Allocator allocator,
  TriStateValueConfig triStateValueConfig,
) =>
    schemaSource.document.definitions
        .whereType<InputObjectTypeDefinitionNode>()
        .expand((InputObjectTypeDefinitionNode node) {
      final inputClass = buildInputClass(
        node,
        schemaSource,
        typeOverrides,
        triStateValueConfig,
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
