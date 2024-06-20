// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_with_duplicated_fields_due_to_fragments.data.gql.g.dart';

abstract class GHeroWithFragmentsDuplicationData
    implements
        Built<GHeroWithFragmentsDuplicationData,
            GHeroWithFragmentsDuplicationDataBuilder> {
  GHeroWithFragmentsDuplicationData._();

  factory GHeroWithFragmentsDuplicationData(
          [void Function(GHeroWithFragmentsDuplicationDataBuilder b) updates]) =
      _$GHeroWithFragmentsDuplicationData;

  static void _initializeBuilder(GHeroWithFragmentsDuplicationDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithFragmentsDuplicationData_hero? get hero;
  static Serializer<GHeroWithFragmentsDuplicationData> get serializer =>
      _$gHeroWithFragmentsDuplicationDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsDuplicationData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsDuplicationData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsDuplicationData.serializer,
        json,
      );
}

abstract class GHeroWithFragmentsDuplicationData_hero
    implements
        Built<GHeroWithFragmentsDuplicationData_hero,
            GHeroWithFragmentsDuplicationData_heroBuilder>,
        GHeroWithFragmentsDuplicationFragment {
  GHeroWithFragmentsDuplicationData_hero._();

  factory GHeroWithFragmentsDuplicationData_hero(
      [void Function(GHeroWithFragmentsDuplicationData_heroBuilder b)
          updates]) = _$GHeroWithFragmentsDuplicationData_hero;

  static void _initializeBuilder(
          GHeroWithFragmentsDuplicationData_heroBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroWithFragmentsDuplicationData_hero> get serializer =>
      _$gHeroWithFragmentsDuplicationDataHeroSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsDuplicationData_hero.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsDuplicationData_hero? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsDuplicationData_hero.serializer,
        json,
      );
}

abstract class GHeroWithFragmentsDuplicationFragment {
  String get G__typename;
  String get id;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GHeroWithFragmentsDuplicationFragmentData
    implements
        Built<GHeroWithFragmentsDuplicationFragmentData,
            GHeroWithFragmentsDuplicationFragmentDataBuilder>,
        GHeroWithFragmentsDuplicationFragment {
  GHeroWithFragmentsDuplicationFragmentData._();

  factory GHeroWithFragmentsDuplicationFragmentData(
      [void Function(GHeroWithFragmentsDuplicationFragmentDataBuilder b)
          updates]) = _$GHeroWithFragmentsDuplicationFragmentData;

  static void _initializeBuilder(
          GHeroWithFragmentsDuplicationFragmentDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroWithFragmentsDuplicationFragmentData> get serializer =>
      _$gHeroWithFragmentsDuplicationFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsDuplicationFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsDuplicationFragmentData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsDuplicationFragmentData.serializer,
        json,
      );
}
