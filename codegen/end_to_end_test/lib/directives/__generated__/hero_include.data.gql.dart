// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_include.data.gql.g.dart';

abstract class GHeroIncludeData
    implements Built<GHeroIncludeData, GHeroIncludeDataBuilder> {
  GHeroIncludeData._();

  factory GHeroIncludeData([Function(GHeroIncludeDataBuilder b) updates]) =
      _$GHeroIncludeData;

  static void _initializeBuilder(GHeroIncludeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroIncludeData_hero? get hero;
  static Serializer<GHeroIncludeData> get serializer =>
      _$gHeroIncludeDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroIncludeData.serializer, this)
          as Map<String, dynamic>);
  static GHeroIncludeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroIncludeData.serializer, json);
}

abstract class GHeroIncludeData_hero
    implements Built<GHeroIncludeData_hero, GHeroIncludeData_heroBuilder> {
  GHeroIncludeData_hero._();

  factory GHeroIncludeData_hero(
          [Function(GHeroIncludeData_heroBuilder b) updates]) =
      _$GHeroIncludeData_hero;

  static void _initializeBuilder(GHeroIncludeData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String get name;
  static Serializer<GHeroIncludeData_hero> get serializer =>
      _$gHeroIncludeDataHeroSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroIncludeData_hero.serializer, this)
          as Map<String, dynamic>);
  static GHeroIncludeData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroIncludeData_hero.serializer, json);
}
