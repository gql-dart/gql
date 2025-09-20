// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_duplicate_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSearchResultsQueryData> _$gSearchResultsQueryDataSerializer =
    _$GSearchResultsQueryDataSerializer();
Serializer<GSearchResultsQueryData_search__base>
    _$gSearchResultsQueryDataSearchBaseSerializer =
    _$GSearchResultsQueryData_search__baseSerializer();
Serializer<GSearchResultsQueryData_search__asHuman>
    _$gSearchResultsQueryDataSearchAsHumanSerializer =
    _$GSearchResultsQueryData_search__asHumanSerializer();
Serializer<GSearchResultsQueryData_search__asHuman_friends>
    _$gSearchResultsQueryDataSearchAsHumanFriendsSerializer =
    _$GSearchResultsQueryData_search__asHuman_friendsSerializer();
Serializer<GSearchResultsQueryData_search__asHuman_friends_friendsConnection>
    _$gSearchResultsQueryDataSearchAsHumanFriendsFriendsConnectionSerializer =
    _$GSearchResultsQueryData_search__asHuman_friends_friendsConnectionSerializer();
Serializer<
        GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends>
    _$gSearchResultsQueryDataSearchAsHumanFriendsFriendsConnectionFriendsSerializer =
    _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsSerializer();
Serializer<GSearchResultsQueryData_search__asDroid>
    _$gSearchResultsQueryDataSearchAsDroidSerializer =
    _$GSearchResultsQueryData_search__asDroidSerializer();
Serializer<GSearchResultsQueryData_search__asDroid_friends>
    _$gSearchResultsQueryDataSearchAsDroidFriendsSerializer =
    _$GSearchResultsQueryData_search__asDroid_friendsSerializer();
Serializer<GSearchResultsQueryData_search__asDroid_friends_friendsConnection>
    _$gSearchResultsQueryDataSearchAsDroidFriendsFriendsConnectionSerializer =
    _$GSearchResultsQueryData_search__asDroid_friends_friendsConnectionSerializer();
Serializer<
        GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends>
    _$gSearchResultsQueryDataSearchAsDroidFriendsFriendsConnectionFriendsSerializer =
    _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsSerializer();
Serializer<GCharacterDetailsData> _$gCharacterDetailsDataSerializer =
    _$GCharacterDetailsDataSerializer();
Serializer<GCharacterDetailsData_friends>
    _$gCharacterDetailsDataFriendsSerializer =
    _$GCharacterDetailsData_friendsSerializer();
Serializer<GCharacterDetailsData_friends_friendsConnection>
    _$gCharacterDetailsDataFriendsFriendsConnectionSerializer =
    _$GCharacterDetailsData_friends_friendsConnectionSerializer();
Serializer<GCharacterDetailsData_friends_friendsConnection_friends>
    _$gCharacterDetailsDataFriendsFriendsConnectionFriendsSerializer =
    _$GCharacterDetailsData_friends_friendsConnection_friendsSerializer();
Serializer<GFriendInfoData> _$gFriendInfoDataSerializer =
    _$GFriendInfoDataSerializer();
Serializer<GFriendInfoData_friendsConnection>
    _$gFriendInfoDataFriendsConnectionSerializer =
    _$GFriendInfoData_friendsConnectionSerializer();
Serializer<GFriendInfoData_friendsConnection_friends>
    _$gFriendInfoDataFriendsConnectionFriendsSerializer =
    _$GFriendInfoData_friendsConnection_friendsSerializer();
Serializer<GCharacterBasicData> _$gCharacterBasicDataSerializer =
    _$GCharacterBasicDataSerializer();

class _$GSearchResultsQueryDataSerializer
    implements StructuredSerializer<GSearchResultsQueryData> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData,
    _$GSearchResultsQueryData
  ];
  @override
  final String wireName = 'GSearchResultsQueryData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchResultsQueryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GSearchResultsQueryData_search)
            ])));
    }
    return result;
  }

  @override
  GSearchResultsQueryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryDataBuilder();

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
        case 'search':
          result.search.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GSearchResultsQueryData_search)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__baseSerializer
    implements StructuredSerializer<GSearchResultsQueryData_search__base> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__base,
    _$GSearchResultsQueryData_search__base
  ];
  @override
  final String wireName = 'GSearchResultsQueryData_search__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchResultsQueryData_search__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSearchResultsQueryData_search__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryData_search__baseBuilder();

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

class _$GSearchResultsQueryData_search__asHumanSerializer
    implements StructuredSerializer<GSearchResultsQueryData_search__asHuman> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asHuman,
    _$GSearchResultsQueryData_search__asHuman
  ];
  @override
  final String wireName = 'GSearchResultsQueryData_search__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchResultsQueryData_search__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'appearsIn',
      serializers.serialize(object.appearsIn,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(_i3.GEpisode)])),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GSearchResultsQueryData_search__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GSearchResultsQueryData_search__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryData_search__asHumanBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GSearchResultsQueryData_search__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
        case 'appearsIn':
          result.appearsIn.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(_i3.GEpisode)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asHuman_friendsSerializer
    implements
        StructuredSerializer<GSearchResultsQueryData_search__asHuman_friends> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asHuman_friends,
    _$GSearchResultsQueryData_search__asHuman_friends
  ];
  @override
  final String wireName = 'GSearchResultsQueryData_search__asHuman_friends';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GSearchResultsQueryData_search__asHuman_friends object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType: const FullType(
              GSearchResultsQueryData_search__asHuman_friends_friendsConnection)),
    ];

    return result;
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryData_search__asHuman_friendsBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GSearchResultsQueryData_search__asHuman_friends_friendsConnection))!
              as GSearchResultsQueryData_search__asHuman_friends_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asHuman_friends_friendsConnectionSerializer
    implements
        StructuredSerializer<
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection,
    _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection
  ];
  @override
  final String wireName =
      'GSearchResultsQueryData_search__asHuman_friends_friendsConnection';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GSearchResultsQueryData_search__asHuman_friends_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsSerializer
    implements
        StructuredSerializer<
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends,
    _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
  ];
  @override
  final String wireName =
      'GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
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

    return result;
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder();

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

class _$GSearchResultsQueryData_search__asDroidSerializer
    implements StructuredSerializer<GSearchResultsQueryData_search__asDroid> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asDroid,
    _$GSearchResultsQueryData_search__asDroid
  ];
  @override
  final String wireName = 'GSearchResultsQueryData_search__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchResultsQueryData_search__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'appearsIn',
      serializers.serialize(object.appearsIn,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(_i3.GEpisode)])),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GSearchResultsQueryData_search__asDroid_friends)
            ])));
    }
    return result;
  }

  @override
  GSearchResultsQueryData_search__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryData_search__asDroidBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GSearchResultsQueryData_search__asDroid_friends)
              ]))! as BuiltList<Object?>);
          break;
        case 'appearsIn':
          result.appearsIn.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(_i3.GEpisode)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asDroid_friendsSerializer
    implements
        StructuredSerializer<GSearchResultsQueryData_search__asDroid_friends> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asDroid_friends,
    _$GSearchResultsQueryData_search__asDroid_friends
  ];
  @override
  final String wireName = 'GSearchResultsQueryData_search__asDroid_friends';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GSearchResultsQueryData_search__asDroid_friends object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType: const FullType(
              GSearchResultsQueryData_search__asDroid_friends_friendsConnection)),
    ];

    return result;
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryData_search__asDroid_friendsBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GSearchResultsQueryData_search__asDroid_friends_friendsConnection))!
              as GSearchResultsQueryData_search__asDroid_friends_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asDroid_friends_friendsConnectionSerializer
    implements
        StructuredSerializer<
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection,
    _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection
  ];
  @override
  final String wireName =
      'GSearchResultsQueryData_search__asDroid_friends_friendsConnection';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GSearchResultsQueryData_search__asDroid_friends_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsSerializer
    implements
        StructuredSerializer<
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends,
    _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
  ];
  @override
  final String wireName =
      'GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
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

    return result;
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder();

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

class _$GCharacterDetailsDataSerializer
    implements StructuredSerializer<GCharacterDetailsData> {
  @override
  final Iterable<Type> types = const [
    GCharacterDetailsData,
    _$GCharacterDetailsData
  ];
  @override
  final String wireName = 'GCharacterDetailsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCharacterDetailsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'appearsIn',
      serializers.serialize(object.appearsIn,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(_i3.GEpisode)])),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GCharacterDetailsData_friends)
            ])));
    }
    return result;
  }

  @override
  GCharacterDetailsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GCharacterDetailsDataBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GCharacterDetailsData_friends)
              ]))! as BuiltList<Object?>);
          break;
        case 'appearsIn':
          result.appearsIn.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(_i3.GEpisode)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GCharacterDetailsData_friendsSerializer
    implements StructuredSerializer<GCharacterDetailsData_friends> {
  @override
  final Iterable<Type> types = const [
    GCharacterDetailsData_friends,
    _$GCharacterDetailsData_friends
  ];
  @override
  final String wireName = 'GCharacterDetailsData_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCharacterDetailsData_friends object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType:
              const FullType(GCharacterDetailsData_friends_friendsConnection)),
    ];

    return result;
  }

  @override
  GCharacterDetailsData_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GCharacterDetailsData_friendsBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCharacterDetailsData_friends_friendsConnection))!
              as GCharacterDetailsData_friends_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GCharacterDetailsData_friends_friendsConnectionSerializer
    implements
        StructuredSerializer<GCharacterDetailsData_friends_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GCharacterDetailsData_friends_friendsConnection,
    _$GCharacterDetailsData_friends_friendsConnection
  ];
  @override
  final String wireName = 'GCharacterDetailsData_friends_friendsConnection';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCharacterDetailsData_friends_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GCharacterDetailsData_friends_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GCharacterDetailsData_friends_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GCharacterDetailsData_friends_friendsConnectionBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GCharacterDetailsData_friends_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GCharacterDetailsData_friends_friendsConnection_friendsSerializer
    implements
        StructuredSerializer<
            GCharacterDetailsData_friends_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GCharacterDetailsData_friends_friendsConnection_friends,
    _$GCharacterDetailsData_friends_friendsConnection_friends
  ];
  @override
  final String wireName =
      'GCharacterDetailsData_friends_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCharacterDetailsData_friends_friendsConnection_friends object,
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
  GCharacterDetailsData_friends_friendsConnection_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GCharacterDetailsData_friends_friendsConnection_friendsBuilder();

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

class _$GFriendInfoDataSerializer
    implements StructuredSerializer<GFriendInfoData> {
  @override
  final Iterable<Type> types = const [GFriendInfoData, _$GFriendInfoData];
  @override
  final String wireName = 'GFriendInfoData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFriendInfoData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType: const FullType(GFriendInfoData_friendsConnection)),
    ];

    return result;
  }

  @override
  GFriendInfoData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GFriendInfoDataBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFriendInfoData_friendsConnection))!
              as GFriendInfoData_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GFriendInfoData_friendsConnectionSerializer
    implements StructuredSerializer<GFriendInfoData_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GFriendInfoData_friendsConnection,
    _$GFriendInfoData_friendsConnection
  ];
  @override
  final String wireName = 'GFriendInfoData_friendsConnection';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFriendInfoData_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GFriendInfoData_friendsConnection_friends)
            ])));
    }
    return result;
  }

  @override
  GFriendInfoData_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GFriendInfoData_friendsConnectionBuilder();

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
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GFriendInfoData_friendsConnection_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFriendInfoData_friendsConnection_friendsSerializer
    implements StructuredSerializer<GFriendInfoData_friendsConnection_friends> {
  @override
  final Iterable<Type> types = const [
    GFriendInfoData_friendsConnection_friends,
    _$GFriendInfoData_friendsConnection_friends
  ];
  @override
  final String wireName = 'GFriendInfoData_friendsConnection_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFriendInfoData_friendsConnection_friends object,
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
  GFriendInfoData_friendsConnection_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GFriendInfoData_friendsConnection_friendsBuilder();

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

class _$GCharacterBasicDataSerializer
    implements StructuredSerializer<GCharacterBasicData> {
  @override
  final Iterable<Type> types = const [
    GCharacterBasicData,
    _$GCharacterBasicData
  ];
  @override
  final String wireName = 'GCharacterBasicData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCharacterBasicData object,
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
  GCharacterBasicData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GCharacterBasicDataBuilder();

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

class _$GSearchResultsQueryData extends GSearchResultsQueryData {
  @override
  final String G__typename;
  @override
  final BuiltList<GSearchResultsQueryData_search?>? search;

  factory _$GSearchResultsQueryData(
          [void Function(GSearchResultsQueryDataBuilder)? updates]) =>
      (GSearchResultsQueryDataBuilder()..update(updates))._build();

  _$GSearchResultsQueryData._({required this.G__typename, this.search})
      : super._();
  @override
  GSearchResultsQueryData rebuild(
          void Function(GSearchResultsQueryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryDataBuilder toBuilder() =>
      GSearchResultsQueryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData &&
        G__typename == other.G__typename &&
        search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSearchResultsQueryData')
          ..add('G__typename', G__typename)
          ..add('search', search))
        .toString();
  }
}

class GSearchResultsQueryDataBuilder
    implements
        Builder<GSearchResultsQueryData, GSearchResultsQueryDataBuilder> {
  _$GSearchResultsQueryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GSearchResultsQueryData_search?>? _search;
  ListBuilder<GSearchResultsQueryData_search?> get search =>
      _$this._search ??= ListBuilder<GSearchResultsQueryData_search?>();
  set search(ListBuilder<GSearchResultsQueryData_search?>? search) =>
      _$this._search = search;

  GSearchResultsQueryDataBuilder() {
    GSearchResultsQueryData._initializeBuilder(this);
  }

  GSearchResultsQueryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _search = $v.search?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData other) {
    _$v = other as _$GSearchResultsQueryData;
  }

  @override
  void update(void Function(GSearchResultsQueryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData build() => _build();

  _$GSearchResultsQueryData _build() {
    _$GSearchResultsQueryData _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSearchResultsQueryData', 'G__typename'),
            search: _search?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'search';
        _search?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__base
    extends GSearchResultsQueryData_search__base {
  @override
  final String G__typename;

  factory _$GSearchResultsQueryData_search__base(
          [void Function(GSearchResultsQueryData_search__baseBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__baseBuilder()..update(updates))._build();

  _$GSearchResultsQueryData_search__base._({required this.G__typename})
      : super._();
  @override
  GSearchResultsQueryData_search__base rebuild(
          void Function(GSearchResultsQueryData_search__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__baseBuilder toBuilder() =>
      GSearchResultsQueryData_search__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData_search__base &&
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
    return (newBuiltValueToStringHelper(r'GSearchResultsQueryData_search__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GSearchResultsQueryData_search__baseBuilder
    implements
        Builder<GSearchResultsQueryData_search__base,
            GSearchResultsQueryData_search__baseBuilder> {
  _$GSearchResultsQueryData_search__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GSearchResultsQueryData_search__baseBuilder() {
    GSearchResultsQueryData_search__base._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData_search__base other) {
    _$v = other as _$GSearchResultsQueryData_search__base;
  }

  @override
  void update(
      void Function(GSearchResultsQueryData_search__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__base build() => _build();

  _$GSearchResultsQueryData_search__base _build() {
    final _$result = _$v ??
        _$GSearchResultsQueryData_search__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GSearchResultsQueryData_search__base', 'G__typename'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asHuman
    extends GSearchResultsQueryData_search__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GSearchResultsQueryData_search__asHuman_friends?>? friends;
  @override
  final BuiltList<_i3.GEpisode?> appearsIn;

  factory _$GSearchResultsQueryData_search__asHuman(
          [void Function(GSearchResultsQueryData_search__asHumanBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asHumanBuilder()..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.friends,
      required this.appearsIn})
      : super._();
  @override
  GSearchResultsQueryData_search__asHuman rebuild(
          void Function(GSearchResultsQueryData_search__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asHumanBuilder toBuilder() =>
      GSearchResultsQueryData_search__asHumanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData_search__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friends == other.friends &&
        appearsIn == other.appearsIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jc(_$hash, appearsIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friends', friends)
          ..add('appearsIn', appearsIn))
        .toString();
  }
}

class GSearchResultsQueryData_search__asHumanBuilder
    implements
        Builder<GSearchResultsQueryData_search__asHuman,
            GSearchResultsQueryData_search__asHumanBuilder> {
  _$GSearchResultsQueryData_search__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GSearchResultsQueryData_search__asHuman_friends?>? _friends;
  ListBuilder<GSearchResultsQueryData_search__asHuman_friends?> get friends =>
      _$this._friends ??=
          ListBuilder<GSearchResultsQueryData_search__asHuman_friends?>();
  set friends(
          ListBuilder<GSearchResultsQueryData_search__asHuman_friends?>?
              friends) =>
      _$this._friends = friends;

  ListBuilder<_i3.GEpisode?>? _appearsIn;
  ListBuilder<_i3.GEpisode?> get appearsIn =>
      _$this._appearsIn ??= ListBuilder<_i3.GEpisode?>();
  set appearsIn(ListBuilder<_i3.GEpisode?>? appearsIn) =>
      _$this._appearsIn = appearsIn;

  GSearchResultsQueryData_search__asHumanBuilder() {
    GSearchResultsQueryData_search__asHuman._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friends = $v.friends?.toBuilder();
      _appearsIn = $v.appearsIn.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData_search__asHuman other) {
    _$v = other as _$GSearchResultsQueryData_search__asHuman;
  }

  @override
  void update(
      void Function(GSearchResultsQueryData_search__asHumanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asHuman build() => _build();

  _$GSearchResultsQueryData_search__asHuman _build() {
    _$GSearchResultsQueryData_search__asHuman _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asHuman._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GSearchResultsQueryData_search__asHuman', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSearchResultsQueryData_search__asHuman', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GSearchResultsQueryData_search__asHuman', 'name'),
            friends: _friends?.build(),
            appearsIn: appearsIn.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
        _$failedField = 'appearsIn';
        appearsIn.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asHuman_friends
    extends GSearchResultsQueryData_search__asHuman_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GSearchResultsQueryData_search__asHuman_friends_friendsConnection
      friendsConnection;

  factory _$GSearchResultsQueryData_search__asHuman_friends(
          [void Function(
                  GSearchResultsQueryData_search__asHuman_friendsBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asHuman_friendsBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asHuman_friends._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.friendsConnection})
      : super._();
  @override
  GSearchResultsQueryData_search__asHuman_friends rebuild(
          void Function(GSearchResultsQueryData_search__asHuman_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asHuman_friendsBuilder toBuilder() =>
      GSearchResultsQueryData_search__asHuman_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData_search__asHuman_friends &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asHuman_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GSearchResultsQueryData_search__asHuman_friendsBuilder
    implements
        Builder<GSearchResultsQueryData_search__asHuman_friends,
            GSearchResultsQueryData_search__asHuman_friendsBuilder> {
  _$GSearchResultsQueryData_search__asHuman_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder?
      _friendsConnection;
  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
      get friendsConnection => _$this._friendsConnection ??=
          GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder();
  set friendsConnection(
          GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder?
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GSearchResultsQueryData_search__asHuman_friendsBuilder() {
    GSearchResultsQueryData_search__asHuman_friends._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asHuman_friendsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData_search__asHuman_friends other) {
    _$v = other as _$GSearchResultsQueryData_search__asHuman_friends;
  }

  @override
  void update(
      void Function(GSearchResultsQueryData_search__asHuman_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends build() => _build();

  _$GSearchResultsQueryData_search__asHuman_friends _build() {
    _$GSearchResultsQueryData_search__asHuman_friends _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asHuman_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GSearchResultsQueryData_search__asHuman_friends',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSearchResultsQueryData_search__asHuman_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GSearchResultsQueryData_search__asHuman_friends', 'name'),
            friendsConnection: friendsConnection.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asHuman_friends',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection
    extends GSearchResultsQueryData_search__asHuman_friends_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?>?
      friends;

  factory _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection(
          [void Function(
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._();
  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection rebuild(
          void Function(
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
      toBuilder() =>
          GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GSearchResultsQueryData_search__asHuman_friends_friendsConnection &&
        G__typename == other.G__typename &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
    implements
        Builder<
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection,
            GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder> {
  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?>?
      _friends;
  ListBuilder<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?>
      get friends => _$this._friends ??= ListBuilder<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?>();
  set friends(
          ListBuilder<
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?>?
              friends) =>
      _$this._friends = friends;

  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder() {
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection
        ._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GSearchResultsQueryData_search__asHuman_friends_friendsConnection other) {
    _$v = other
        as _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection;
  }

  @override
  void update(
      void Function(
              GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection build() =>
      _build();

  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection _build() {
    _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection
        _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection',
                'G__typename'),
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
    extends GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends(
          [void Function(
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends rebuild(
          void Function(
                  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
      toBuilder() =>
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends &&
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
            r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
    implements
        Builder<
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends,
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder> {
  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder() {
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
        ._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
      get _$this {
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
  void replace(
      GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
          other) {
    _$v = other
        as _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends;
  }

  @override
  void update(
      void Function(
              GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
      build() => _build();

  _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
      _build() {
    final _$result = _$v ??
        _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends',
              'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends',
              'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asDroid
    extends GSearchResultsQueryData_search__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GSearchResultsQueryData_search__asDroid_friends?>? friends;
  @override
  final BuiltList<_i3.GEpisode?> appearsIn;

  factory _$GSearchResultsQueryData_search__asDroid(
          [void Function(GSearchResultsQueryData_search__asDroidBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asDroidBuilder()..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.friends,
      required this.appearsIn})
      : super._();
  @override
  GSearchResultsQueryData_search__asDroid rebuild(
          void Function(GSearchResultsQueryData_search__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asDroidBuilder toBuilder() =>
      GSearchResultsQueryData_search__asDroidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData_search__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friends == other.friends &&
        appearsIn == other.appearsIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jc(_$hash, appearsIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friends', friends)
          ..add('appearsIn', appearsIn))
        .toString();
  }
}

class GSearchResultsQueryData_search__asDroidBuilder
    implements
        Builder<GSearchResultsQueryData_search__asDroid,
            GSearchResultsQueryData_search__asDroidBuilder> {
  _$GSearchResultsQueryData_search__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GSearchResultsQueryData_search__asDroid_friends?>? _friends;
  ListBuilder<GSearchResultsQueryData_search__asDroid_friends?> get friends =>
      _$this._friends ??=
          ListBuilder<GSearchResultsQueryData_search__asDroid_friends?>();
  set friends(
          ListBuilder<GSearchResultsQueryData_search__asDroid_friends?>?
              friends) =>
      _$this._friends = friends;

  ListBuilder<_i3.GEpisode?>? _appearsIn;
  ListBuilder<_i3.GEpisode?> get appearsIn =>
      _$this._appearsIn ??= ListBuilder<_i3.GEpisode?>();
  set appearsIn(ListBuilder<_i3.GEpisode?>? appearsIn) =>
      _$this._appearsIn = appearsIn;

  GSearchResultsQueryData_search__asDroidBuilder() {
    GSearchResultsQueryData_search__asDroid._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friends = $v.friends?.toBuilder();
      _appearsIn = $v.appearsIn.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData_search__asDroid other) {
    _$v = other as _$GSearchResultsQueryData_search__asDroid;
  }

  @override
  void update(
      void Function(GSearchResultsQueryData_search__asDroidBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asDroid build() => _build();

  _$GSearchResultsQueryData_search__asDroid _build() {
    _$GSearchResultsQueryData_search__asDroid _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GSearchResultsQueryData_search__asDroid', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSearchResultsQueryData_search__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GSearchResultsQueryData_search__asDroid', 'name'),
            friends: _friends?.build(),
            appearsIn: appearsIn.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
        _$failedField = 'appearsIn';
        appearsIn.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asDroid',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asDroid_friends
    extends GSearchResultsQueryData_search__asDroid_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GSearchResultsQueryData_search__asDroid_friends_friendsConnection
      friendsConnection;

  factory _$GSearchResultsQueryData_search__asDroid_friends(
          [void Function(
                  GSearchResultsQueryData_search__asDroid_friendsBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asDroid_friendsBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asDroid_friends._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.friendsConnection})
      : super._();
  @override
  GSearchResultsQueryData_search__asDroid_friends rebuild(
          void Function(GSearchResultsQueryData_search__asDroid_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asDroid_friendsBuilder toBuilder() =>
      GSearchResultsQueryData_search__asDroid_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQueryData_search__asDroid_friends &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asDroid_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GSearchResultsQueryData_search__asDroid_friendsBuilder
    implements
        Builder<GSearchResultsQueryData_search__asDroid_friends,
            GSearchResultsQueryData_search__asDroid_friendsBuilder> {
  _$GSearchResultsQueryData_search__asDroid_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder?
      _friendsConnection;
  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
      get friendsConnection => _$this._friendsConnection ??=
          GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder();
  set friendsConnection(
          GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder?
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GSearchResultsQueryData_search__asDroid_friendsBuilder() {
    GSearchResultsQueryData_search__asDroid_friends._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asDroid_friendsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQueryData_search__asDroid_friends other) {
    _$v = other as _$GSearchResultsQueryData_search__asDroid_friends;
  }

  @override
  void update(
      void Function(GSearchResultsQueryData_search__asDroid_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends build() => _build();

  _$GSearchResultsQueryData_search__asDroid_friends _build() {
    _$GSearchResultsQueryData_search__asDroid_friends _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asDroid_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GSearchResultsQueryData_search__asDroid_friends',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSearchResultsQueryData_search__asDroid_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name,
                r'GSearchResultsQueryData_search__asDroid_friends', 'name'),
            friendsConnection: friendsConnection.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asDroid_friends',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection
    extends GSearchResultsQueryData_search__asDroid_friends_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?>?
      friends;

  factory _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection(
          [void Function(
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._();
  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection rebuild(
          void Function(
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
      toBuilder() =>
          GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GSearchResultsQueryData_search__asDroid_friends_friendsConnection &&
        G__typename == other.G__typename &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
    implements
        Builder<
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection,
            GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder> {
  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?>?
      _friends;
  ListBuilder<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?>
      get friends => _$this._friends ??= ListBuilder<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?>();
  set friends(
          ListBuilder<
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?>?
              friends) =>
      _$this._friends = friends;

  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder() {
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection
        ._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GSearchResultsQueryData_search__asDroid_friends_friendsConnection other) {
    _$v = other
        as _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection;
  }

  @override
  void update(
      void Function(
              GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection build() =>
      _build();

  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection _build() {
    _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection
        _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection',
                'G__typename'),
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
    extends GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends(
          [void Function(
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder)?
              updates]) =>
      (GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder()
            ..update(updates))
          ._build();

  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends rebuild(
          void Function(
                  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
      toBuilder() =>
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends &&
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
            r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
    implements
        Builder<
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends,
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder> {
  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder() {
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
        ._initializeBuilder(this);
  }

  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
      get _$this {
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
  void replace(
      GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
          other) {
    _$v = other
        as _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends;
  }

  @override
  void update(
      void Function(
              GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
      build() => _build();

  _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
      _build() {
    final _$result = _$v ??
        _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends',
              'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends',
              'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GCharacterDetailsData extends GCharacterDetailsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GCharacterDetailsData_friends?>? friends;
  @override
  final BuiltList<_i3.GEpisode?> appearsIn;

  factory _$GCharacterDetailsData(
          [void Function(GCharacterDetailsDataBuilder)? updates]) =>
      (GCharacterDetailsDataBuilder()..update(updates))._build();

  _$GCharacterDetailsData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.friends,
      required this.appearsIn})
      : super._();
  @override
  GCharacterDetailsData rebuild(
          void Function(GCharacterDetailsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCharacterDetailsDataBuilder toBuilder() =>
      GCharacterDetailsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCharacterDetailsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friends == other.friends &&
        appearsIn == other.appearsIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jc(_$hash, appearsIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCharacterDetailsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friends', friends)
          ..add('appearsIn', appearsIn))
        .toString();
  }
}

class GCharacterDetailsDataBuilder
    implements Builder<GCharacterDetailsData, GCharacterDetailsDataBuilder> {
  _$GCharacterDetailsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GCharacterDetailsData_friends?>? _friends;
  ListBuilder<GCharacterDetailsData_friends?> get friends =>
      _$this._friends ??= ListBuilder<GCharacterDetailsData_friends?>();
  set friends(ListBuilder<GCharacterDetailsData_friends?>? friends) =>
      _$this._friends = friends;

  ListBuilder<_i3.GEpisode?>? _appearsIn;
  ListBuilder<_i3.GEpisode?> get appearsIn =>
      _$this._appearsIn ??= ListBuilder<_i3.GEpisode?>();
  set appearsIn(ListBuilder<_i3.GEpisode?>? appearsIn) =>
      _$this._appearsIn = appearsIn;

  GCharacterDetailsDataBuilder() {
    GCharacterDetailsData._initializeBuilder(this);
  }

  GCharacterDetailsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friends = $v.friends?.toBuilder();
      _appearsIn = $v.appearsIn.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCharacterDetailsData other) {
    _$v = other as _$GCharacterDetailsData;
  }

  @override
  void update(void Function(GCharacterDetailsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCharacterDetailsData build() => _build();

  _$GCharacterDetailsData _build() {
    _$GCharacterDetailsData _$result;
    try {
      _$result = _$v ??
          _$GCharacterDetailsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCharacterDetailsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCharacterDetailsData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GCharacterDetailsData', 'name'),
            friends: _friends?.build(),
            appearsIn: appearsIn.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
        _$failedField = 'appearsIn';
        appearsIn.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GCharacterDetailsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCharacterDetailsData_friends extends GCharacterDetailsData_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GCharacterDetailsData_friends_friendsConnection friendsConnection;

  factory _$GCharacterDetailsData_friends(
          [void Function(GCharacterDetailsData_friendsBuilder)? updates]) =>
      (GCharacterDetailsData_friendsBuilder()..update(updates))._build();

  _$GCharacterDetailsData_friends._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.friendsConnection})
      : super._();
  @override
  GCharacterDetailsData_friends rebuild(
          void Function(GCharacterDetailsData_friendsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCharacterDetailsData_friendsBuilder toBuilder() =>
      GCharacterDetailsData_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCharacterDetailsData_friends &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCharacterDetailsData_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GCharacterDetailsData_friendsBuilder
    implements
        Builder<GCharacterDetailsData_friends,
            GCharacterDetailsData_friendsBuilder> {
  _$GCharacterDetailsData_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GCharacterDetailsData_friends_friendsConnectionBuilder? _friendsConnection;
  GCharacterDetailsData_friends_friendsConnectionBuilder
      get friendsConnection => _$this._friendsConnection ??=
          GCharacterDetailsData_friends_friendsConnectionBuilder();
  set friendsConnection(
          GCharacterDetailsData_friends_friendsConnectionBuilder?
              friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GCharacterDetailsData_friendsBuilder() {
    GCharacterDetailsData_friends._initializeBuilder(this);
  }

  GCharacterDetailsData_friendsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCharacterDetailsData_friends other) {
    _$v = other as _$GCharacterDetailsData_friends;
  }

  @override
  void update(void Function(GCharacterDetailsData_friendsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCharacterDetailsData_friends build() => _build();

  _$GCharacterDetailsData_friends _build() {
    _$GCharacterDetailsData_friends _$result;
    try {
      _$result = _$v ??
          _$GCharacterDetailsData_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCharacterDetailsData_friends', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCharacterDetailsData_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GCharacterDetailsData_friends', 'name'),
            friendsConnection: friendsConnection.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GCharacterDetailsData_friends', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCharacterDetailsData_friends_friendsConnection
    extends GCharacterDetailsData_friends_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<GCharacterDetailsData_friends_friendsConnection_friends?>?
      friends;

  factory _$GCharacterDetailsData_friends_friendsConnection(
          [void Function(
                  GCharacterDetailsData_friends_friendsConnectionBuilder)?
              updates]) =>
      (GCharacterDetailsData_friends_friendsConnectionBuilder()
            ..update(updates))
          ._build();

  _$GCharacterDetailsData_friends_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._();
  @override
  GCharacterDetailsData_friends_friendsConnection rebuild(
          void Function(GCharacterDetailsData_friends_friendsConnectionBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCharacterDetailsData_friends_friendsConnectionBuilder toBuilder() =>
      GCharacterDetailsData_friends_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCharacterDetailsData_friends_friendsConnection &&
        G__typename == other.G__typename &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GCharacterDetailsData_friends_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GCharacterDetailsData_friends_friendsConnectionBuilder
    implements
        Builder<GCharacterDetailsData_friends_friendsConnection,
            GCharacterDetailsData_friends_friendsConnectionBuilder> {
  _$GCharacterDetailsData_friends_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GCharacterDetailsData_friends_friendsConnection_friends?>?
      _friends;
  ListBuilder<GCharacterDetailsData_friends_friendsConnection_friends?>
      get friends => _$this._friends ??= ListBuilder<
          GCharacterDetailsData_friends_friendsConnection_friends?>();
  set friends(
          ListBuilder<GCharacterDetailsData_friends_friendsConnection_friends?>?
              friends) =>
      _$this._friends = friends;

  GCharacterDetailsData_friends_friendsConnectionBuilder() {
    GCharacterDetailsData_friends_friendsConnection._initializeBuilder(this);
  }

  GCharacterDetailsData_friends_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCharacterDetailsData_friends_friendsConnection other) {
    _$v = other as _$GCharacterDetailsData_friends_friendsConnection;
  }

  @override
  void update(
      void Function(GCharacterDetailsData_friends_friendsConnectionBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCharacterDetailsData_friends_friendsConnection build() => _build();

  _$GCharacterDetailsData_friends_friendsConnection _build() {
    _$GCharacterDetailsData_friends_friendsConnection _$result;
    try {
      _$result = _$v ??
          _$GCharacterDetailsData_friends_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GCharacterDetailsData_friends_friendsConnection',
                'G__typename'),
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GCharacterDetailsData_friends_friendsConnection',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCharacterDetailsData_friends_friendsConnection_friends
    extends GCharacterDetailsData_friends_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GCharacterDetailsData_friends_friendsConnection_friends(
          [void Function(
                  GCharacterDetailsData_friends_friendsConnection_friendsBuilder)?
              updates]) =>
      (GCharacterDetailsData_friends_friendsConnection_friendsBuilder()
            ..update(updates))
          ._build();

  _$GCharacterDetailsData_friends_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GCharacterDetailsData_friends_friendsConnection_friends rebuild(
          void Function(
                  GCharacterDetailsData_friends_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCharacterDetailsData_friends_friendsConnection_friendsBuilder toBuilder() =>
      GCharacterDetailsData_friends_friendsConnection_friendsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCharacterDetailsData_friends_friendsConnection_friends &&
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
            r'GCharacterDetailsData_friends_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GCharacterDetailsData_friends_friendsConnection_friendsBuilder
    implements
        Builder<GCharacterDetailsData_friends_friendsConnection_friends,
            GCharacterDetailsData_friends_friendsConnection_friendsBuilder> {
  _$GCharacterDetailsData_friends_friendsConnection_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GCharacterDetailsData_friends_friendsConnection_friendsBuilder() {
    GCharacterDetailsData_friends_friendsConnection_friends._initializeBuilder(
        this);
  }

  GCharacterDetailsData_friends_friendsConnection_friendsBuilder get _$this {
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
  void replace(GCharacterDetailsData_friends_friendsConnection_friends other) {
    _$v = other as _$GCharacterDetailsData_friends_friendsConnection_friends;
  }

  @override
  void update(
      void Function(
              GCharacterDetailsData_friends_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCharacterDetailsData_friends_friendsConnection_friends build() => _build();

  _$GCharacterDetailsData_friends_friendsConnection_friends _build() {
    final _$result = _$v ??
        _$GCharacterDetailsData_friends_friendsConnection_friends._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GCharacterDetailsData_friends_friendsConnection_friends',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(id,
              r'GCharacterDetailsData_friends_friendsConnection_friends', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GCharacterDetailsData_friends_friendsConnection_friends',
              'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GFriendInfoData extends GFriendInfoData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GFriendInfoData_friendsConnection friendsConnection;

  factory _$GFriendInfoData([void Function(GFriendInfoDataBuilder)? updates]) =>
      (GFriendInfoDataBuilder()..update(updates))._build();

  _$GFriendInfoData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.friendsConnection})
      : super._();
  @override
  GFriendInfoData rebuild(void Function(GFriendInfoDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFriendInfoDataBuilder toBuilder() => GFriendInfoDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFriendInfoData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFriendInfoData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GFriendInfoDataBuilder
    implements Builder<GFriendInfoData, GFriendInfoDataBuilder> {
  _$GFriendInfoData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFriendInfoData_friendsConnectionBuilder? _friendsConnection;
  GFriendInfoData_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??= GFriendInfoData_friendsConnectionBuilder();
  set friendsConnection(
          GFriendInfoData_friendsConnectionBuilder? friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GFriendInfoDataBuilder() {
    GFriendInfoData._initializeBuilder(this);
  }

  GFriendInfoDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFriendInfoData other) {
    _$v = other as _$GFriendInfoData;
  }

  @override
  void update(void Function(GFriendInfoDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFriendInfoData build() => _build();

  _$GFriendInfoData _build() {
    _$GFriendInfoData _$result;
    try {
      _$result = _$v ??
          _$GFriendInfoData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFriendInfoData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFriendInfoData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GFriendInfoData', 'name'),
            friendsConnection: friendsConnection.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GFriendInfoData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFriendInfoData_friendsConnection
    extends GFriendInfoData_friendsConnection {
  @override
  final String G__typename;
  @override
  final BuiltList<GFriendInfoData_friendsConnection_friends?>? friends;

  factory _$GFriendInfoData_friendsConnection(
          [void Function(GFriendInfoData_friendsConnectionBuilder)? updates]) =>
      (GFriendInfoData_friendsConnectionBuilder()..update(updates))._build();

  _$GFriendInfoData_friendsConnection._(
      {required this.G__typename, this.friends})
      : super._();
  @override
  GFriendInfoData_friendsConnection rebuild(
          void Function(GFriendInfoData_friendsConnectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFriendInfoData_friendsConnectionBuilder toBuilder() =>
      GFriendInfoData_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFriendInfoData_friendsConnection &&
        G__typename == other.G__typename &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, friends.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFriendInfoData_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('friends', friends))
        .toString();
  }
}

class GFriendInfoData_friendsConnectionBuilder
    implements
        Builder<GFriendInfoData_friendsConnection,
            GFriendInfoData_friendsConnectionBuilder> {
  _$GFriendInfoData_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFriendInfoData_friendsConnection_friends?>? _friends;
  ListBuilder<GFriendInfoData_friendsConnection_friends?> get friends =>
      _$this._friends ??=
          ListBuilder<GFriendInfoData_friendsConnection_friends?>();
  set friends(
          ListBuilder<GFriendInfoData_friendsConnection_friends?>? friends) =>
      _$this._friends = friends;

  GFriendInfoData_friendsConnectionBuilder() {
    GFriendInfoData_friendsConnection._initializeBuilder(this);
  }

  GFriendInfoData_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFriendInfoData_friendsConnection other) {
    _$v = other as _$GFriendInfoData_friendsConnection;
  }

  @override
  void update(
      void Function(GFriendInfoData_friendsConnectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFriendInfoData_friendsConnection build() => _build();

  _$GFriendInfoData_friendsConnection _build() {
    _$GFriendInfoData_friendsConnection _$result;
    try {
      _$result = _$v ??
          _$GFriendInfoData_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFriendInfoData_friendsConnection', 'G__typename'),
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GFriendInfoData_friendsConnection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFriendInfoData_friendsConnection_friends
    extends GFriendInfoData_friendsConnection_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GFriendInfoData_friendsConnection_friends(
          [void Function(GFriendInfoData_friendsConnection_friendsBuilder)?
              updates]) =>
      (GFriendInfoData_friendsConnection_friendsBuilder()..update(updates))
          ._build();

  _$GFriendInfoData_friendsConnection_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GFriendInfoData_friendsConnection_friends rebuild(
          void Function(GFriendInfoData_friendsConnection_friendsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFriendInfoData_friendsConnection_friendsBuilder toBuilder() =>
      GFriendInfoData_friendsConnection_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFriendInfoData_friendsConnection_friends &&
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
            r'GFriendInfoData_friendsConnection_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GFriendInfoData_friendsConnection_friendsBuilder
    implements
        Builder<GFriendInfoData_friendsConnection_friends,
            GFriendInfoData_friendsConnection_friendsBuilder> {
  _$GFriendInfoData_friendsConnection_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFriendInfoData_friendsConnection_friendsBuilder() {
    GFriendInfoData_friendsConnection_friends._initializeBuilder(this);
  }

  GFriendInfoData_friendsConnection_friendsBuilder get _$this {
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
  void replace(GFriendInfoData_friendsConnection_friends other) {
    _$v = other as _$GFriendInfoData_friendsConnection_friends;
  }

  @override
  void update(
      void Function(GFriendInfoData_friendsConnection_friendsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFriendInfoData_friendsConnection_friends build() => _build();

  _$GFriendInfoData_friendsConnection_friends _build() {
    final _$result = _$v ??
        _$GFriendInfoData_friendsConnection_friends._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GFriendInfoData_friendsConnection_friends', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GFriendInfoData_friendsConnection_friends', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GFriendInfoData_friendsConnection_friends', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GCharacterBasicData extends GCharacterBasicData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GCharacterBasicData(
          [void Function(GCharacterBasicDataBuilder)? updates]) =>
      (GCharacterBasicDataBuilder()..update(updates))._build();

  _$GCharacterBasicData._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GCharacterBasicData rebuild(
          void Function(GCharacterBasicDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCharacterBasicDataBuilder toBuilder() =>
      GCharacterBasicDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCharacterBasicData &&
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
    return (newBuiltValueToStringHelper(r'GCharacterBasicData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GCharacterBasicDataBuilder
    implements Builder<GCharacterBasicData, GCharacterBasicDataBuilder> {
  _$GCharacterBasicData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GCharacterBasicDataBuilder() {
    GCharacterBasicData._initializeBuilder(this);
  }

  GCharacterBasicDataBuilder get _$this {
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
  void replace(GCharacterBasicData other) {
    _$v = other as _$GCharacterBasicData;
  }

  @override
  void update(void Function(GCharacterBasicDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCharacterBasicData build() => _build();

  _$GCharacterBasicData _build() {
    final _$result = _$v ??
        _$GCharacterBasicData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GCharacterBasicData', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GCharacterBasicData', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GCharacterBasicData', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
