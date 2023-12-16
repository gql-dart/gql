// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_include.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroIncludeData> _$gHeroIncludeDataSerializer =
    new _$GHeroIncludeDataSerializer();
Serializer<GHeroIncludeData_hero> _$gHeroIncludeDataHeroSerializer =
    new _$GHeroIncludeData_heroSerializer();

class _$GHeroIncludeDataSerializer
    implements StructuredSerializer<GHeroIncludeData> {
  @override
  final Iterable<Type> types = const [GHeroIncludeData, _$GHeroIncludeData];
  @override
  final String wireName = 'GHeroIncludeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroIncludeData object,
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
            specifiedType: const FullType(GHeroIncludeData_hero)));
    }
    return result;
  }

  @override
  GHeroIncludeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroIncludeDataBuilder();

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
                  specifiedType: const FullType(GHeroIncludeData_hero))!
              as GHeroIncludeData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroIncludeData_heroSerializer
    implements StructuredSerializer<GHeroIncludeData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroIncludeData_hero,
    _$GHeroIncludeData_hero
  ];
  @override
  final String wireName = 'GHeroIncludeData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroIncludeData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHeroIncludeData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroIncludeData_heroBuilder();

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
              specifiedType: const FullType(String)) as String?;
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

class _$GHeroIncludeData extends GHeroIncludeData {
  @override
  final String G__typename;
  @override
  final GHeroIncludeData_hero? hero;

  factory _$GHeroIncludeData(
          [void Function(GHeroIncludeDataBuilder)? updates]) =>
      (new GHeroIncludeDataBuilder()..update(updates))._build();

  _$GHeroIncludeData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroIncludeData', 'G__typename');
  }

  @override
  GHeroIncludeData rebuild(void Function(GHeroIncludeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroIncludeDataBuilder toBuilder() =>
      new GHeroIncludeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroIncludeData &&
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
    return (newBuiltValueToStringHelper(r'GHeroIncludeData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroIncludeDataBuilder
    implements Builder<GHeroIncludeData, GHeroIncludeDataBuilder> {
  _$GHeroIncludeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroIncludeData_heroBuilder? _hero;
  GHeroIncludeData_heroBuilder get hero =>
      _$this._hero ??= new GHeroIncludeData_heroBuilder();
  set hero(GHeroIncludeData_heroBuilder? hero) => _$this._hero = hero;

  GHeroIncludeDataBuilder() {
    GHeroIncludeData._initializeBuilder(this);
  }

  GHeroIncludeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroIncludeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroIncludeData;
  }

  @override
  void update(void Function(GHeroIncludeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroIncludeData build() => _build();

  _$GHeroIncludeData _build() {
    _$GHeroIncludeData _$result;
    try {
      _$result = _$v ??
          new _$GHeroIncludeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroIncludeData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroIncludeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroIncludeData_hero extends GHeroIncludeData_hero {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String name;

  factory _$GHeroIncludeData_hero(
          [void Function(GHeroIncludeData_heroBuilder)? updates]) =>
      (new GHeroIncludeData_heroBuilder()..update(updates))._build();

  _$GHeroIncludeData_hero._(
      {required this.G__typename, this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroIncludeData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroIncludeData_hero', 'name');
  }

  @override
  GHeroIncludeData_hero rebuild(
          void Function(GHeroIncludeData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroIncludeData_heroBuilder toBuilder() =>
      new GHeroIncludeData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroIncludeData_hero &&
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
    return (newBuiltValueToStringHelper(r'GHeroIncludeData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroIncludeData_heroBuilder
    implements Builder<GHeroIncludeData_hero, GHeroIncludeData_heroBuilder> {
  _$GHeroIncludeData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroIncludeData_heroBuilder() {
    GHeroIncludeData_hero._initializeBuilder(this);
  }

  GHeroIncludeData_heroBuilder get _$this {
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
  void replace(GHeroIncludeData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroIncludeData_hero;
  }

  @override
  void update(void Function(GHeroIncludeData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroIncludeData_hero build() => _build();

  _$GHeroIncludeData_hero _build() {
    final _$result = _$v ??
        new _$GHeroIncludeData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroIncludeData_hero', 'G__typename'),
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroIncludeData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
