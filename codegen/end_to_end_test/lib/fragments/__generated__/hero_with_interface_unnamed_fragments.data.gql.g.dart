// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_unnamed_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceUnnamedFragmentsData>
    _$gHeroWithInterfaceUnnamedFragmentsDataSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsDataSerializer();
Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__base>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroBaseSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__baseSerializer();
Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanSerializer();
Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsBaseSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseSerializer();
Serializer<
        GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsAsHumanSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanSerializer();
Serializer<
        GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsHumanFriendsAsDroidSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidSerializer();
Serializer<GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid>
    _$gHeroWithInterfaceUnnamedFragmentsDataHeroAsDroidSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidSerializer();

class _$GHeroWithInterfaceUnnamedFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithInterfaceUnnamedFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData,
    _$GHeroWithInterfaceUnnamedFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithInterfaceUnnamedFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceUnnamedFragmentsData object,
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
                const FullType(GHeroWithInterfaceUnnamedFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceUnnamedFragmentsDataBuilder();

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
                      GHeroWithInterfaceUnnamedFragmentsData_hero))
              as GHeroWithInterfaceUnnamedFragmentsData_hero?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__baseSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__base,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__base
  ];
  @override
  final String wireName = 'GHeroWithInterfaceUnnamedFragmentsData_hero__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__base object,
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
  GHeroWithInterfaceUnnamedFragmentsData_hero__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman object,
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
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder();

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
                    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
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
    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
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
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidSerializer
    implements
        StructuredSerializer<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid,
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid
  ];
  @override
  final String wireName =
      'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid object,
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
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsData
    extends GHeroWithInterfaceUnnamedFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithInterfaceUnnamedFragmentsData_hero? hero;

  factory _$GHeroWithInterfaceUnnamedFragmentsData(
          [void Function(GHeroWithInterfaceUnnamedFragmentsDataBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsDataBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData._(
      {required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithInterfaceUnnamedFragmentsData', 'G__typename');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData rebuild(
          void Function(GHeroWithInterfaceUnnamedFragmentsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsDataBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragmentsData &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsDataBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragmentsData,
            GHeroWithInterfaceUnnamedFragmentsDataBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInterfaceUnnamedFragmentsData_hero? _hero;
  GHeroWithInterfaceUnnamedFragmentsData_hero? get hero => _$this._hero;
  set hero(GHeroWithInterfaceUnnamedFragmentsData_hero? hero) =>
      _$this._hero = hero;

  GHeroWithInterfaceUnnamedFragmentsDataBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceUnnamedFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragmentsData;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceUnnamedFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData', 'G__typename'),
          hero: hero,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__base
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__base {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__base(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__base._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__base', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceUnnamedFragmentsData_hero__base', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceUnnamedFragmentsData_hero__base', 'name');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__base rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragmentsData_hero__base &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__base')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragmentsData_hero__base,
            GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__base._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder get _$this {
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
  void replace(GHeroWithInterfaceUnnamedFragmentsData_hero__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragmentsData_hero__base;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceUnnamedFragmentsData_hero__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__base build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__base _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData_hero__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__base',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GHeroWithInterfaceUnnamedFragmentsData_hero__base', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__base', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman {
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
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>? friends;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman', 'name');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman,
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman? _$v;

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

  ListBuilder<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
      _friends;
  ListBuilder<GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>
      get friends => _$this._friends ??= new ListBuilder<
          GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>();
  set friends(
          ListBuilder<
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends?>?
              friends) =>
      _$this._friends = friends;

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman._initializeBuilder(
        this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder get _$this {
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
  void replace(GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceUnnamedFragmentsData_hero__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman _build() {
    _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman',
                'name'),
            homePlanet: homePlanet,
            friends: _friends?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base {
  @override
  final String G__typename;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base',
        'G__typename');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder
      toBuilder() =>
          new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder
    implements
        Builder<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base,
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder
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
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base build() =>
      _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
      _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__base',
              'G__typename'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
        'name');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
      toBuilder() =>
          new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
    implements
        Builder<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman,
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman? _$v;

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

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder
      get _$this {
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
  void replace(
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
      build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
      _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
              'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asHuman',
              'name'),
          homePlanet: homePlanet,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
        'name');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
      toBuilder() =>
          new GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
    implements
        Builder<
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid,
            GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid? _$v;

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

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
        ._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder
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
      GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
      build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
      _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
              'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends__asDroid',
              'name'),
          primaryFunction: primaryFunction,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid
    extends GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid(
          [void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid', 'name');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid rebuild(
          void Function(
                  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid &&
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
            r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid,
            GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid? _$v;

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

  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder() {
    GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid._initializeBuilder(
        this);
  }

  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder get _$this {
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
  void replace(GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid;
  }

  @override
  void update(
      void Function(
              GHeroWithInterfaceUnnamedFragmentsData_hero__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(id,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GHeroWithInterfaceUnnamedFragmentsData_hero__asDroid', 'name'),
          primaryFunction: primaryFunction,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
