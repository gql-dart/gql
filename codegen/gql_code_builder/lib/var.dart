import "package:code_builder/code_builder.dart";
import "package:collection/collection.dart";
import "package:gql/ast.dart";

import "./source.dart";
import "./src/built_class.dart";
import "./src/common.dart";
import "./src/frag_vars.dart";

Library buildVarLibrary(
  SourceNode docSource,
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides,
  Allocator allocator,
) {
  final operationVarClasses = docSource.document.definitions
      .whereType<OperationDefinitionNode>()
      .map((op) => builtClass(
              name: "${op.name!.value}Vars",
              getters: op.variableDefinitions.map<Method>(
                (node) => buildOptionalGetter(
                  nameNode: node.variable.name,
                  typeNode: node.type,
                  schemaSource: schemaSource,
                  typeOverrides: typeOverrides,
                ),
              ),
              hasCustomSerializer: true,
              methods: [
                nullAwareJsonSerializerField(op, "G${op.name!.value}Vars"),
              ]))
      .toList();

  Map<String, FragmentDefinitionNode> _fragmentMap(SourceNode source) => {
        for (final def
            in source.document.definitions.whereType<FragmentDefinitionNode>())
          def.name.value: def,
        for (final import in source.imports) ..._fragmentMap(import)
      };

  final fragmentVarClasses = docSource.document.definitions
      .whereType<FragmentDefinitionNode>()
      .map((frag) {
    final varTypes = fragmentVarTypes(
      fragment: frag,
      fragmentMap: _fragmentMap(docSource),
      schema: schemaSource.document,
    );
    return builtClass(
      name: "${frag.name.value}Vars",
      getters: varTypes.entries.map<Method>(
        (entry) => buildOptionalGetter(
          nameNode: entry.key,
          typeNode: entry.value,
          schemaSource: schemaSource,
          typeOverrides: typeOverrides,
        ),
      ),
      hasCustomSerializer: true,
      methods: [
        nullAwareJsonSerializerField(frag, "G${frag.name.value}Vars"),
      ],
    );
  }).toList();

  return Library(
    (b) => b
      ..directives.add(Directive.part(partUrl))
      ..body.addAll([
        ...operationVarClasses,
        ...fragmentVarClasses,
        for (final op in operationVarClasses)
          nullAwareJsonSerializerClass(
            op,
            allocator,
            schemaSource,
            typeOverrides,
          ),
        for (final frag in fragmentVarClasses)
          nullAwareJsonSerializerClass(
            frag,
            allocator,
            schemaSource,
            typeOverrides,
          ),
      ]),
  );
}

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

Class nullAwareJsonSerializerClass(
  Class base,
  Allocator allocator,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    Class((b) => b
      ..name = "${base.name}Serializer"
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

  for (final field in base.methods
      .where((field) => !field.static && field.type == MethodType.getter)) {
    final isOptionalValue = isValue(field.returns!);
    final statements = <Code>[];

    if (isOptionalValue) {
      final realType =
          (field.returns as TypeReference).types.first as TypeReference;

      final _valueVarName = "_\$${field.name}value";

      statements.add(Code("final $_valueVarName = object.${field.name};"));
      statements.add(Code(
          "if ($_valueVarName case ${allocator.allocate(refer("PresentValue", 'package:gql_exec/value.dart'))}(value: final _\$value) ) {"));
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
        Map<String, Reference> typeOverrides) =>
    Code("""final builder =  ${base.name}Builder();
      final iterator = serialized.iterator;
      while (iterator.moveNext()) {
        final key = iterator.current as String;
        iterator.moveNext();
        final Object? value = iterator.current;
        switch (key) {
          ${_generateFieldDeserializers(
      base,
      allocator,
      schemaSource,
      typeOverrides,
    )}
        }
      }
      return builder.build();
    """);

String _generateFieldDeserializers(
  Class clazz,
  Allocator allocator,
  SourceNode schemaSource,
  Map<String, Reference> typeOverrides,
) =>
    clazz.methods
        .where((field) => field.type == MethodType.getter && !field.static)
        .map((field) {
      var type = field.returns!;
      final isWrappedValue = isValue(type);
      if (isWrappedValue) {
        type = (type as TypeReference).types.first;
      }
      final fullType = _generateFullType(type as TypeReference, allocator);

      final typeDefNode = getTypeDefinitionNode(
          schemaSource.document, type.symbol.substring(1));

      print(typeDefNode.runtimeType.toString() +
          " " +
          (typeDefNode?.name.value.toString() ?? ""));

      //TODO this feels flaky, find a better way
      final isBuilder = type.url != null &&
          !isWrappedValue &&
          (typeDefNode is! ScalarTypeDefinitionNode &&
              typeDefNode is! EnumTypeDefinitionNode);

      /// TODO check for wireName

      var base = """
case '${_getWireName(field)}':
  var fieldValue = serializers.deserialize(
      value, specifiedType: const $fullType) as ${_generateTypeCast(type, allocator)};""";

      if (isBuilder) {
        base += """
        builder.${field.name}.replace(fieldValue);
      """;
      } else {
        base += """
        builder.${field.name} = ${isWrappedValue ? "${allocator.allocate(_presentValueTypeRef)}(fieldValue)" : "fieldValue"};
      """;
      }

      return base +
          """
break;
""";
    }).join();

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

final _valueTypeRef = TypeReference((b) => b
  ..symbol = "Value"
  ..url = "package:gql_exec/value.dart");

final _presentValueTypeRef = TypeReference((b) => b
  ..symbol = "PresentValue"
  ..url = "package:gql_exec/value.dart");

bool isValue(Reference ref) {
  if (ref is! TypeReference) return false;

  return ref.symbol == _valueTypeRef.symbol && ref.url == _valueTypeRef.url;
}

String _getWireName(Method m) {
  final annotation = m.annotations.firstWhereOrNull(
          (a) => a is InvokeExpression && a.name == "BuiltValueField")
      as InvokeExpression?;
  if (annotation == null) return m.name!;
  return (annotation.namedArguments["wireName"] as LiteralExpression?)
          ?.literal ??
      m.name!;
}
