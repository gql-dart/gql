// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_duplicated_fields_due_to_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsDuplicationData>
    _$gHeroWithFragmentsDuplicationDataSerializer =
    new _$GHeroWithFragmentsDuplicationDataSerializer();
Serializer<GHeroWithFragmentsDuplicationData_hero>
    _$gHeroWithFragmentsDuplicationDataHeroSerializer =
    new _$GHeroWithFragmentsDuplicationData_heroSerializer();
Serializer<GHeroWithFragmentsDuplicationFragmentData>
    _$gHeroWithFragmentsDuplicationFragmentDataSerializer =
    new _$GHeroWithFragmentsDuplicationFragmentDataSerializer();

class _$GHeroWithFragmentsDuplicationDataSerializer
    implements StructuredSerializer<GHeroWithFragmentsDuplicationData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsDuplicationData,
    _$GHeroWithFragmentsDuplicationData
  ];
  @override
  final String wireName = 'GHeroWithFragmentsDuplicationData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsDuplicationData object,
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
                const FullType(GHeroWithFragmentsDuplicationData_hero)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsDuplicationData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDuplicationDataBuilder();

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
                  specifiedType:
                      const FullType(GHeroWithFragmentsDuplicationData_hero))!
              as GHeroWithFragmentsDuplicationData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsDuplicationData_heroSerializer
    implements StructuredSerializer<GHeroWithFragmentsDuplicationData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsDuplicationData_hero,
    _$GHeroWithFragmentsDuplicationData_hero
  ];
  @override
  final String wireName = 'GHeroWithFragmentsDuplicationData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsDuplicationData_hero object,
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
  GHeroWithFragmentsDuplicationData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDuplicationData_heroBuilder();

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

class _$GHeroWithFragmentsDuplicationFragmentDataSerializer
    implements StructuredSerializer<GHeroWithFragmentsDuplicationFragmentData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsDuplicationFragmentData,
    _$GHeroWithFragmentsDuplicationFragmentData
  ];
  @override
  final String wireName = 'GHeroWithFragmentsDuplicationFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsDuplicationFragmentData object,
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
  GHeroWithFragmentsDuplicationFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDuplicationFragmentDataBuilder();

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

class _$GHeroWithFragmentsDuplicationData
    extends GHeroWithFragmentsDuplicationData {
  @override
  final String G__typename;
  @override
  final GHeroWithFragmentsDuplicationData_hero? hero;

  factory _$GHeroWithFragmentsDuplicationData(
          [void Function(GHeroWithFragmentsDuplicationDataBuilder)? updates]) =>
      (new GHeroWithFragmentsDuplicationDataBuilder()..update(updates))
          ._build();

  _$GHeroWithFragmentsDuplicationData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithFragmentsDuplicationData', 'G__typename');
  }

  @override
  GHeroWithFragmentsDuplicationData rebuild(
          void Function(GHeroWithFragmentsDuplicationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDuplicationDataBuilder toBuilder() =>
      new GHeroWithFragmentsDuplicationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsDuplicationData &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsDuplicationData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithFragmentsDuplicationDataBuilder
    implements
        Builder<GHeroWithFragmentsDuplicationData,
            GHeroWithFragmentsDuplicationDataBuilder> {
  _$GHeroWithFragmentsDuplicationData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithFragmentsDuplicationData_heroBuilder? _hero;
  GHeroWithFragmentsDuplicationData_heroBuilder get hero =>
      _$this._hero ??= new GHeroWithFragmentsDuplicationData_heroBuilder();
  set hero(GHeroWithFragmentsDuplicationData_heroBuilder? hero) =>
      _$this._hero = hero;

  GHeroWithFragmentsDuplicationDataBuilder() {
    GHeroWithFragmentsDuplicationData._initializeBuilder(this);
  }

  GHeroWithFragmentsDuplicationDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsDuplicationData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsDuplicationData;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsDuplicationDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsDuplicationData build() => _build();

  _$GHeroWithFragmentsDuplicationData _build() {
    _$GHeroWithFragmentsDuplicationData _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsDuplicationData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GHeroWithFragmentsDuplicationData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsDuplicationData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsDuplicationData_hero
    extends GHeroWithFragmentsDuplicationData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithFragmentsDuplicationData_hero(
          [void Function(GHeroWithFragmentsDuplicationData_heroBuilder)?
              updates]) =>
      (new GHeroWithFragmentsDuplicationData_heroBuilder()..update(updates))
          ._build();

  _$GHeroWithFragmentsDuplicationData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithFragmentsDuplicationData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithFragmentsDuplicationData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithFragmentsDuplicationData_hero', 'name');
  }

  @override
  GHeroWithFragmentsDuplicationData_hero rebuild(
          void Function(GHeroWithFragmentsDuplicationData_heroBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDuplicationData_heroBuilder toBuilder() =>
      new GHeroWithFragmentsDuplicationData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsDuplicationData_hero &&
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
            r'GHeroWithFragmentsDuplicationData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithFragmentsDuplicationData_heroBuilder
    implements
        Builder<GHeroWithFragmentsDuplicationData_hero,
            GHeroWithFragmentsDuplicationData_heroBuilder> {
  _$GHeroWithFragmentsDuplicationData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithFragmentsDuplicationData_heroBuilder() {
    GHeroWithFragmentsDuplicationData_hero._initializeBuilder(this);
  }

  GHeroWithFragmentsDuplicationData_heroBuilder get _$this {
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
  void replace(GHeroWithFragmentsDuplicationData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsDuplicationData_hero;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsDuplicationData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsDuplicationData_hero build() => _build();

  _$GHeroWithFragmentsDuplicationData_hero _build() {
    final _$result = _$v ??
        new _$GHeroWithFragmentsDuplicationData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithFragmentsDuplicationData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWithFragmentsDuplicationData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWithFragmentsDuplicationData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithFragmentsDuplicationFragmentData
    extends GHeroWithFragmentsDuplicationFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithFragmentsDuplicationFragmentData(
          [void Function(GHeroWithFragmentsDuplicationFragmentDataBuilder)?
              updates]) =>
      (new GHeroWithFragmentsDuplicationFragmentDataBuilder()..update(updates))
          ._build();

  _$GHeroWithFragmentsDuplicationFragmentData._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithFragmentsDuplicationFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithFragmentsDuplicationFragmentData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithFragmentsDuplicationFragmentData', 'name');
  }

  @override
  GHeroWithFragmentsDuplicationFragmentData rebuild(
          void Function(GHeroWithFragmentsDuplicationFragmentDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDuplicationFragmentDataBuilder toBuilder() =>
      new GHeroWithFragmentsDuplicationFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsDuplicationFragmentData &&
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
            r'GHeroWithFragmentsDuplicationFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithFragmentsDuplicationFragmentDataBuilder
    implements
        Builder<GHeroWithFragmentsDuplicationFragmentData,
            GHeroWithFragmentsDuplicationFragmentDataBuilder> {
  _$GHeroWithFragmentsDuplicationFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithFragmentsDuplicationFragmentDataBuilder() {
    GHeroWithFragmentsDuplicationFragmentData._initializeBuilder(this);
  }

  GHeroWithFragmentsDuplicationFragmentDataBuilder get _$this {
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
  void replace(GHeroWithFragmentsDuplicationFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsDuplicationFragmentData;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsDuplicationFragmentDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsDuplicationFragmentData build() => _build();

  _$GHeroWithFragmentsDuplicationFragmentData _build() {
    final _$result = _$v ??
        new _$GHeroWithFragmentsDuplicationFragmentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithFragmentsDuplicationFragmentData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWithFragmentsDuplicationFragmentData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWithFragmentsDuplicationFragmentData', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
