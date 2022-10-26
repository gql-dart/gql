// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'merge_selection_sets.graphql.data.gql.g.dart';

abstract class GHeroMergeData
    implements Built<GHeroMergeData, GHeroMergeDataBuilder> {
  GHeroMergeData._();

  factory GHeroMergeData([Function(GHeroMergeDataBuilder b) updates]) =
      _$GHeroMergeData;

  static void _initializeBuilder(GHeroMergeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroMergeData_hero? get hero;
  static Serializer<GHeroMergeData> get serializer =>
      _$gHeroMergeDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeData.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeData.serializer, json);
}

abstract class GHeroMergeData_hero
    implements Built<GHeroMergeData_hero, GHeroMergeData_heroBuilder> {
  GHeroMergeData_hero._();

  factory GHeroMergeData_hero(
      [Function(GHeroMergeData_heroBuilder b) updates]) = _$GHeroMergeData_hero;

  static void _initializeBuilder(GHeroMergeData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHeroMergeData_hero> get serializer =>
      _$gHeroMergeDataHeroSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeData_hero.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeData_hero.serializer, json);
}
