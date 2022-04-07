import "package:gql/ast.dart";

/// Prints any AST [node] as [String].
///
/// Accepts any kind of [Node].
String printNode(Node node) => node.accept(
      _PrintVisitor(),
    );

class _PrintVisitor extends Visitor<String> {
  int _tabs = 0;

  String _indent(int tabs) => List.filled(tabs, "  ").join();

  @override
  String visitDocumentNode(DocumentNode doc) => doc.definitions
      .map(
        (def) => def.accept(this),
      )
      .join("\n\n");

  String visitDirectiveSetNode(Iterable<DirectiveNode> directives) => directives
      .map(
        (directive) => directive.accept(this),
      )
      .join(" ");

  String visitOperationTypeDefinitionSetNode(
          Iterable<OperationTypeDefinitionNode> operationTypes) =>
      [
        "{",
        "\n",
        _indent(++_tabs),
        ...operationTypes
            .expand(
              (operationType) => [
                _indent(_tabs),
                operationType.accept(this),
                "\n",
              ],
            )
            .skip(1),
        _indent(--_tabs),
        "}",
      ].join();

  String visitVariableDefinitionSetNode(
          Iterable<VariableDefinitionNode> defs) =>
      "(" +
      defs
          .map(
            (def) => def.accept(this),
          )
          .join(", ") +
      ")";

  String visitArgumentSetNode(Iterable<ArgumentNode> args) =>
      "(" +
      args
          .map(
            (arg) => arg.accept(this),
          )
          .join(", ") +
      ")";

  @override
  String visitVariableDefinitionNode(VariableDefinitionNode def) => [
        def.variable.accept(this),
        ": ",
        def.type.accept(this),
        def.defaultValue!.accept(this)
      ].join();

  @override
  String visitDefaultValueNode(DefaultValueNode defaultValueNode) {
    if (defaultValueNode.value == null) return "";

    return " = ${defaultValueNode.value!.accept(this)}";
  }

  @override
  String visitVariableNode(VariableNode variable) =>
      "\$" + variable.name.accept(this);

  @override
  String visitOperationDefinitionNode(OperationDefinitionNode op) => [
        _opType(op.type),
        if (op.name != null) ...[
          " ",
          op.name!.accept(this),
        ],
        if (op.variableDefinitions.isNotEmpty)
          visitVariableDefinitionSetNode(op.variableDefinitions),
        if (op.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(op.directives),
        ],
        " ",
        visitSelectionSetNode(op.selectionSet),
      ].join();

  @override
  String visitNameNode(NameNode name) => name.value;

  @override
  String visitDirectiveNode(DirectiveNode directiveNode) => [
        "@",
        directiveNode.name.accept(this),
        if (directiveNode.arguments.isNotEmpty)
          visitArgumentSetNode(directiveNode.arguments),
      ].join();

  @override
  String visitListTypeNode(ListTypeNode listTypeNode) => [
        "[",
        listTypeNode.type.accept(this),
        "]",
        if (listTypeNode.isNonNull) "!",
      ].join();

  @override
  String visitNamedTypeNode(NamedTypeNode namedTypeNode) => [
        namedTypeNode.name.accept(this),
        if (namedTypeNode.isNonNull) "!",
      ].join();

  @override
  String visitObjectFieldNode(ObjectFieldNode objectFieldNode) => [
        objectFieldNode.name.accept(this),
        ": ",
        objectFieldNode.value.accept(this),
      ].join();

  @override
  String visitObjectValueNode(ObjectValueNode objectValueNode) => [
        "{",
        ...objectValueNode.fields
            .expand(
              (field) => [
                ", ",
                field.accept(this),
              ],
            )
            .skip(1),
        "}",
      ].join();

  @override
  String visitListValueNode(ListValueNode listValueNode) => [
        "[",
        ...listValueNode.values
            .expand(
              (value) => [
                ", ",
                value.accept(this),
              ],
            )
            .skip(1),
        "]",
      ].join();

  @override
  String visitEnumValueNode(EnumValueNode enumValueNode) =>
      enumValueNode.name.accept(this);

  @override
  String visitNullValueNode(NullValueNode nullValueNode) => "null";

  @override
  String visitBooleanValueNode(BooleanValueNode booleanValueNode) =>
      booleanValueNode.value ? "true" : "false";

  @override
  String visitStringValueNode(StringValueNode stringValueNode) {
    if (!stringValueNode.isBlock) {
      return [
        '"',
        stringValueNode.value,
        '"',
      ].join();
    }

    return [
      '"""',
      "\n",
      _indent(_tabs),
      stringValueNode.value.replaceAll('"""', '\\"""'),
      "\n",
      _indent(_tabs),
      '"""',
    ].join();
  }

  @override
  String visitFloatValueNode(FloatValueNode floatValueNode) =>
      floatValueNode.value;

  @override
  String visitIntValueNode(IntValueNode intValueNode) => intValueNode.value;

  @override
  String visitTypeConditionNode(TypeConditionNode typeConditionNode) =>
      "on ${typeConditionNode.on.accept(this)}";

  @override
  String visitFragmentDefinitionNode(
          FragmentDefinitionNode fragmentDefinitionNode) =>
      [
        "fragment ",
        fragmentDefinitionNode.name.accept(this),
        " ",
        fragmentDefinitionNode.typeCondition.accept(this),
        if (fragmentDefinitionNode.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(fragmentDefinitionNode.directives),
        ],
        " ",
        fragmentDefinitionNode.selectionSet.accept(this),
      ].join();

  @override
  String visitInlineFragmentNode(InlineFragmentNode inlineFragmentNode) => [
        "...",
        " ",
        inlineFragmentNode.typeCondition!.accept(this),
        if (inlineFragmentNode.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(inlineFragmentNode.directives),
        ],
        " ",
        inlineFragmentNode.selectionSet.accept(this),
      ].join();

  @override
  String visitFragmentSpreadNode(FragmentSpreadNode fragmentSpreadNode) => [
        "...",
        fragmentSpreadNode.name.accept(this),
        if (fragmentSpreadNode.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(fragmentSpreadNode.directives),
        ],
      ].join();

  @override
  String visitArgumentNode(ArgumentNode argumentNode) => [
        argumentNode.name.accept(this),
        ": ",
        argumentNode.value.accept(this),
      ].join();

  @override
  String visitFieldNode(FieldNode fieldNode) => [
        if (fieldNode.alias != null) ...[
          fieldNode.alias!.accept(this),
          ": ",
        ],
        fieldNode.name.accept(this),
        if (fieldNode.arguments.isNotEmpty)
          visitArgumentSetNode(fieldNode.arguments),
        if (fieldNode.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(fieldNode.directives),
        ],
        if (fieldNode.selectionSet != null) ...[
          " ",
          visitSelectionSetNode(fieldNode.selectionSet!),
        ],
      ].join();

  @override
  String visitSelectionSetNode(SelectionSetNode selectionSetNode) => [
        "{",
        "\n",
        _indent(++_tabs),
        ...selectionSetNode.selections
            .expand(
              (selection) => [
                "\n",
                _indent(_tabs),
                selection.accept(this),
              ],
            )
            .skip(2),
        "\n",
        _indent(--_tabs),
        "}",
      ].join();

  @override
  String visitSchemaDefinitionNode(SchemaDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "schema",
        " ",
        visitDirectiveSetNode(node.directives),
        visitOperationTypeDefinitionSetNode(node.operationTypes),
      ].join();

  @override
  String visitOperationTypeDefinitionNode(OperationTypeDefinitionNode node) => [
        _opType(node.operation),
        ": ",
        node.type.accept(this),
      ].join();

  @override
  String visitScalarTypeDefinitionNode(ScalarTypeDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "scalar",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
      ].join();

  @override
  String visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "type",
        " ",
        node.name.accept(this),
        " ",
        visitImplementsSetNode(node.interfaces),
        visitDirectiveSetNode(node.directives),
        visitFieldSetNode(node.fields),
      ].join();

  String visitImplementsSetNode(Iterable<NamedTypeNode> interfaces) =>
      interfaces.isEmpty
          ? ""
          : [
              "implements",
              " ",
              ...interfaces
                  .expand(
                    (interface) => [
                      "&",
                      " ",
                      interface.accept(this),
                      " ",
                    ],
                  )
                  .skip(2),
            ].join();

  String visitFieldSetNode(Iterable<FieldDefinitionNode> fields) =>
      fields.isEmpty
          ? ""
          : [
              "{",
              "\n",
              _indent(++_tabs),
              ...fields
                  .expand(
                    (field) => [
                      "\n",
                      _indent(_tabs),
                      field.accept(this),
                    ],
                  )
                  .skip(2),
              "\n",
              _indent(--_tabs),
              "}",
            ].join();

  @override
  String visitFieldDefinitionNode(FieldDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
          _indent(_tabs),
        ],
        node.name.accept(this),
        visitArgumentDefinitionSetNode(node.args),
        ":",
        " ",
        node.type.accept(this),
        if (node.directives.isNotEmpty) " ",
        visitDirectiveSetNode(node.directives),
      ].join();

  String visitArgumentDefinitionSetNode(
          Iterable<InputValueDefinitionNode> args) =>
      args.isEmpty
          ? ""
          : [
              "(",
              ...args
                  .expand(
                    (arg) => [
                      ",",
                      " ",
                      arg.accept(this),
                    ],
                  )
                  .skip(2),
              ")",
            ].join();

  @override
  String visitInputValueDefinitionNode(InputValueDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
          _indent(_tabs),
        ],
        node.name.accept(this),
        ":",
        " ",
        node.type.accept(this),
        if (node.defaultValue != null) ...[
          " ",
          "=",
          " ",
          node.defaultValue!.accept(this),
        ],
        if (node.directives.isNotEmpty) " ",
        visitDirectiveSetNode(node.directives),
      ].join();

  @override
  String visitInterfaceTypeDefinitionNode(InterfaceTypeDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "interface",
        " ",
        node.name.accept(this),
        " ",
        visitImplementsSetNode(node.interfaces),
        visitDirectiveSetNode(node.directives),
        visitFieldSetNode(node.fields),
      ].join();

  @override
  String visitUnionTypeDefinitionNode(UnionTypeDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "union",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        visitUnionTypeSetNode(node.types),
      ].join();

  String visitUnionTypeSetNode(Iterable<NamedTypeNode> types) => types.isEmpty
      ? ""
      : [
          " ",
          "=",
          "\n",
          _indent(++_tabs),
          ...types
              .expand(
                (type) => [
                  "\n",
                  _indent(_tabs),
                  "|",
                  " ",
                  type.accept(this),
                ],
              )
              .skip(2),
          ...[
            _indent(--_tabs),
          ].skip(1),
        ].join();

  @override
  String visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "enum",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        visitEnumValueDefinitionSetNode(node.values),
      ].join();

  String visitEnumValueDefinitionSetNode(
          Iterable<EnumValueDefinitionNode> values) =>
      values.isEmpty
          ? ""
          : [
              " ",
              "{",
              "\n",
              _indent(++_tabs),
              ...values
                  .expand(
                    (value) => [
                      "\n",
                      _indent(_tabs),
                      value.accept(this),
                    ],
                  )
                  .skip(2),
              "\n",
              _indent(--_tabs),
              "}",
            ].join();

  @override
  String visitEnumValueDefinitionNode(EnumValueDefinitionNode node) => [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
          _indent(_tabs),
        ],
        node.name.accept(this),
        if (node.directives.isNotEmpty) " ",
        visitDirectiveSetNode(node.directives),
      ].join();

  @override
  String visitInputObjectTypeDefinitionNode(
          InputObjectTypeDefinitionNode node) =>
      [
        if (node.description != null) ...[
          node.description!.accept(this),
          "\n",
        ],
        "input",
        " ",
        node.name.accept(this),
        " ",
        visitDirectiveSetNode(node.directives),
        visitInputValueDefinitionSetNode(node.fields),
      ].join();

  String visitInputValueDefinitionSetNode(
          Iterable<InputValueDefinitionNode> fields) =>
      fields.isEmpty
          ? ""
          : [
              "{",
              "\n",
              _indent(++_tabs),
              ...fields
                  .expand(
                    (field) => [
                      "\n",
                      _indent(_tabs),
                      field.accept(this),
                    ],
                  )
                  .skip(2),
              "\n",
              _indent(--_tabs),
              "}",
            ].join();

  @override
  String visitDirectiveDefinitionNode(DirectiveDefinitionNode node) {
    final description = node.description;
    return [
      if (description != null) ...[
        description.accept(this),
        "\n",
      ],
      "directive",
      " ",
      "@",
      node.name.accept(this),
      visitArgumentDefinitionSetNode(node.args),
      if (node.repeatable) ...[
        " ",
        "repeatable",
      ],
      visitDirectiveLocationSetNode(node.locations),
    ].join();
  }

  String visitDirectiveLocationSetNode(Iterable<DirectiveLocation> locations) =>
      locations.isEmpty
          ? ""
          : [
              " ",
              "on",
              "\n",
              _indent(++_tabs),
              ...locations
                  .expand(
                    (location) => [
                      "\n",
                      _indent(_tabs),
                      "|",
                      " ",
                      _directiveLocation(location),
                    ],
                  )
                  .skip(2),
              ...[
                _indent(--_tabs),
              ].skip(1),
            ].join();

  @override
  String visitSchemaExtensionNode(SchemaExtensionNode node) => [
        "extend",
        " ",
        "schema",
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        if (node.operationTypes.isNotEmpty) ...[
          " ",
          visitOperationTypeDefinitionSetNode(node.operationTypes),
        ],
      ].join();

  @override
  String visitScalarTypeExtensionNode(ScalarTypeExtensionNode node) => [
        "extend",
        " ",
        "scalar",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
      ].join();

  @override
  String visitObjectTypeExtensionNode(ObjectTypeExtensionNode node) => [
        "extend",
        " ",
        "type",
        " ",
        node.name.accept(this),
        " ",
        visitImplementsSetNode(node.interfaces),
        visitDirectiveSetNode(node.directives),
        visitFieldSetNode(node.fields),
      ].join();

  @override
  String visitInterfaceTypeExtensionNode(InterfaceTypeExtensionNode node) => [
        "extend",
        " ",
        "interface",
        " ",
        node.name.accept(this),
        " ",
        visitImplementsSetNode(node.interfaces),
        visitDirectiveSetNode(node.directives),
        visitFieldSetNode(node.fields),
      ].join();

  @override
  String visitUnionTypeExtensionNode(UnionTypeExtensionNode node) => [
        "extend",
        " ",
        "union",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        visitUnionTypeSetNode(node.types),
      ].join();

  @override
  String visitEnumTypeExtensionNode(EnumTypeExtensionNode node) => [
        "extend",
        " ",
        "enum",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        visitEnumValueDefinitionSetNode(node.values),
      ].join();

  @override
  String visitInputObjectTypeExtensionNode(InputObjectTypeExtensionNode node) =>
      [
        "extend",
        " ",
        "input",
        " ",
        node.name.accept(this),
        if (node.directives.isNotEmpty) ...[
          " ",
          visitDirectiveSetNode(node.directives),
        ],
        visitInputValueDefinitionSetNode(node.fields),
      ].join();
}

String? _opType(OperationType t) {
  switch (t) {
    case OperationType.query:
      return "query";
    case OperationType.mutation:
      return "mutation";
    case OperationType.subscription:
      return "subscription";
  }
}

String? _directiveLocation(DirectiveLocation location) {
  switch (location) {
    case DirectiveLocation.query:
      return "QUERY";
    case DirectiveLocation.mutation:
      return "MUTATION";
    case DirectiveLocation.subscription:
      return "SUBSCRIPTION";
    case DirectiveLocation.field:
      return "FIELD";
    case DirectiveLocation.fragmentDefinition:
      return "FRAGMENT_DEFINITION";
    case DirectiveLocation.fragmentSpread:
      return "FRAGMENT_SPREAD";
    case DirectiveLocation.inlineFragment:
      return "INLINE_FRAGMENT";
    case DirectiveLocation.variableDefinition:
      return "VARIABLE_DEFINITION";
    case DirectiveLocation.schema:
      return "SCHEMA";
    case DirectiveLocation.scalar:
      return "SCALAR";
    case DirectiveLocation.object:
      return "OBJECT";
    case DirectiveLocation.fieldDefinition:
      return "FIELD_DEFINITION";
    case DirectiveLocation.argumentDefinition:
      return "ARGUMENT_DEFINITION";
    case DirectiveLocation.interface:
      return "INTERFACE";
    case DirectiveLocation.union:
      return "UNION";
    case DirectiveLocation.enumDefinition:
      return "ENUM";
    case DirectiveLocation.enumValue:
      return "ENUM_VALUE";
    case DirectiveLocation.inputObject:
      return "INPUT_OBJECT";
    case DirectiveLocation.inputFieldDefinition:
      return "INPUT_FIELD_DEFINITION";
  }
}
