// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;
import 'package:gql_example_build/__generated__/serializers.gql.dart' as _i1;

part 'shape.data.gql.g.dart';

abstract class GShapeData implements Built<GShapeData, GShapeDataBuilder> {
  GShapeData._();

  factory GShapeData([Function(GShapeDataBuilder b) updates]) = _$GShapeData;

  static void _initializeBuilder(GShapeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GShapeData_shape? get shape;
  static Serializer<GShapeData> get serializer => _$gShapeDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShapeData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShapeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShapeData.serializer,
        json,
      );
}

abstract class GShapeData_shape {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get area;
  static Serializer<GShapeData_shape> get serializer =>
      _i2.InlineFragmentSerializer<GShapeData_shape>(
        'GShapeData_shape',
        GShapeData_shape__base,
        {
          'Square': GShapeData_shape__asSquare,
          'Rectangle': GShapeData_shape__asRectangle,
        },
      );
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShapeData_shape.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShapeData_shape? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShapeData_shape.serializer,
        json,
      );
}

extension GShapeData_shapeWhenExtension on GShapeData_shape {
  _T when<_T>({
    required _T Function(GShapeData_shape__asSquare) square,
    required _T Function(GShapeData_shape__asRectangle) rectangle,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Square':
        return square((this as GShapeData_shape__asSquare));
      case 'Rectangle':
        return rectangle((this as GShapeData_shape__asRectangle));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GShapeData_shape__asSquare)? square,
    _T Function(GShapeData_shape__asRectangle)? rectangle,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Square':
        return square != null
            ? square((this as GShapeData_shape__asSquare))
            : orElse();
      case 'Rectangle':
        return rectangle != null
            ? rectangle((this as GShapeData_shape__asRectangle))
            : orElse();
      default:
        return orElse();
    }
  }
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
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double? get area;
  static Serializer<GShapeData_shape__base> get serializer =>
      _$gShapeDataShapeBaseSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShapeData_shape__base.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShapeData_shape__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShapeData_shape__base.serializer,
        json,
      );
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
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double? get area;
  double? get sideLength;
  static Serializer<GShapeData_shape__asSquare> get serializer =>
      _$gShapeDataShapeAsSquareSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShapeData_shape__asSquare.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShapeData_shape__asSquare? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShapeData_shape__asSquare.serializer,
        json,
      );
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
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double? get area;
  double? get sideLengthA;
  double? get sideLengthB;
  static Serializer<GShapeData_shape__asRectangle> get serializer =>
      _$gShapeDataShapeAsRectangleSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShapeData_shape__asRectangle.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShapeData_shape__asRectangle? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShapeData_shape__asRectangle.serializer,
        json,
      );
}
