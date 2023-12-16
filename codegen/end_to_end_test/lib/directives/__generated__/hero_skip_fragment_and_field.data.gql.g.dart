// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip_fragment_and_field.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipFragmentData> _$gHeroSkipFragmentDataSerializer =
    new _$GHeroSkipFragmentDataSerializer();
Serializer<GHeroSkipFragmentData_hero> _$gHeroSkipFragmentDataHeroSerializer =
    new _$GHeroSkipFragmentData_heroSerializer();
Serializer<GHeroDetailData> _$gHeroDetailDataSerializer =
    new _$GHeroDetailDataSerializer();

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
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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

  factory _$GHeroSkipFragmentData_hero(
          [void Function(GHeroSkipFragmentData_heroBuilder)? updates]) =>
      (new GHeroSkipFragmentData_heroBuilder()..update(updates))._build();

  _$GHeroSkipFragmentData_hero._(
      {required this.G__typename, required this.id, required this.name})
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
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
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

  GHeroSkipFragmentData_heroBuilder() {
    GHeroSkipFragmentData_hero._initializeBuilder(this);
  }

  GHeroSkipFragmentData_heroBuilder get _$this {
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
    final _$result = _$v ??
        new _$GHeroSkipFragmentData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroSkipFragmentData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroSkipFragmentData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroSkipFragmentData_hero', 'name'));
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

  factory _$GHeroDetailData([void Function(GHeroDetailDataBuilder)? updates]) =>
      (new GHeroDetailDataBuilder()..update(updates))._build();

  _$GHeroDetailData._(
      {required this.G__typename, required this.id, required this.name})
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
    return (newBuiltValueToStringHelper(r'GHeroDetailData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
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

  GHeroDetailDataBuilder() {
    GHeroDetailData._initializeBuilder(this);
  }

  GHeroDetailDataBuilder get _$this {
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
    final _$result = _$v ??
        new _$GHeroDetailData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroDetailData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroDetailData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroDetailData', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint