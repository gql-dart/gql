// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipFragmentData> _$gHeroSkipFragmentDataSerializer =
    new _$GHeroSkipFragmentDataSerializer();
Serializer<GHeroSkipFragmentData_hero> _$gHeroSkipFragmentDataHeroSerializer =
    new _$GHeroSkipFragmentData_heroSerializer();
Serializer<GHeroSkipFragmentData_hero_friends>
    _$gHeroSkipFragmentDataHeroFriendsSerializer =
    new _$GHeroSkipFragmentData_hero_friendsSerializer();
Serializer<GHeroDetailData> _$gHeroDetailDataSerializer =
    new _$GHeroDetailDataSerializer();
Serializer<GHeroDetailData_friends> _$gHeroDetailDataFriendsSerializer =
    new _$GHeroDetailData_friendsSerializer();

class _$GHeroSkipFragmentDataSerializer
    implements StructuredSerializer<GHeroSkipFragmentData> {
  @override
  final Iterable<Type> types = const [
    GHeroSkipFragmentData,
    _$GHeroSkipFragmentData
  ];
  @override
  final String wireName = 'GHeroSkipFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroSkipFragmentData object,
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
            specifiedType: const FullType(GHeroSkipFragmentData_hero)));
    }
    return result;
  }

  @override
  GHeroSkipFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipFragmentDataBuilder();

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
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHeroSkipFragmentData_hero))!
              as GHeroSkipFragmentData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroSkipFragmentData_heroSerializer
    implements StructuredSerializer<GHeroSkipFragmentData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroSkipFragmentData_hero,
    _$GHeroSkipFragmentData_hero
  ];
  @override
  final String wireName = 'GHeroSkipFragmentData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroSkipFragmentData_hero object,
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
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GHeroSkipFragmentData_hero_friends)
            ])));
    }
    return result;
  }

  @override
  GHeroSkipFragmentData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipFragmentData_heroBuilder();

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
                const FullType.nullable(GHeroSkipFragmentData_hero_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroSkipFragmentData_hero_friendsSerializer
    implements StructuredSerializer<GHeroSkipFragmentData_hero_friends> {
  @override
  final Iterable<Type> types = const [
    GHeroSkipFragmentData_hero_friends,
    _$GHeroSkipFragmentData_hero_friends
  ];
  @override
  final String wireName = 'GHeroSkipFragmentData_hero_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroSkipFragmentData_hero_friends object,
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
  GHeroSkipFragmentData_hero_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipFragmentData_hero_friendsBuilder();

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

class _$GHeroDetailDataSerializer
    implements StructuredSerializer<GHeroDetailData> {
  @override
  final Iterable<Type> types = const [GHeroDetailData, _$GHeroDetailData];
  @override
  final String wireName = 'GHeroDetailData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroDetailData object,
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
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType.nullable(GHeroDetailData_friends)])));
    }
    return result;
  }

  @override
  GHeroDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroDetailDataBuilder();

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
                const FullType.nullable(GHeroDetailData_friends)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroDetailData_friendsSerializer
    implements StructuredSerializer<GHeroDetailData_friends> {
  @override
  final Iterable<Type> types = const [
    GHeroDetailData_friends,
    _$GHeroDetailData_friends
  ];
  @override
  final String wireName = 'GHeroDetailData_friends';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroDetailData_friends object,
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
  GHeroDetailData_friends deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroDetailData_friendsBuilder();

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

class _$GHeroSkipFragmentData extends GHeroSkipFragmentData {
  @override
  final String G__typename;
  @override
  final GHeroSkipFragmentData_hero? hero;

  factory _$GHeroSkipFragmentData(
          [void Function(GHeroSkipFragmentDataBuilder)? updates]) =>
      (new GHeroSkipFragmentDataBuilder()..update(updates))._build();

  _$GHeroSkipFragmentData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroSkipFragmentData', 'G__typename');
  }

  @override
  GHeroSkipFragmentData rebuild(
          void Function(GHeroSkipFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentDataBuilder toBuilder() =>
      new GHeroSkipFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragmentData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), hero.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroSkipFragmentDataBuilder
    implements Builder<GHeroSkipFragmentData, GHeroSkipFragmentDataBuilder> {
  _$GHeroSkipFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroSkipFragmentData_heroBuilder? _hero;
  GHeroSkipFragmentData_heroBuilder get hero =>
      _$this._hero ??= new GHeroSkipFragmentData_heroBuilder();
  set hero(GHeroSkipFragmentData_heroBuilder? hero) => _$this._hero = hero;

  GHeroSkipFragmentDataBuilder() {
    GHeroSkipFragmentData._initializeBuilder(this);
  }

  GHeroSkipFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragmentData;
  }

  @override
  void update(void Function(GHeroSkipFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragmentData build() => _build();

  _$GHeroSkipFragmentData _build() {
    _$GHeroSkipFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GHeroSkipFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroSkipFragmentData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroSkipFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroSkipFragmentData_hero extends GHeroSkipFragmentData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GHeroSkipFragmentData_hero_friends?>? friends;

  factory _$GHeroSkipFragmentData_hero(
          [void Function(GHeroSkipFragmentData_heroBuilder)? updates]) =>
      (new GHeroSkipFragmentData_heroBuilder()..update(updates))._build();

  _$GHeroSkipFragmentData_hero._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroSkipFragmentData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroSkipFragmentData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroSkipFragmentData_hero', 'name');
  }

  @override
  GHeroSkipFragmentData_hero rebuild(
          void Function(GHeroSkipFragmentData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentData_heroBuilder toBuilder() =>
      new GHeroSkipFragmentData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragmentData_hero &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        friends.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroSkipFragmentData_heroBuilder
    implements
        Builder<GHeroSkipFragmentData_hero, GHeroSkipFragmentData_heroBuilder> {
  _$GHeroSkipFragmentData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GHeroSkipFragmentData_hero_friends?>? _friends;
  ListBuilder<GHeroSkipFragmentData_hero_friends?> get friends =>
      _$this._friends ??=
          new ListBuilder<GHeroSkipFragmentData_hero_friends?>();
  set friends(ListBuilder<GHeroSkipFragmentData_hero_friends?>? friends) =>
      _$this._friends = friends;

  GHeroSkipFragmentData_heroBuilder() {
    GHeroSkipFragmentData_hero._initializeBuilder(this);
  }

  GHeroSkipFragmentData_heroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipFragmentData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragmentData_hero;
  }

  @override
  void update(void Function(GHeroSkipFragmentData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragmentData_hero build() => _build();

  _$GHeroSkipFragmentData_hero _build() {
    _$GHeroSkipFragmentData_hero _$result;
    try {
      _$result = _$v ??
          new _$GHeroSkipFragmentData_hero._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroSkipFragmentData_hero', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHeroSkipFragmentData_hero', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHeroSkipFragmentData_hero', 'name'),
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroSkipFragmentData_hero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroSkipFragmentData_hero_friends
    extends GHeroSkipFragmentData_hero_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroSkipFragmentData_hero_friends(
          [void Function(GHeroSkipFragmentData_hero_friendsBuilder)?
              updates]) =>
      (new GHeroSkipFragmentData_hero_friendsBuilder()..update(updates))
          ._build();

  _$GHeroSkipFragmentData_hero_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroSkipFragmentData_hero_friends', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroSkipFragmentData_hero_friends', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroSkipFragmentData_hero_friends', 'name');
  }

  @override
  GHeroSkipFragmentData_hero_friends rebuild(
          void Function(GHeroSkipFragmentData_hero_friendsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentData_hero_friendsBuilder toBuilder() =>
      new GHeroSkipFragmentData_hero_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragmentData_hero_friends &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentData_hero_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroSkipFragmentData_hero_friendsBuilder
    implements
        Builder<GHeroSkipFragmentData_hero_friends,
            GHeroSkipFragmentData_hero_friendsBuilder> {
  _$GHeroSkipFragmentData_hero_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroSkipFragmentData_hero_friendsBuilder() {
    GHeroSkipFragmentData_hero_friends._initializeBuilder(this);
  }

  GHeroSkipFragmentData_hero_friendsBuilder get _$this {
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
  void replace(GHeroSkipFragmentData_hero_friends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragmentData_hero_friends;
  }

  @override
  void update(
      void Function(GHeroSkipFragmentData_hero_friendsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragmentData_hero_friends build() => _build();

  _$GHeroSkipFragmentData_hero_friends _build() {
    final _$result = _$v ??
        new _$GHeroSkipFragmentData_hero_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroSkipFragmentData_hero_friends', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroSkipFragmentData_hero_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroSkipFragmentData_hero_friends', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroDetailData extends GHeroDetailData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GHeroDetailData_friends?>? friends;

  factory _$GHeroDetailData([void Function(GHeroDetailDataBuilder)? updates]) =>
      (new GHeroDetailDataBuilder()..update(updates))._build();

  _$GHeroDetailData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.friends})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroDetailData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroDetailData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GHeroDetailData', 'name');
  }

  @override
  GHeroDetailData rebuild(void Function(GHeroDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroDetailDataBuilder toBuilder() =>
      new GHeroDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroDetailData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        friends.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroDetailData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('friends', friends))
        .toString();
  }
}

class GHeroDetailDataBuilder
    implements Builder<GHeroDetailData, GHeroDetailDataBuilder> {
  _$GHeroDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GHeroDetailData_friends?>? _friends;
  ListBuilder<GHeroDetailData_friends?> get friends =>
      _$this._friends ??= new ListBuilder<GHeroDetailData_friends?>();
  set friends(ListBuilder<GHeroDetailData_friends?>? friends) =>
      _$this._friends = friends;

  GHeroDetailDataBuilder() {
    GHeroDetailData._initializeBuilder(this);
  }

  GHeroDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _friends = $v.friends?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroDetailData;
  }

  @override
  void update(void Function(GHeroDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroDetailData build() => _build();

  _$GHeroDetailData _build() {
    _$GHeroDetailData _$result;
    try {
      _$result = _$v ??
          new _$GHeroDetailData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroDetailData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHeroDetailData', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHeroDetailData', 'name'),
              friends: _friends?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroDetailData_friends extends GHeroDetailData_friends {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroDetailData_friends(
          [void Function(GHeroDetailData_friendsBuilder)? updates]) =>
      (new GHeroDetailData_friendsBuilder()..update(updates))._build();

  _$GHeroDetailData_friends._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroDetailData_friends', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroDetailData_friends', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroDetailData_friends', 'name');
  }

  @override
  GHeroDetailData_friends rebuild(
          void Function(GHeroDetailData_friendsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroDetailData_friendsBuilder toBuilder() =>
      new GHeroDetailData_friendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroDetailData_friends &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroDetailData_friends')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroDetailData_friendsBuilder
    implements
        Builder<GHeroDetailData_friends, GHeroDetailData_friendsBuilder> {
  _$GHeroDetailData_friends? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroDetailData_friendsBuilder() {
    GHeroDetailData_friends._initializeBuilder(this);
  }

  GHeroDetailData_friendsBuilder get _$this {
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
  void replace(GHeroDetailData_friends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroDetailData_friends;
  }

  @override
  void update(void Function(GHeroDetailData_friendsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroDetailData_friends build() => _build();

  _$GHeroDetailData_friends _build() {
    final _$result = _$v ??
        new _$GHeroDetailData_friends._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroDetailData_friends', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroDetailData_friends', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroDetailData_friends', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
