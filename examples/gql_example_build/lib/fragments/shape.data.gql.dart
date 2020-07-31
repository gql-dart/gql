// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i3;
import 'package:gql_code_builder/src/utils/built_faker.dart' as _i2;
import 'package:gql_example_build/serializers.gql.dart' as _i1;

part 'shape.data.gql.g.dart';

abstract class GShapeData implements Built<GShapeData, GShapeDataBuilder> {
  GShapeData._();

  factory GShapeData([Function(GShapeDataBuilder b) updates]) = _$GShapeData;

  @nullable
  GShapeData_shape get shape;
  static Serializer<GShapeData> get serializer => _$gShapeDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GShapeData.serializer, this);
  static GShapeData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GShapeData.serializer, json);
}

@BuiltValue(instantiable: false)
abstract class GShapeData_shape implements _i2.BuiltFaker {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  double get area;
  @BuiltValueSerializer(custom: true)
  static Serializer<GShapeData_shape> get serializer =>
      _i3.InlineFragmentSerializer<GShapeData_shape>(
          'GShapeData_shape',
          GShapeData_shape__base,
          [GShapeData_shape__asSquare, GShapeData_shape__asRectangle]);
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GShapeData_shape.serializer, this);
  static GShapeData_shape fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GShapeData_shape.serializer, json);
}

abstract class GShapeData_shape__base
    implements
        Built<GShapeData_shape__base, GShapeData_shape__baseBuilder>,
        GShapeData_shape {
  GShapeData_shape__base._();

  factory GShapeData_shape__base(
          [Function(GShapeData_shape__baseBuilder b) updates]) =
      _$GShapeData_shape__base;

  static void _initializeBuilder(GShapeData_shape__baseBuilder b) =>
      b..G__typename = 'Shape';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  double get area;
  static Serializer<GShapeData_shape__base> get serializer =>
      _$gShapeDataShapeBaseSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GShapeData_shape__base.serializer, this);
  static GShapeData_shape__base fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GShapeData_shape__base.serializer, json);
}

abstract class GShapeData_shape__asSquare
    implements
        Built<GShapeData_shape__asSquare, GShapeData_shape__asSquareBuilder>,
        GShapeData_shape {
  GShapeData_shape__asSquare._();

  factory GShapeData_shape__asSquare(
          [Function(GShapeData_shape__asSquareBuilder b) updates]) =
      _$GShapeData_shape__asSquare;

  static void _initializeBuilder(GShapeData_shape__asSquareBuilder b) =>
      b..G__typename = 'Square';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  double get area;
  @nullable
  double get sideLength;
  static Serializer<GShapeData_shape__asSquare> get serializer =>
      _$gShapeDataShapeAsSquareSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GShapeData_shape__asSquare.serializer, this);
  static GShapeData_shape__asSquare fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GShapeData_shape__asSquare.serializer, json);
}

abstract class GShapeData_shape__asRectangle
    implements
        Built<GShapeData_shape__asRectangle,
            GShapeData_shape__asRectangleBuilder>,
        GShapeData_shape {
  GShapeData_shape__asRectangle._();

  factory GShapeData_shape__asRectangle(
          [Function(GShapeData_shape__asRectangleBuilder b) updates]) =
      _$GShapeData_shape__asRectangle;

  static void _initializeBuilder(GShapeData_shape__asRectangleBuilder b) =>
      b..G__typename = 'Rectangle';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  double get area;
  @nullable
  double get sideLengthA;
  @nullable
  double get sideLengthB;
  static Serializer<GShapeData_shape__asRectangle> get serializer =>
      _$gShapeDataShapeAsRectangleSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GShapeData_shape__asRectangle.serializer, this);
  static GShapeData_shape__asRectangle fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GShapeData_shape__asRectangle.serializer, json);
}
