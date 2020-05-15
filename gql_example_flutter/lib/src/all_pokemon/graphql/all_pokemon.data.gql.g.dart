// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllPokemonData> _$allPokemonDataSerializer =
    new _$AllPokemonDataSerializer();
Serializer<AllPokemonData_pokemons> _$allPokemonDataPokemonsSerializer =
    new _$AllPokemonData_pokemonsSerializer();

class _$AllPokemonDataSerializer
    implements StructuredSerializer<AllPokemonData> {
  @override
  final Iterable<Type> types = const [AllPokemonData, _$AllPokemonData];
  @override
  final String wireName = 'AllPokemonData';

  @override
  Iterable<Object> serialize(Serializers serializers, AllPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.pokemons != null) {
      result
        ..add('pokemons')
        ..add(serializers.serialize(object.pokemons,
            specifiedType: const FullType(_i1.BuiltList,
                const [const FullType(AllPokemonData_pokemons)])));
    }
    return result;
  }

  @override
  AllPokemonData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllPokemonDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pokemons':
          result.pokemons.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.BuiltList, const [
                const FullType(AllPokemonData_pokemons)
              ])) as _i1.BuiltList<AllPokemonData_pokemons>);
          break;
      }
    }

    return result.build();
  }
}

class _$AllPokemonData_pokemonsSerializer
    implements StructuredSerializer<AllPokemonData_pokemons> {
  @override
  final Iterable<Type> types = const [
    AllPokemonData_pokemons,
    _$AllPokemonData_pokemons
  ];
  @override
  final String wireName = 'AllPokemonData_pokemons';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AllPokemonData_pokemons object,
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
  AllPokemonData_pokemons deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllPokemonData_pokemonsBuilder();

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

class _$AllPokemonData extends AllPokemonData {
  @override
  final _i1.BuiltList<AllPokemonData_pokemons> pokemons;

  factory _$AllPokemonData([void Function(AllPokemonDataBuilder) updates]) =>
      (new AllPokemonDataBuilder()..update(updates)).build();

  _$AllPokemonData._({this.pokemons}) : super._();

  @override
  AllPokemonData rebuild(void Function(AllPokemonDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllPokemonDataBuilder toBuilder() =>
      new AllPokemonDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllPokemonData && pokemons == other.pokemons;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllPokemonData')
          ..add('pokemons', pokemons))
        .toString();
  }
}

class AllPokemonDataBuilder
    implements Builder<AllPokemonData, AllPokemonDataBuilder> {
  _$AllPokemonData _$v;

  _i1.ListBuilder<AllPokemonData_pokemons> _pokemons;
  _i1.ListBuilder<AllPokemonData_pokemons> get pokemons =>
      _$this._pokemons ??= new _i1.ListBuilder<AllPokemonData_pokemons>();
  set pokemons(_i1.ListBuilder<AllPokemonData_pokemons> pokemons) =>
      _$this._pokemons = pokemons;

  AllPokemonDataBuilder();

  AllPokemonDataBuilder get _$this {
    if (_$v != null) {
      _pokemons = _$v.pokemons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllPokemonData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllPokemonData;
  }

  @override
  void update(void Function(AllPokemonDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllPokemonData build() {
    _$AllPokemonData _$result;
    try {
      _$result = _$v ?? new _$AllPokemonData._(pokemons: _pokemons?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pokemons';
        _pokemons?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AllPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AllPokemonData_pokemons extends AllPokemonData_pokemons {
  @override
  final String id;
  @override
  final String name;
  @override
  final int maxHP;
  @override
  final String image;

  factory _$AllPokemonData_pokemons(
          [void Function(AllPokemonData_pokemonsBuilder) updates]) =>
      (new AllPokemonData_pokemonsBuilder()..update(updates)).build();

  _$AllPokemonData_pokemons._({this.id, this.name, this.maxHP, this.image})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AllPokemonData_pokemons', 'id');
    }
  }

  @override
  AllPokemonData_pokemons rebuild(
          void Function(AllPokemonData_pokemonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllPokemonData_pokemonsBuilder toBuilder() =>
      new AllPokemonData_pokemonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllPokemonData_pokemons &&
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
    return (newBuiltValueToStringHelper('AllPokemonData_pokemons')
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image))
        .toString();
  }
}

class AllPokemonData_pokemonsBuilder
    implements
        Builder<AllPokemonData_pokemons, AllPokemonData_pokemonsBuilder> {
  _$AllPokemonData_pokemons _$v;

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

  AllPokemonData_pokemonsBuilder();

  AllPokemonData_pokemonsBuilder get _$this {
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
  void replace(AllPokemonData_pokemons other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllPokemonData_pokemons;
  }

  @override
  void update(void Function(AllPokemonData_pokemonsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllPokemonData_pokemons build() {
    final _$result = _$v ??
        new _$AllPokemonData_pokemons._(
            id: id, name: name, maxHP: maxHP, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
