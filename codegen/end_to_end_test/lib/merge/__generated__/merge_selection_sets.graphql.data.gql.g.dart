// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeData> _$gHeroMergeDataSerializer =
    new _$GHeroMergeDataSerializer();
Serializer<GHeroMergeData_hero> _$gHeroMergeDataHeroSerializer =
    new _$GHeroMergeData_heroSerializer();

class _$GHeroMergeDataSerializer
    implements StructuredSerializer<GHeroMergeData> {
  @override
  final Iterable<Type> types = const [GHeroMergeData, _$GHeroMergeData];
  @override
  final String wireName = 'GHeroMergeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroMergeData object,
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
            specifiedType: const FullType(GHeroMergeData_hero)));
    }
    return result;
  }

  @override
  GHeroMergeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeDataBuilder();

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
                  specifiedType: const FullType(GHeroMergeData_hero))!
              as GHeroMergeData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroMergeData_heroSerializer
    implements StructuredSerializer<GHeroMergeData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroMergeData_hero,
    _$GHeroMergeData_hero
  ];
  @override
  final String wireName = 'GHeroMergeData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroMergeData_hero object,
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
  GHeroMergeData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeData_heroBuilder();

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

class _$GHeroMergeData extends GHeroMergeData {
  @override
  final String G__typename;
  @override
  final GHeroMergeData_hero? hero;

  factory _$GHeroMergeData([void Function(GHeroMergeDataBuilder)? updates]) =>
      (new GHeroMergeDataBuilder()..update(updates))._build();

  _$GHeroMergeData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroMergeData', 'G__typename');
  }

  @override
  GHeroMergeData rebuild(void Function(GHeroMergeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeDataBuilder toBuilder() =>
      new GHeroMergeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeData &&
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
    return (newBuiltValueToStringHelper(r'GHeroMergeData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroMergeDataBuilder
    implements Builder<GHeroMergeData, GHeroMergeDataBuilder> {
  _$GHeroMergeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroMergeData_heroBuilder? _hero;
  GHeroMergeData_heroBuilder get hero =>
      _$this._hero ??= new GHeroMergeData_heroBuilder();
  set hero(GHeroMergeData_heroBuilder? hero) => _$this._hero = hero;

  GHeroMergeDataBuilder() {
    GHeroMergeData._initializeBuilder(this);
  }

  GHeroMergeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMergeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeData;
  }

  @override
  void update(void Function(GHeroMergeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeData build() => _build();

  _$GHeroMergeData _build() {
    _$GHeroMergeData _$result;
    try {
      _$result = _$v ??
          new _$GHeroMergeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroMergeData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroMergeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroMergeData_hero extends GHeroMergeData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroMergeData_hero(
          [void Function(GHeroMergeData_heroBuilder)? updates]) =>
      (new GHeroMergeData_heroBuilder()..update(updates))._build();

  _$GHeroMergeData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroMergeData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroMergeData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GHeroMergeData_hero', 'name');
  }

  @override
  GHeroMergeData_hero rebuild(
          void Function(GHeroMergeData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeData_heroBuilder toBuilder() =>
      new GHeroMergeData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeData_hero &&
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
    return (newBuiltValueToStringHelper(r'GHeroMergeData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroMergeData_heroBuilder
    implements Builder<GHeroMergeData_hero, GHeroMergeData_heroBuilder> {
  _$GHeroMergeData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroMergeData_heroBuilder() {
    GHeroMergeData_hero._initializeBuilder(this);
  }

  GHeroMergeData_heroBuilder get _$this {
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
  void replace(GHeroMergeData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeData_hero;
  }

  @override
  void update(void Function(GHeroMergeData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeData_hero build() => _build();

  _$GHeroMergeData_hero _build() {
    final _$result = _$v ??
        new _$GHeroMergeData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroMergeData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroMergeData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroMergeData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
