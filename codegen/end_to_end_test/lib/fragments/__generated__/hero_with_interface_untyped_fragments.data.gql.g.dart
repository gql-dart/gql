// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_untyped_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithoutFragmentsData> _$gHeroWithoutFragmentsDataSerializer =
    new _$GHeroWithoutFragmentsDataSerializer();
Serializer<GHeroWithoutFragmentsData_hero__base>
    _$gHeroWithoutFragmentsDataHeroBaseSerializer =
    new _$GHeroWithoutFragmentsData_hero__baseSerializer();
Serializer<GHeroWithoutFragmentsData_hero__asHuman>
    _$gHeroWithoutFragmentsDataHeroAsHumanSerializer =
    new _$GHeroWithoutFragmentsData_hero__asHumanSerializer();
Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__base>
    _$gHeroWithoutFragmentsDataHeroAsHumanFriendsBaseSerializer =
    new _$GHeroWithoutFragmentsData_hero__asHuman_friends__baseSerializer();
Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman>
    _$gHeroWithoutFragmentsDataHeroAsHumanFriendsAsHumanSerializer =
    new _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanSerializer();
Serializer<GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid>
    _$gHeroWithoutFragmentsDataHeroAsHumanFriendsAsDroidSerializer =
    new _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidSerializer();
Serializer<GHeroWithoutFragmentsData_hero__asDroid>
    _$gHeroWithoutFragmentsDataHeroAsDroidSerializer =
    new _$GHeroWithoutFragmentsData_hero__asDroidSerializer();

class _$GHeroWithoutFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithoutFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData,
    _$GHeroWithoutFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithoutFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragmentsData object,
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
            specifiedType: const FullType(GHeroWithoutFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithoutFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsDataBuilder();

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
                  specifiedType: const FullType(GHeroWithoutFragmentsData_hero))
              as GHeroWithoutFragmentsData_hero?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithoutFragmentsData_hero__baseSerializer
    implements StructuredSerializer<GHeroWithoutFragmentsData_hero__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__base,
    _$GHeroWithoutFragmentsData_hero__base
  ];
  @override
  final String wireName = 'GHeroWithoutFragmentsData_hero__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragmentsData_hero__base object,
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
  GHeroWithoutFragmentsData_hero__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsData_hero__baseBuilder();

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

class _$GHeroWithoutFragmentsData_hero__asHumanSerializer
    implements StructuredSerializer<GHeroWithoutFragmentsData_hero__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__asHuman,
    _$GHeroWithoutFragmentsData_hero__asHuman
  ];
  @override
  final String wireName = 'GHeroWithoutFragmentsData_hero__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragmentsData_hero__asHuman object,
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
                  GHeroWithoutFragmentsData_hero__asHuman_friends)
            ])));
    }
    return result;
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsData_hero__asHumanBuilder();

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
                    GHeroWithoutFragmentsData_hero__asHuman_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__baseSerializer
    implements
        StructuredSerializer<
            GHeroWithoutFragmentsData_hero__asHuman_friends__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__asHuman_friends__base,
    _$GHeroWithoutFragmentsData_hero__asHuman_friends__base
  ];
  @override
  final String wireName =
      'GHeroWithoutFragmentsData_hero__asHuman_friends__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithoutFragmentsData_hero__asHuman_friends__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder();

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

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanSerializer
    implements
        StructuredSerializer<
            GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
    _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman
  ];
  @override
  final String wireName =
      'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman object,
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
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder();

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

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidSerializer
    implements
        StructuredSerializer<
            GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
    _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid
  ];
  @override
  final String wireName =
      'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid object,
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
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder();

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

class _$GHeroWithoutFragmentsData_hero__asDroidSerializer
    implements StructuredSerializer<GHeroWithoutFragmentsData_hero__asDroid> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsData_hero__asDroid,
    _$GHeroWithoutFragmentsData_hero__asDroid
  ];
  @override
  final String wireName = 'GHeroWithoutFragmentsData_hero__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragmentsData_hero__asDroid object,
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
  GHeroWithoutFragmentsData_hero__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsData_hero__asDroidBuilder();

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

class _$GHeroWithoutFragmentsData extends GHeroWithoutFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithoutFragmentsData_hero? hero;

  factory _$GHeroWithoutFragmentsData(
          [void Function(GHeroWithoutFragmentsDataBuilder)? updates]) =>
      (new GHeroWithoutFragmentsDataBuilder()..update(updates))._build();

  _$GHeroWithoutFragmentsData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithoutFragmentsData', 'G__typename');
  }

  @override
  GHeroWithoutFragmentsData rebuild(
          void Function(GHeroWithoutFragmentsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsDataBuilder toBuilder() =>
      new GHeroWithoutFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithoutFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithoutFragmentsDataBuilder
    implements
        Builder<GHeroWithoutFragmentsData, GHeroWithoutFragmentsDataBuilder> {
  _$GHeroWithoutFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithoutFragmentsData_hero? _hero;
  GHeroWithoutFragmentsData_hero? get hero => _$this._hero;
  set hero(GHeroWithoutFragmentsData_hero? hero) => _$this._hero = hero;

  GHeroWithoutFragmentsDataBuilder() {
    GHeroWithoutFragmentsData._initializeBuilder(this);
  }

  GHeroWithoutFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithoutFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData;
  }

  @override
  void update(void Function(GHeroWithoutFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData build() => _build();

  _$GHeroWithoutFragmentsData _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroWithoutFragmentsData', 'G__typename'),
            hero: hero);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__base
    extends GHeroWithoutFragmentsData_hero__base {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithoutFragmentsData_hero__base(
          [void Function(GHeroWithoutFragmentsData_hero__baseBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__baseBuilder()..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__base._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithoutFragmentsData_hero__base', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithoutFragmentsData_hero__base', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithoutFragmentsData_hero__base', 'name');
  }

  @override
  GHeroWithoutFragmentsData_hero__base rebuild(
          void Function(GHeroWithoutFragmentsData_hero__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__baseBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__base &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithoutFragmentsData_hero__base')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__baseBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__base,
            GHeroWithoutFragmentsData_hero__baseBuilder> {
  _$GHeroWithoutFragmentsData_hero__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithoutFragmentsData_hero__baseBuilder() {
    GHeroWithoutFragmentsData_hero__base._initializeBuilder(this);
  }

  GHeroWithoutFragmentsData_hero__baseBuilder get _$this {
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
  void replace(GHeroWithoutFragmentsData_hero__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__base;
  }

  @override
  void update(
      void Function(GHeroWithoutFragmentsData_hero__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__base build() => _build();

  _$GHeroWithoutFragmentsData_hero__base _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData_hero__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithoutFragmentsData_hero__base', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWithoutFragmentsData_hero__base', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWithoutFragmentsData_hero__base', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__asHuman
    extends GHeroWithoutFragmentsData_hero__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final BuiltList<GHeroWithoutFragmentsData_hero__asHuman_friends?>? friends;

  factory _$GHeroWithoutFragmentsData_hero__asHuman(
          [void Function(GHeroWithoutFragmentsData_hero__asHumanBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__asHumanBuilder()..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithoutFragmentsData_hero__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithoutFragmentsData_hero__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithoutFragmentsData_hero__asHuman', 'name');
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman rebuild(
          void Function(GHeroWithoutFragmentsData_hero__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__asHumanBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__asHumanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__asHuman &&
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
            r'GHeroWithoutFragmentsData_hero__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__asHumanBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__asHuman,
            GHeroWithoutFragmentsData_hero__asHumanBuilder> {
  _$GHeroWithoutFragmentsData_hero__asHuman? _$v;

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

  ListBuilder<GHeroWithoutFragmentsData_hero__asHuman_friends?>? _friends;
  ListBuilder<GHeroWithoutFragmentsData_hero__asHuman_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GHeroWithoutFragmentsData_hero__asHuman_friends?>();
  set friends(
          ListBuilder<GHeroWithoutFragmentsData_hero__asHuman_friends?>?
              friends) =>
      _$this._friends = friends;

  GHeroWithoutFragmentsData_hero__asHumanBuilder() {
    GHeroWithoutFragmentsData_hero__asHuman._initializeBuilder(this);
  }

  GHeroWithoutFragmentsData_hero__asHumanBuilder get _$this {
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
  void replace(GHeroWithoutFragmentsData_hero__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__asHuman;
  }

  @override
  void update(
      void Function(GHeroWithoutFragmentsData_hero__asHumanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman build() => _build();

  _$GHeroWithoutFragmentsData_hero__asHuman _build() {
    _$GHeroWithoutFragmentsData_hero__asHuman _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithoutFragmentsData_hero__asHuman._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GHeroWithoutFragmentsData_hero__asHuman', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHeroWithoutFragmentsData_hero__asHuman', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHeroWithoutFragmentsData_hero__asHuman', 'name'),
              homePlanet: homePlanet,
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithoutFragmentsData_hero__asHuman',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__base
    extends GHeroWithoutFragmentsData_hero__asHuman_friends__base {
  @override
  final String G__typename;

  factory _$GHeroWithoutFragmentsData_hero__asHuman_friends__base(
          [void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithoutFragmentsData_hero__asHuman_friends__base',
        'G__typename');
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__base rebuild(
          void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__asHuman_friends__base &&
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
            r'GHeroWithoutFragmentsData_hero__asHuman_friends__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__asHuman_friends__base,
            GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder> {
  _$GHeroWithoutFragmentsData_hero__asHuman_friends__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder() {
    GHeroWithoutFragmentsData_hero__asHuman_friends__base._initializeBuilder(
        this);
  }

  GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithoutFragmentsData_hero__asHuman_friends__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__asHuman_friends__base;
  }

  @override
  void update(
      void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__base build() => _build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__base _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData_hero__asHuman_friends__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman
    extends GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;

  factory _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman(
          [void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(name,
        r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman', 'name');
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman rebuild(
          void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman &&
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
            r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
            GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder> {
  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman? _$v;

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

  GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder() {
    GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman._initializeBuilder(
        this);
  }

  GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder get _$this {
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
  void replace(GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman;
  }

  @override
  void update(
      void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__asHumanBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman build() => _build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman',
                'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman',
                'name'),
            homePlanet: homePlanet);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid
    extends GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid(
          [void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(name,
        r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid', 'name');
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid rebuild(
          void Function(
                  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid &&
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
            r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
            GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder> {
  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid? _$v;

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

  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder() {
    GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid._initializeBuilder(
        this);
  }

  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder get _$this {
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
  void replace(GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid;
  }

  @override
  void update(
      void Function(
              GHeroWithoutFragmentsData_hero__asHuman_friends__asDroidBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid build() => _build();

  _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid',
                'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid',
                'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithoutFragmentsData_hero__asDroid
    extends GHeroWithoutFragmentsData_hero__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GHeroWithoutFragmentsData_hero__asDroid(
          [void Function(GHeroWithoutFragmentsData_hero__asDroidBuilder)?
              updates]) =>
      (new GHeroWithoutFragmentsData_hero__asDroidBuilder()..update(updates))
          ._build();

  _$GHeroWithoutFragmentsData_hero__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithoutFragmentsData_hero__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithoutFragmentsData_hero__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithoutFragmentsData_hero__asDroid', 'name');
  }

  @override
  GHeroWithoutFragmentsData_hero__asDroid rebuild(
          void Function(GHeroWithoutFragmentsData_hero__asDroidBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsData_hero__asDroidBuilder toBuilder() =>
      new GHeroWithoutFragmentsData_hero__asDroidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsData_hero__asDroid &&
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
            r'GHeroWithoutFragmentsData_hero__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GHeroWithoutFragmentsData_hero__asDroidBuilder
    implements
        Builder<GHeroWithoutFragmentsData_hero__asDroid,
            GHeroWithoutFragmentsData_hero__asDroidBuilder> {
  _$GHeroWithoutFragmentsData_hero__asDroid? _$v;

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

  GHeroWithoutFragmentsData_hero__asDroidBuilder() {
    GHeroWithoutFragmentsData_hero__asDroid._initializeBuilder(this);
  }

  GHeroWithoutFragmentsData_hero__asDroidBuilder get _$this {
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
  void replace(GHeroWithoutFragmentsData_hero__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsData_hero__asDroid;
  }

  @override
  void update(
      void Function(GHeroWithoutFragmentsData_hero__asDroidBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsData_hero__asDroid build() => _build();

  _$GHeroWithoutFragmentsData_hero__asDroid _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsData_hero__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithoutFragmentsData_hero__asDroid', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWithoutFragmentsData_hero__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWithoutFragmentsData_hero__asDroid', 'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
