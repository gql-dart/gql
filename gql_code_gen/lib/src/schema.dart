import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_gen/src/common.dart";
import "package:meta/meta.dart";
import "package:recase/recase.dart";

/// Build input types, enums and scalars from schema
Spec buildSchema(
  Node node, [
  BuildOptions options,
]) =>
    node.accept(
      _SchemaBuilderVisitor(options),
    );

@immutable
class BuildOptions {
  final Map<String, Reference> typeMap;

  const BuildOptions({
    this.typeMap = const {},
  });
}

class _SchemaBuilderVisitor extends SimpleVisitor<Spec> {
  final Map<String, Reference> _typeMap;

  _SchemaBuilderVisitor(BuildOptions options)
      : _typeMap = {
          ...defaultTypeMap,
          if (options != null) ...options.typeMap,
        };

  Reference _getTypeRef(
    String type,
  ) =>
      getTypeRef(
        type,
        _typeMap,
      );

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
            toJson(node.name.value),
          ])
          ..constructors = ListBuilder<Constructor>(<Constructor>[
            _buildConstructor(node),
            fromJson(node.name.value),
          ])
          ..annotations = ListBuilder<Expression>(<Expression>[
            jsonAnnotation("JsonSerializable"),
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
            jsonAnnotation(
              "JsonKey",
              [],
              {
                "disallowNullValue": literalBool(node.type.isNonNull),
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
            jsonAnnotation("JsonSerializable"),
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
        jsonAnnotation("JsonValue", [
          literalString(node.name.value),
        ]).code,
        Code("${identifier(ReCase(node.name.value).camelCase)},"),
      ]);
}
