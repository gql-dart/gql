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

String identifier(String raw) => reserved.contains(raw) ? "$raw\$" : raw;

const defaultTypeMap = <String, Reference>{
  "Int": Reference("int"),
  "Float": Reference("double"),
  "ID": Reference("String"),
  "Boolean": Reference("bool"),
};

Expression jsonAnnotation(
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
Constructor fromJson(String className) => Constructor(
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

Method toJson(String className) => Method(
      (b) => b
        ..name = "toJson"
        ..returns = refer("Map<String, dynamic>")
        ..lambda = true
        ..body = Code("_\$${className}ToJson(this)"),
    );

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
        ..types = ListBuilder<Reference>(<Reference>[
          typeRef(type.type, typeMap),
        ]),
    );
  }

  return null;
}

Reference typeRef(
  TypeNode type, [
  Map<String, Reference> typeMap = defaultTypeMap,
]) {
  final t = _listOrNot(type, typeMap);

  if (type.isNonNull) return t;

  return TypeReference(
    (b) => b
      ..symbol = "Optional"
      ..types = ListBuilder<Reference>(<Reference>[t]),
  );
}
