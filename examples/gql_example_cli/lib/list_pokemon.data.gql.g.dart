// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GListPokemonData> _$gListPokemonDataSerializer =
    new _$GListPokemonDataSerializer();
Serializer<GListPokemonData_pokemons> _$gListPokemonDataPokemonsSerializer =
    new _$GListPokemonData_pokemonsSerializer();

class _$GListPokemonDataSerializer
    implements StructuredSerializer<GListPokemonData> {
  @override
  final Iterable<Type> types = const [GListPokemonData, _$GListPokemonData];
  @override
  final String wireName = 'GListPokemonData';

  @override
  Iterable<Object> serialize(Serializers serializers, GListPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.pokemons != null) {
      result
        ..add('pokemons')
        ..add(serializers.serialize(object.pokemons,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GListPokemonData_pokemons)])));
    }
    return result;
  }

  @override
  GListPokemonData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GListPokemonDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pokemons':
          result.pokemons.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GListPokemonData_pokemons)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GListPokemonData_pokemonsSerializer
    implements StructuredSerializer<GListPokemonData_pokemons> {
  @override
  final Iterable<Type> types = const [
    GListPokemonData_pokemons,
    _$GListPokemonData_pokemons
  ];
  @override
  final String wireName = 'GListPokemonData_pokemons';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GListPokemonData_pokemons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GListPokemonData_pokemons deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GListPokemonData_pokemonsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GListPokemonData extends GListPokemonData {
  @override
  final BuiltList<GListPokemonData_pokemons> pokemons;

  factory _$GListPokemonData(
          [void Function(GListPokemonDataBuilder) updates]) =>
      (new GListPokemonDataBuilder()..update(updates)).build();

  _$GListPokemonData._({this.pokemons}) : super._();

  @override
  GListPokemonData rebuild(void Function(GListPokemonDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GListPokemonDataBuilder toBuilder() =>
      new GListPokemonDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GListPokemonData && pokemons == other.pokemons;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GListPokemonData')
          ..add('pokemons', pokemons))
        .toString();
  }
}

class GListPokemonDataBuilder
    implements Builder<GListPokemonData, GListPokemonDataBuilder> {
  _$GListPokemonData _$v;

  ListBuilder<GListPokemonData_pokemons> _pokemons;
  ListBuilder<GListPokemonData_pokemons> get pokemons =>
      _$this._pokemons ??= new ListBuilder<GListPokemonData_pokemons>();
  set pokemons(ListBuilder<GListPokemonData_pokemons> pokemons) =>
      _$this._pokemons = pokemons;

  GListPokemonDataBuilder();

  GListPokemonDataBuilder get _$this {
    if (_$v != null) {
      _pokemons = _$v.pokemons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GListPokemonData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GListPokemonData;
  }

  @override
  void update(void Function(GListPokemonDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GListPokemonData build() {
    _$GListPokemonData _$result;
    try {
      _$result = _$v ?? new _$GListPokemonData._(pokemons: _pokemons?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pokemons';
        _pokemons?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GListPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GListPokemonData_pokemons extends GListPokemonData_pokemons {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GListPokemonData_pokemons(
          [void Function(GListPokemonData_pokemonsBuilder) updates]) =>
      (new GListPokemonData_pokemonsBuilder()..update(updates)).build();

  _$GListPokemonData_pokemons._({this.G__typename, this.id, this.name})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GListPokemonData_pokemons', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GListPokemonData_pokemons', 'id');
    }
  }

  @override
  GListPokemonData_pokemons rebuild(
          void Function(GListPokemonData_pokemonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GListPokemonData_pokemonsBuilder toBuilder() =>
      new GListPokemonData_pokemonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GListPokemonData_pokemons &&
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
    return (newBuiltValueToStringHelper('GListPokemonData_pokemons')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GListPokemonData_pokemonsBuilder
    implements
        Builder<GListPokemonData_pokemons, GListPokemonData_pokemonsBuilder> {
  _$GListPokemonData_pokemons _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GListPokemonData_pokemonsBuilder() {
    GListPokemonData_pokemons._initializeBuilder(this);
  }

  GListPokemonData_pokemonsBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GListPokemonData_pokemons other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GListPokemonData_pokemons;
  }

  @override
  void update(void Function(GListPokemonData_pokemonsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GListPokemonData_pokemons build() {
    final _$result = _$v ??
        new _$GListPokemonData_pokemons._(
            G__typename: G__typename, id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
