// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'multiple_fragments.data.gql.g.dart';

abstract class GHeroWith2FragmentsData
    implements Built<GHeroWith2FragmentsData, GHeroWith2FragmentsDataBuilder> {
  GHeroWith2FragmentsData._();

  factory GHeroWith2FragmentsData(
          [Function(GHeroWith2FragmentsDataBuilder b) updates]) =
      _$GHeroWith2FragmentsData;

  static void _initializeBuilder(GHeroWith2FragmentsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWith2FragmentsData_hero? get hero;
  static Serializer<GHeroWith2FragmentsData> get serializer =>
      _$gHeroWith2FragmentsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWith2FragmentsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWith2FragmentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWith2FragmentsData.serializer,
        json,
      );
}

abstract class GHeroWith2FragmentsData_hero
    implements
        Built<GHeroWith2FragmentsData_hero,
            GHeroWith2FragmentsData_heroBuilder>,
        GheroName,
        GheroId {
  GHeroWith2FragmentsData_hero._();

  factory GHeroWith2FragmentsData_hero(
          [Function(GHeroWith2FragmentsData_heroBuilder b) updates]) =
      _$GHeroWith2FragmentsData_hero;

  static void _initializeBuilder(GHeroWith2FragmentsData_heroBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  @override
  String get id;
  static Serializer<GHeroWith2FragmentsData_hero> get serializer =>
      _$gHeroWith2FragmentsDataHeroSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWith2FragmentsData_hero.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWith2FragmentsData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWith2FragmentsData_hero.serializer,
        json,
      );
}

abstract class GheroName {
  String get G__typename;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GheroNameData
    implements Built<GheroNameData, GheroNameDataBuilder>, GheroName {
  GheroNameData._();

  factory GheroNameData([Function(GheroNameDataBuilder b) updates]) =
      _$GheroNameData;

  static void _initializeBuilder(GheroNameDataBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  static Serializer<GheroNameData> get serializer => _$gheroNameDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroNameData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroNameData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroNameData.serializer,
        json,
      );
}

abstract class GheroId {
  String get G__typename;
  String get id;
  Map<String, dynamic> toJson();
}

abstract class GheroIdData
    implements Built<GheroIdData, GheroIdDataBuilder>, GheroId {
  GheroIdData._();

  factory GheroIdData([Function(GheroIdDataBuilder b) updates]) = _$GheroIdData;

  static void _initializeBuilder(GheroIdDataBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  static Serializer<GheroIdData> get serializer => _$gheroIdDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroIdData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroIdData.serializer,
        json,
      );
}
