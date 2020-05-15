// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllPokemon_Data> _$allPokemonDataSerializer =
    new _$AllPokemon_DataSerializer();
Serializer<AllPokemon_Data_pokemons> _$allPokemonDataPokemonsSerializer =
    new _$AllPokemon_Data_pokemonsSerializer();

class _$AllPokemon_DataSerializer
    implements StructuredSerializer<AllPokemon_Data> {
  @override
  final Iterable<Type> types = const [AllPokemon_Data, _$AllPokemon_Data];
  @override
  final String wireName = 'AllPokemon_Data';

  @override
  Iterable<Object> serialize(Serializers serializers, AllPokemon_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.pokemons != null) {
      result
        ..add('pokemons')
        ..add(serializers.serialize(object.pokemons,
            specifiedType: const FullType(_i1.BuiltList,
                const [const FullType(AllPokemon_Data_pokemons)])));
    }
    return result;
  }

  @override
  AllPokemon_Data deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllPokemon_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pokemons':
          result.pokemons.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.BuiltList, const [
                const FullType(AllPokemon_Data_pokemons)
              ])) as _i1.BuiltList<AllPokemon_Data_pokemons>);
          break;
      }
    }

    return result.build();
  }
}

class _$AllPokemon_Data_pokemonsSerializer
    implements StructuredSerializer<AllPokemon_Data_pokemons> {
  @override
  final Iterable<Type> types = const [
    AllPokemon_Data_pokemons,
    _$AllPokemon_Data_pokemons
  ];
  @override
  final String wireName = 'AllPokemon_Data_pokemons';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AllPokemon_Data_pokemons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.maxHP != null) {
      result
        ..add('maxHP')
        ..add(serializers.serialize(object.maxHP,
            specifiedType: const FullType(int)));
    }
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AllPokemon_Data_pokemons deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllPokemon_Data_pokemonsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'maxHP':
          result.maxHP = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AllPokemon_Data extends AllPokemon_Data {
  @override
  final _i1.BuiltList<AllPokemon_Data_pokemons> pokemons;

  factory _$AllPokemon_Data([void Function(AllPokemon_DataBuilder) updates]) =>
      (new AllPokemon_DataBuilder()..update(updates)).build();

  _$AllPokemon_Data._({this.pokemons}) : super._();

  @override
  AllPokemon_Data rebuild(void Function(AllPokemon_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllPokemon_DataBuilder toBuilder() =>
      new AllPokemon_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllPokemon_Data && pokemons == other.pokemons;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllPokemon_Data')
          ..add('pokemons', pokemons))
        .toString();
  }
}

class AllPokemon_DataBuilder
    implements Builder<AllPokemon_Data, AllPokemon_DataBuilder> {
  _$AllPokemon_Data _$v;

  _i1.ListBuilder<AllPokemon_Data_pokemons> _pokemons;
  _i1.ListBuilder<AllPokemon_Data_pokemons> get pokemons =>
      _$this._pokemons ??= new _i1.ListBuilder<AllPokemon_Data_pokemons>();
  set pokemons(_i1.ListBuilder<AllPokemon_Data_pokemons> pokemons) =>
      _$this._pokemons = pokemons;

  AllPokemon_DataBuilder();

  AllPokemon_DataBuilder get _$this {
    if (_$v != null) {
      _pokemons = _$v.pokemons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllPokemon_Data other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllPokemon_Data;
  }

  @override
  void update(void Function(AllPokemon_DataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllPokemon_Data build() {
    _$AllPokemon_Data _$result;
    try {
      _$result = _$v ?? new _$AllPokemon_Data._(pokemons: _pokemons?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pokemons';
        _pokemons?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AllPokemon_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AllPokemon_Data_pokemons extends AllPokemon_Data_pokemons {
  @override
  final String id;
  @override
  final String name;
  @override
  final int maxHP;
  @override
  final String image;

  factory _$AllPokemon_Data_pokemons(
          [void Function(AllPokemon_Data_pokemonsBuilder) updates]) =>
      (new AllPokemon_Data_pokemonsBuilder()..update(updates)).build();

  _$AllPokemon_Data_pokemons._({this.id, this.name, this.maxHP, this.image})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AllPokemon_Data_pokemons', 'id');
    }
  }

  @override
  AllPokemon_Data_pokemons rebuild(
          void Function(AllPokemon_Data_pokemonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllPokemon_Data_pokemonsBuilder toBuilder() =>
      new AllPokemon_Data_pokemonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllPokemon_Data_pokemons &&
        id == other.id &&
        name == other.name &&
        maxHP == other.maxHP &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), name.hashCode), maxHP.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllPokemon_Data_pokemons')
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image))
        .toString();
  }
}

class AllPokemon_Data_pokemonsBuilder
    implements
        Builder<AllPokemon_Data_pokemons, AllPokemon_Data_pokemonsBuilder> {
  _$AllPokemon_Data_pokemons _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _maxHP;
  int get maxHP => _$this._maxHP;
  set maxHP(int maxHP) => _$this._maxHP = maxHP;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  AllPokemon_Data_pokemonsBuilder();

  AllPokemon_Data_pokemonsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _maxHP = _$v.maxHP;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllPokemon_Data_pokemons other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllPokemon_Data_pokemons;
  }

  @override
  void update(void Function(AllPokemon_Data_pokemonsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllPokemon_Data_pokemons build() {
    final _$result = _$v ??
        new _$AllPokemon_Data_pokemons._(
            id: id, name: name, maxHP: maxHP, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
