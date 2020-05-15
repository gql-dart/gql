// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonDetail_Data> _$pokemonDetailDataSerializer =
    new _$PokemonDetail_DataSerializer();
Serializer<PokemonDetail_Data_pokemon> _$pokemonDetailDataPokemonSerializer =
    new _$PokemonDetail_Data_pokemonSerializer();
Serializer<PokemonDetail_Data_pokemon_weight>
    _$pokemonDetailDataPokemonWeightSerializer =
    new _$PokemonDetail_Data_pokemon_weightSerializer();
Serializer<PokemonDetail_Data_pokemon_height>
    _$pokemonDetailDataPokemonHeightSerializer =
    new _$PokemonDetail_Data_pokemon_heightSerializer();

class _$PokemonDetail_DataSerializer
    implements StructuredSerializer<PokemonDetail_Data> {
  @override
  final Iterable<Type> types = const [PokemonDetail_Data, _$PokemonDetail_Data];
  @override
  final String wireName = 'PokemonDetail_Data';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonDetail_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.pokemon != null) {
      result
        ..add('pokemon')
        ..add(serializers.serialize(object.pokemon,
            specifiedType: const FullType(PokemonDetail_Data_pokemon)));
    }
    return result;
  }

  @override
  PokemonDetail_Data deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetail_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pokemon':
          result.pokemon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonDetail_Data_pokemon))
              as PokemonDetail_Data_pokemon);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetail_Data_pokemonSerializer
    implements StructuredSerializer<PokemonDetail_Data_pokemon> {
  @override
  final Iterable<Type> types = const [
    PokemonDetail_Data_pokemon,
    _$PokemonDetail_Data_pokemon
  ];
  @override
  final String wireName = 'PokemonDetail_Data_pokemon';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PokemonDetail_Data_pokemon object,
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
    if (object.weight != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(object.weight,
            specifiedType: const FullType(PokemonDetail_Data_pokemon_weight)));
    }
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType: const FullType(PokemonDetail_Data_pokemon_height)));
    }
    return result;
  }

  @override
  PokemonDetail_Data_pokemon deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetail_Data_pokemonBuilder();

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
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(PokemonDetail_Data_pokemon_weight))
              as PokemonDetail_Data_pokemon_weight);
          break;
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(PokemonDetail_Data_pokemon_height))
              as PokemonDetail_Data_pokemon_height);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetail_Data_pokemon_weightSerializer
    implements StructuredSerializer<PokemonDetail_Data_pokemon_weight> {
  @override
  final Iterable<Type> types = const [
    PokemonDetail_Data_pokemon_weight,
    _$PokemonDetail_Data_pokemon_weight
  ];
  @override
  final String wireName = 'PokemonDetail_Data_pokemon_weight';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PokemonDetail_Data_pokemon_weight object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.minimum != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(object.minimum,
            specifiedType: const FullType(String)));
    }
    if (object.maximum != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(object.maximum,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonDetail_Data_pokemon_weight deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetail_Data_pokemon_weightBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetail_Data_pokemon_heightSerializer
    implements StructuredSerializer<PokemonDetail_Data_pokemon_height> {
  @override
  final Iterable<Type> types = const [
    PokemonDetail_Data_pokemon_height,
    _$PokemonDetail_Data_pokemon_height
  ];
  @override
  final String wireName = 'PokemonDetail_Data_pokemon_height';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PokemonDetail_Data_pokemon_height object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.minimum != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(object.minimum,
            specifiedType: const FullType(String)));
    }
    if (object.maximum != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(object.maximum,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonDetail_Data_pokemon_height deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetail_Data_pokemon_heightBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetail_Data extends PokemonDetail_Data {
  @override
  final PokemonDetail_Data_pokemon pokemon;

  factory _$PokemonDetail_Data(
          [void Function(PokemonDetail_DataBuilder) updates]) =>
      (new PokemonDetail_DataBuilder()..update(updates)).build();

  _$PokemonDetail_Data._({this.pokemon}) : super._();

  @override
  PokemonDetail_Data rebuild(
          void Function(PokemonDetail_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetail_DataBuilder toBuilder() =>
      new PokemonDetail_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetail_Data && pokemon == other.pokemon;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetail_Data')
          ..add('pokemon', pokemon))
        .toString();
  }
}

class PokemonDetail_DataBuilder
    implements Builder<PokemonDetail_Data, PokemonDetail_DataBuilder> {
  _$PokemonDetail_Data _$v;

  PokemonDetail_Data_pokemonBuilder _pokemon;
  PokemonDetail_Data_pokemonBuilder get pokemon =>
      _$this._pokemon ??= new PokemonDetail_Data_pokemonBuilder();
  set pokemon(PokemonDetail_Data_pokemonBuilder pokemon) =>
      _$this._pokemon = pokemon;

  PokemonDetail_DataBuilder();

  PokemonDetail_DataBuilder get _$this {
    if (_$v != null) {
      _pokemon = _$v.pokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetail_Data other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetail_Data;
  }

  @override
  void update(void Function(PokemonDetail_DataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetail_Data build() {
    _$PokemonDetail_Data _$result;
    try {
      _$result = _$v ?? new _$PokemonDetail_Data._(pokemon: _pokemon?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pokemon';
        _pokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetail_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetail_Data_pokemon extends PokemonDetail_Data_pokemon {
  @override
  final String id;
  @override
  final String name;
  @override
  final int maxHP;
  @override
  final String image;
  @override
  final PokemonDetail_Data_pokemon_weight weight;
  @override
  final PokemonDetail_Data_pokemon_height height;

  factory _$PokemonDetail_Data_pokemon(
          [void Function(PokemonDetail_Data_pokemonBuilder) updates]) =>
      (new PokemonDetail_Data_pokemonBuilder()..update(updates)).build();

  _$PokemonDetail_Data_pokemon._(
      {this.id, this.name, this.maxHP, this.image, this.weight, this.height})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('PokemonDetail_Data_pokemon', 'id');
    }
  }

  @override
  PokemonDetail_Data_pokemon rebuild(
          void Function(PokemonDetail_Data_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetail_Data_pokemonBuilder toBuilder() =>
      new PokemonDetail_Data_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetail_Data_pokemon &&
        id == other.id &&
        name == other.name &&
        maxHP == other.maxHP &&
        image == other.image &&
        weight == other.weight &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), maxHP.hashCode),
                image.hashCode),
            weight.hashCode),
        height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetail_Data_pokemon')
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image)
          ..add('weight', weight)
          ..add('height', height))
        .toString();
  }
}

class PokemonDetail_Data_pokemonBuilder
    implements
        Builder<PokemonDetail_Data_pokemon, PokemonDetail_Data_pokemonBuilder> {
  _$PokemonDetail_Data_pokemon _$v;

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

  PokemonDetail_Data_pokemon_weightBuilder _weight;
  PokemonDetail_Data_pokemon_weightBuilder get weight =>
      _$this._weight ??= new PokemonDetail_Data_pokemon_weightBuilder();
  set weight(PokemonDetail_Data_pokemon_weightBuilder weight) =>
      _$this._weight = weight;

  PokemonDetail_Data_pokemon_heightBuilder _height;
  PokemonDetail_Data_pokemon_heightBuilder get height =>
      _$this._height ??= new PokemonDetail_Data_pokemon_heightBuilder();
  set height(PokemonDetail_Data_pokemon_heightBuilder height) =>
      _$this._height = height;

  PokemonDetail_Data_pokemonBuilder();

  PokemonDetail_Data_pokemonBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _maxHP = _$v.maxHP;
      _image = _$v.image;
      _weight = _$v.weight?.toBuilder();
      _height = _$v.height?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetail_Data_pokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetail_Data_pokemon;
  }

  @override
  void update(void Function(PokemonDetail_Data_pokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetail_Data_pokemon build() {
    _$PokemonDetail_Data_pokemon _$result;
    try {
      _$result = _$v ??
          new _$PokemonDetail_Data_pokemon._(
              id: id,
              name: name,
              maxHP: maxHP,
              image: image,
              weight: _weight?.build(),
              height: _height?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'weight';
        _weight?.build();
        _$failedField = 'height';
        _height?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetail_Data_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetail_Data_pokemon_weight
    extends PokemonDetail_Data_pokemon_weight {
  @override
  final String minimum;
  @override
  final String maximum;

  factory _$PokemonDetail_Data_pokemon_weight(
          [void Function(PokemonDetail_Data_pokemon_weightBuilder) updates]) =>
      (new PokemonDetail_Data_pokemon_weightBuilder()..update(updates)).build();

  _$PokemonDetail_Data_pokemon_weight._({this.minimum, this.maximum})
      : super._();

  @override
  PokemonDetail_Data_pokemon_weight rebuild(
          void Function(PokemonDetail_Data_pokemon_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetail_Data_pokemon_weightBuilder toBuilder() =>
      new PokemonDetail_Data_pokemon_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetail_Data_pokemon_weight &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetail_Data_pokemon_weight')
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class PokemonDetail_Data_pokemon_weightBuilder
    implements
        Builder<PokemonDetail_Data_pokemon_weight,
            PokemonDetail_Data_pokemon_weightBuilder> {
  _$PokemonDetail_Data_pokemon_weight _$v;

  String _minimum;
  String get minimum => _$this._minimum;
  set minimum(String minimum) => _$this._minimum = minimum;

  String _maximum;
  String get maximum => _$this._maximum;
  set maximum(String maximum) => _$this._maximum = maximum;

  PokemonDetail_Data_pokemon_weightBuilder();

  PokemonDetail_Data_pokemon_weightBuilder get _$this {
    if (_$v != null) {
      _minimum = _$v.minimum;
      _maximum = _$v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetail_Data_pokemon_weight other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetail_Data_pokemon_weight;
  }

  @override
  void update(void Function(PokemonDetail_Data_pokemon_weightBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetail_Data_pokemon_weight build() {
    final _$result = _$v ??
        new _$PokemonDetail_Data_pokemon_weight._(
            minimum: minimum, maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetail_Data_pokemon_height
    extends PokemonDetail_Data_pokemon_height {
  @override
  final String minimum;
  @override
  final String maximum;

  factory _$PokemonDetail_Data_pokemon_height(
          [void Function(PokemonDetail_Data_pokemon_heightBuilder) updates]) =>
      (new PokemonDetail_Data_pokemon_heightBuilder()..update(updates)).build();

  _$PokemonDetail_Data_pokemon_height._({this.minimum, this.maximum})
      : super._();

  @override
  PokemonDetail_Data_pokemon_height rebuild(
          void Function(PokemonDetail_Data_pokemon_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetail_Data_pokemon_heightBuilder toBuilder() =>
      new PokemonDetail_Data_pokemon_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetail_Data_pokemon_height &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetail_Data_pokemon_height')
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class PokemonDetail_Data_pokemon_heightBuilder
    implements
        Builder<PokemonDetail_Data_pokemon_height,
            PokemonDetail_Data_pokemon_heightBuilder> {
  _$PokemonDetail_Data_pokemon_height _$v;

  String _minimum;
  String get minimum => _$this._minimum;
  set minimum(String minimum) => _$this._minimum = minimum;

  String _maximum;
  String get maximum => _$this._maximum;
  set maximum(String maximum) => _$this._maximum = maximum;

  PokemonDetail_Data_pokemon_heightBuilder();

  PokemonDetail_Data_pokemon_heightBuilder get _$this {
    if (_$v != null) {
      _minimum = _$v.minimum;
      _maximum = _$v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetail_Data_pokemon_height other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetail_Data_pokemon_height;
  }

  @override
  void update(void Function(PokemonDetail_Data_pokemon_heightBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetail_Data_pokemon_height build() {
    final _$result = _$v ??
        new _$PokemonDetail_Data_pokemon_height._(
            minimum: minimum, maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
