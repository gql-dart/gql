import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/tristate_optionals_config.dart";
import "package:gql_code_builder/src/tristate_optionals.dart";

import "../source.dart";

const _reserved = <String>[
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
  "bool",
  "int",
  "double",
  "String",
  "Function",
  "Map",
  "List",
  "Set",
  "update",
  "values",
  "build",
  "replace",
  "toJson",
  "fromJson",
  "serializer",
];

class SourceSelections {
  final String? url;
  final List<SelectionNode> selections;

  const SourceSelections({
    this.url,
    required this.selections,
  });
}

/// Prefixes a string with "G"
///
/// This is used when generating classes and:
/// 1. allows type-sensitive graphql operation names without breaking `built_value` serialization
/// 2. prevents "_" prefixed graphql operations from becoming private in dart.
String builtClassName(String name) => "G" + name;

String identifier(String raw) => _escapePrivate(_escapeReserved(raw));

String _escapeReserved(String raw) => _reserved.contains(raw) ? "G$raw" : raw;

String _escapePrivate(String raw) => raw.startsWith("_") ? "G$raw" : raw;

const defaultTypeMap = <String, Reference>{
  "Int": Reference("int"),
  "Float": Reference("double"),
  "ID": Reference("String"),
  "Boolean": Reference("bool"),
};

Reference _typeRef(TypeNode type, Map<String, Reference> typeMap) {
  if (type is NamedTypeNode) {
    final ref = typeMap[type.name.value] ?? Reference(type.name.value);
    assert(ref.symbol != null, "Symbol for ${ref} must not be null");
    return TypeReference(
      (b) => b
        ..url = ref.url
        ..symbol = ref.symbol
        ..isNullable = !type.isNonNull,
    );
  } else if (type is ListTypeNode) {
    return TypeReference(
      (b) => b
        ..url = "package:built_collection/built_collection.dart"
        ..symbol = "BuiltList"
        ..isNullable = !type.isNonNull
        ..types.add(_typeRef(type.type, typeMap)),
    );
  }
  throw Exception("Unrecognized TypeNode type");
}

const defaultRootTypes = {
  OperationType.query: "Query",
  OperationType.mutation: "Mutation",
  OperationType.subscription: "Subscription"
};

NamedTypeNode unwrapTypeNode(
  TypeNode node,
) {
  if (node is ListTypeNode) {
    return unwrapTypeNode(node.type);
  }
  return node as NamedTypeNode;
}

TypeDefinitionNode? getTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions
        .whereType<TypeDefinitionNode>()
        .firstWhereOrNull((node) => node.name.value == name);

Method buildGetter({
  required NameNode nameNode,
  required TypeNode typeNode,
  required SourceNode schemaSource,
  Map<String, Reference> typeOverrides = const {},
  Reference? typeRefAlias,
  String? typeRefPrefix,
  bool built = true,
  bool isOverride = false,
}) {
  final unwrappedTypeNode = unwrapTypeNode(typeNode);
  final typeName = unwrappedTypeNode.name.value;
  final typeDef = getTypeDefinitionNode(
    schemaSource.document,
    typeName,
  );

  final typeMap = {
    ...defaultTypeMap,
    if (typeRefAlias != null)
      typeName: typeRefAlias
    else if (typeRefPrefix != null)
      typeName: refer("${typeRefPrefix}_${nameNode.value}")
    else if (typeDef != null)
      typeName: refer(
        builtClassName(typeName),
        "${schemaSource.url}#schema",
      ),
    ...typeOverrides,
  };

  final returnType = _typeRef(
    typeNode,
    typeMap,
  );

  return Method(
    (b) => b
      ..annotations = ListBuilder(<Expression>[
        if (isOverride) refer("override"),
        if (built && identifier(nameNode.value) != nameNode.value)
          refer("BuiltValueField", "package:built_value/built_value.dart")
              .call([], {"wireName": literalString(nameNode.value)}),
      ])
      ..returns = returnType
      ..type = MethodType.getter
      ..name = identifier(nameNode.value),
  );
}

/// like [buildGetter] but wraps the return type in a [Value] for nullable types
/// in order to distinguish between `null` and absent values
/// if [useTriStateValueForNullableTypes] is [TriStateValueConfig.onAllNullableFields]
Method buildOptionalGetter({
  required NameNode nameNode,
  required TypeNode typeNode,
  required SourceNode schemaSource,
  Map<String, Reference> typeOverrides = const {},
  String? typeRefPrefix,
  bool built = true,
  bool isOverride = false,
  TriStateValueConfig useTriStateValueForNullableTypes =
      TriStateValueConfig.never,
}) {
  final baseGetter = buildGetter(
    nameNode: nameNode,
    typeNode: typeNode,
    schemaSource: schemaSource,
    typeOverrides: typeOverrides,
    typeRefPrefix: typeRefPrefix,
    built: built,
    isOverride: isOverride,
  );

  if (typeNode.isNonNull ||
      useTriStateValueForNullableTypes == TriStateValueConfig.never) {
    return baseGetter;
  }

  final optionalGetter = baseGetter.rebuild((b) => b
    ..returns = TypeReference((b2) => b2
      ..isNullable = false
      ..url = valueTypeUrl
      ..symbol = valueTypeSymbol
      ..types.add((baseGetter.returns as TypeReference)
          .rebuild((b3) => b3..isNullable = false))));
  return optionalGetter;
}

Method buildSerializerGetter(String className) => Method(
      (b) => b
        ..static = true
        ..returns = TypeReference(
          (b) => b
            ..url = "package:built_value/serializer.dart"
            ..symbol = "Serializer"
            ..types.add(
              refer(className),
            ),
        )
        ..type = MethodType.getter
        ..name = "serializer"
        ..lambda = true,
    );

Method buildToJsonGetter(
  String className, {
  bool implemented = true,
  bool isOverride = false,
}) =>
    Method(
      (b) => b
        ..annotations.addAll([
          if (isOverride) refer("override"),
        ])
        ..returns = refer("Map<String, dynamic>")
        ..name = "toJson"
        ..lambda = implemented
        ..body = implemented
            ? refer("serializers", "#serializer")
                .property("serializeWith")
                .call([
                  refer(className).property("serializer"),
                  refer("this"),
                ])
                .asA(refer("Map<String, dynamic>"))
                .code
            : null,
    );

Method buildFromJsonGetter(String className) => Method(
      (b) => b
        ..static = true
        ..returns = TypeReference(
          (b) => b
            ..symbol = className
            ..isNullable = true,
        )
        ..name = "fromJson"
        ..requiredParameters.add(Parameter((b) => b
          ..type = refer("Map<String, dynamic>")
          ..name = "json"))
        ..lambda = true
        ..body = refer("serializers", "#serializer")
            .property("deserializeWith")
            .call(
                [refer(className).property("serializer"), refer("json")]).code,
    );
