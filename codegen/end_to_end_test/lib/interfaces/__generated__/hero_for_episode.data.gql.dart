// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

part 'hero_for_episode.data.gql.g.dart';

abstract class GHeroForEpisodeData
    implements Built<GHeroForEpisodeData, GHeroForEpisodeDataBuilder> {
  GHeroForEpisodeData._();

  factory GHeroForEpisodeData(
      [Function(GHeroForEpisodeDataBuilder b) updates]) = _$GHeroForEpisodeData;

  static void _initializeBuilder(GHeroForEpisodeDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroForEpisodeData_hero? get hero;
  static Serializer<GHeroForEpisodeData> get serializer =>
      _$gHeroForEpisodeDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData.serializer,
        json,
      );
}

abstract class GHeroForEpisodeData_hero {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  BuiltList<GHeroForEpisodeData_hero_friends?>? get friends;
  static Serializer<GHeroForEpisodeData_hero> get serializer =>
      _i2.InlineFragmentSerializer<GHeroForEpisodeData_hero>(
        'GHeroForEpisodeData_hero',
        GHeroForEpisodeData_hero__base,
        {'Droid': GHeroForEpisodeData_hero__asDroid},
      );
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData_hero.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData_hero.serializer,
        json,
      );
}

extension GHeroForEpisodeData_heroWhenExtension on GHeroForEpisodeData_hero {
  _T when<_T>({
    required _T Function(GHeroForEpisodeData_hero__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid((this as GHeroForEpisodeData_hero__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroForEpisodeData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this as GHeroForEpisodeData_hero__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroForEpisodeData_hero__base
    implements
        Built<GHeroForEpisodeData_hero__base,
            GHeroForEpisodeData_hero__baseBuilder>,
        GHeroForEpisodeData_hero {
  GHeroForEpisodeData_hero__base._();

  factory GHeroForEpisodeData_hero__base(
          [Function(GHeroForEpisodeData_hero__baseBuilder b) updates]) =
      _$GHeroForEpisodeData_hero__base;

  static void _initializeBuilder(GHeroForEpisodeData_hero__baseBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  @override
  BuiltList<GHeroForEpisodeData_hero__base_friends?>? get friends;
  static Serializer<GHeroForEpisodeData_hero__base> get serializer =>
      _$gHeroForEpisodeDataHeroBaseSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData_hero__base.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData_hero__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData_hero__base.serializer,
        json,
      );
}

abstract class GHeroForEpisodeData_hero__base_friends
    implements
        Built<GHeroForEpisodeData_hero__base_friends,
            GHeroForEpisodeData_hero__base_friendsBuilder>,
        GHeroForEpisodeData_hero_friends {
  GHeroForEpisodeData_hero__base_friends._();

  factory GHeroForEpisodeData_hero__base_friends(
          [Function(GHeroForEpisodeData_hero__base_friendsBuilder b) updates]) =
      _$GHeroForEpisodeData_hero__base_friends;

  static void _initializeBuilder(
          GHeroForEpisodeData_hero__base_friendsBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  static Serializer<GHeroForEpisodeData_hero__base_friends> get serializer =>
      _$gHeroForEpisodeDataHeroBaseFriendsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData_hero__base_friends.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData_hero__base_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData_hero__base_friends.serializer,
        json,
      );
}

abstract class GHeroForEpisodeData_hero__asDroid
    implements
        Built<GHeroForEpisodeData_hero__asDroid,
            GHeroForEpisodeData_hero__asDroidBuilder>,
        GHeroForEpisodeData_hero,
        GDroidFragment {
  GHeroForEpisodeData_hero__asDroid._();

  factory GHeroForEpisodeData_hero__asDroid(
          [Function(GHeroForEpisodeData_hero__asDroidBuilder b) updates]) =
      _$GHeroForEpisodeData_hero__asDroid;

  static void _initializeBuilder(GHeroForEpisodeData_hero__asDroidBuilder b) =>
      b..G__typename = 'Droid';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  @override
  BuiltList<GHeroForEpisodeData_hero__asDroid_friends?>? get friends;
  @override
  String? get primaryFunction;
  static Serializer<GHeroForEpisodeData_hero__asDroid> get serializer =>
      _$gHeroForEpisodeDataHeroAsDroidSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData_hero__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData_hero__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData_hero__asDroid.serializer,
        json,
      );
}

abstract class GHeroForEpisodeData_hero__asDroid_friends
    implements
        Built<GHeroForEpisodeData_hero__asDroid_friends,
            GHeroForEpisodeData_hero__asDroid_friendsBuilder>,
        GHeroForEpisodeData_hero_friends {
  GHeroForEpisodeData_hero__asDroid_friends._();

  factory GHeroForEpisodeData_hero__asDroid_friends(
      [Function(GHeroForEpisodeData_hero__asDroid_friendsBuilder b)
          updates]) = _$GHeroForEpisodeData_hero__asDroid_friends;

  static void _initializeBuilder(
          GHeroForEpisodeData_hero__asDroid_friendsBuilder b) =>
      b..G__typename = 'Character';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  static Serializer<GHeroForEpisodeData_hero__asDroid_friends> get serializer =>
      _$gHeroForEpisodeDataHeroAsDroidFriendsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroForEpisodeData_hero__asDroid_friends.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisodeData_hero__asDroid_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroForEpisodeData_hero__asDroid_friends.serializer,
        json,
      );
}

abstract class GHeroForEpisodeData_hero_friends {
  String get G__typename;
  String get name;
  Map<String, dynamic> toJson();
}

abstract class GDroidFragment {
  String get G__typename;
  String? get primaryFunction;
  Map<String, dynamic> toJson();
}

abstract class GDroidFragmentData
    implements
        Built<GDroidFragmentData, GDroidFragmentDataBuilder>,
        GDroidFragment {
  GDroidFragmentData._();

  factory GDroidFragmentData([Function(GDroidFragmentDataBuilder b) updates]) =
      _$GDroidFragmentData;

  static void _initializeBuilder(GDroidFragmentDataBuilder b) =>
      b..G__typename = 'Droid';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  static Serializer<GDroidFragmentData> get serializer =>
      _$gDroidFragmentDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDroidFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDroidFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDroidFragmentData.serializer,
        json,
      );
}
