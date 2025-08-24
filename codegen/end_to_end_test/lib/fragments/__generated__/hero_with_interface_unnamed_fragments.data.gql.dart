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

part 'hero_with_interface_unnamed_fragments.data.gql.g.dart';

abstract class GHeroWithInterfaceUnnamedFragmentsData
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData,
          GHeroWithInterfaceUnnamedFragmentsDataBuilder
        > {
  GHeroWithInterfaceUnnamedFragmentsData._();

  factory GHeroWithInterfaceUnnamedFragmentsData([
    void Function(GHeroWithInterfaceUnnamedFragmentsDataBuilder b) updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsDataBuilder b,
  ) => b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHeroWithInterfaceUnnamedFragmentsData_hero? get hero;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsData> get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData.serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero>
  get serializer =>
      _i2.InlineFragmentSerializer<GHeroWithInterfaceUnnamedFragmentsData_hero>(
        'GHeroWithInterfaceUnnamedFragmentsData_hero',
        GHeroWithInterfaceUnnamedFragmentsData_hero__base,
        {
          'Human': GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman,
          'Droid': GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid,
        },
      );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero.serializer,
    json,
  );
}

extension GHeroWithInterfaceUnnamedFragmentsData_heroWhenExtension
    on GHeroWithInterfaceUnnamedFragmentsData_hero {
  _T when<_T>({
    required _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman)
    human,
    required _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid)
    droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(
          (this as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman),
        );
      case 'Droid':
        return droid(
          (this as GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid),
        );
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman)? human,
    _T Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human(
              (this as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman),
            )
            : orElse();
      case 'Droid':
        return droid != null
            ? droid(
              (this as GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid),
            )
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__base
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__base,
          GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__base._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__base([
    void Function(GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder b)
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__base;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__base>
  get serializer => _$gHeroWithInterfaceUnnamedFragmentsDataHeroBaseSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__base.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__base? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__base.serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman,
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman([
    void Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder b)
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder b,
  ) => b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  String? get homePlanet;
  BuiltList<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
  get friends;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman>
  get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman.serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends
  >
  get serializer => _i2.InlineFragmentSerializer<
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends
  >(
    'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends',
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base,
    {
      'Human':
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
      'Droid':
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
    },
  );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends.serializer,
    json,
  );
}

extension GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friendsWhenExtension
    on GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  _T when<_T>({
    required _T Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
    )
    human,
    required _T Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
    )
    droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human(
          (this
              as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman),
        );
      case 'Droid':
        return droid(
          (this
              as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid),
        );
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
    )?
    human,
    _T Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
    )?
    droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human(
              (this
                  as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman),
            )
            : orElse();
      case 'Droid':
        return droid != null
            ? droid(
              (this
                  as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid),
            )
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base,
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base([
    void Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder
      b,
    )
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
  >
  get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsBaseSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
        .serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman([
    void Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
      b,
    )
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
    b,
  ) => b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get homePlanet;
  static Serializer<
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
  >
  get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsAsHumanSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
        .serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid([
    void Function(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
      b,
    )
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
    b,
  ) => b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String? get primaryFunction;
  static Serializer<
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
  >
  get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsAsDroidSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
        .serializer,
    json,
  );
}

abstract class GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid,
          GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder
        >,
        GHeroWithInterfaceUnnamedFragmentsData_hero {
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid._();

  factory GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid([
    void Function(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder b)
    updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid;

  static void _initializeBuilder(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder b,
  ) => b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  String? get primaryFunction;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid>
  get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsDroidSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid.serializer,
    json,
  );
}
