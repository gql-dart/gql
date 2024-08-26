// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipData> _$gHeroSkipDataSerializer =
    new _$GHeroSkipDataSerializer();
Serializer<GHeroSkipData_hero> _$gHeroSkipDataHeroSerializer =
    new _$GHeroSkipData_heroSerializer();

class _$GHeroSkipDataSerializer implements StructuredSerializer<GHeroSkipData> {
  @override
  final Iterable<Type> types = const [GHeroSkipData, _$GHeroSkipData];
  @override
  final String wireName = 'GHeroSkipData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroSkipData object,
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
            specifiedType: const FullType(GHeroSkipData_hero)));
    }
    return result;
  }

  @override
  GHeroSkipData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipDataBuilder();

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
                  specifiedType: const FullType(GHeroSkipData_hero))!
              as GHeroSkipData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroSkipData_heroSerializer
    implements StructuredSerializer<GHeroSkipData_hero> {
  @override
  final Iterable<Type> types = const [GHeroSkipData_hero, _$GHeroSkipData_hero];
  @override
  final String wireName = 'GHeroSkipData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroSkipData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GHeroSkipData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipData_heroBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroSkipData extends GHeroSkipData {
  @override
  final String G__typename;
  @override
  final GHeroSkipData_hero? hero;

  factory _$GHeroSkipData([void Function(GHeroSkipDataBuilder)? updates]) =>
      (new GHeroSkipDataBuilder()..update(updates))._build();

  _$GHeroSkipData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroSkipData', 'G__typename');
  }

  @override
  GHeroSkipData rebuild(void Function(GHeroSkipDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipDataBuilder toBuilder() => new GHeroSkipDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipData &&
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
    return (newBuiltValueToStringHelper(r'GHeroSkipData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroSkipDataBuilder
    implements Builder<GHeroSkipData, GHeroSkipDataBuilder> {
  _$GHeroSkipData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroSkipData_heroBuilder? _hero;
  GHeroSkipData_heroBuilder get hero =>
      _$this._hero ??= new GHeroSkipData_heroBuilder();
  set hero(GHeroSkipData_heroBuilder? hero) => _$this._hero = hero;

  GHeroSkipDataBuilder() {
    GHeroSkipData._initializeBuilder(this);
  }

  GHeroSkipDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipData;
  }

  @override
  void update(void Function(GHeroSkipDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipData build() => _build();

  _$GHeroSkipData _build() {
    _$GHeroSkipData _$result;
    try {
      _$result = _$v ??
          new _$GHeroSkipData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroSkipData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroSkipData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroSkipData_hero extends GHeroSkipData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? name;

  factory _$GHeroSkipData_hero(
          [void Function(GHeroSkipData_heroBuilder)? updates]) =>
      (new GHeroSkipData_heroBuilder()..update(updates))._build();

  _$GHeroSkipData_hero._(
      {required this.G__typename, required this.id, this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroSkipData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroSkipData_hero', 'id');
  }

  @override
  GHeroSkipData_hero rebuild(
          void Function(GHeroSkipData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipData_heroBuilder toBuilder() =>
      new GHeroSkipData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipData_hero &&
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
    return (newBuiltValueToStringHelper(r'GHeroSkipData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroSkipData_heroBuilder
    implements Builder<GHeroSkipData_hero, GHeroSkipData_heroBuilder> {
  _$GHeroSkipData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroSkipData_heroBuilder() {
    GHeroSkipData_hero._initializeBuilder(this);
  }

  GHeroSkipData_heroBuilder get _$this {
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
  void replace(GHeroSkipData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipData_hero;
  }

  @override
  void update(void Function(GHeroSkipData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipData_hero build() => _build();

  _$GHeroSkipData_hero _build() {
    final _$result = _$v ??
        new _$GHeroSkipData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroSkipData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroSkipData_hero', 'id'),
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
