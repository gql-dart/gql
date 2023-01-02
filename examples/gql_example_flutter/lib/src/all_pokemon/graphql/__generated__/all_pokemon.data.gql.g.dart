// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemonData> _$gAllPokemonDataSerializer =
    new _$GAllPokemonDataSerializer();
Serializer<GAllPokemonData_pokemons> _$gAllPokemonDataPokemonsSerializer =
    new _$GAllPokemonData_pokemonsSerializer();

class _$GAllPokemonDataSerializer
    implements StructuredSerializer<GAllPokemonData> {
  @override
  final Iterable<Type> types = const [GAllPokemonData, _$GAllPokemonData];
  @override
  final String wireName = 'GAllPokemonData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pokemons;
    if (value != null) {
      result
        ..add('pokemons')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType.nullable(GAllPokemonData_pokemons)])));
    }
    return result;
  }

  @override
  GAllPokemonData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonDataBuilder();

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
        case 'pokemons':
          result.pokemons.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GAllPokemonData_pokemons)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonData_pokemonsSerializer
    implements StructuredSerializer<GAllPokemonData_pokemons> {
  @override
  final Iterable<Type> types = const [
    GAllPokemonData_pokemons,
    _$GAllPokemonData_pokemons
  ];
  @override
  final String wireName = 'GAllPokemonData_pokemons';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllPokemonData_pokemons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.maxHP;
    if (value != null) {
      result
        ..add('maxHP')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  GAllPokemonData_pokemons deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonData_pokemonsBuilder();

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
        case 'maxHP':
          result.maxHP = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$GAllPokemonData extends GAllPokemonData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAllPokemonData_pokemons?>? pokemons;

  factory _$GAllPokemonData([void Function(GAllPokemonDataBuilder)? updates]) =>
      (new GAllPokemonDataBuilder()..update(updates))._build();

  _$GAllPokemonData._({required this.G__typename, this.pokemons}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData', 'G__typename');
  }

  @override
  GAllPokemonData rebuild(void Function(GAllPokemonDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonDataBuilder toBuilder() =>
      new GAllPokemonDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData &&
        G__typename == other.G__typename &&
        pokemons == other.pokemons;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), pokemons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonData')
          ..add('G__typename', G__typename)
          ..add('pokemons', pokemons))
        .toString();
  }
}

class GAllPokemonDataBuilder
    implements Builder<GAllPokemonData, GAllPokemonDataBuilder> {
  _$GAllPokemonData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAllPokemonData_pokemons?>? _pokemons;
  ListBuilder<GAllPokemonData_pokemons?> get pokemons =>
      _$this._pokemons ??= new ListBuilder<GAllPokemonData_pokemons?>();
  set pokemons(ListBuilder<GAllPokemonData_pokemons?>? pokemons) =>
      _$this._pokemons = pokemons;

  GAllPokemonDataBuilder() {
    GAllPokemonData._initializeBuilder(this);
  }

  GAllPokemonDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemons = $v.pokemons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData;
  }

  @override
  void update(void Function(GAllPokemonDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData build() => _build();

  _$GAllPokemonData _build() {
    _$GAllPokemonData _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemonData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAllPokemonData', 'G__typename'),
              pokemons: _pokemons?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemons';
        _pokemons?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAllPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllPokemonData_pokemons extends GAllPokemonData_pokemons {
  @override
  final String G__typename;
  @override
  final int? maxHP;
  @override
  final String? image;
  @override
  final String id;
  @override
  final String? name;

  factory _$GAllPokemonData_pokemons(
          [void Function(GAllPokemonData_pokemonsBuilder)? updates]) =>
      (new GAllPokemonData_pokemonsBuilder()..update(updates))._build();

  _$GAllPokemonData_pokemons._(
      {required this.G__typename,
      this.maxHP,
      this.image,
      required this.id,
      this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllPokemonData_pokemons', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAllPokemonData_pokemons', 'id');
  }

  @override
  GAllPokemonData_pokemons rebuild(
          void Function(GAllPokemonData_pokemonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonData_pokemonsBuilder toBuilder() =>
      new GAllPokemonData_pokemonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonData_pokemons &&
        G__typename == other.G__typename &&
        maxHP == other.maxHP &&
        image == other.image &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), maxHP.hashCode),
                image.hashCode),
            id.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonData_pokemons')
          ..add('G__typename', G__typename)
          ..add('maxHP', maxHP)
          ..add('image', image)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GAllPokemonData_pokemonsBuilder
    implements
        Builder<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder> {
  _$GAllPokemonData_pokemons? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _maxHP;
  int? get maxHP => _$this._maxHP;
  set maxHP(int? maxHP) => _$this._maxHP = maxHP;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GAllPokemonData_pokemonsBuilder() {
    GAllPokemonData_pokemons._initializeBuilder(this);
  }

  GAllPokemonData_pokemonsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _maxHP = $v.maxHP;
      _image = $v.image;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonData_pokemons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonData_pokemons;
  }

  @override
  void update(void Function(GAllPokemonData_pokemonsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonData_pokemons build() => _build();

  _$GAllPokemonData_pokemons _build() {
    final _$result = _$v ??
        new _$GAllPokemonData_pokemons._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAllPokemonData_pokemons', 'G__typename'),
            maxHP: maxHP,
            image: image,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAllPokemonData_pokemons', 'id'),
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
