// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;
import 'package:gql_example_build/__generated__/serializers.gql.dart' as _i2;

part 'schema.schema.gql.g.dart';

abstract class GScalar implements Built<GScalar, GScalarBuilder> {
  GScalar._();

  factory GScalar([String? value]) =>
      _$GScalar((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GScalar> get serializer =>
      _i1.DefaultScalarSerializer<GScalar>(
          (Object serialized) => GScalar((serialized as String?)));
}

class GEnum extends EnumClass {
  const GEnum._(String name) : super(name);

  static const GEnum ON = _$gEnumON;

  static const GEnum OFF = _$gEnumOFF;

  static Serializer<GEnum> get serializer => _$gEnumSerializer;
  static BuiltSet<GEnum> get values => _$gEnumValues;
  static GEnum valueOf(String name) => _$gEnumValueOf(name);
}

abstract class GInput implements Built<GInput, GInputBuilder> {
  GInput._();

  factory GInput([Function(GInputBuilder b) updates]) = _$GInput;

  String? get id;
  @BuiltValueField(wireName: 'bool')
  bool? get Gbool;
  @BuiltValueField(wireName: 'int')
  int? get Gint;
  double? get float;
  String? get string;
  GScalar? get scalar;
  @BuiltValueField(wireName: 'enum')
  GEnum? get Genum;
  GInput? get input;
  String get idRequired;
  bool get boolRequired;
  int get intRequired;
  double get floatRequired;
  String get stringRequired;
  GScalar get scalarRequired;
  GEnum get enumRequired;
  GInput get inputRequired;
  static Serializer<GInput> get serializer => _$gInputSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GInput.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {
  'Shape': {
    'Square',
    'Rectangle',
  }
};
