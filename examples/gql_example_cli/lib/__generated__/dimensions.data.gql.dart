// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i1;

part 'dimensions.data.gql.g.dart';

abstract class GDimensions {
  String get G__typename;
  String? get minimum;
  String? get maximum;
  Map<String, dynamic> toJson();
}

abstract class GDimensionsData
    implements Built<GDimensionsData, GDimensionsDataBuilder>, GDimensions {
  GDimensionsData._();

  factory GDimensionsData([Function(GDimensionsDataBuilder b) updates]) =
      _$GDimensionsData;

  static void _initializeBuilder(GDimensionsDataBuilder b) =>
      b..G__typename = 'PokemonDimension';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get minimum;
  @override
  String? get maximum;
  static Serializer<GDimensionsData> get serializer =>
      _$gDimensionsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDimensionsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDimensionsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDimensionsData.serializer,
        json,
      );
}
