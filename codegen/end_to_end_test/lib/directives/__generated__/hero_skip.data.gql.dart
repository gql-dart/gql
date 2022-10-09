// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip.data.gql.g.dart';

abstract class GHeroSkipData
    implements Built<GHeroSkipData, GHeroSkipDataBuilder> {
  GHeroSkipData._();

  factory GHeroSkipData([Function(GHeroSkipDataBuilder b) updates]) =
      _$GHeroSkipData;

  static void _initializeBuilder(GHeroSkipDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroSkipData_hero? get hero;
  static Serializer<GHeroSkipData> get serializer => _$gHeroSkipDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroSkipData.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroSkipData.serializer, json);
}

abstract class GHeroSkipData_hero
    implements Built<GHeroSkipData_hero, GHeroSkipData_heroBuilder> {
  GHeroSkipData_hero._();

  factory GHeroSkipData_hero([Function(GHeroSkipData_heroBuilder b) updates]) =
      _$GHeroSkipData_hero;

  static void _initializeBuilder(GHeroSkipData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String? get name;
  static Serializer<GHeroSkipData_hero> get serializer =>
      _$gHeroSkipDataHeroSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroSkipData_hero.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroSkipData_hero.serializer, json);
}
