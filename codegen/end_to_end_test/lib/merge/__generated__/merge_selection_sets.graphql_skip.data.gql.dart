// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'merge_selection_sets.graphql_skip.data.gql.g.dart';

abstract class GHeroMergeSkipData
    implements Built<GHeroMergeSkipData, GHeroMergeSkipDataBuilder> {
  GHeroMergeSkipData._();

  factory GHeroMergeSkipData([Function(GHeroMergeSkipDataBuilder b) updates]) =
      _$GHeroMergeSkipData;

  static void _initializeBuilder(GHeroMergeSkipDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroMergeSkipData_hero? get hero;
  static Serializer<GHeroMergeSkipData> get serializer =>
      _$gHeroMergeSkipDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeSkipData.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeSkipData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeSkipData.serializer, json);
}

abstract class GHeroMergeSkipData_hero
    implements Built<GHeroMergeSkipData_hero, GHeroMergeSkipData_heroBuilder> {
  GHeroMergeSkipData_hero._();

  factory GHeroMergeSkipData_hero(
          [Function(GHeroMergeSkipData_heroBuilder b) updates]) =
      _$GHeroMergeSkipData_hero;

  static void _initializeBuilder(GHeroMergeSkipData_heroBuilder b) =>
      b..G__typename = 'Character';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHeroMergeSkipData_hero> get serializer =>
      _$gHeroMergeSkipDataHeroSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeSkipData_hero.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeSkipData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeSkipData_hero.serializer, json);
}
