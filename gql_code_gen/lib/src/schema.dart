import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:meta/meta.dart";
import "package:recase/recase.dart";

const reserved = <String>[
  "else",
  "assert",
  "enum",
  "in",
  "super",
  "switch",
  "extends",
  "is",
  "break",
  "this",
  "case",
  "throw",
  "catch",
  "false",
  "new",
  "true",
  "class",
  "final",
  "null",
  "try",
  "const",
  "finally",
  "continue",
  "for",
  "var",
  "void",
  "default",
  "rethrow",
  "while",
  "return",
  "with",
  "do",
  "if",
];

String identifier(String raw) => reserved.contains(raw) ? "$raw\$" : raw;

/// Build input types, enums and scalars from schema
Spec buildSchema(
  Node node, [
  BuildOptions options,
]) =>
    node.accept(
      _SchemaBuilderVisitor(options),
    );

const _defaultTypeMap = <String, Reference>{
  "Int": Reference("int"),
  "Float": Reference("double"),
  "ID": Reference("String"),
  "Boolean": Reference("bool"),
};

@immutable
class BuildOptions {
  final Map<String, Reference> typeMap;

  const BuildOptions({
    this.typeMap = const {},
  });
}

Expression _jsonAnnotation(
  String symbol, [
  Iterable<Expression> positionalArguments = const [],
  Map<String, Expression> namedArguments = const {},
  List<Reference> typeArguments = const [],
]) =>
    TypeReference(
      (b) => b
        ..symbol = symbol
        ..url = "package:json_annotation/json_annotation.dart",
    ).call(
      positionalArguments,
      namedArguments,
      typeArguments,
    );

// factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
Constructor _fromJson(String className) => Constructor(
      (b) => b
        ..factory = true
        ..name = "fromJson"
        ..requiredParameters = ListBuilder<Parameter>(<Parameter>[
          Parameter(
            (b) => b
              ..name = "json"
              ..type = refer("Map<String, dynamic>"),
          ),
        ])
        ..lambda = true
        ..body = Code("_\$${className}FromJson(json)"),
    );

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final Map<String, Reference> _typeMap;

  _SchemaBuilderVisitor(BuildOptions options)
      : _typeMap = {
          ..._defaultTypeMap,
          if (options != null) ...options.typeMap,
        };

  Reference _getTypeRef(String type) =>
      _typeMap.containsKey(type) ? _typeMap[type] : Reference(type);

  Spec _acceptOne(
    Node node,
  ) =>
      node != null ? node.accept(this) : literalNull;

  List<Spec> _acceptMany(
    List<Node> nodes,
  ) =>
      nodes.map(_acceptOne).toList(
            growable: false,
          );

  @override
  Spec visitDocumentNode(
    DocumentNode node,
  ) =>
      Library(
        (b) => b.body.addAll(
          _acceptMany(node.definitions).where((d) => d != null),
        ),
      );

  Constructor _buildConstructor(
    InputObjectTypeDefinitionNode node,
  ) =>
      Constructor(
        (b) => b
          ..optionalParameters = ListBuilder<Parameter>(
            node.fields.map<Parameter>(_buildParameter),
          )
          ..constant = true,
      );

  Parameter _buildParameter(
    InputValueDefinitionNode node,
  ) =>
      Parameter(
        (b) => b
          ..name = node.name.value
          ..toThis = true
          ..named = true,
      );

  @override
  Spec visitInputObjectTypeDefinitionNode(
    InputObjectTypeDefinitionNode node,
  ) =>
      Class(
        (b) => b
          ..name = node.name.value
          ..fields = ListBuilder<Field>(
            _acceptMany(node.fields),
          )
          ..methods = ListBuilder<Method>(<Method>[
            Method(
              (b) => b
                ..name = "toJson"
                ..returns = refer("Map<String, dynamic>")
                ..lambda = true
                ..body = Code("_\$${node.name.value}ToJson(this)"),
            ),
          ])
          ..constructors = ListBuilder<Constructor>(<Constructor>[
            _buildConstructor(node),
            _fromJson(node.name.value),
          ])
          ..annotations = ListBuilder<Expression>(<Expression>[
            _jsonAnnotation("JsonSerializable"),
          ]),
      );

  @override
  Spec visitInputValueDefinitionNode(
    InputValueDefinitionNode node,
  ) =>
      Field(
        (b) => b
          ..name = node.name.value
          ..type = node.type.isNonNull
              ? _acceptOne(node.type) as Reference
              : TypeReference(
                  (b) => b
                    ..symbol = "Optional"
                    ..types = ListBuilder<Reference>(<Reference>[
                      _acceptOne(node.type) as Reference,
                    ]),
                )
          ..modifier = FieldModifier.final$
          ..annotations = ListBuilder<Expression>(<Expression>[
            _jsonAnnotation(
              "JsonKey",
              [],
              {
                "required": literalBool(node.type.isNonNull),
                "nullable": literalBool(!node.type.isNonNull),
                "includeIfNull": literalBool(false),
              },
            ),
          ]),
      );

  @override
  Spec visitListTypeNode(
    ListTypeNode node,
  ) =>
      TypeReference(
        (b) => b
          ..symbol = "List"
          ..types = ListBuilder<Reference>(<Reference>[
            _acceptOne(node.type) as Reference,
          ]),
      );

  @override
  Spec visitNamedTypeNode(
    NamedTypeNode node,
  ) =>
      _getTypeRef(node.name.value);

  @override
  Spec visitScalarTypeDefinitionNode(
    ScalarTypeDefinitionNode node,
  ) =>
      Class(
        (b) => b
          ..name = node.name.value
          ..fields = ListBuilder<Field>(<Field>[
            Field(
              (b) => b
                ..name = "value"
                ..type = refer("String")
                ..modifier = FieldModifier.final$,
            ),
          ])
          ..constructors = ListBuilder<Constructor>(<Constructor>[
            Constructor(
              (b) => b
                ..requiredParameters = ListBuilder<Parameter>(<Parameter>[
                  Parameter(
                    (b) => b
                      ..name = "value"
                      ..toThis = true,
                  )
                ])
                ..constant = true,
            ),
          ])
          ..annotations = ListBuilder<Expression>(<Expression>[
            _jsonAnnotation("JsonSerializable"),
          ]),
      );

  @override
  Spec visitEnumTypeDefinitionNode(
    EnumTypeDefinitionNode node,
  ) =>
      Block(
        (b) => b
          ..statements = ListBuilder<Code>(<Code>[
            Code("enum ${node.name.value} {"),
            ..._acceptMany(node.values).cast<Code>(),
            Code("}"),
          ]),
      );

  @override
  Spec visitEnumValueDefinitionNode(
    EnumValueDefinitionNode node,
  ) =>
      Block.of(<Code>[
        Code("@"),
        _jsonAnnotation("JsonValue", [
          literalString(node.name.value),
        ]).code,
        Code("${identifier(ReCase(node.name.value).camelCase)},"),
      ]);
}
