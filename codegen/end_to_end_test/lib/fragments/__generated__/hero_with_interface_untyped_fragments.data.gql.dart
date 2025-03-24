// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    as _i2;

part 'hero_with_interface_untyped_fragments.data.gql.g.dart';

abstract class GHeroWithoutFragmentsData
    implements
        Built<GHeroWithoutFragmentsData, GHeroWithoutFragmentsDataBuilder> {
  GHeroWithoutFragmentsData._();

  factory GHeroWithoutFragmentsData(
          [void Function(GHeroWithoutFragmentsDataBuilder b) updates]) =
      _$GHeroWithoutFragmentsData;

  static void _initializeBuilder(GHeroWithoutFragmentsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithoutFragmentsData_hero? get hero;
  static Serializer<GHeroWithoutFragmentsData> get serializer =>
      _$gHeroWithoutFragmentsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHeroWithoutFragmentsData_hero> get serializer =>
      _i2.InlineFragmentSerializer<GHeroWithoutFragmentsData_hero>(
        'GHeroWithoutFragmentsData_hero',
        GHeroWithoutFragmentsData_hero__base,
        {
          'Human': GHeroWithoutFragmentsData_hero__asHuman,
          'Droid': GHeroWithoutFragmentsData_hero__asDroid,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero.serializer,
        json,
      );
}

extension GHeroWithoutFragmentsData_heroWhenExtension
    on GHeroWithoutFragmentsData_hero {
  _T when<_T>({
    required _T Function(GHeroWithoutFragmentsData_hero__asHuman) human,
    required _T Function(GHeroWithoutFragmentsData_hero__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human((this as GHeroWithoutFragmentsData_hero__asHuman));
      case 'Droid':
        return droid((this as GHeroWithoutFragmentsData_hero__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroWithoutFragmentsData_hero__asHuman)? human,
    _T Function(GHeroWithoutFragmentsData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human((this as GHeroWithoutFragmentsData_hero__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid((this as GHeroWithoutFragmentsData_hero__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithoutFragmentsData_hero__base
    implements
        Built<GHeroWithoutFragmentsData_hero__base,
            GHeroWithoutFragmentsData_hero__baseBuilder>,
        GHeroWithoutFragmentsData_hero {
  GHeroWithoutFragmentsData_hero__base._();

  factory GHeroWithoutFragmentsData_hero__base(
      [void Function(GHeroWithoutFragmentsData_hero__baseBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__base;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroWithoutFragmentsData_hero__base> get serializer =>
      _$gHeroWithoutFragmentsDataHeroBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__base.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero__asHuman
    implements
        Built<GHeroWithoutFragmentsData_hero__asHuman,
            GHeroWithoutFragmentsData_hero__asHumanBuilder>,
        GHeroWithoutFragmentsData_hero {
  GHeroWithoutFragmentsData_hero__asHuman._();

  factory GHeroWithoutFragmentsData_hero__asHuman(
      [void Function(GHeroWithoutFragmentsData_hero__asHumanBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__asHuman;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  String? get homePlanet;
  BuiltList<GHeroWithoutFragmentsData_hero__asHuman_friends?>? get friends;
  static Serializer<GHeroWithoutFragmentsData_hero__asHuman> get serializer =>
      _$gHeroWithoutFragmentsDataHeroAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asHuman.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero__asHuman_friends {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends>
      get serializer => _i2.InlineFragmentSerializer<
              GHeroWithoutFragmentsData_hero__asHuman_friends>(
            'GHeroWithoutFragmentsData_hero__asHuman_friends',
            GHeroWithoutFragmentsData_hero__asHuman_friends__base,
            {
              'Human': GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
              'Droid': GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asHuman_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends.serializer,
        json,
      );
}

extension GHeroWithoutFragmentsData_hero__asHuman_friendsWhenExtension
    on GHeroWithoutFragmentsData_hero__asHuman_friends {
  _T when<_T>({
    required _T Function(
            GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman)
        human,
    required _T Function(
            GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid)
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(
            (this as GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman));
      case 'Droid':
        return droid(
            (this as GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman)?
        human,
    _T Function(GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid)?
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human((this
                as GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid((this
                as GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithoutFragmentsData_hero__asHuman_friends__base
    implements
        Built<GHeroWithoutFragmentsData_hero__asHuman_friends__base,
            GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder>,
        GHeroWithoutFragmentsData_hero__asHuman_friends {
  GHeroWithoutFragmentsData_hero__asHuman_friends__base._();

  factory GHeroWithoutFragmentsData_hero__asHuman_friends__base(
      [void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__asHuman_friends__base;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__base>
      get serializer =>
          _$gHeroWithoutFragmentsDataHeroAsHumanFriendsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asHuman_friends__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__base.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman
    implements
        Built<GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
            GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder>,
        GHeroWithoutFragmentsData_hero__asHuman_friends {
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman._();

  factory GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman(
      [void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  static Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman>
      get serializer =>
          _$gHeroWithoutFragmentsDataHeroAsHumanFriendsAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid
    implements
        Built<GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
            GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder>,
        GHeroWithoutFragmentsData_hero__asHuman_friends {
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid._();

  factory GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid(
      [void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get primaryFunction;
  static Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid>
      get serializer =>
          _$gHeroWithoutFragmentsDataHeroAsHumanFriendsAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid.serializer,
        json,
      );
}

abstract class GHeroWithoutFragmentsData_hero__asDroid
    implements
        Built<GHeroWithoutFragmentsData_hero__asDroid,
            GHeroWithoutFragmentsData_hero__asDroidBuilder>,
        GHeroWithoutFragmentsData_hero {
  GHeroWithoutFragmentsData_hero__asDroid._();

  factory GHeroWithoutFragmentsData_hero__asDroid(
      [void Function(GHeroWithoutFragmentsData_hero__asDroidBuilder b)
          updates]) = _$GHeroWithoutFragmentsData_hero__asDroid;

  static void _initializeBuilder(
          GHeroWithoutFragmentsData_hero__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  String? get primaryFunction;
  static Serializer<GHeroWithoutFragmentsData_hero__asDroid> get serializer =>
      _$gHeroWithoutFragmentsDataHeroAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithoutFragmentsData_hero__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsData_hero__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithoutFragmentsData_hero__asDroid.serializer,
        json,
      );
}
