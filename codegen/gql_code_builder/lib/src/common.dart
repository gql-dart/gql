import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

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
        ..symbol = "List"
        ..types = ListBuilder<Reference>(
          <Reference>[
            typeRef(type.type, typeMap),
          ],
        ),
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
