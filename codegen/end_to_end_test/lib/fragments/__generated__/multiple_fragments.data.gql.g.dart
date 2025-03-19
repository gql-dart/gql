// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWith2FragmentsData> _$gHeroWith2FragmentsDataSerializer =
    new _$GHeroWith2FragmentsDataSerializer();
Serializer<GHeroWith2FragmentsData_hero>
    _$gHeroWith2FragmentsDataHeroSerializer =
    new _$GHeroWith2FragmentsData_heroSerializer();
Serializer<GheroNameData> _$gheroNameDataSerializer =
    new _$GheroNameDataSerializer();
Serializer<GheroIdData> _$gheroIdDataSerializer = new _$GheroIdDataSerializer();

class _$GHeroWith2FragmentsDataSerializer
    implements StructuredSerializer<GHeroWith2FragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWith2FragmentsData,
    _$GHeroWith2FragmentsData
  ];
  @override
  final String wireName = 'GHeroWith2FragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWith2FragmentsData object,
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
            specifiedType: const FullType(GHeroWith2FragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWith2FragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWith2FragmentsDataBuilder();

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
                  specifiedType: const FullType(GHeroWith2FragmentsData_hero))!
              as GHeroWith2FragmentsData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWith2FragmentsData_heroSerializer
    implements StructuredSerializer<GHeroWith2FragmentsData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroWith2FragmentsData_hero,
    _$GHeroWith2FragmentsData_hero
  ];
  @override
  final String wireName = 'GHeroWith2FragmentsData_hero';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWith2FragmentsData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'G__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWith2FragmentsData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWith2FragmentsData_heroBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'G__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroNameDataSerializer implements StructuredSerializer<GheroNameData> {
  @override
  final Iterable<Type> types = const [GheroNameData, _$GheroNameData];
  @override
  final String wireName = 'GheroNameData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroNameData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'G__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroNameData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroNameDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'G__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroIdDataSerializer implements StructuredSerializer<GheroIdData> {
  @override
  final Iterable<Type> types = const [GheroIdData, _$GheroIdData];
  @override
  final String wireName = 'GheroIdData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'G__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroIdData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroIdDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'G__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWith2FragmentsData extends GHeroWith2FragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWith2FragmentsData_hero? hero;

  factory _$GHeroWith2FragmentsData(
          [void Function(GHeroWith2FragmentsDataBuilder)? updates]) =>
      (new GHeroWith2FragmentsDataBuilder()..update(updates))._build();

  _$GHeroWith2FragmentsData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWith2FragmentsData', 'G__typename');
  }

  @override
  GHeroWith2FragmentsData rebuild(
          void Function(GHeroWith2FragmentsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWith2FragmentsDataBuilder toBuilder() =>
      new GHeroWith2FragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWith2FragmentsData &&
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
    return (newBuiltValueToStringHelper(r'GHeroWith2FragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWith2FragmentsDataBuilder
    implements
        Builder<GHeroWith2FragmentsData, GHeroWith2FragmentsDataBuilder> {
  _$GHeroWith2FragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWith2FragmentsData_heroBuilder? _hero;
  GHeroWith2FragmentsData_heroBuilder get hero =>
      _$this._hero ??= new GHeroWith2FragmentsData_heroBuilder();
  set hero(GHeroWith2FragmentsData_heroBuilder? hero) => _$this._hero = hero;

  GHeroWith2FragmentsDataBuilder() {
    GHeroWith2FragmentsData._initializeBuilder(this);
  }

  GHeroWith2FragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWith2FragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWith2FragmentsData;
  }

  @override
  void update(void Function(GHeroWith2FragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWith2FragmentsData build() => _build();

  _$GHeroWith2FragmentsData _build() {
    _$GHeroWith2FragmentsData _$result;
    try {
      _$result = _$v ??
          new _$GHeroWith2FragmentsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroWith2FragmentsData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWith2FragmentsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWith2FragmentsData_hero extends GHeroWith2FragmentsData_hero {
  @override
  final String name;
  @override
  final String id;
  @override
  final String G__typename;

  factory _$GHeroWith2FragmentsData_hero(
          [void Function(GHeroWith2FragmentsData_heroBuilder)? updates]) =>
      (new GHeroWith2FragmentsData_heroBuilder()..update(updates))._build();

  _$GHeroWith2FragmentsData_hero._(
      {required this.name, required this.id, required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWith2FragmentsData_hero', 'name');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWith2FragmentsData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWith2FragmentsData_hero', 'G__typename');
  }

  @override
  GHeroWith2FragmentsData_hero rebuild(
          void Function(GHeroWith2FragmentsData_heroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWith2FragmentsData_heroBuilder toBuilder() =>
      new GHeroWith2FragmentsData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWith2FragmentsData_hero &&
        name == other.name &&
        id == other.id &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWith2FragmentsData_hero')
          ..add('name', name)
          ..add('id', id)
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GHeroWith2FragmentsData_heroBuilder
    implements
        Builder<GHeroWith2FragmentsData_hero,
            GHeroWith2FragmentsData_heroBuilder> {
  _$GHeroWith2FragmentsData_hero? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWith2FragmentsData_heroBuilder();

  GHeroWith2FragmentsData_heroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _id = $v.id;
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWith2FragmentsData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWith2FragmentsData_hero;
  }

  @override
  void update(void Function(GHeroWith2FragmentsData_heroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWith2FragmentsData_hero build() => _build();

  _$GHeroWith2FragmentsData_hero _build() {
    final _$result = _$v ??
        new _$GHeroWith2FragmentsData_hero._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWith2FragmentsData_hero', 'name'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWith2FragmentsData_hero', 'id'),
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroWith2FragmentsData_hero', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroNameData extends GheroNameData {
  @override
  final String name;
  @override
  final String G__typename;

  factory _$GheroNameData([void Function(GheroNameDataBuilder)? updates]) =>
      (new GheroNameDataBuilder()..update(updates))._build();

  _$GheroNameData._({required this.name, required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GheroNameData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroNameData', 'G__typename');
  }

  @override
  GheroNameData rebuild(void Function(GheroNameDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroNameDataBuilder toBuilder() => new GheroNameDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroNameData &&
        name == other.name &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroNameData')
          ..add('name', name)
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GheroNameDataBuilder
    implements Builder<GheroNameData, GheroNameDataBuilder> {
  _$GheroNameData? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GheroNameDataBuilder();

  GheroNameDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroNameData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroNameData;
  }

  @override
  void update(void Function(GheroNameDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroNameData build() => _build();

  _$GheroNameData _build() {
    final _$result = _$v ??
        new _$GheroNameData._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroNameData', 'name'),
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroNameData', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroIdData extends GheroIdData {
  @override
  final String id;
  @override
  final String G__typename;

  factory _$GheroIdData([void Function(GheroIdDataBuilder)? updates]) =>
      (new GheroIdDataBuilder()..update(updates))._build();

  _$GheroIdData._({required this.id, required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GheroIdData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroIdData', 'G__typename');
  }

  @override
  GheroIdData rebuild(void Function(GheroIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroIdDataBuilder toBuilder() => new GheroIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroIdData &&
        id == other.id &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroIdData')
          ..add('id', id)
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GheroIdDataBuilder implements Builder<GheroIdData, GheroIdDataBuilder> {
  _$GheroIdData? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GheroIdDataBuilder();

  GheroIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroIdData;
  }

  @override
  void update(void Function(GheroIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroIdData build() => _build();

  _$GheroIdData _build() {
    final _$result = _$v ??
        new _$GheroIdData._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'GheroIdData', 'id'),
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroIdData', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
