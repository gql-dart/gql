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

/*

  static Serializer<AppInfo> get serializer => _$appInfoSerializer;
  String toJson() {
    return json.encode(serializers.serializeWith(AppInfo.serializer,this));
  }

  static AppInfo fromJson(String jsonString) {
  return serializers.deserializeWith(
      AppInfo.serializer, json.decode(jsonString));
  }
*/

String serializerSymbol(String raw) {
  if (raw.isEmpty) return raw;
  final parts = raw.split("_");
  final capitalized = parts
      .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
      .join("");
  final decapitalizedFirst =
      capitalized.substring(0, 1).toLowerCase() + capitalized.substring(1);
  return "_\$${decapitalizedFirst}Serializer";
}

Class builtClass({
  @required String name,
  Iterable<Method> getters,
}) =>
    Class(
      (b) => b
        ..abstract = true
        ..name = identifier(name)
        ..implements.add(
          TypeReference(
            (b) => b
              ..url = "package:built_value/built_value.dart"
              ..symbol = "Built"
              ..types = ListBuilder(
                <Reference>[
                  refer(identifier(name)),
                  refer("${identifier(name)}Builder"),
                ],
              ),
          ),
        )
        ..constructors.addAll(
          [
            Constructor((b) => b..name = "_"),
            Constructor(
              (b) => b
                ..factory = true
                ..optionalParameters.add(
                  Parameter(
                    (b) => b
                      ..name = "updates"
                      ..type = refer("Function(${identifier(name)}Builder b)"),
                  ),
                )
                ..redirect = refer("_\$${identifier(name)}"),
            ),
          ],
        )
        ..methods = ListBuilder(<Method>[
          ...getters,
          Method(
            (b) => b
              ..static = true
              ..returns = TypeReference(
                (b) => b
                  ..url = "package:built_value/serializer.dart"
                  ..symbol = "Serializer"
                  ..types.add(
                    refer(identifier(name)),
                  ),
              )
              ..type = MethodType.getter
              ..name = "serializer"
              ..lambda = true
              ..body = Code(serializerSymbol(identifier(name))),
          ),
        ]),
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
        identifier(typeName),
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
        if (nullable && built) CodeExpression(Code("nullable")),
      ])
      ..returns = returnType
      ..type = MethodType.getter
      ..name = identifier(nameNode.value),
  );
}
