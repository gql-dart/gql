import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/schema.dart";
import "package:gql_code_builder/src/schema/enum.dart";
import "package:test/test.dart";

void main() {
  final simpleEnum =
      EnumTypeDefinitionNode(name: NameNode(value: "testEnum"), values: const [
    EnumValueDefinitionNode(name: NameNode(value: "val1")),
    EnumValueDefinitionNode(name: NameNode(value: "val2"))
  ]);

  test("does not generate fallback value when no fallback set in config", () {
    final clazz = buildEnumClass(
        simpleEnum,
        EnumFallbackConfig(
            generateFallbackValuesGlobally: false, fallbackValueMap: {}));

    expect(clazz.fields.length, 2);

    for (final field in clazz.fields) {
      final annotation = getBuiltValueEnumConstAnnotation(field);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });

  test("does generate global fallback value when fallback set in config", () {
    final clazz = buildEnumClass(
        simpleEnum,
        EnumFallbackConfig(
            generateFallbackValuesGlobally: true,
            globalEnumFallbackName: "fallback",
            fallbackValueMap: {}));

    expect(clazz.fields.length, 3);
    final fallbackvalue =
        clazz.fields.firstWhere((field) => field.name == "fallback");
    final enumAnnotation = getBuiltValueEnumConstAnnotation(fallbackvalue);

    expect(enumAnnotation, isNotNull);

    expect(enumAnnotation.namedArguments["fallback"], literalTrue);

    for (final otherField
        in clazz.fields.where((field) => field != fallbackvalue)) {
      final annotation = getBuiltValueEnumConstAnnotation(otherField);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });

  test("does generate fallback value when custom fallback set in config", () {
    final clazz = buildEnumClass(
        simpleEnum,
        EnumFallbackConfig(
            generateFallbackValuesGlobally: false,
            fallbackValueMap: {"testEnum": "val2"}));

    expect(clazz.fields.length, 2);
    final fallbackvalue =
        clazz.fields.firstWhere((field) => field.name == "val2");
    final enumAnnotation = getBuiltValueEnumConstAnnotation(fallbackvalue);

    expect(enumAnnotation, isNotNull);

    expect(enumAnnotation.namedArguments["fallback"], literalTrue);

    for (final otherField
        in clazz.fields.where((field) => field != fallbackvalue)) {
      final annotation = getBuiltValueEnumConstAnnotation(otherField);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });

  test("custom fallback overwrites global fallback", () {
    final clazz = buildEnumClass(
        simpleEnum,
        EnumFallbackConfig(
            generateFallbackValuesGlobally: true,
            globalEnumFallbackName: "fallbackValue",
            fallbackValueMap: {"testEnum": "val2"}));

    expect(clazz.fields.length, 2);
    final fallbackvalue =
        clazz.fields.firstWhere((field) => field.name == "val2");
    final enumAnnotation = getBuiltValueEnumConstAnnotation(fallbackvalue);

    expect(enumAnnotation, isNotNull);

    expect(enumAnnotation.namedArguments["fallback"], literalTrue);

    for (final otherField
        in clazz.fields.where((field) => field != fallbackvalue)) {
      final annotation = getBuiltValueEnumConstAnnotation(otherField);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });

  test("handles name clashes", () {
    final clazz = buildEnumClass(
        simpleEnum,
        EnumFallbackConfig(
            generateFallbackValuesGlobally: true,
            globalEnumFallbackName: "val2",
            fallbackValueMap: {}));

    expect(clazz.fields.length, 3);
    final fallbackvalue =
        clazz.fields.firstWhere((field) => field.name == "gval2");
    final enumAnnotation = getBuiltValueEnumConstAnnotation(fallbackvalue);

    expect(enumAnnotation, isNotNull);

    expect(enumAnnotation.namedArguments["fallback"], literalTrue);

    for (final otherField
        in clazz.fields.where((field) => field != fallbackvalue)) {
      final annotation = getBuiltValueEnumConstAnnotation(otherField);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });

  test("works with escaped names", () {
    final clazz = buildEnumClass(
        EnumTypeDefinitionNode(
            name: NameNode(value: "testEnum"),
            values: const [
              EnumValueDefinitionNode(name: NameNode(value: "name")),
              EnumValueDefinitionNode(name: NameNode(value: "default"))
            ]),
        EnumFallbackConfig(
            generateFallbackValuesGlobally: false,
            fallbackValueMap: {"testEnum": "default"}));

    expect(clazz.fields.length, 2);
    final fallbackvalue =
        clazz.fields.firstWhere((field) => field.name == "Gdefault");
    final enumAnnotation = getBuiltValueEnumConstAnnotation(fallbackvalue);

    expect(enumAnnotation, isNotNull);

    expect(enumAnnotation.namedArguments["fallback"], literalTrue);

    for (final otherField
        in clazz.fields.where((field) => field != fallbackvalue)) {
      final annotation = getBuiltValueEnumConstAnnotation(otherField);
      if (annotation != null) {
        expect(annotation.namedArguments["fallback"], isNot(literalTrue));
      }
    }
  });
}

InvokeExpression getBuiltValueEnumConstAnnotation(Field field) =>
    field.annotations.whereType<InvokeExpression>().singleWhere(
        (annotation) =>
            (annotation.target is Reference) &&
            (annotation.target as Reference).symbol == "BuiltValueEnumConst",
        orElse: () => null);
