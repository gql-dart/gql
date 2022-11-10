// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_build/__generated__/schema.schema.gql.dart' as _i2;
import 'package:gql_example_build/__generated__/serializers.gql.dart' as _i1;

part 'query.data.gql.g.dart';

abstract class GQueryOperationData
    implements Built<GQueryOperationData, GQueryOperationDataBuilder> {
  GQueryOperationData._();

  factory GQueryOperationData(
      [Function(GQueryOperationDataBuilder b) updates]) = _$GQueryOperationData;

  static void _initializeBuilder(GQueryOperationDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GQueryOperationData_field? get field;
  static Serializer<GQueryOperationData> get serializer =>
      _$gQueryOperationDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryOperationData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GQueryOperationData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryOperationData.serializer,
        json,
      );
}

abstract class GQueryOperationData_field
    implements
        Built<GQueryOperationData_field, GQueryOperationData_fieldBuilder> {
  GQueryOperationData_field._();

  factory GQueryOperationData_field(
          [Function(GQueryOperationData_fieldBuilder b) updates]) =
      _$GQueryOperationData_field;

  static void _initializeBuilder(GQueryOperationData_fieldBuilder b) =>
      b..G__typename = 'Field';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  @BuiltValueField(wireName: 'bool')
  bool? get Gbool;
  @BuiltValueField(wireName: 'int')
  int? get Gint;
  double? get float;
  String? get string;
  _i2.GScalar? get scalar;
  @BuiltValueField(wireName: 'enum')
  _i2.GEnum? get Genum;
  GQueryOperationData_field_field? get field;
  String get idRequired;
  bool get boolRequired;
  int get intRequired;
  double get floatRequired;
  String get stringRequired;
  _i2.GScalar get scalarRequired;
  _i2.GEnum get enumRequired;
  GQueryOperationData_field_fieldRequired get fieldRequired;
  static Serializer<GQueryOperationData_field> get serializer =>
      _$gQueryOperationDataFieldSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryOperationData_field.serializer,
        this,
      ) as Map<String, dynamic>);
  static GQueryOperationData_field? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryOperationData_field.serializer,
        json,
      );
}

abstract class GQueryOperationData_field_field
    implements
        Built<GQueryOperationData_field_field,
            GQueryOperationData_field_fieldBuilder> {
  GQueryOperationData_field_field._();

  factory GQueryOperationData_field_field(
          [Function(GQueryOperationData_field_fieldBuilder b) updates]) =
      _$GQueryOperationData_field_field;

  static void _initializeBuilder(GQueryOperationData_field_fieldBuilder b) =>
      b..G__typename = 'Field';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GQueryOperationData_field_field> get serializer =>
      _$gQueryOperationDataFieldFieldSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryOperationData_field_field.serializer,
        this,
      ) as Map<String, dynamic>);
  static GQueryOperationData_field_field? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryOperationData_field_field.serializer,
        json,
      );
}

abstract class GQueryOperationData_field_fieldRequired
    implements
        Built<GQueryOperationData_field_fieldRequired,
            GQueryOperationData_field_fieldRequiredBuilder> {
  GQueryOperationData_field_fieldRequired._();

  factory GQueryOperationData_field_fieldRequired(
      [Function(GQueryOperationData_field_fieldRequiredBuilder b)
          updates]) = _$GQueryOperationData_field_fieldRequired;

  static void _initializeBuilder(
          GQueryOperationData_field_fieldRequiredBuilder b) =>
      b..G__typename = 'Field';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GQueryOperationData_field_fieldRequired> get serializer =>
      _$gQueryOperationDataFieldFieldRequiredSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GQueryOperationData_field_fieldRequired.serializer,
        this,
      ) as Map<String, dynamic>);
  static GQueryOperationData_field_fieldRequired? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GQueryOperationData_field_fieldRequired.serializer,
        json,
      );
}
