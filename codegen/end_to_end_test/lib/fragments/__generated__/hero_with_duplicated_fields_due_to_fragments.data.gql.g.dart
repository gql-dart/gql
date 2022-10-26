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
Serializer<GheroDataData> _$gheroDataDataSerializer =
    new _$GheroDataDataSerializer();

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

class _$GheroDataDataSerializer implements StructuredSerializer<GheroDataData> {
  @override
  final Iterable<Type> types = const [GheroDataData, _$GheroDataData];
  @override
  final String wireName = 'GheroDataData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroDataData object,
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
  GheroDataData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroDataDataBuilder();

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
    return $jf($jc($jc(0, G__typename.hashCode), hero.hashCode));
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
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
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

class _$GheroDataData extends GheroDataData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GheroDataData([void Function(GheroDataDataBuilder)? updates]) =>
      (new GheroDataDataBuilder()..update(updates))._build();

  _$GheroDataData._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroDataData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GheroDataData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GheroDataData', 'name');
  }

  @override
  GheroDataData rebuild(void Function(GheroDataDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataDataBuilder toBuilder() => new GheroDataDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataData &&
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
    return (newBuiltValueToStringHelper(r'GheroDataData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GheroDataDataBuilder
    implements Builder<GheroDataData, GheroDataDataBuilder> {
  _$GheroDataData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GheroDataDataBuilder() {
    GheroDataData._initializeBuilder(this);
  }

  GheroDataDataBuilder get _$this {
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
  void replace(GheroDataData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroDataData;
  }

  @override
  void update(void Function(GheroDataDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroDataData build() => _build();

  _$GheroDataData _build() {
    final _$result = _$v ??
        new _$GheroDataData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroDataData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroDataData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroDataData', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
