import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/utils/parse_literal_string.dart";

/// add a static custom serializer to the generated class which
/// is aware of the `Value` type and can serialize it to json
/// in order to distinguish between `null`, and absent values
/// use the corresponding nullAwareJsonSerializerClass() method
/// to generate the serializer class which is referenced here
Method nullAwareJsonSerializerField(Node op, String className) =>
    Method((b) => b
      ..annotations.add(CodeExpression(
          Code("BuiltValueSerializer(custom: true, serializeNulls: true)")))
      ..static = true
      ..type = MethodType.getter
      ..lambda = true
      ..returns = TypeReference((b2) => b2
        ..symbol = "Serializer"
        ..url = "package:built_value/serializer.dart"
        ..types.add(refer(className)))
      ..name = "serializer"
      ..body = Code("${className}Serializer()"));

/// builds a custom serializer for the generated class which
/// is aware of the `Value` type and can serialize it to json
/// in order to distinguish between `null`, and absent values
/// use the corresponding nullAwareJsonSerializerField() method
/// to add the serializer to the generated class
Class nullAwareJsonSerializerClass(
  Class base,
  Allocator allocator,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    Class((b) => b
      ..name = "${base.name}Serializer"
      ..modifier = ClassModifier.final$
      ..extend = TypeReference((b) => b
        ..symbol = "StructuredSerializer"
        ..url = "package:built_value/serializer.dart"
        ..types.add(refer(base.name)))
      ..fields.addAll([
        Field(
          (b) => b
            ..name = "wireName"
            ..modifier = FieldModifier.final$
            ..type = refer("String")
            ..assignment = (literalString(base.name)).code,
        ),
        Field((b) => b
          ..name = "types"
          ..modifier = FieldModifier.final$
          ..type = TypeReference((b2) => b2..symbol = "Iterable<Type>")
          ..assignment = Code("const [${base.name}, _\$${base.name}]"))
      ])
      ..methods.addAll([
        Method((b) => b
          ..name = "serialize"
          ..returns = refer("Iterable<Object?>")
          ..requiredParameters.add(Parameter((b) => b
            ..name = "serializers"
            ..type =
                refer("Serializers", "package:built_value/serializer.dart")))
          ..requiredParameters.add(Parameter((b) => b
            ..name = "object"
            ..type = refer(base.name)))
          ..optionalParameters.add(Parameter((b) => b
            ..name = "specifiedType"
            ..named = true
            ..type = refer("FullType", "package:built_value/serializer.dart")
            ..defaultTo = Code("FullType.unspecified")))
          ..body =
              _serializerBody(base, allocator, schemaSource, typeOverrides)),
        Method((b) => b
          ..name = "deserialize"
          ..returns = refer(base.name)
          ..requiredParameters.add(Parameter((b) => b
            ..name = "serializers"
            ..type =
                refer("Serializers", "package:built_value/serializer.dart")))
          ..requiredParameters.add(Parameter((b) => b
            ..name = "serialized"
            ..type = refer("Iterable<Object?>")))
          ..optionalParameters.add(Parameter((b) => b
            ..name = "specifiedType"
            ..named = true
            ..type = refer("FullType", "package:built_value/serializer.dart")
            ..defaultTo = Code("FullType.unspecified")))
          ..body =
              _deserializerBody(base, allocator, schemaSource, typeOverrides)),
      ]));

Code _serializerBody(Class base, Allocator allocator, SourceNode schemaSource,
    Map<String, Reference> typeOverrides) {
  final vars = <Code>[];

  final fields = base.methods
      .where((field) => field.type == MethodType.getter && !field.static)
      .toList();

  if (fields.isEmpty) {
    return Code("return const [];");
  }

  for (final field in fields) {
    final isOptionalValue = _isValue(field.returns!);
    final statements = <Code>[];

    if (isOptionalValue) {
      final realType =
          (field.returns as TypeReference).types.first as TypeReference;

      final _valueVarName = "_\$${field.name}value";

      statements.add(Code("final $_valueVarName = object.${field.name};"));
      statements.add(Code(
          "if ($_valueVarName case ${allocator.allocate(presentValueTypeRef)}(value: final _\$value) ) {"));
      statements.add(Code("result.add('${_getWireName(field)}');"));
      statements.add(Code(
          "result.add(serializers.serialize(_\$value, specifiedType: const ${_generateFullType(realType, allocator)}));"));
      statements.add(Code("}"));
    } else {
      statements.add(Code("result.add('${_getWireName(field)}');"));
      statements.add(Code(
          "result.add(serializers.serialize(object.${field.name}, specifiedType: const ${_generateFullType(field.returns as TypeReference, allocator)}));"));
    }
    vars.add(Block.of(statements));
  }

  final body = Block.of([
    Code("final result = <Object?>[];"),
    ...vars,
    Code("return result;"),
  ]);

  return body;
}

Code _deserializerBody(Class base, Allocator allocator, SourceNode schemaSource,
    Map<String, Reference> typeOverrides) {
  final fields = base.methods
      .where((field) => field.type == MethodType.getter && !field.static)
      .toList();

  return switch (fields) {
    [] => Code("return ${base.name}();"),
    final nonEmptyFieldsList => Code("""
      final builder =  ${base.name}Builder();  
      final iterator = serialized.iterator;
      while (iterator.moveNext()) {
        final key = iterator.current as String;
        iterator.moveNext();
        final Object? value = iterator.current;
        switch (key) {
          ${_generateFieldDeserializers(
        nonEmptyFieldsList,
        allocator,
        schemaSource,
        typeOverrides,
      )}
        }
      }
      return builder.build();
    """),
  };
}

String _generateFieldDeserializers(
  List<Method> fields,
  Allocator allocator,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    fields.map((field) {
      var type = field.returns!;
      final isWrappedValue = _isValue(type);
      if (isWrappedValue) {
        type = (type as TypeReference).types.first;
      }
      final fullType = _generateFullType(type as TypeReference, allocator);
      final typeDefNode = getTypeDefinitionNode(
        schemaSource.document,
        _originalSymbolName(typeOverrides, type),
      );

      //TODO this feels flaky, find a better way
      final isBuilder = type.url != null &&
          !isWrappedValue &&
          (typeDefNode is! ScalarTypeDefinitionNode &&
              typeDefNode is! EnumTypeDefinitionNode);

      const fieldNameVariableName = "_\$fieldValue";

      final fieldNameExpr = CodeExpression(Code(fieldNameVariableName));
      var base = """
case '${_getWireName(field)}':
  var ${fieldNameVariableName} = serializers.deserialize(
      value, specifiedType: const $fullType) as ${_generateTypeCast(type, allocator)};""";

      if (isBuilder) {
        base += """
        builder.${field.name}.replace($fieldNameVariableName);
      """;
      } else {
        base += """
        builder.${field.name} = ${isWrappedValue ? newPresentValueConstructorInvocation(fieldNameExpr, allocator) : fieldNameVariableName};
      """;
      }

      return base +
          """
break;
""";
    }).join();

String _originalSymbolName(
    Map<String, Reference> typeOverrides, TypeReference type) {
  String? originalSymbolName;

  /// If symbol exists in [typeOverrides] then the original symbol from Schema file is the key of [typeOverrides].
  /// And [type.symbol] is the type of the Dart class that handles Schema's scalar.
  for (final entry in typeOverrides.entries) {
    if (entry.value.symbol == type.symbol) {
      originalSymbolName = entry.key;
      break;
    }
  }

  /// Removes the leading `G` from the type name.
  /// It still can not work if you original type's symbol starts with the 'G' letter.
  originalSymbolName ??=
      type.symbol[0] == "G" ? type.symbol.substring(1) : type.symbol;
  return originalSymbolName;
}

String _getWireName(Method m) {
  final wireNameExpr = m.annotations
      .map((annotation) {
        if (annotation
            case InvokeExpression(
              target: Reference(
                symbol: "BuiltValueField",
                url: "package:built_value/built_value.dart",
              )
            )) {
          return annotation.namedArguments["wireName"];
        }
        return null;
      })
      .whereNotNull()
      .firstOrNull;

  if (wireNameExpr is! LiteralExpression) {
    return m.name!;
  }
  // remove quotes from string literal
  return parseLiteralString(wireNameExpr);
}

Code _generateFullType(TypeReference ref, Allocator allocator) {
  if (ref.types.isEmpty) {
    return Code("FullType(${allocator.allocate(ref)})");
  } else {
    return Code(
        "FullType(${allocator.allocate(ref)}, [${ref.types.map((t) => _generateFullType(t as TypeReference, allocator)).join(",")}])");
  }
}

String _generateTypeCast(TypeReference ref, Allocator allocator) {
  if (ref.types.isEmpty) {
    return allocator.allocate(ref);
  } else {
    return "${allocator.allocate(ref)}<${ref.types.map((t) => _generateTypeCast(t as TypeReference, allocator)).join(",")}>";
  }
}

const valueTypeSymbol = "Value";
const valueTypeUrl = "package:gql_tristate_value/gql_tristate_value.dart";

final valueTypeRef = TypeReference(
  (b) => b
    ..symbol = valueTypeSymbol
    ..url = valueTypeUrl,
);

final absentValueTypeRef = TypeReference(
  (b) => b
    ..symbol = "AbsentValue"
    ..url = valueTypeUrl,
);

final presentValueTypeRef = TypeReference(
  (b) => b
    ..symbol = "PresentValue"
    ..url = valueTypeUrl,
);

Expression absentValueConstructorInvocation() =>
    absentValueTypeRef.constInstance(const []);

String newPresentValueConstructorInvocation(
    Expression value, Allocator allocator) {
  final prefixedRef = allocator.allocate(presentValueTypeRef);

  return "$prefixedRef(${value.code})";
}

bool _isValue(Reference ref) {
  if (ref is! TypeReference) return false;

  return ref.symbol == valueTypeRef.symbol && ref.url == valueTypeRef.url;
}
