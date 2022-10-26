// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

part 'hero_inline_fragment.data.gql.g.dart';

abstract class GHeroWithInlineFragmentsData
    implements
        Built<GHeroWithInlineFragmentsData,
            GHeroWithInlineFragmentsDataBuilder> {
  GHeroWithInlineFragmentsData._();

  factory GHeroWithInlineFragmentsData(
          [Function(GHeroWithInlineFragmentsDataBuilder b) updates]) =
      _$GHeroWithInlineFragmentsData;

  static void _initializeBuilder(GHeroWithInlineFragmentsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithInlineFragmentsData_hero? get hero;
  static Serializer<GHeroWithInlineFragmentsData> get serializer =>
      _$gHeroWithInlineFragmentsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GHeroWithInlineFragmentsData.serializer, this) as Map<String, dynamic>);
  static GHeroWithInlineFragmentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithInlineFragmentsData.serializer, json);
}

abstract class GHeroWithInlineFragmentsData_hero {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GHeroWithInlineFragmentsData_hero> get serializer =>
      _i2.InlineFragmentSerializer<GHeroWithInlineFragmentsData_hero>(
          'GHeroWithInlineFragmentsData_hero',
          GHeroWithInlineFragmentsData_hero__base, {});
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GHeroWithInlineFragmentsData_hero.serializer, this)
      as Map<String, dynamic>);
  static GHeroWithInlineFragmentsData_hero? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithInlineFragmentsData_hero.serializer, json);
}

abstract class GHeroWithInlineFragmentsData_hero__base
    implements
        Built<GHeroWithInlineFragmentsData_hero__base,
            GHeroWithInlineFragmentsData_hero__baseBuilder>,
        GHeroWithInlineFragmentsData_hero {
  GHeroWithInlineFragmentsData_hero__base._();

  factory GHeroWithInlineFragmentsData_hero__base(
      [Function(GHeroWithInlineFragmentsData_hero__baseBuilder b)
          updates]) = _$GHeroWithInlineFragmentsData_hero__base;

  static void _initializeBuilder(
          GHeroWithInlineFragmentsData_hero__baseBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GHeroWithInlineFragmentsData_hero__base> get serializer =>
      _$gHeroWithInlineFragmentsDataHeroBaseSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GHeroWithInlineFragmentsData_hero__base.serializer, this)
      as Map<String, dynamic>);
  static GHeroWithInlineFragmentsData_hero__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithInlineFragmentsData_hero__base.serializer, json);
}
