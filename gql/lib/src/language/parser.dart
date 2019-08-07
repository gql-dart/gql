import "package:source_span/source_span.dart";

import "package:gql/src/ast/ast.dart";
import "package:gql/src/language/lexer.dart";

/// Parses [source] and returns [DocumentNode].
///
/// Supports both GraphQL SDL and executable definitions.
DocumentNode parse(SourceFile source) {
  final lexer = Lexer();
  final tokens = lexer.tokenize(source);
  final parser = _Parser(tokens);

  return parser.parse();
}

class _Parser {
  final List<Token> _tokens;
  final int _length;
  int _position = 0;

  _Parser(this._tokens) : _length = _tokens.length;

  DocumentNode parse() => _parseDocument();

  bool _peek(TokenKind kind, {int offset = 0}) {
    final next = _next(offset: offset);
    if (next == null) return false;

    return next.kind == kind;
  }

  void _advance() {
    ++_position;
  }

  Token _expectToken(TokenKind kind, [String errorMessage]) {
    final next = _next();
    if (next.kind == kind) {
      _advance();
      return next;
    }

    throw SourceSpanException(
      errorMessage ?? "Expected $kind",
      _next().span,
    );
  }

  Token _expectOptionalToken(TokenKind kind) {
    final next = _next();
    if (next.kind == kind) {
      _advance();
      return next;
    }

    return null;
  }

  Token _expectKeyword(String value, [String errorMessage]) {
    final next = _next();
    if (next.kind == TokenKind.name && next.value == value) {
      _advance();
      return next;
    }

    throw SourceSpanException(
      errorMessage ?? "Expected keyword $value",
      _next().span,
    );
  }

  Token _expectOptionalKeyword(String value) {
    final next = _next();
    if (next.kind == TokenKind.name && next.value == value) {
      _advance();
      return next;
    }

    return null;
  }

  Token _next({int offset = 0}) {
    if (_position + offset >= _length) return null;

    return _tokens[_position + offset];
  }

  SourceSpanException _unexpected([message = "Parse error", offset = 0]) =>
      SourceSpanException(
        message,
        _next(offset: offset).span,
      );

  Iterable<N> _parseMany<N>(TokenKind open, parse, TokenKind close,
      [String errorMessage]) {
    _expectToken(open, errorMessage);

    final nodes = <N>[];

    while (_expectOptionalToken(close) == null) {
      nodes.add(parse());
    }

    return nodes;
  }

  Iterable<N> _maybeParseMany<N>(TokenKind open, parse, TokenKind close,
      [String errorMessage]) {
    if (_peek(open)) {
      return _parseMany<N>(
        open,
        parse,
        close,
        errorMessage,
      );
    }

    return <N>[];
  }

  Iterable<N> _parseAny<N>(TokenKind open, parse, TokenKind close,
      [String errorMessage]) {
    _expectToken(open, errorMessage);

    final nodes = <N>[];

    do {
      nodes.add(parse());
    } while (_expectOptionalToken(close) == null);

    return nodes;
  }

  DocumentNode _parseDocument() => DocumentNode(
        definitions: _parseMany(
          TokenKind.sof,
          _parseDefinition,
          TokenKind.eof,
        ),
      );

  DefinitionNode _parseDefinition() {
    if (_peek(TokenKind.name)) {
      switch (_next().value) {
        case "query":
        case "mutation":
        case "subscription":
        case "fragment":
          return _parseExecutableDefinition();
        case "schema":
        case "scalar":
        case "type":
        case "interface":
        case "union":
        case "enum":
        case "input":
        case "directive":
          return _parseTypeSystemDefinition();
        case "extend":
          return _parseTypeSystemExtension();
      }
    } else if (_peek(TokenKind.braceL)) {
      return _parseExecutableDefinition();
    } else if (_peek(TokenKind.string) || _peek(TokenKind.blockString)) {
      return _parseTypeSystemDefinition();
    }

    throw _unexpected("Unknown definition type '${_next().value}'");
  }

  ExecutableDefinitionNode _parseExecutableDefinition() {
    if (_peek(TokenKind.name)) {
      switch (_next().value) {
        case "query":
        case "mutation":
        case "subscription":
          return _parseOperationDefinition();
        case "fragment":
          return _parseFragmentDefinition();
      }
    } else if (_peek(TokenKind.braceL)) {
      return _parseOperationDefinition();
    }

    throw _unexpected("Unknown executable definition '${_next().value}'");
  }

  FragmentDefinitionNode _parseFragmentDefinition() {
    _expectKeyword("fragment");

    final name = _parseFragmentName();

    _expectKeyword("on");

    return FragmentDefinitionNode(
      name: name,
      typeCondition: TypeConditionNode(
        on: _parseNamedType(),
      ),
      directives: _parseDirectives(),
      selectionSet: _parseSelectionSet(),
    );
  }

  OperationDefinitionNode _parseOperationDefinition() {
    if (_peek(TokenKind.braceL)) {
      return OperationDefinitionNode(
        type: OperationType.query,
        selectionSet: _parseSelectionSet(),
      );
    }

    final operationType = _parseOperationType();
    var name;
    if (_peek(TokenKind.name)) name = _parseName();

    return OperationDefinitionNode(
      type: operationType,
      name: name,
      variableDefinitions: _parseVariableDefinitions(),
      directives: _parseDirectives(),
      selectionSet: _parseSelectionSet(),
    );
  }

  Iterable<VariableDefinitionNode> _parseVariableDefinitions() =>
      _maybeParseMany(
        TokenKind.parenL,
        _parseVariableDefinition,
        TokenKind.parenR,
      );

  VariableDefinitionNode _parseVariableDefinition() {
    final variable = _parseVariable();

    _expectToken(TokenKind.colon, "Expected ':' followed by variable type");

    final type = _parseType();

    var defaultValue;
    if (_expectOptionalToken(TokenKind.equals) != null) {
      defaultValue = _parseValue(isConst: true);
    }

    return VariableDefinitionNode(
      variable: variable,
      type: type,
      defaultValue: DefaultValueNode(
        value: defaultValue,
      ),
      directives: _parseDirectives(isConst: true),
    );
  }

  VariableNode _parseVariable() {
    _expectToken(TokenKind.dollar, "Variable name must be start with '\$'");

    return VariableNode(
      name: _parseName("Expected a variable name"),
    );
  }

  TypeNode _parseType() {
    if (_expectOptionalToken(TokenKind.bracketL) != null) {
      final type = _parseType();
      _expectToken(TokenKind.bracketR, "Expected ']'");

      final isNonNull = _expectOptionalToken(TokenKind.bang) != null;

      return ListTypeNode(
        isNonNull: isNonNull,
        type: type,
      );
    } else {
      return _parseNamedType();
    }
  }

  NamedTypeNode _parseNamedType() {
    final name = _parseName("Expected a named type");
    final isNonNull = _expectOptionalToken(TokenKind.bang) != null;

    return NamedTypeNode(
      isNonNull: isNonNull,
      name: name,
    );
  }

  ObjectFieldNode _parseConstObjectField() => _parseObjectField(isConst: true);

  ObjectFieldNode _parseNonConstObjectField() =>
      _parseObjectField(isConst: false);

  ObjectFieldNode _parseObjectField({bool isConst}) {
    final name = _parseName("Expected an object field name");

    _expectToken(TokenKind.colon, "Missing ':' before object field value");

    return ObjectFieldNode(name: name, value: _parseValue(isConst: isConst));
  }

  ValueNode _parseConstValue() => _parseValue(isConst: true);

  ValueNode _parseNonConstValue() => _parseValue(isConst: false);

  ValueNode _parseValue({bool isConst}) {
    final token = _next();
    switch (token.kind) {
      case TokenKind.bracketL:
        return _parseList(isConst: isConst);
      case TokenKind.braceL:
        return _parseObject(isConst: isConst);
      case TokenKind.int:
        _advance();

        return IntValueNode(
          value: token.value,
        );
      case TokenKind.float:
        _advance();

        return FloatValueNode(
          value: token.value,
        );
      case TokenKind.string:
      case TokenKind.blockString:
        return _parseStringValue();
      case TokenKind.name:
        if (token.value == "true" || token.value == "false") {
          _advance();

          return BooleanValueNode(
            value: token.value == "true",
          );
        } else if (token.value == "null") {
          _advance();

          return NullValueNode();
        }

        return EnumValueNode(
          name: _parseName(),
        );
      case TokenKind.dollar:
        if (!isConst) {
          return _parseVariable();
        }

        throw _unexpected("Cannot use variable in a constant context");
      default:
        throw _unexpected("Unexpected token found when parsing a value");
    }
  }

  StringValueNode _parseStringValue() {
    final valueToken = _next();
    _advance();

    return StringValueNode(
      value: valueToken.value,
      isBlock: valueToken.kind == TokenKind.blockString,
    );
  }

  ListValueNode _parseList({bool isConst}) => ListValueNode(
        values: _parseAny(
          TokenKind.bracketL,
          isConst ? _parseConstValue : _parseNonConstValue,
          TokenKind.bracketR,
        ),
      );

  ObjectValueNode _parseObject({bool isConst}) => ObjectValueNode(
        fields: _parseAny(
          TokenKind.braceL,
          isConst ? _parseConstObjectField : _parseNonConstObjectField,
          TokenKind.braceR,
        ),
      );

  Iterable<DirectiveNode> _parseDirectives({bool isConst = false}) {
    final directives = <DirectiveNode>[];
    while (_peek(TokenKind.at)) {
      directives.add(_parseDirective(isConst: isConst));
    }

    return directives;
  }

  DirectiveNode _parseDirective({bool isConst}) {
    _expectToken(TokenKind.at, "Expected directive name starting with '@'");

    return DirectiveNode(
      name: _parseName("Expected a directive name"),
      arguments: _parseArguments(isConst: isConst),
    );
  }

  Iterable<ArgumentNode> _parseArguments({bool isConst}) => _maybeParseMany(
        TokenKind.parenL,
        isConst ? _parseConstArgument : _parseNonConstArgument,
        TokenKind.parenR,
      );

  ArgumentNode _parseConstArgument() => _parseArgument(isConst: true);

  ArgumentNode _parseNonConstArgument() => _parseArgument(isConst: false);

  ArgumentNode _parseArgument({bool isConst}) {
    final name = _parseName("Expected an argument name");

    _expectToken(TokenKind.colon, "Expected ':' followed by argument value");

    return ArgumentNode(
      name: name,
      value: _parseValue(isConst: isConst),
    );
  }

  OperationType _parseOperationType() {
    final token = _expectToken(TokenKind.name, "Expected operation name");

    switch (token.value) {
      case "query":
        return OperationType.query;
      case "mutation":
        return OperationType.mutation;
      case "subscription":
        return OperationType.subscription;
    }

    throw _unexpected("Unknown operation '${token.value}'", -1);
  }

  SelectionSetNode _parseSelectionSet() => SelectionSetNode(
        selections: _parseMany(
          TokenKind.braceL,
          _parseSelection,
          TokenKind.braceR,
          "Expected a selection set starting with '{'",
        ),
      );

  SelectionNode _parseSelection() {
    if (_peek(TokenKind.spread)) {
      return _parseFragment();
    }

    return _parseField();
  }

  SelectionNode _parseFragment() {
    _expectToken(TokenKind.spread, "Expected '...' spread before fragment");

    final hasTypeCondition = _expectOptionalKeyword("on") != null;

    if (!hasTypeCondition && _peek(TokenKind.name)) {
      return FragmentSpreadNode(
        name: _parseFragmentName(),
        directives: _parseDirectives(isConst: false),
      );
    }

    return InlineFragmentNode(
      typeCondition:
          hasTypeCondition ? TypeConditionNode(on: _parseNamedType()) : null,
      directives: _parseDirectives(isConst: false),
      selectionSet: _parseSelectionSet(),
    );
  }

  NameNode _parseFragmentName() {
    if (_next().value == "on") {
      throw _unexpected("Invalid fragment name 'on'");
    }

    return _parseName("Expected a fragment name");
  }

  FieldNode _parseField() {
    final nameOrAlias = _parseName("Expected a field or field alias name");

    var name;
    var alias;

    if (_expectOptionalToken(TokenKind.colon) != null) {
      alias = nameOrAlias;
      name = _parseName("Expected a field name");
    } else {
      name = nameOrAlias;
    }

    final arguments = _parseArguments(isConst: false);
    final directives = _parseDirectives(isConst: false);

    var selectionSet;
    if (_peek(TokenKind.braceL)) {
      selectionSet = _parseSelectionSet();
    }

    return FieldNode(
      alias: alias,
      name: name,
      arguments: arguments,
      directives: directives,
      selectionSet: selectionSet,
    );
  }

  NameNode _parseName([String errorMessage]) => NameNode(
        value: _expectToken(TokenKind.name, errorMessage ?? "Expected a name")
            .value,
      );

  TypeSystemDefinitionNode _parseTypeSystemDefinition() {
    final keywordOffset =
        (_peek(TokenKind.string) || _peek(TokenKind.blockString)) ? 1 : 0;

    if (_peek(TokenKind.name, offset: keywordOffset)) {
      switch (_next(offset: keywordOffset).value) {
        case "schema":
          return _parseSchemaDefinition();
        case "scalar":
          return _parseScalarTypeDefinition();
        case "type":
          return _parseObjectTypeDefinition();
        case "interface":
          return _parseInterfaceTypeDefinition();
        case "union":
          return _parseUnionTypeDefinition();
        case "enum":
          return _parseEnumTypeDefinition();
        case "input":
          return _parseInputObjectTypeDefinition();
        case "directive":
          return _parseDirectiveDefinition();
      }
    }

    throw _unexpected(
        "Unknown type system definition type '${_next(offset: keywordOffset).value}'");
  }

  TypeSystemExtensionNode _parseTypeSystemExtension() {
    _expectKeyword("extend");

    if (_peek(TokenKind.name) != null) {
      switch (_next().value) {
        case "schema":
          return _parseSchemaExtension();
        case "scalar":
          return _parseScalarTypeExtension();
        case "type":
          return _parseObjectTypeExtension();
        case "interface":
          return _parseInterfaceTypeExtension();
        case "union":
          return _parseUnionTypeExtension();
        case "enum":
          return _parseEnumTypeExtension();
        case "input":
          return _parseInputObjectTypeExtension();
      }
    }

    throw _unexpected("Unknown type system extension type '${_next().value}'");
  }

  SchemaDefinitionNode _parseSchemaDefinition() {
    _expectKeyword("schema");

    return SchemaDefinitionNode(
      directives: _parseDirectives(
        isConst: true,
      ),
      operationTypes: _parseMany(
        TokenKind.braceL,
        _parseOperationTypeDefinition,
        TokenKind.braceR,
        "Expected a operation type definitions starting with '{'",
      ),
    );
  }

  OperationTypeDefinitionNode _parseOperationTypeDefinition() {
    final operation = _parseOperationType();
    _expectToken(TokenKind.colon, "Expected ':' before operation type");
    final type = _parseNamedType();

    return OperationTypeDefinitionNode(
      operation: operation,
      type: type,
    );
  }

  ScalarTypeDefinitionNode _parseScalarTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("scalar");
    final name = _parseName("Expected a scalar name");
    final directives = _parseDirectives(isConst: true);

    return ScalarTypeDefinitionNode(
      description: description,
      name: name,
      directives: directives,
    );
  }

  StringValueNode _parseDescription() {
    if (_peek(TokenKind.string) || _peek(TokenKind.blockString)) {
      return _parseStringValue();
    }

    return null;
  }

  Iterable<NamedTypeNode> _parseImplementsInterfaces() {
    final types = <NamedTypeNode>[];

    if (_expectOptionalKeyword("implements") != null) {
      _expectOptionalToken(TokenKind.amp);
      do {
        types.add(_parseNamedType());
      } while (_expectOptionalToken(TokenKind.amp) != null);
    }

    return types;
  }

  ObjectTypeDefinitionNode _parseObjectTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("type");
    final name = _parseName("Expected an object type name");
    final interfaces = _parseImplementsInterfaces();
    final directives = _parseDirectives(isConst: true);
    final fields = _parseFieldsDefinition();

    return ObjectTypeDefinitionNode(
      description: description,
      name: name,
      interfaces: interfaces,
      directives: directives,
      fields: fields,
    );
  }

  Iterable<FieldDefinitionNode> _parseFieldsDefinition() => _maybeParseMany(
        TokenKind.braceL,
        _parseFieldDefinition,
        TokenKind.braceR,
      );

  FieldDefinitionNode _parseFieldDefinition() {
    final description = _parseDescription();
    final name = _parseName("Expected a field name");
    final args = _parseArgumentDefinitions();
    _expectToken(TokenKind.colon, "Expected ':' followed by field type");
    final type = _parseType();
    final directives = _parseDirectives(isConst: true);

    return FieldDefinitionNode(
      description: description,
      name: name,
      args: args,
      type: type,
      directives: directives,
    );
  }

  Iterable<InputValueDefinitionNode> _parseArgumentDefinitions() =>
      _maybeParseMany<InputValueDefinitionNode>(
        TokenKind.parenL,
        _parseInputValueDefinition,
        TokenKind.parenR,
      );

  InputValueDefinitionNode _parseInputValueDefinition() {
    final description = _parseDescription();
    final name = _parseName("Expected an input value name");
    _expectToken(TokenKind.colon, "Expected ':' followed by input value type");
    final type = _parseType();
    var defaultValue;
    if (_expectOptionalToken(TokenKind.equals) != null) {
      defaultValue = _parseConstValue();
    }
    final directives = _parseDirectives(isConst: true);

    return InputValueDefinitionNode(
      description: description,
      name: name,
      type: type,
      defaultValue: defaultValue,
      directives: directives,
    );
  }

  InterfaceTypeDefinitionNode _parseInterfaceTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("interface");
    final name = _parseName("Expected an interface name");
    final directives = _parseDirectives(isConst: true);
    final fields = _parseFieldsDefinition();

    return InterfaceTypeDefinitionNode(
      description: description,
      name: name,
      directives: directives,
      fields: fields,
    );
  }

  UnionTypeDefinitionNode _parseUnionTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("union");
    final name = _parseName("Expected a union name");
    final directives = _parseDirectives(isConst: true);
    final types = _parseUnionMemberTypes();

    return UnionTypeDefinitionNode(
      description: description,
      name: name,
      directives: directives,
      types: types,
    );
  }

  Iterable<NamedTypeNode> _parseUnionMemberTypes() {
    final types = <NamedTypeNode>[];

    if (_expectOptionalToken(TokenKind.equals) != null) {
      _expectOptionalToken(TokenKind.pipe);
      do {
        types.add(_parseNamedType());
      } while (_expectOptionalToken(TokenKind.pipe) != null);
    }

    return types;
  }

  EnumTypeDefinitionNode _parseEnumTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("enum");
    final name = _parseName("Expected an enum name");
    final directives = _parseDirectives(isConst: true);
    final values = _parseEnumValuesDefinition();

    return EnumTypeDefinitionNode(
      description: description,
      name: name,
      directives: directives,
      values: values,
    );
  }

  Iterable<EnumValueDefinitionNode> _parseEnumValuesDefinition() =>
      _maybeParseMany(
        TokenKind.braceL,
        _parseEnumValueDefinition,
        TokenKind.braceR,
      );

  EnumValueDefinitionNode _parseEnumValueDefinition() {
    final description = _parseDescription();
    final name = _parseName("Expected an enum value");
    final directives = _parseDirectives(isConst: true);

    return EnumValueDefinitionNode(
      description: description,
      name: name,
      directives: directives,
    );
  }

  InputObjectTypeDefinitionNode _parseInputObjectTypeDefinition() {
    final description = _parseDescription();
    _expectKeyword("input");
    final name = _parseName("Expected an input object type name");
    final directives = _parseDirectives(isConst: true);
    final fields = _parseInputFieldsDefinition();

    return InputObjectTypeDefinitionNode(
      description: description,
      name: name,
      directives: directives,
      fields: fields,
    );
  }

  Iterable<InputValueDefinitionNode> _parseInputFieldsDefinition() =>
      _maybeParseMany(
        TokenKind.braceL,
        _parseInputValueDefinition,
        TokenKind.braceR,
      );

  DirectiveDefinitionNode _parseDirectiveDefinition() {
    final description = _parseDescription();
    _expectKeyword("directive");
    _expectToken(TokenKind.at, "Directive name must be start with '\$'");
    final name = _parseName("Expected a directive name");
    final args = _parseArgumentDefinitions();
    final repeatable = _expectOptionalKeyword("repeatable") != null;
    _expectKeyword("on");
    final locations = _parseDirectiveLocations();

    return DirectiveDefinitionNode(
      description: description,
      name: name,
      args: args,
      repeatable: repeatable,
      locations: locations,
    );
  }

  Iterable<DirectiveLocation> _parseDirectiveLocations() {
    _expectOptionalToken(TokenKind.pipe);
    final locations = <DirectiveLocation>[];
    do {
      locations.add(_parseDirectiveLocation());
    } while (_expectOptionalToken(TokenKind.pipe) != null);

    return locations;
  }

  DirectiveLocation _parseDirectiveLocation() {
    final name = _parseName("Expected a directive location");

    switch (name.value) {
      case "QUERY":
        return DirectiveLocation.query;
      case "MUTATION":
        return DirectiveLocation.mutation;
      case "SUBSCRIPTION":
        return DirectiveLocation.subscription;
      case "FIELD":
        return DirectiveLocation.field;
      case "FRAGMENT_DEFINITION":
        return DirectiveLocation.fragmentDefinition;
      case "FRAGMENT_SPREAD":
        return DirectiveLocation.fragmentSpread;
      case "INLINE_FRAGMENT":
        return DirectiveLocation.inlineFragment;
      case "SCHEMA":
        return DirectiveLocation.schema;
      case "SCALAR":
        return DirectiveLocation.scalar;
      case "OBJECT":
        return DirectiveLocation.object;
      case "FIELD_DEFINITION":
        return DirectiveLocation.fieldDefinition;
      case "ARGUMENT_DEFINITION":
        return DirectiveLocation.argumentDefinition;
      case "INTERFACE":
        return DirectiveLocation.interface;
      case "UNION":
        return DirectiveLocation.union;
      case "ENUM":
        return DirectiveLocation.enumDefinition;
      case "ENUM_VALUE":
        return DirectiveLocation.enumValue;
      case "INPUT_OBJECT":
        return DirectiveLocation.inputObject;
      case "INPUT_FIELD_DEFINITION":
        return DirectiveLocation.inputFieldDefinition;
    }

    throw _unexpected("Unknown directive location '${name.value}'");
  }

  SchemaExtensionNode _parseSchemaExtension() {
    _expectKeyword("schema");

    final directives = _parseDirectives(isConst: true);
    final operationTypes = _maybeParseMany<OperationTypeDefinitionNode>(
      TokenKind.braceL,
      _parseOperationTypeDefinition,
      TokenKind.braceR,
    );

    if (directives.isEmpty && operationTypes.isEmpty) {
      throw _unexpected(
          "Schema extension must have either directives or operation types defined");
    }

    return SchemaExtensionNode(
      directives: directives,
      operationTypes: operationTypes,
    );
  }

  ScalarTypeExtensionNode _parseScalarTypeExtension() {
    _expectKeyword("scalar");

    final name = _parseName("Expected a scalar name");
    final directives = _parseDirectives(isConst: true);

    if (directives.isEmpty) {
      throw _unexpected("Scalar extension must have either directives defined");
    }

    return ScalarTypeExtensionNode(
      name: name,
      directives: directives,
    );
  }

  ObjectTypeExtensionNode _parseObjectTypeExtension() {
    _expectKeyword("type");

    final name = _parseName("Expected an object type name");
    final interfaces = _parseImplementsInterfaces();
    final directives = _parseDirectives(isConst: true);
    final fields = _parseFieldsDefinition();

    if (interfaces.isEmpty && directives.isEmpty && fields.isEmpty) {
      throw _unexpected(
          "Object type extension must define at least one directive or field, or implement at lease one interface");
    }

    return ObjectTypeExtensionNode(
      name: name,
      interfaces: interfaces,
      directives: directives,
      fields: fields,
    );
  }

  InterfaceTypeExtensionNode _parseInterfaceTypeExtension() {
    _expectKeyword("interface");

    final name = _parseName("Expected an interface name");
    final directives = _parseDirectives(isConst: true);
    final fields = _parseFieldsDefinition();

    if (directives.isEmpty && fields.isEmpty) {
      throw _unexpected(
          "Interface type extension must define at least one directive or field");
    }

    return InterfaceTypeExtensionNode(
      name: name,
      directives: directives,
      fields: fields,
    );
  }

  UnionTypeExtensionNode _parseUnionTypeExtension() {
    _expectKeyword("union");
    final name = _parseName("Expected a union name");
    final directives = _parseDirectives(isConst: true);
    final types = _parseUnionMemberTypes();

    if (directives.isEmpty && types.isEmpty) {
      throw _unexpected(
          "Union type extension must define at least one directive or type");
    }

    return UnionTypeExtensionNode(
      name: name,
      directives: directives,
      types: types,
    );
  }

  EnumTypeExtensionNode _parseEnumTypeExtension() {
    _expectKeyword("enum");
    final name = _parseName("Expected an enum name");
    final directives = _parseDirectives(isConst: true);
    final values = _parseEnumValuesDefinition();

    if (directives.isEmpty && values.isEmpty) {
      throw _unexpected(
          "Enum type extension must define at least one directive or value");
    }

    return EnumTypeExtensionNode(
      name: name,
      directives: directives,
      values: values,
    );
  }

  InputObjectTypeExtensionNode _parseInputObjectTypeExtension() {
    _expectKeyword("input");
    final name = _parseName("Expected an input object type name");
    final directives = _parseDirectives(isConst: true);
    final fields = _parseInputFieldsDefinition();

    if (directives.isEmpty && fields.isEmpty) {
      throw _unexpected(
          "Input type extension must define at least one directive or field, or implement at lease one interface");
    }

    return InputObjectTypeExtensionNode(
      name: name,
      directives: directives,
      fields: fields,
    );
  }
}
