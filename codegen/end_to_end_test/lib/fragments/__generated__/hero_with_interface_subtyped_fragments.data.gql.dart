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

part 'hero_with_interface_subtyped_fragments.data.gql.g.dart';

abstract class GHeroWithInterfaceSubTypedFragmentsData
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsData,
            GHeroWithInterfaceSubTypedFragmentsDataBuilder> {
  GHeroWithInterfaceSubTypedFragmentsData._();

  factory GHeroWithInterfaceSubTypedFragmentsData(
      [void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsData;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithInterfaceSubTypedFragmentsData_hero? get hero;
  static Serializer<GHeroWithInterfaceSubTypedFragmentsData> get serializer =>
      _$gHeroWithInterfaceSubTypedFragmentsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsData.serializer,
        json,
      );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero
    implements GheroFieldsFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman? get asHuman;
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid? get asDroid;
  static Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero>
      get serializer => _i2.InlineFragmentSerializer<
              GHeroWithInterfaceSubTypedFragmentsData_hero>(
            'GHeroWithInterfaceSubTypedFragmentsData_hero',
            GHeroWithInterfaceSubTypedFragmentsData_hero__base,
            {
              'Human': GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
              'Droid': GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero.serializer,
        json,
      );
}

extension GHeroWithInterfaceSubTypedFragmentsData_heroWhenExtension
    on GHeroWithInterfaceSubTypedFragmentsData_hero {
  _T when<_T>({
    required _T Function(GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman)
        human,
    required _T Function(GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid)
        droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(
            (this as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman));
      case 'Droid':
        return droid(
            (this as GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman)? human,
    _T Function(GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human(
                (this as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid(
                (this as GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__base
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsData_hero__base,
            GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero,
        GheroFieldsFragment {
  GHeroWithInterfaceSubTypedFragmentsData_hero__base._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__base(
      [void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsData_hero__base;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman? get asHuman => null;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asDroid? get asDroid => null;

  static Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__base>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__base.serializer,
        json,
      );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero,
        GheroFieldsFragment,
        GhumanFieldsFragment {
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman(
      [void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get homePlanet;
  BuiltList<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>?
      get friends;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman? get asHuman => this;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asDroid? get asDroid => null;

  static Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman.serializer,
        json,
      );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends
    implements GhumanFieldsFragment_friends {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid?
      get asDroid;
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman?
      get asHuman;
  static Serializer<
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends>
      get serializer => _i2.InlineFragmentSerializer<
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends>(
            'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends',
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
            {
              'Droid':
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
              'Human':
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends
                .serializer,
            json,
          );
}

extension GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friendsWhenExtension
    on GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends {
  _T when<_T>({
    required _T Function(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid)
        droid,
    required _T Function(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman)
        human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid((this
            as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid));
      case 'Human':
        return human((this
            as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid)?
        droid,
    _T Function(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman)?
        human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this
                as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid))
            : orElse();
      case 'Human':
        return human != null
            ? human((this
                as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
    implements
        Built<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder
                      b)
              updates]) =
      _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder
              b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid?
      get asDroid => null;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman?
      get asHuman => null;

  static Serializer<
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
                .serializer,
            json,
          );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
    implements
        Built<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends,
        GdroidFieldsFragment {
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder
                      b)
              updates]) =
      _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder
              b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid?
      get asDroid => this;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman?
      get asHuman => null;

  static Serializer<
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
                .serializer,
            json,
          );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
    implements
        Built<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder
                      b)
              updates]) =
      _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder
              b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid?
      get asDroid => null;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman?
      get asHuman => this;

  static Serializer<
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
                .serializer,
            json,
          );
}

abstract class GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder>,
        GHeroWithInterfaceSubTypedFragmentsData_hero,
        GheroFieldsFragment,
        GdroidFieldsFragment {
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid._();

  factory GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid(
      [void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid;

  static void _initializeBuilder(
          GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asHuman? get asHuman => null;

  @override
  HeroWithInterfaceSubTypedFragmentsData_hero__asDroid? get asDroid => this;

  static Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid>
      get serializer =>
          _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid.serializer,
        json,
      );
}

abstract class GheroFieldsFragment {
  String get G__typename;
  String get id;
  String get name;
  GheroFieldsFragment__asHuman? get asHuman;
  GheroFieldsFragment__asDroid? get asDroid;
}

extension GheroFieldsFragmentWhenExtension on GheroFieldsFragment {
  _T when<_T>({
    required _T Function(GheroFieldsFragment__asHuman) human,
    required _T Function(GheroFieldsFragment__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human((this as GheroFieldsFragment__asHuman));
      case 'Droid':
        return droid((this as GheroFieldsFragment__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragment__asHuman)? human,
    _T Function(GheroFieldsFragment__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human((this as GheroFieldsFragment__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid((this as GheroFieldsFragment__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GheroFieldsFragment__base implements GheroFieldsFragment {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  heroFieldsFragment__asHuman? get asHuman => null;

  @override
  heroFieldsFragment__asDroid? get asDroid => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragment__asHuman
    implements GheroFieldsFragment, GhumanFieldsFragment {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get G__typename;
  @override
  String? get homePlanet;
  BuiltList<GheroFieldsFragment__asHuman_friends?>? get friends;
  @override
  heroFieldsFragment__asHuman? get asHuman => this;

  @override
  heroFieldsFragment__asDroid? get asDroid => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragment__asHuman_friends
    implements GhumanFieldsFragment_friends {
  @override
  String get G__typename;
  GheroFieldsFragment__asHuman_friends__asDroid? get asDroid;
  GheroFieldsFragment__asHuman_friends__asHuman? get asHuman;
}

extension GheroFieldsFragment__asHuman_friendsWhenExtension
    on GheroFieldsFragment__asHuman_friends {
  _T when<_T>({
    required _T Function(GheroFieldsFragment__asHuman_friends__asDroid) droid,
    required _T Function(GheroFieldsFragment__asHuman_friends__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid((this as GheroFieldsFragment__asHuman_friends__asDroid));
      case 'Human':
        return human((this as GheroFieldsFragment__asHuman_friends__asHuman));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragment__asHuman_friends__asDroid)? droid,
    _T Function(GheroFieldsFragment__asHuman_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this as GheroFieldsFragment__asHuman_friends__asDroid))
            : orElse();
      case 'Human':
        return human != null
            ? human((this as GheroFieldsFragment__asHuman_friends__asHuman))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GheroFieldsFragment__asHuman_friends__base
    implements GheroFieldsFragment__asHuman_friends {
  @override
  String get G__typename;
  @override
  heroFieldsFragment__asHuman_friends__asDroid? get asDroid => null;

  @override
  heroFieldsFragment__asHuman_friends__asHuman? get asHuman => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragment__asHuman_friends__asDroid
    implements GheroFieldsFragment__asHuman_friends, GdroidFieldsFragment {
  @override
  String get G__typename;
  String get id;
  String get name;
  @override
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  heroFieldsFragment__asHuman_friends__asDroid? get asDroid => this;

  @override
  heroFieldsFragment__asHuman_friends__asHuman? get asHuman => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragment__asHuman_friends__asHuman
    implements GheroFieldsFragment__asHuman_friends {
  @override
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  @override
  heroFieldsFragment__asHuman_friends__asDroid? get asDroid => null;

  @override
  heroFieldsFragment__asHuman_friends__asHuman? get asHuman => this;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragment__asDroid
    implements GheroFieldsFragment, GdroidFieldsFragment {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  heroFieldsFragment__asHuman? get asHuman => null;

  @override
  heroFieldsFragment__asDroid? get asDroid => this;

  @override
  Map<String, dynamic> toJson();
}

abstract class GheroFieldsFragmentData implements GheroFieldsFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  GheroFieldsFragmentData__asHuman? get asHuman;
  GheroFieldsFragmentData__asDroid? get asDroid;
  static Serializer<GheroFieldsFragmentData> get serializer =>
      _i2.InlineFragmentSerializer<GheroFieldsFragmentData>(
        'GheroFieldsFragmentData',
        GheroFieldsFragmentData__base,
        {
          'Human': GheroFieldsFragmentData__asHuman,
          'Droid': GheroFieldsFragmentData__asDroid,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData.serializer,
        json,
      );
}

extension GheroFieldsFragmentDataWhenExtension on GheroFieldsFragmentData {
  _T when<_T>({
    required _T Function(GheroFieldsFragmentData__asHuman) human,
    required _T Function(GheroFieldsFragmentData__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human((this as GheroFieldsFragmentData__asHuman));
      case 'Droid':
        return droid((this as GheroFieldsFragmentData__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragmentData__asHuman)? human,
    _T Function(GheroFieldsFragmentData__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human((this as GheroFieldsFragmentData__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid((this as GheroFieldsFragmentData__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GheroFieldsFragmentData__base
    implements
        Built<GheroFieldsFragmentData__base,
            GheroFieldsFragmentData__baseBuilder>,
        GheroFieldsFragmentData {
  GheroFieldsFragmentData__base._();

  factory GheroFieldsFragmentData__base(
          [void Function(GheroFieldsFragmentData__baseBuilder b) updates]) =
      _$GheroFieldsFragmentData__base;

  static void _initializeBuilder(GheroFieldsFragmentData__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  heroFieldsFragmentData__asHuman? get asHuman => null;

  @override
  heroFieldsFragmentData__asDroid? get asDroid => null;

  static Serializer<GheroFieldsFragmentData__base> get serializer =>
      _$gheroFieldsFragmentDataBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__base.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentData__asHuman
    implements
        Built<GheroFieldsFragmentData__asHuman,
            GheroFieldsFragmentData__asHumanBuilder>,
        GheroFieldsFragmentData,
        GhumanFieldsFragment {
  GheroFieldsFragmentData__asHuman._();

  factory GheroFieldsFragmentData__asHuman(
          [void Function(GheroFieldsFragmentData__asHumanBuilder b) updates]) =
      _$GheroFieldsFragmentData__asHuman;

  static void _initializeBuilder(GheroFieldsFragmentData__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get homePlanet;
  BuiltList<GheroFieldsFragmentData__asHuman_friends?>? get friends;
  @override
  heroFieldsFragmentData__asHuman? get asHuman => this;

  @override
  heroFieldsFragmentData__asDroid? get asDroid => null;

  static Serializer<GheroFieldsFragmentData__asHuman> get serializer =>
      _$gheroFieldsFragmentDataAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asHuman.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentData__asHuman_friends
    implements GhumanFieldsFragment_friends {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GheroFieldsFragmentData__asHuman_friends__asDroid? get asDroid;
  GheroFieldsFragmentData__asHuman_friends__asHuman? get asHuman;
  static Serializer<GheroFieldsFragmentData__asHuman_friends> get serializer =>
      _i2.InlineFragmentSerializer<GheroFieldsFragmentData__asHuman_friends>(
        'GheroFieldsFragmentData__asHuman_friends',
        GheroFieldsFragmentData__asHuman_friends__base,
        {
          'Droid': GheroFieldsFragmentData__asHuman_friends__asDroid,
          'Human': GheroFieldsFragmentData__asHuman_friends__asHuman,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asHuman_friends.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asHuman_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asHuman_friends.serializer,
        json,
      );
}

extension GheroFieldsFragmentData__asHuman_friendsWhenExtension
    on GheroFieldsFragmentData__asHuman_friends {
  _T when<_T>({
    required _T Function(GheroFieldsFragmentData__asHuman_friends__asDroid)
        droid,
    required _T Function(GheroFieldsFragmentData__asHuman_friends__asHuman)
        human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid(
            (this as GheroFieldsFragmentData__asHuman_friends__asDroid));
      case 'Human':
        return human(
            (this as GheroFieldsFragmentData__asHuman_friends__asHuman));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GheroFieldsFragmentData__asHuman_friends__asDroid)? droid,
    _T Function(GheroFieldsFragmentData__asHuman_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this as GheroFieldsFragmentData__asHuman_friends__asDroid))
            : orElse();
      case 'Human':
        return human != null
            ? human((this as GheroFieldsFragmentData__asHuman_friends__asHuman))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GheroFieldsFragmentData__asHuman_friends__base
    implements
        Built<GheroFieldsFragmentData__asHuman_friends__base,
            GheroFieldsFragmentData__asHuman_friends__baseBuilder>,
        GheroFieldsFragmentData__asHuman_friends {
  GheroFieldsFragmentData__asHuman_friends__base._();

  factory GheroFieldsFragmentData__asHuman_friends__base(
      [void Function(GheroFieldsFragmentData__asHuman_friends__baseBuilder b)
          updates]) = _$GheroFieldsFragmentData__asHuman_friends__base;

  static void _initializeBuilder(
          GheroFieldsFragmentData__asHuman_friends__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  heroFieldsFragmentData__asHuman_friends__asDroid? get asDroid => null;

  @override
  heroFieldsFragmentData__asHuman_friends__asHuman? get asHuman => null;

  static Serializer<GheroFieldsFragmentData__asHuman_friends__base>
      get serializer => _$gheroFieldsFragmentDataAsHumanFriendsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asHuman_friends__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asHuman_friends__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asHuman_friends__base.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentData__asHuman_friends__asDroid
    implements
        Built<GheroFieldsFragmentData__asHuman_friends__asDroid,
            GheroFieldsFragmentData__asHuman_friends__asDroidBuilder>,
        GheroFieldsFragmentData__asHuman_friends,
        GdroidFieldsFragment {
  GheroFieldsFragmentData__asHuman_friends__asDroid._();

  factory GheroFieldsFragmentData__asHuman_friends__asDroid(
      [void Function(GheroFieldsFragmentData__asHuman_friends__asDroidBuilder b)
          updates]) = _$GheroFieldsFragmentData__asHuman_friends__asDroid;

  static void _initializeBuilder(
          GheroFieldsFragmentData__asHuman_friends__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  heroFieldsFragmentData__asHuman_friends__asDroid? get asDroid => this;

  @override
  heroFieldsFragmentData__asHuman_friends__asHuman? get asHuman => null;

  static Serializer<GheroFieldsFragmentData__asHuman_friends__asDroid>
      get serializer =>
          _$gheroFieldsFragmentDataAsHumanFriendsAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asHuman_friends__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asHuman_friends__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asHuman_friends__asDroid.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentData__asHuman_friends__asHuman
    implements
        Built<GheroFieldsFragmentData__asHuman_friends__asHuman,
            GheroFieldsFragmentData__asHuman_friends__asHumanBuilder>,
        GheroFieldsFragmentData__asHuman_friends {
  GheroFieldsFragmentData__asHuman_friends__asHuman._();

  factory GheroFieldsFragmentData__asHuman_friends__asHuman(
      [void Function(GheroFieldsFragmentData__asHuman_friends__asHumanBuilder b)
          updates]) = _$GheroFieldsFragmentData__asHuman_friends__asHuman;

  static void _initializeBuilder(
          GheroFieldsFragmentData__asHuman_friends__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  @override
  heroFieldsFragmentData__asHuman_friends__asDroid? get asDroid => null;

  @override
  heroFieldsFragmentData__asHuman_friends__asHuman? get asHuman => this;

  static Serializer<GheroFieldsFragmentData__asHuman_friends__asHuman>
      get serializer =>
          _$gheroFieldsFragmentDataAsHumanFriendsAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asHuman_friends__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asHuman_friends__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asHuman_friends__asHuman.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentData__asDroid
    implements
        Built<GheroFieldsFragmentData__asDroid,
            GheroFieldsFragmentData__asDroidBuilder>,
        GheroFieldsFragmentData,
        GdroidFieldsFragment {
  GheroFieldsFragmentData__asDroid._();

  factory GheroFieldsFragmentData__asDroid(
          [void Function(GheroFieldsFragmentData__asDroidBuilder b) updates]) =
      _$GheroFieldsFragmentData__asDroid;

  static void _initializeBuilder(GheroFieldsFragmentData__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  heroFieldsFragmentData__asHuman? get asHuman => null;

  @override
  heroFieldsFragmentData__asDroid? get asDroid => this;

  static Serializer<GheroFieldsFragmentData__asDroid> get serializer =>
      _$gheroFieldsFragmentDataAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroFieldsFragmentData__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentData__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroFieldsFragmentData__asDroid.serializer,
        json,
      );
}

abstract class GhumanFieldsFragment {
  String get G__typename;
  String? get homePlanet;
  BuiltList<GhumanFieldsFragment_friends?>? get friends;
  Map<String, dynamic> toJson();
}

abstract class GhumanFieldsFragment_friends {
  String get G__typename;
  GhumanFieldsFragment_friends__asDroid? get asDroid;
  GhumanFieldsFragment_friends__asHuman? get asHuman;
}

extension GhumanFieldsFragment_friendsWhenExtension
    on GhumanFieldsFragment_friends {
  _T when<_T>({
    required _T Function(GhumanFieldsFragment_friends__asDroid) droid,
    required _T Function(GhumanFieldsFragment_friends__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid((this as GhumanFieldsFragment_friends__asDroid));
      case 'Human':
        return human((this as GhumanFieldsFragment_friends__asHuman));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GhumanFieldsFragment_friends__asDroid)? droid,
    _T Function(GhumanFieldsFragment_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this as GhumanFieldsFragment_friends__asDroid))
            : orElse();
      case 'Human':
        return human != null
            ? human((this as GhumanFieldsFragment_friends__asHuman))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GhumanFieldsFragment_friends__base
    implements GhumanFieldsFragment_friends {
  @override
  String get G__typename;
  @override
  humanFieldsFragment_friends__asDroid? get asDroid => null;

  @override
  humanFieldsFragment_friends__asHuman? get asHuman => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GhumanFieldsFragment_friends__asDroid
    implements GhumanFieldsFragment_friends, GdroidFieldsFragment {
  @override
  String get G__typename;
  String get id;
  String get name;
  @override
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  humanFieldsFragment_friends__asDroid? get asDroid => this;

  @override
  humanFieldsFragment_friends__asHuman? get asHuman => null;

  @override
  Map<String, dynamic> toJson();
}

abstract class GhumanFieldsFragment_friends__asHuman
    implements GhumanFieldsFragment_friends {
  @override
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  @override
  humanFieldsFragment_friends__asDroid? get asDroid => null;

  @override
  humanFieldsFragment_friends__asHuman? get asHuman => this;

  @override
  Map<String, dynamic> toJson();
}

abstract class GhumanFieldsFragmentData
    implements
        Built<GhumanFieldsFragmentData, GhumanFieldsFragmentDataBuilder>,
        GhumanFieldsFragment {
  GhumanFieldsFragmentData._();

  factory GhumanFieldsFragmentData(
          [void Function(GhumanFieldsFragmentDataBuilder b) updates]) =
      _$GhumanFieldsFragmentData;

  static void _initializeBuilder(GhumanFieldsFragmentDataBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get homePlanet;
  @override
  BuiltList<GhumanFieldsFragmentData_friends?>? get friends;
  static Serializer<GhumanFieldsFragmentData> get serializer =>
      _$ghumanFieldsFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GhumanFieldsFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GhumanFieldsFragmentData.serializer,
        json,
      );
}

abstract class GhumanFieldsFragmentData_friends
    implements GhumanFieldsFragment_friends {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GhumanFieldsFragmentData_friends__asDroid? get asDroid;
  GhumanFieldsFragmentData_friends__asHuman? get asHuman;
  static Serializer<GhumanFieldsFragmentData_friends> get serializer =>
      _i2.InlineFragmentSerializer<GhumanFieldsFragmentData_friends>(
        'GhumanFieldsFragmentData_friends',
        GhumanFieldsFragmentData_friends__base,
        {
          'Droid': GhumanFieldsFragmentData_friends__asDroid,
          'Human': GhumanFieldsFragmentData_friends__asHuman,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GhumanFieldsFragmentData_friends.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentData_friends? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GhumanFieldsFragmentData_friends.serializer,
        json,
      );
}

extension GhumanFieldsFragmentData_friendsWhenExtension
    on GhumanFieldsFragmentData_friends {
  _T when<_T>({
    required _T Function(GhumanFieldsFragmentData_friends__asDroid) droid,
    required _T Function(GhumanFieldsFragmentData_friends__asHuman) human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid((this as GhumanFieldsFragmentData_friends__asDroid));
      case 'Human':
        return human((this as GhumanFieldsFragmentData_friends__asHuman));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GhumanFieldsFragmentData_friends__asDroid)? droid,
    _T Function(GhumanFieldsFragmentData_friends__asHuman)? human,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Droid':
        return droid != null
            ? droid((this as GhumanFieldsFragmentData_friends__asDroid))
            : orElse();
      case 'Human':
        return human != null
            ? human((this as GhumanFieldsFragmentData_friends__asHuman))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GhumanFieldsFragmentData_friends__base
    implements
        Built<GhumanFieldsFragmentData_friends__base,
            GhumanFieldsFragmentData_friends__baseBuilder>,
        GhumanFieldsFragmentData_friends {
  GhumanFieldsFragmentData_friends__base._();

  factory GhumanFieldsFragmentData_friends__base(
      [void Function(GhumanFieldsFragmentData_friends__baseBuilder b)
          updates]) = _$GhumanFieldsFragmentData_friends__base;

  static void _initializeBuilder(
          GhumanFieldsFragmentData_friends__baseBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  humanFieldsFragmentData_friends__asDroid? get asDroid => null;

  @override
  humanFieldsFragmentData_friends__asHuman? get asHuman => null;

  static Serializer<GhumanFieldsFragmentData_friends__base> get serializer =>
      _$ghumanFieldsFragmentDataFriendsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GhumanFieldsFragmentData_friends__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentData_friends__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GhumanFieldsFragmentData_friends__base.serializer,
        json,
      );
}

abstract class GhumanFieldsFragmentData_friends__asDroid
    implements
        Built<GhumanFieldsFragmentData_friends__asDroid,
            GhumanFieldsFragmentData_friends__asDroidBuilder>,
        GhumanFieldsFragmentData_friends,
        GdroidFieldsFragment {
  GhumanFieldsFragmentData_friends__asDroid._();

  factory GhumanFieldsFragmentData_friends__asDroid(
      [void Function(GhumanFieldsFragmentData_friends__asDroidBuilder b)
          updates]) = _$GhumanFieldsFragmentData_friends__asDroid;

  static void _initializeBuilder(
          GhumanFieldsFragmentData_friends__asDroidBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  @override
  humanFieldsFragmentData_friends__asDroid? get asDroid => this;

  @override
  humanFieldsFragmentData_friends__asHuman? get asHuman => null;

  static Serializer<GhumanFieldsFragmentData_friends__asDroid> get serializer =>
      _$ghumanFieldsFragmentDataFriendsAsDroidSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GhumanFieldsFragmentData_friends__asDroid.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentData_friends__asDroid? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GhumanFieldsFragmentData_friends__asDroid.serializer,
        json,
      );
}

abstract class GhumanFieldsFragmentData_friends__asHuman
    implements
        Built<GhumanFieldsFragmentData_friends__asHuman,
            GhumanFieldsFragmentData_friends__asHumanBuilder>,
        GhumanFieldsFragmentData_friends {
  GhumanFieldsFragmentData_friends__asHuman._();

  factory GhumanFieldsFragmentData_friends__asHuman(
      [void Function(GhumanFieldsFragmentData_friends__asHumanBuilder b)
          updates]) = _$GhumanFieldsFragmentData_friends__asHuman;

  static void _initializeBuilder(
          GhumanFieldsFragmentData_friends__asHumanBuilder b) =>
      b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  @override
  humanFieldsFragmentData_friends__asDroid? get asDroid => null;

  @override
  humanFieldsFragmentData_friends__asHuman? get asHuman => this;

  static Serializer<GhumanFieldsFragmentData_friends__asHuman> get serializer =>
      _$ghumanFieldsFragmentDataFriendsAsHumanSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GhumanFieldsFragmentData_friends__asHuman.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentData_friends__asHuman? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GhumanFieldsFragmentData_friends__asHuman.serializer,
        json,
      );
}

abstract class GdroidFieldsFragment {
  String get G__typename;
  String? get primaryFunction;
  Map<String, dynamic> toJson();
}

abstract class GdroidFieldsFragmentData
    implements
        Built<GdroidFieldsFragmentData, GdroidFieldsFragmentDataBuilder>,
        GdroidFieldsFragment {
  GdroidFieldsFragmentData._();

  factory GdroidFieldsFragmentData(
          [void Function(GdroidFieldsFragmentDataBuilder b) updates]) =
      _$GdroidFieldsFragmentData;

  static void _initializeBuilder(GdroidFieldsFragmentDataBuilder b) =>
      b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String? get primaryFunction;
  static Serializer<GdroidFieldsFragmentData> get serializer =>
      _$gdroidFieldsFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GdroidFieldsFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GdroidFieldsFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GdroidFieldsFragmentData.serializer,
        json,
      );
}
