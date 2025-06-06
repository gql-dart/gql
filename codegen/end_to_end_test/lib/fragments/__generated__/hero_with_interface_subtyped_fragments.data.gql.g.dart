// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_subtyped_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceSubTypedFragmentsData>
    _$gHeroWithInterfaceSubTypedFragmentsDataSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsDataSerializer();
Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__base>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroBaseSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__baseSerializer();
Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanSerializer();
Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsBaseSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseSerializer();
Serializer<
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsAsDroidSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidSerializer();
Serializer<
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsHumanFriendsAsHumanSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanSerializer();
Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroAsDroidSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidSerializer();
Serializer<GheroFieldsFragmentData__base>
    _$gheroFieldsFragmentDataBaseSerializer =
    new _$GheroFieldsFragmentData__baseSerializer();
Serializer<GheroFieldsFragmentData__asHuman>
    _$gheroFieldsFragmentDataAsHumanSerializer =
    new _$GheroFieldsFragmentData__asHumanSerializer();
Serializer<GheroFieldsFragmentData__asHuman_friends__base>
    _$gheroFieldsFragmentDataAsHumanFriendsBaseSerializer =
    new _$GheroFieldsFragmentData__asHuman_friends__baseSerializer();
Serializer<GheroFieldsFragmentData__asHuman_friends__asDroid>
    _$gheroFieldsFragmentDataAsHumanFriendsAsDroidSerializer =
    new _$GheroFieldsFragmentData__asHuman_friends__asDroidSerializer();
Serializer<GheroFieldsFragmentData__asHuman_friends__asHuman>
    _$gheroFieldsFragmentDataAsHumanFriendsAsHumanSerializer =
    new _$GheroFieldsFragmentData__asHuman_friends__asHumanSerializer();
Serializer<GheroFieldsFragmentData__asDroid>
    _$gheroFieldsFragmentDataAsDroidSerializer =
    new _$GheroFieldsFragmentData__asDroidSerializer();
Serializer<GhumanFieldsFragmentData> _$ghumanFieldsFragmentDataSerializer =
    new _$GhumanFieldsFragmentDataSerializer();
Serializer<GhumanFieldsFragmentData_friends__base>
    _$ghumanFieldsFragmentDataFriendsBaseSerializer =
    new _$GhumanFieldsFragmentData_friends__baseSerializer();
Serializer<GhumanFieldsFragmentData_friends__asDroid>
    _$ghumanFieldsFragmentDataFriendsAsDroidSerializer =
    new _$GhumanFieldsFragmentData_friends__asDroidSerializer();
Serializer<GhumanFieldsFragmentData_friends__asHuman>
    _$ghumanFieldsFragmentDataFriendsAsHumanSerializer =
    new _$GhumanFieldsFragmentData_friends__asHumanSerializer();
Serializer<GdroidFieldsFragmentData> _$gdroidFieldsFragmentDataSerializer =
    new _$GdroidFieldsFragmentDataSerializer();

class _$GHeroWithInterfaceSubTypedFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithInterfaceSubTypedFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData,
    _$GHeroWithInterfaceSubTypedFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceSubTypedFragmentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.hero;
    if (value != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GHeroWithInterfaceSubTypedFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceSubTypedFragmentsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'hero':
          result.hero = serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHeroWithInterfaceSubTypedFragmentsData_hero))
              as GHeroWithInterfaceSubTypedFragmentsData_hero?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__baseSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__base,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__base
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsData_hero__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GheroFieldsFragment__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GheroFieldsFragment__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__baseSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__base> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__base,
    _$GheroFieldsFragmentData__base
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroFieldsFragmentData__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asHumanSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__asHuman> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asHuman,
    _$GheroFieldsFragmentData__asHuman
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GheroFieldsFragmentData__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__asHumanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GheroFieldsFragmentData__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__baseSerializer
    implements
        StructuredSerializer<GheroFieldsFragmentData__asHuman_friends__base> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asHuman_friends__base,
    _$GheroFieldsFragmentData__asHuman_friends__base
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asHuman_friends__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GheroFieldsFragmentData__asHuman_friends__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__asHuman_friends__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__asDroidSerializer
    implements
        StructuredSerializer<
            GheroFieldsFragmentData__asHuman_friends__asDroid> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asHuman_friends__asDroid,
    _$GheroFieldsFragmentData__asHuman_friends__asDroid
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asHuman_friends__asDroid';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GheroFieldsFragmentData__asHuman_friends__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GheroFieldsFragmentData__asHuman_friends__asDroidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__asHumanSerializer
    implements
        StructuredSerializer<
            GheroFieldsFragmentData__asHuman_friends__asHuman> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asHuman_friends__asHuman,
    _$GheroFieldsFragmentData__asHuman_friends__asHuman
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asHuman_friends__asHuman';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GheroFieldsFragmentData__asHuman_friends__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GheroFieldsFragment__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GheroFieldsFragmentData__asHuman_friends__asHumanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GheroFieldsFragment__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asDroidSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__asDroid> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asDroid,
    _$GheroFieldsFragmentData__asDroid
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__asDroidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GhumanFieldsFragmentDataSerializer
    implements StructuredSerializer<GhumanFieldsFragmentData> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentData,
    _$GhumanFieldsFragmentData
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GhumanFieldsFragmentData_friends)
            ])));
    }
    return result;
  }

  @override
  GhumanFieldsFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GhumanFieldsFragmentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GhumanFieldsFragmentData_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GhumanFieldsFragmentData_friends__baseSerializer
    implements StructuredSerializer<GhumanFieldsFragmentData_friends__base> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentData_friends__base,
    _$GhumanFieldsFragmentData_friends__base
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentData_friends__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentData_friends__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GhumanFieldsFragmentData_friends__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GhumanFieldsFragmentData_friends__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GhumanFieldsFragmentData_friends__asDroidSerializer
    implements StructuredSerializer<GhumanFieldsFragmentData_friends__asDroid> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentData_friends__asDroid,
    _$GhumanFieldsFragmentData_friends__asDroid
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentData_friends__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentData_friends__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GhumanFieldsFragmentData_friends__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GhumanFieldsFragmentData_friends__asDroidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GhumanFieldsFragmentData_friends__asHumanSerializer
    implements StructuredSerializer<GhumanFieldsFragmentData_friends__asHuman> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentData_friends__asHuman,
    _$GhumanFieldsFragmentData_friends__asHuman
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentData_friends__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentData_friends__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GhumanFieldsFragmentData_friends__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GhumanFieldsFragmentData_friends__asHumanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GdroidFieldsFragmentDataSerializer
    implements StructuredSerializer<GdroidFieldsFragmentData> {
  @override
  final Iterable<Type> types = const [
    GdroidFieldsFragmentData,
    _$GdroidFieldsFragmentData
  ];
  @override
  final String wireName = 'GdroidFieldsFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GdroidFieldsFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GdroidFieldsFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GdroidFieldsFragmentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData
    extends GHeroWithInterfaceSubTypedFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithInterfaceSubTypedFragmentsData_hero? hero;

  factory _$GHeroWithInterfaceSubTypedFragmentsData(
          [void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsDataBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData._(
      {required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithInterfaceSubTypedFragmentsData', 'G__typename');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData rebuild(
          void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsDataBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsDataBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData,
            GHeroWithInterfaceSubTypedFragmentsDataBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInterfaceSubTypedFragmentsData_hero? _hero;
  GHeroWithInterfaceSubTypedFragmentsData_hero? get hero => _$this._hero;
  set hero(GHeroWithInterfaceSubTypedFragmentsData_hero? hero) =>
      _$this._hero = hero;

  GHeroWithInterfaceSubTypedFragmentsDataBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData', 'G__typename'),
            hero: hero);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__base
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__base {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__base(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__base._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__base', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceSubTypedFragmentsData_hero__base', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceSubTypedFragmentsData_hero__base', 'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__base rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData_hero__base &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__base')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData_hero__base,
            GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__base._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData_hero__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData_hero__base;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsData_hero__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__base build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__base _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData_hero__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__base',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__base', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__base', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final BuiltList<
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>? friends;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman', 'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  ListBuilder<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>?
      _friends;
  ListBuilder<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>
      get friends => _$this._friends ??= new ListBuilder<
          GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>();
  set friends(
          ListBuilder<
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends?>?
              friends) =>
      _$this._friends = friends;

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman._initializeBuilder(
        this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman _build() {
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman',
                  'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman',
                  'name'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base {
  @override
  final String G__typename;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base',
        'G__typename');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder
      toBuilder() =>
          new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder
    implements
        Builder<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base build() =>
      _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
      _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid',
        'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder
      toBuilder() =>
          new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder
    implements
        Builder<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
      build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid
      _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid',
                'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final BuiltList<GheroFieldsFragment__asHuman_friends?>? friends;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
        'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder
      toBuilder() =>
          new GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder
    implements
        Builder<
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  ListBuilder<GheroFieldsFragment__asHuman_friends?>? _friends;
  ListBuilder<GheroFieldsFragment__asHuman_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GheroFieldsFragment__asHuman_friends?>();
  set friends(ListBuilder<GheroFieldsFragment__asHuman_friends?>? friends) =>
      _$this._friends = friends;

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
      build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
      _build() {
    _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman
        _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
                  'name'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid
    extends GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid(
          [void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid', 'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid rebuild(
          void Function(
                  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
            GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid._initializeBuilder(
        this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceSubTypedFragmentsData_hero__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid',
                'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__base extends GheroFieldsFragmentData__base {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GheroFieldsFragmentData__base(
          [void Function(GheroFieldsFragmentData__baseBuilder)? updates]) =>
      (new GheroFieldsFragmentData__baseBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__base._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__base', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__base', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__base', 'name');
  }

  @override
  GheroFieldsFragmentData__base rebuild(
          void Function(GheroFieldsFragmentData__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__baseBuilder toBuilder() =>
      new GheroFieldsFragmentData__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__base &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__base')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GheroFieldsFragmentData__baseBuilder
    implements
        Builder<GheroFieldsFragmentData__base,
            GheroFieldsFragmentData__baseBuilder> {
  _$GheroFieldsFragmentData__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GheroFieldsFragmentData__baseBuilder() {
    GheroFieldsFragmentData__base._initializeBuilder(this);
  }

  GheroFieldsFragmentData__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__base;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__base build() => _build();

  _$GheroFieldsFragmentData__base _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroFieldsFragmentData__base', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__base', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroFieldsFragmentData__base', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asHuman
    extends GheroFieldsFragmentData__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final BuiltList<GheroFieldsFragmentData__asHuman_friends?>? friends;

  factory _$GheroFieldsFragmentData__asHuman(
          [void Function(GheroFieldsFragmentData__asHumanBuilder)? updates]) =>
      (new GheroFieldsFragmentData__asHumanBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asHuman', 'name');
  }

  @override
  GheroFieldsFragmentData__asHuman rebuild(
          void Function(GheroFieldsFragmentData__asHumanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asHumanBuilder toBuilder() =>
      new GheroFieldsFragmentData__asHumanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GheroFieldsFragmentData__asHumanBuilder
    implements
        Builder<GheroFieldsFragmentData__asHuman,
            GheroFieldsFragmentData__asHumanBuilder> {
  _$GheroFieldsFragmentData__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  ListBuilder<GheroFieldsFragmentData__asHuman_friends?>? _friends;
  ListBuilder<GheroFieldsFragmentData__asHuman_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GheroFieldsFragmentData__asHuman_friends?>();
  set friends(
          ListBuilder<GheroFieldsFragmentData__asHuman_friends?>? friends) =>
      _$this._friends = friends;

  GheroFieldsFragmentData__asHumanBuilder() {
    GheroFieldsFragmentData__asHuman._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asHuman;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__asHumanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asHuman build() => _build();

  _$GheroFieldsFragmentData__asHuman _build() {
    _$GheroFieldsFragmentData__asHuman _$result;
    try {
      _$result = _$v ??
          new _$GheroFieldsFragmentData__asHuman._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GheroFieldsFragmentData__asHuman', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GheroFieldsFragmentData__asHuman', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GheroFieldsFragmentData__asHuman', 'name'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GheroFieldsFragmentData__asHuman', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__base
    extends GheroFieldsFragmentData__asHuman_friends__base {
  @override
  final String G__typename;

  factory _$GheroFieldsFragmentData__asHuman_friends__base(
          [void Function(GheroFieldsFragmentData__asHuman_friends__baseBuilder)?
              updates]) =>
      (new GheroFieldsFragmentData__asHuman_friends__baseBuilder()
            ..update(updates))
          ._build();

  _$GheroFieldsFragmentData__asHuman_friends__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GheroFieldsFragmentData__asHuman_friends__base', 'G__typename');
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__base rebuild(
          void Function(GheroFieldsFragmentData__asHuman_friends__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asHuman_friends__baseBuilder toBuilder() =>
      new GheroFieldsFragmentData__asHuman_friends__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asHuman_friends__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GheroFieldsFragmentData__asHuman_friends__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GheroFieldsFragmentData__asHuman_friends__baseBuilder
    implements
        Builder<GheroFieldsFragmentData__asHuman_friends__base,
            GheroFieldsFragmentData__asHuman_friends__baseBuilder> {
  _$GheroFieldsFragmentData__asHuman_friends__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GheroFieldsFragmentData__asHuman_friends__baseBuilder() {
    GheroFieldsFragmentData__asHuman_friends__base._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asHuman_friends__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asHuman_friends__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asHuman_friends__base;
  }

  @override
  void update(
      void Function(GheroFieldsFragmentData__asHuman_friends__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__base build() => _build();

  _$GheroFieldsFragmentData__asHuman_friends__base _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__asHuman_friends__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GheroFieldsFragmentData__asHuman_friends__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__asDroid
    extends GheroFieldsFragmentData__asHuman_friends__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GheroFieldsFragmentData__asHuman_friends__asDroid(
          [void Function(
                  GheroFieldsFragmentData__asHuman_friends__asDroidBuilder)?
              updates]) =>
      (new GheroFieldsFragmentData__asHuman_friends__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GheroFieldsFragmentData__asHuman_friends__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GheroFieldsFragmentData__asHuman_friends__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asHuman_friends__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asHuman_friends__asDroid', 'name');
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asDroid rebuild(
          void Function(
                  GheroFieldsFragmentData__asHuman_friends__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asHuman_friends__asDroidBuilder toBuilder() =>
      new GheroFieldsFragmentData__asHuman_friends__asDroidBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asHuman_friends__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GheroFieldsFragmentData__asHuman_friends__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GheroFieldsFragmentData__asHuman_friends__asDroidBuilder
    implements
        Builder<GheroFieldsFragmentData__asHuman_friends__asDroid,
            GheroFieldsFragmentData__asHuman_friends__asDroidBuilder> {
  _$GheroFieldsFragmentData__asHuman_friends__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GheroFieldsFragmentData__asHuman_friends__asDroidBuilder() {
    GheroFieldsFragmentData__asHuman_friends__asDroid._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asHuman_friends__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asHuman_friends__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asHuman_friends__asDroid;
  }

  @override
  void update(
      void Function(GheroFieldsFragmentData__asHuman_friends__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asDroid build() => _build();

  _$GheroFieldsFragmentData__asHuman_friends__asDroid _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__asHuman_friends__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GheroFieldsFragmentData__asHuman_friends__asDroid',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__asHuman_friends__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GheroFieldsFragmentData__asHuman_friends__asDroid', 'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asHuman_friends__asHuman
    extends GheroFieldsFragmentData__asHuman_friends__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final BuiltList<GheroFieldsFragment__asHuman_friends?>? friends;

  factory _$GheroFieldsFragmentData__asHuman_friends__asHuman(
          [void Function(
                  GheroFieldsFragmentData__asHuman_friends__asHumanBuilder)?
              updates]) =>
      (new GheroFieldsFragmentData__asHuman_friends__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GheroFieldsFragmentData__asHuman_friends__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GheroFieldsFragmentData__asHuman_friends__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asHuman_friends__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asHuman_friends__asHuman', 'name');
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asHuman rebuild(
          void Function(
                  GheroFieldsFragmentData__asHuman_friends__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asHuman_friends__asHumanBuilder toBuilder() =>
      new GheroFieldsFragmentData__asHuman_friends__asHumanBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asHuman_friends__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GheroFieldsFragmentData__asHuman_friends__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GheroFieldsFragmentData__asHuman_friends__asHumanBuilder
    implements
        Builder<GheroFieldsFragmentData__asHuman_friends__asHuman,
            GheroFieldsFragmentData__asHuman_friends__asHumanBuilder> {
  _$GheroFieldsFragmentData__asHuman_friends__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  ListBuilder<GheroFieldsFragment__asHuman_friends?>? _friends;
  ListBuilder<GheroFieldsFragment__asHuman_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GheroFieldsFragment__asHuman_friends?>();
  set friends(ListBuilder<GheroFieldsFragment__asHuman_friends?>? friends) =>
      _$this._friends = friends;

  GheroFieldsFragmentData__asHuman_friends__asHumanBuilder() {
    GheroFieldsFragmentData__asHuman_friends__asHuman._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asHuman_friends__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asHuman_friends__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asHuman_friends__asHuman;
  }

  @override
  void update(
      void Function(GheroFieldsFragmentData__asHuman_friends__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asHuman_friends__asHuman build() => _build();

  _$GheroFieldsFragmentData__asHuman_friends__asHuman _build() {
    _$GheroFieldsFragmentData__asHuman_friends__asHuman _$result;
    try {
      _$result = _$v ??
          new _$GheroFieldsFragmentData__asHuman_friends__asHuman._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GheroFieldsFragmentData__asHuman_friends__asHuman',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GheroFieldsFragmentData__asHuman_friends__asHuman', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GheroFieldsFragmentData__asHuman_friends__asHuman', 'name'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GheroFieldsFragmentData__asHuman_friends__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asDroid
    extends GheroFieldsFragmentData__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GheroFieldsFragmentData__asDroid(
          [void Function(GheroFieldsFragmentData__asDroidBuilder)? updates]) =>
      (new GheroFieldsFragmentData__asDroidBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asDroid', 'name');
  }

  @override
  GheroFieldsFragmentData__asDroid rebuild(
          void Function(GheroFieldsFragmentData__asDroidBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asDroidBuilder toBuilder() =>
      new GheroFieldsFragmentData__asDroidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GheroFieldsFragmentData__asDroidBuilder
    implements
        Builder<GheroFieldsFragmentData__asDroid,
            GheroFieldsFragmentData__asDroidBuilder> {
  _$GheroFieldsFragmentData__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GheroFieldsFragmentData__asDroidBuilder() {
    GheroFieldsFragmentData__asDroid._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asDroid;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__asDroidBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asDroid build() => _build();

  _$GheroFieldsFragmentData__asDroid _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GheroFieldsFragmentData__asDroid', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroFieldsFragmentData__asDroid', 'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentData extends GhumanFieldsFragmentData {
  @override
  final String G__typename;
  @override
  final String? homePlanet;
  @override
  final BuiltList<GhumanFieldsFragmentData_friends?>? friends;

  factory _$GhumanFieldsFragmentData(
          [void Function(GhumanFieldsFragmentDataBuilder)? updates]) =>
      (new GhumanFieldsFragmentDataBuilder()..update(updates))._build();

  _$GhumanFieldsFragmentData._(
      {required this.G__typename, this.homePlanet, this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GhumanFieldsFragmentData', 'G__typename');
  }

  @override
  GhumanFieldsFragmentData rebuild(
          void Function(GhumanFieldsFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentDataBuilder toBuilder() =>
      new GhumanFieldsFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentData &&
        G__typename == other.G__typename &&
        homePlanet == other.homePlanet &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GhumanFieldsFragmentData')
          ..add('G__typename', G__typename)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GhumanFieldsFragmentDataBuilder
    implements
        Builder<GhumanFieldsFragmentData, GhumanFieldsFragmentDataBuilder> {
  _$GhumanFieldsFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  ListBuilder<GhumanFieldsFragmentData_friends?>? _friends;
  ListBuilder<GhumanFieldsFragmentData_friends?> get friends =>
      _$this._friends ??= new ListBuilder<GhumanFieldsFragmentData_friends?>();
  set friends(ListBuilder<GhumanFieldsFragmentData_friends?>? friends) =>
      _$this._friends = friends;

  GhumanFieldsFragmentDataBuilder() {
    GhumanFieldsFragmentData._initializeBuilder(this);
  }

  GhumanFieldsFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _homePlanet = $v.homePlanet;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GhumanFieldsFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentData;
  }

  @override
  void update(void Function(GhumanFieldsFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentData build() => _build();

  _$GhumanFieldsFragmentData _build() {
    _$GhumanFieldsFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GhumanFieldsFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GhumanFieldsFragmentData', 'G__typename'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GhumanFieldsFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentData_friends__base
    extends GhumanFieldsFragmentData_friends__base {
  @override
  final String G__typename;

  factory _$GhumanFieldsFragmentData_friends__base(
          [void Function(GhumanFieldsFragmentData_friends__baseBuilder)?
              updates]) =>
      (new GhumanFieldsFragmentData_friends__baseBuilder()..update(updates))
          ._build();

  _$GhumanFieldsFragmentData_friends__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GhumanFieldsFragmentData_friends__base', 'G__typename');
  }

  @override
  GhumanFieldsFragmentData_friends__base rebuild(
          void Function(GhumanFieldsFragmentData_friends__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentData_friends__baseBuilder toBuilder() =>
      new GhumanFieldsFragmentData_friends__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentData_friends__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GhumanFieldsFragmentData_friends__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GhumanFieldsFragmentData_friends__baseBuilder
    implements
        Builder<GhumanFieldsFragmentData_friends__base,
            GhumanFieldsFragmentData_friends__baseBuilder> {
  _$GhumanFieldsFragmentData_friends__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GhumanFieldsFragmentData_friends__baseBuilder() {
    GhumanFieldsFragmentData_friends__base._initializeBuilder(this);
  }

  GhumanFieldsFragmentData_friends__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GhumanFieldsFragmentData_friends__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentData_friends__base;
  }

  @override
  void update(
      void Function(GhumanFieldsFragmentData_friends__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentData_friends__base build() => _build();

  _$GhumanFieldsFragmentData_friends__base _build() {
    final _$result = _$v ??
        new _$GhumanFieldsFragmentData_friends__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GhumanFieldsFragmentData_friends__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentData_friends__asDroid
    extends GhumanFieldsFragmentData_friends__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GhumanFieldsFragmentData_friends__asDroid(
          [void Function(GhumanFieldsFragmentData_friends__asDroidBuilder)?
              updates]) =>
      (new GhumanFieldsFragmentData_friends__asDroidBuilder()..update(updates))
          ._build();

  _$GhumanFieldsFragmentData_friends__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GhumanFieldsFragmentData_friends__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GhumanFieldsFragmentData_friends__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GhumanFieldsFragmentData_friends__asDroid', 'name');
  }

  @override
  GhumanFieldsFragmentData_friends__asDroid rebuild(
          void Function(GhumanFieldsFragmentData_friends__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentData_friends__asDroidBuilder toBuilder() =>
      new GhumanFieldsFragmentData_friends__asDroidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentData_friends__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GhumanFieldsFragmentData_friends__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GhumanFieldsFragmentData_friends__asDroidBuilder
    implements
        Builder<GhumanFieldsFragmentData_friends__asDroid,
            GhumanFieldsFragmentData_friends__asDroidBuilder> {
  _$GhumanFieldsFragmentData_friends__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GhumanFieldsFragmentData_friends__asDroidBuilder() {
    GhumanFieldsFragmentData_friends__asDroid._initializeBuilder(this);
  }

  GhumanFieldsFragmentData_friends__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GhumanFieldsFragmentData_friends__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentData_friends__asDroid;
  }

  @override
  void update(
      void Function(GhumanFieldsFragmentData_friends__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentData_friends__asDroid build() => _build();

  _$GhumanFieldsFragmentData_friends__asDroid _build() {
    final _$result = _$v ??
        new _$GhumanFieldsFragmentData_friends__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GhumanFieldsFragmentData_friends__asDroid', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GhumanFieldsFragmentData_friends__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GhumanFieldsFragmentData_friends__asDroid', 'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentData_friends__asHuman
    extends GhumanFieldsFragmentData_friends__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;

  factory _$GhumanFieldsFragmentData_friends__asHuman(
          [void Function(GhumanFieldsFragmentData_friends__asHumanBuilder)?
              updates]) =>
      (new GhumanFieldsFragmentData_friends__asHumanBuilder()..update(updates))
          ._build();

  _$GhumanFieldsFragmentData_friends__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GhumanFieldsFragmentData_friends__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GhumanFieldsFragmentData_friends__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GhumanFieldsFragmentData_friends__asHuman', 'name');
  }

  @override
  GhumanFieldsFragmentData_friends__asHuman rebuild(
          void Function(GhumanFieldsFragmentData_friends__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentData_friends__asHumanBuilder toBuilder() =>
      new GhumanFieldsFragmentData_friends__asHumanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentData_friends__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homePlanet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GhumanFieldsFragmentData_friends__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet))
        .toString();
  }
}

class GhumanFieldsFragmentData_friends__asHumanBuilder
    implements
        Builder<GhumanFieldsFragmentData_friends__asHuman,
            GhumanFieldsFragmentData_friends__asHumanBuilder> {
  _$GhumanFieldsFragmentData_friends__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  GhumanFieldsFragmentData_friends__asHumanBuilder() {
    GhumanFieldsFragmentData_friends__asHuman._initializeBuilder(this);
  }

  GhumanFieldsFragmentData_friends__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GhumanFieldsFragmentData_friends__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentData_friends__asHuman;
  }

  @override
  void update(
      void Function(GhumanFieldsFragmentData_friends__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentData_friends__asHuman build() => _build();

  _$GhumanFieldsFragmentData_friends__asHuman _build() {
    final _$result = _$v ??
        new _$GhumanFieldsFragmentData_friends__asHuman._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GhumanFieldsFragmentData_friends__asHuman', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GhumanFieldsFragmentData_friends__asHuman', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GhumanFieldsFragmentData_friends__asHuman', 'name'),
            homePlanet: homePlanet);
    replace(_$result);
    return _$result;
  }
}

class _$GdroidFieldsFragmentData extends GdroidFieldsFragmentData {
  @override
  final String G__typename;
  @override
  final String? primaryFunction;

  factory _$GdroidFieldsFragmentData(
          [void Function(GdroidFieldsFragmentDataBuilder)? updates]) =>
      (new GdroidFieldsFragmentDataBuilder()..update(updates))._build();

  _$GdroidFieldsFragmentData._(
      {required this.G__typename, this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GdroidFieldsFragmentData', 'G__typename');
  }

  @override
  GdroidFieldsFragmentData rebuild(
          void Function(GdroidFieldsFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GdroidFieldsFragmentDataBuilder toBuilder() =>
      new GdroidFieldsFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GdroidFieldsFragmentData &&
        G__typename == other.G__typename &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, primaryFunction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GdroidFieldsFragmentData')
          ..add('G__typename', G__typename)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GdroidFieldsFragmentDataBuilder
    implements
        Builder<GdroidFieldsFragmentData, GdroidFieldsFragmentDataBuilder> {
  _$GdroidFieldsFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GdroidFieldsFragmentDataBuilder() {
    GdroidFieldsFragmentData._initializeBuilder(this);
  }

  GdroidFieldsFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GdroidFieldsFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GdroidFieldsFragmentData;
  }

  @override
  void update(void Function(GdroidFieldsFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GdroidFieldsFragmentData build() => _build();

  _$GdroidFieldsFragmentData _build() {
    final _$result = _$v ??
        new _$GdroidFieldsFragmentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GdroidFieldsFragmentData', 'G__typename'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
