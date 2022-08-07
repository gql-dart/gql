// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_pokemon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFindPokemonData> _$gFindPokemonDataSerializer =
    new _$GFindPokemonDataSerializer();
Serializer<GFindPokemonData_pokemon> _$gFindPokemonDataPokemonSerializer =
    new _$GFindPokemonData_pokemonSerializer();
Serializer<GFindPokemonData_pokemon_weight>
    _$gFindPokemonDataPokemonWeightSerializer =
    new _$GFindPokemonData_pokemon_weightSerializer();
Serializer<GFindPokemonData_pokemon_height>
    _$gFindPokemonDataPokemonHeightSerializer =
    new _$GFindPokemonData_pokemon_heightSerializer();

class _$GFindPokemonDataSerializer
    implements StructuredSerializer<GFindPokemonData> {
  @override
  final Iterable<Type> types = const [GFindPokemonData, _$GFindPokemonData];
  @override
  final String wireName = 'GFindPokemonData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFindPokemonData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pokemon;
    if (value != null) {
      result
        ..add('pokemon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFindPokemonData_pokemon)));
    }
    return result;
  }

  @override
  GFindPokemonData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pokemon':
          result.pokemon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFindPokemonData_pokemon))!
              as GFindPokemonData_pokemon);
          break;
      }
    }

    return result.build();
  }
}

class _$GFindPokemonData_pokemonSerializer
    implements StructuredSerializer<GFindPokemonData_pokemon> {
  @override
  final Iterable<Type> types = const [
    GFindPokemonData_pokemon,
    _$GFindPokemonData_pokemon
  ];
  @override
  final String wireName = 'GFindPokemonData_pokemon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFindPokemonData_pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFindPokemonData_pokemon_weight)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFindPokemonData_pokemon_height)));
    }
    return result;
  }

  @override
  GFindPokemonData_pokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonData_pokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFindPokemonData_pokemon_weight))!
              as GFindPokemonData_pokemon_weight);
          break;
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFindPokemonData_pokemon_height))!
              as GFindPokemonData_pokemon_height);
          break;
      }
    }

    return result.build();
  }
}

class _$GFindPokemonData_pokemon_weightSerializer
    implements StructuredSerializer<GFindPokemonData_pokemon_weight> {
  @override
  final Iterable<Type> types = const [
    GFindPokemonData_pokemon_weight,
    _$GFindPokemonData_pokemon_weight
  ];
  @override
  final String wireName = 'GFindPokemonData_pokemon_weight';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFindPokemonData_pokemon_weight object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFindPokemonData_pokemon_weight deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonData_pokemon_weightBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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

class _$GFindPokemonData_pokemon_heightSerializer
    implements StructuredSerializer<GFindPokemonData_pokemon_height> {
  @override
  final Iterable<Type> types = const [
    GFindPokemonData_pokemon_height,
    _$GFindPokemonData_pokemon_height
  ];
  @override
  final String wireName = 'GFindPokemonData_pokemon_height';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFindPokemonData_pokemon_height object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFindPokemonData_pokemon_height deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonData_pokemon_heightBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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

class _$GFindPokemonData extends GFindPokemonData {
  @override
  final String G__typename;
  @override
  final GFindPokemonData_pokemon? pokemon;

  factory _$GFindPokemonData(
          [void Function(GFindPokemonDataBuilder)? updates]) =>
      (new GFindPokemonDataBuilder()..update(updates)).build();

  _$GFindPokemonData._({required this.G__typename, this.pokemon}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GFindPokemonData', 'G__typename');
  }

  @override
  GFindPokemonData rebuild(void Function(GFindPokemonDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonDataBuilder toBuilder() =>
      new GFindPokemonDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemonData &&
        G__typename == other.G__typename &&
        pokemon == other.pokemon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), pokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFindPokemonData')
          ..add('G__typename', G__typename)
          ..add('pokemon', pokemon))
        .toString();
  }
}

class GFindPokemonDataBuilder
    implements Builder<GFindPokemonData, GFindPokemonDataBuilder> {
  _$GFindPokemonData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFindPokemonData_pokemonBuilder? _pokemon;
  GFindPokemonData_pokemonBuilder get pokemon =>
      _$this._pokemon ??= new GFindPokemonData_pokemonBuilder();
  set pokemon(GFindPokemonData_pokemonBuilder? pokemon) =>
      _$this._pokemon = pokemon;

  GFindPokemonDataBuilder() {
    GFindPokemonData._initializeBuilder(this);
  }

  GFindPokemonDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemon = $v.pokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemonData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemonData;
  }

  @override
  void update(void Function(GFindPokemonDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFindPokemonData build() {
    _$GFindPokemonData _$result;
    try {
      _$result = _$v ??
          new _$GFindPokemonData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GFindPokemonData', 'G__typename'),
              pokemon: _pokemon?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon';
        _pokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFindPokemonData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFindPokemonData_pokemon extends GFindPokemonData_pokemon {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? name;
  @override
  final GFindPokemonData_pokemon_weight? weight;
  @override
  final GFindPokemonData_pokemon_height? height;

  factory _$GFindPokemonData_pokemon(
          [void Function(GFindPokemonData_pokemonBuilder)? updates]) =>
      (new GFindPokemonData_pokemonBuilder()..update(updates)).build();

  _$GFindPokemonData_pokemon._(
      {required this.G__typename,
      required this.id,
      this.name,
      this.weight,
      this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GFindPokemonData_pokemon', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, 'GFindPokemonData_pokemon', 'id');
  }

  @override
  GFindPokemonData_pokemon rebuild(
          void Function(GFindPokemonData_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonData_pokemonBuilder toBuilder() =>
      new GFindPokemonData_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemonData_pokemon &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        weight == other.weight &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
            weight.hashCode),
        height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFindPokemonData_pokemon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('weight', weight)
          ..add('height', height))
        .toString();
  }
}

class GFindPokemonData_pokemonBuilder
    implements
        Builder<GFindPokemonData_pokemon, GFindPokemonData_pokemonBuilder> {
  _$GFindPokemonData_pokemon? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFindPokemonData_pokemon_weightBuilder? _weight;
  GFindPokemonData_pokemon_weightBuilder get weight =>
      _$this._weight ??= new GFindPokemonData_pokemon_weightBuilder();
  set weight(GFindPokemonData_pokemon_weightBuilder? weight) =>
      _$this._weight = weight;

  GFindPokemonData_pokemon_heightBuilder? _height;
  GFindPokemonData_pokemon_heightBuilder get height =>
      _$this._height ??= new GFindPokemonData_pokemon_heightBuilder();
  set height(GFindPokemonData_pokemon_heightBuilder? height) =>
      _$this._height = height;

  GFindPokemonData_pokemonBuilder() {
    GFindPokemonData_pokemon._initializeBuilder(this);
  }

  GFindPokemonData_pokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _weight = $v.weight?.toBuilder();
      _height = $v.height?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemonData_pokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemonData_pokemon;
  }

  @override
  void update(void Function(GFindPokemonData_pokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFindPokemonData_pokemon build() {
    _$GFindPokemonData_pokemon _$result;
    try {
      _$result = _$v ??
          new _$GFindPokemonData_pokemon._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GFindPokemonData_pokemon', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'GFindPokemonData_pokemon', 'id'),
              name: name,
              weight: _weight?.build(),
              height: _height?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weight';
        _weight?.build();
        _$failedField = 'height';
        _height?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFindPokemonData_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFindPokemonData_pokemon_weight
    extends GFindPokemonData_pokemon_weight {
  @override
  final String G__typename;
  @override
  final String? minimum;
  @override
  final String? maximum;

  factory _$GFindPokemonData_pokemon_weight(
          [void Function(GFindPokemonData_pokemon_weightBuilder)? updates]) =>
      (new GFindPokemonData_pokemon_weightBuilder()..update(updates)).build();

  _$GFindPokemonData_pokemon_weight._(
      {required this.G__typename, this.minimum, this.maximum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GFindPokemonData_pokemon_weight', 'G__typename');
  }

  @override
  GFindPokemonData_pokemon_weight rebuild(
          void Function(GFindPokemonData_pokemon_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonData_pokemon_weightBuilder toBuilder() =>
      new GFindPokemonData_pokemon_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemonData_pokemon_weight &&
        G__typename == other.G__typename &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFindPokemonData_pokemon_weight')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GFindPokemonData_pokemon_weightBuilder
    implements
        Builder<GFindPokemonData_pokemon_weight,
            GFindPokemonData_pokemon_weightBuilder> {
  _$GFindPokemonData_pokemon_weight? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  GFindPokemonData_pokemon_weightBuilder() {
    GFindPokemonData_pokemon_weight._initializeBuilder(this);
  }

  GFindPokemonData_pokemon_weightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _minimum = $v.minimum;
      _maximum = $v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemonData_pokemon_weight other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemonData_pokemon_weight;
  }

  @override
  void update(void Function(GFindPokemonData_pokemon_weightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFindPokemonData_pokemon_weight build() {
    final _$result = _$v ??
        new _$GFindPokemonData_pokemon_weight._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GFindPokemonData_pokemon_weight', 'G__typename'),
            minimum: minimum,
            maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

class _$GFindPokemonData_pokemon_height
    extends GFindPokemonData_pokemon_height {
  @override
  final String G__typename;
  @override
  final String? minimum;
  @override
  final String? maximum;

  factory _$GFindPokemonData_pokemon_height(
          [void Function(GFindPokemonData_pokemon_heightBuilder)? updates]) =>
      (new GFindPokemonData_pokemon_heightBuilder()..update(updates)).build();

  _$GFindPokemonData_pokemon_height._(
      {required this.G__typename, this.minimum, this.maximum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GFindPokemonData_pokemon_height', 'G__typename');
  }

  @override
  GFindPokemonData_pokemon_height rebuild(
          void Function(GFindPokemonData_pokemon_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonData_pokemon_heightBuilder toBuilder() =>
      new GFindPokemonData_pokemon_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemonData_pokemon_height &&
        G__typename == other.G__typename &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFindPokemonData_pokemon_height')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GFindPokemonData_pokemon_heightBuilder
    implements
        Builder<GFindPokemonData_pokemon_height,
            GFindPokemonData_pokemon_heightBuilder> {
  _$GFindPokemonData_pokemon_height? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  GFindPokemonData_pokemon_heightBuilder() {
    GFindPokemonData_pokemon_height._initializeBuilder(this);
  }

  GFindPokemonData_pokemon_heightBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _minimum = $v.minimum;
      _maximum = $v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemonData_pokemon_height other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemonData_pokemon_height;
  }

  @override
  void update(void Function(GFindPokemonData_pokemon_heightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFindPokemonData_pokemon_height build() {
    final _$result = _$v ??
        new _$GFindPokemonData_pokemon_height._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GFindPokemonData_pokemon_height', 'G__typename'),
            minimum: minimum,
            maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
