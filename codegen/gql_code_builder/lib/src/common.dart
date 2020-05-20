import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:meta/meta.dart";

import "../source.dart";

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

/// Prefixes a string with "G"
///
/// This is used when generating classes and:
/// 1. allows type-sensitive graphql operation names without breaking `built_value` serialization
/// 2. prevents "_" prefixed graphql operations from becoming private in dart.
String builtClassName(String name) => "G" + name;

String identifier(String raw) => _escapePrivate(_escapeReserved(raw));

String _escapeReserved(String raw) => reserved.contains(raw) ? "$raw\$" : raw;

String _escapePrivate(String raw) => raw.startsWith("_") ? "\$$raw" : raw;

const defaultTypeMap = <String, Reference>{
  "Int": Reference("int"),
  "Float": Reference("double"),
  "ID": Reference("String"),
  "Boolean": Reference("bool"),
};

Reference getTypeRef(
  String type,
  Map<String, Reference> typeMap,
) =>
    typeMap.containsKey(type) ? typeMap[type] : Reference(type);

Reference _listOrNot(
  TypeNode type,
  Map<String, Reference> typeMap,
) {
  if (type is NamedTypeNode) {
    return getTypeRef(
      type.name.value,
      typeMap,
    );
  } else if (type is ListTypeNode) {
    return TypeReference(
      (b) => b
        ..url = "package:built_collection/built_collection.dart"
        ..symbol = "BuiltList"
        ..types.add(typeRef(type.type, typeMap)),
    );
  }

  return null;
}

Reference typeRef(
  TypeNode type, [
  Map<String, Reference> typeMap = defaultTypeMap,
]) =>
    _listOrNot(type, typeMap);

const defaultRootTypes = {
  OperationType.query: "Query",
  OperationType.mutation: "Mutation",
  OperationType.subscription: "Subscription"
};

NamedTypeNode unwrapTypeNode(
  TypeNode node,
) {
  if (node is NamedTypeNode) {
    return node;
  }

  if (node is ListTypeNode) {
    return unwrapTypeNode(node.type);
  }

  return null;
}

TypeDefinitionNode getTypeDefinitionNode(
  DocumentNode schema,
  String name,
) =>
    schema.definitions.whereType<TypeDefinitionNode>().firstWhere(
          (node) => node.name.value == name,
          orElse: () => null,
        );

Method buildGetter({
  @required NameNode nameNode,
  @required TypeNode typeNode,
  @required SourceNode schemaSource,
  String typeRefPrefix,
  bool built = true,
}) {
  final unwrappedTypeNode = unwrapTypeNode(typeNode);
  final typeName = unwrappedTypeNode.name.value;
  final nullable = !unwrappedTypeNode.isNonNull;
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
  };

  final returnType = typeRef(
    typeNode,
    typeMap,
  );

  return Method(
    (b) => b
      ..annotations = ListBuilder(<Expression>[
        if (built && nullable)
          refer("nullable", "package:built_value/built_value.dart"),
        if (built && identifier(nameNode.value) != nameNode.value)
          refer("BuiltValueField", "package:built_value/built_value.dart")
              .call([], {"wireName": literalString(nameNode.value)}),
      ])
      ..returns = returnType
      ..type = MethodType.getter
      ..name = identifier(nameNode.value),
  );
}
