import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";

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

Reference _typeRef(
  TypeNode type,
  Map<String, Reference> typeMap, [

  /// TODO: remove
  /// https://github.com/google/built_value.dart/issues/1011#issuecomment-804843573
  bool inList = false,
]) {
  if (type is NamedTypeNode) {
    final ref = typeMap[type.name.value] ?? Reference(type.name.value);
    return TypeReference(
      (b) => b
        ..url = ref.url
        ..symbol = ref.symbol

        /// TODO: remove `inList` check
        /// https://github.com/google/built_value.dart/issues/1011#issuecomment-804843573
        ..isNullable = !inList && !type.isNonNull,
    );
  } else if (type is ListTypeNode) {
    return TypeReference(
      (b) => b
        ..url = "package:built_collection/built_collection.dart"
        ..symbol = "BuiltList"
        ..isNullable = !type.isNonNull
        ..types.add(_typeRef(type.type, typeMap, true)),
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
    if (typeRefPrefix != null)
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
