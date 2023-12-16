// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql_skip.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeSkipData> _$gHeroMergeSkipDataSerializer =
    new _$GHeroMergeSkipDataSerializer();
Serializer<GHeroMergeSkipData_hero> _$gHeroMergeSkipDataHeroSerializer =
    new _$GHeroMergeSkipData_heroSerializer();

class _$GHeroMergeSkipDataSerializer
    implements StructuredSerializer<GHeroMergeSkipData> {
  @override
  final Iterable<Type> types = const [GHeroMergeSkipData, _$GHeroMergeSkipData];
  @override
  final String wireName = 'GHeroMergeSkipData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroMergeSkipData object,
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
            specifiedType: const FullType(GHeroMergeSkipData_hero)));
    }
    return result;
  }

  @override
  GHeroMergeSkipData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeSkipDataBuilder();

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
                  specifiedType: const FullType(GHeroMergeSkipData_hero))!
              as GHeroMergeSkipData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroMergeSkipData_heroSerializer
    implements StructuredSerializer<GHeroMergeSkipData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroMergeSkipData_hero,
    _$GHeroMergeSkipData_hero
  ];
  @override
  final String wireName = 'GHeroMergeSkipData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroMergeSkipData_hero object,
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
  GHeroMergeSkipData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeSkipData_heroBuilder();

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

class _$GHeroMergeSkipData extends GHeroMergeSkipData {
  @override
  final String G__typename;
  @override
  final GHeroMergeSkipData_hero? hero;

  factory _$GHeroMergeSkipData(
          [void Function(GHeroMergeSkipDataBuilder)? updates]) =>
      (new GHeroMergeSkipDataBuilder()..update(updates))._build();

  _$GHeroMergeSkipData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroMergeSkipData', 'G__typename');
  }

  @override
  GHeroMergeSkipData rebuild(
          void Function(GHeroMergeSkipDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeSkipDataBuilder toBuilder() =>
      new GHeroMergeSkipDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeSkipData &&
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
    return (newBuiltValueToStringHelper(r'GHeroMergeSkipData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroMergeSkipDataBuilder
    implements Builder<GHeroMergeSkipData, GHeroMergeSkipDataBuilder> {
  _$GHeroMergeSkipData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroMergeSkipData_heroBuilder? _hero;
  GHeroMergeSkipData_heroBuilder get hero =>
      _$this._hero ??= new GHeroMergeSkipData_heroBuilder();
  set hero(GHeroMergeSkipData_heroBuilder? hero) => _$this._hero = hero;

  GHeroMergeSkipDataBuilder() {
    GHeroMergeSkipData._initializeBuilder(this);
  }

  GHeroMergeSkipDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMergeSkipData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeSkipData;
  }

  @override
  void update(void Function(GHeroMergeSkipDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeSkipData build() => _build();

  _$GHeroMergeSkipData _build() {
    _$GHeroMergeSkipData _$result;
    try {
      _$result = _$v ??
          new _$GHeroMergeSkipData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroMergeSkipData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroMergeSkipData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroMergeSkipData_hero extends GHeroMergeSkipData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroMergeSkipData_hero(
          [void Function(GHeroMergeSkipData_heroBuilder)? updates]) =>
      (new GHeroMergeSkipData_heroBuilder()..update(updates))._build();

  _$GHeroMergeSkipData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroMergeSkipData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHeroMergeSkipData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroMergeSkipData_hero', 'name');
  }

  @override
  GHeroMergeSkipData_hero rebuild(
          void Function(GHeroMergeSkipData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeSkipData_heroBuilder toBuilder() =>
      new GHeroMergeSkipData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeSkipData_hero &&
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
    return (newBuiltValueToStringHelper(r'GHeroMergeSkipData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroMergeSkipData_heroBuilder
    implements
        Builder<GHeroMergeSkipData_hero, GHeroMergeSkipData_heroBuilder> {
  _$GHeroMergeSkipData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroMergeSkipData_heroBuilder() {
    GHeroMergeSkipData_hero._initializeBuilder(this);
  }

  GHeroMergeSkipData_heroBuilder get _$this {
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
  void replace(GHeroMergeSkipData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeSkipData_hero;
  }

  @override
  void update(void Function(GHeroMergeSkipData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeSkipData_hero build() => _build();

  _$GHeroMergeSkipData_hero _build() {
    final _$result = _$v ??
        new _$GHeroMergeSkipData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroMergeSkipData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroMergeSkipData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroMergeSkipData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
