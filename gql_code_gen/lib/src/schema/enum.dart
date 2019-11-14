import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:recase/recase.dart";

Class buildEnumClass(
  EnumTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = "${node.name.value}"
        ..fields = _buildFields(node.values),
    );

ListBuilder<Field> _buildFields(
  List<EnumValueDefinitionNode> nodes,
) =>
    ListBuilder<Field>(
      nodes.map<Field>(_buildField),
    );

Field _buildField(
  EnumValueDefinitionNode node,
) =>
    Field(
      (b) => b
        ..static = true
        ..modifier = FieldModifier.final$
        ..name = ReCase(node.name.value).camelCase
        ..assignment = Code('"${node.name.value}"'),
    );
