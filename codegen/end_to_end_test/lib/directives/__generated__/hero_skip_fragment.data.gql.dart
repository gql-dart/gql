// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip_fragment.data.gql.g.dart';

abstract class GHeroSkipFragmentData
    implements Built<GHeroSkipFragmentData, GHeroSkipFragmentDataBuilder> {
  GHeroSkipFragmentData._();

  factory GHeroSkipFragmentData(
          [Function(GHeroSkipFragmentDataBuilder b) updates]) =
      _$GHeroSkipFragmentData;

  static void _initializeBuilder(GHeroSkipFragmentDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroSkipFragmentData_hero? get hero;
  static Serializer<GHeroSkipFragmentData> get serializer =>
      _$gHeroSkipFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroSkipFragmentData.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroSkipFragmentData.serializer, json);
}

abstract class GHeroSkipFragmentData_hero
    implements
        Built<GHeroSkipFragmentData_hero, GHeroSkipFragmentData_heroBuilder>,
        GHeroDetail {
  GHeroSkipFragmentData_hero._();

  factory GHeroSkipFragmentData_hero(
          [Function(GHeroSkipFragmentData_heroBuilder b) updates]) =
      _$GHeroSkipFragmentData_hero;

  static void _initializeBuilder(GHeroSkipFragmentData_heroBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  BuiltList<GHeroSkipFragmentData_hero_friends?>? get friends;
  static Serializer<GHeroSkipFragmentData_hero> get serializer =>
      _$gHeroSkipFragmentDataHeroSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GHeroSkipFragmentData_hero.serializer, this) as Map<String, dynamic>);
  static GHeroSkipFragmentData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroSkipFragmentData_hero.serializer, json);
}

abstract class GHeroSkipFragmentData_hero_friends
    implements
        Built<GHeroSkipFragmentData_hero_friends,
            GHeroSkipFragmentData_hero_friendsBuilder>,
        GHeroDetail_friends {
  GHeroSkipFragmentData_hero_friends._();

  factory GHeroSkipFragmentData_hero_friends(
          [Function(GHeroSkipFragmentData_hero_friendsBuilder b) updates]) =
      _$GHeroSkipFragmentData_hero_friends;

  static void _initializeBuilder(GHeroSkipFragmentData_hero_friendsBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroSkipFragmentData_hero_friends> get serializer =>
      _$gHeroSkipFragmentDataHeroFriendsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GHeroSkipFragmentData_hero_friends.serializer, this)
      as Map<String, dynamic>);
  static GHeroSkipFragmentData_hero_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroSkipFragmentData_hero_friends.serializer, json);
}

abstract class GHeroDetail {
  String get G__typename;
  String get id;
  String get name;
  BuiltList<GHeroDetail_friends?>? get friends;
  Map<String, dynamic> toJson();
}

abstract class GHeroDetail_friends {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GHeroDetailData
    implements Built<GHeroDetailData, GHeroDetailDataBuilder>, GHeroDetail {
  GHeroDetailData._();

  factory GHeroDetailData([Function(GHeroDetailDataBuilder b) updates]) =
      _$GHeroDetailData;

  static void _initializeBuilder(GHeroDetailDataBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  BuiltList<GHeroDetailData_friends?>? get friends;
  static Serializer<GHeroDetailData> get serializer =>
      _$gHeroDetailDataSerializer;
  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroDetailData.serializer, this)
          as Map<String, dynamic>);
  static GHeroDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroDetailData.serializer, json);
}

abstract class GHeroDetailData_friends
    implements
        Built<GHeroDetailData_friends, GHeroDetailData_friendsBuilder>,
        GHeroDetail_friends {
  GHeroDetailData_friends._();

  factory GHeroDetailData_friends(
          [Function(GHeroDetailData_friendsBuilder b) updates]) =
      _$GHeroDetailData_friends;

  static void _initializeBuilder(GHeroDetailData_friendsBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroDetailData_friends> get serializer =>
      _$gHeroDetailDataFriendsSerializer;
  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroDetailData_friends.serializer, this)
          as Map<String, dynamic>);
  static GHeroDetailData_friends? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroDetailData_friends.serializer, json);
}
