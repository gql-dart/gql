// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailData> _$gPokemonDetailDataSerializer =
    new _$GPokemonDetailDataSerializer();
Serializer<GPokemonDetailData_pokemon> _$gPokemonDetailDataPokemonSerializer =
    new _$GPokemonDetailData_pokemonSerializer();
Serializer<GPokemonDetailData_pokemon_weight>
    _$gPokemonDetailDataPokemonWeightSerializer =
    new _$GPokemonDetailData_pokemon_weightSerializer();
Serializer<GPokemonDetailData_pokemon_height>
    _$gPokemonDetailDataPokemonHeightSerializer =
    new _$GPokemonDetailData_pokemon_heightSerializer();

class _$GPokemonDetailDataSerializer
    implements StructuredSerializer<GPokemonDetailData> {
  @override
  final Iterable<Type> types = const [GPokemonDetailData, _$GPokemonDetailData];
  @override
  final String wireName = 'GPokemonDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData object,
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
            specifiedType: const FullType(GPokemonDetailData_pokemon)));
    }
    return result;
  }

  @override
  GPokemonDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailDataBuilder();

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
        case 'pokemon':
          result.pokemon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPokemonDetailData_pokemon))!
              as GPokemonDetailData_pokemon);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemonSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon,
    _$GPokemonDetailData_pokemon
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon object,
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
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonDetailData_pokemon_weight)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonDetailData_pokemon_height)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemonBuilder();

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
        case 'weight':
          result.weight.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_weight))!
              as GPokemonDetailData_pokemon_weight);
          break;
        case 'height':
          result.height.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_height))!
              as GPokemonDetailData_pokemon_height);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_weightSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_weight> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_weight,
    _$GPokemonDetailData_pokemon_weight
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_weight';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_weight object,
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
  GPokemonDetailData_pokemon_weight deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemon_weightBuilder();

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
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_heightSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_height> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_height,
    _$GPokemonDetailData_pokemon_height
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_height';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_height object,
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
  GPokemonDetailData_pokemon_height deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailData_pokemon_heightBuilder();

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
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData extends GPokemonDetailData {
  @override
  final String G__typename;
  @override
  final GPokemonDetailData_pokemon? pokemon;

  factory _$GPokemonDetailData(
          [void Function(GPokemonDetailDataBuilder)? updates]) =>
      (new GPokemonDetailDataBuilder()..update(updates))._build();

  _$GPokemonDetailData._({required this.G__typename, this.pokemon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData', 'G__typename');
  }

  @override
  GPokemonDetailData rebuild(
          void Function(GPokemonDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailDataBuilder toBuilder() =>
      new GPokemonDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData &&
        G__typename == other.G__typename &&
        pokemon == other.pokemon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), pokemon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData')
          ..add('G__typename', G__typename)
          ..add('pokemon', pokemon))
        .toString();
  }
}

class GPokemonDetailDataBuilder
    implements Builder<GPokemonDetailData, GPokemonDetailDataBuilder> {
  _$GPokemonDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPokemonDetailData_pokemonBuilder? _pokemon;
  GPokemonDetailData_pokemonBuilder get pokemon =>
      _$this._pokemon ??= new GPokemonDetailData_pokemonBuilder();
  set pokemon(GPokemonDetailData_pokemonBuilder? pokemon) =>
      _$this._pokemon = pokemon;

  GPokemonDetailDataBuilder() {
    GPokemonDetailData._initializeBuilder(this);
  }

  GPokemonDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemon = $v.pokemon?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData;
  }

  @override
  void update(void Function(GPokemonDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData build() => _build();

  _$GPokemonDetailData _build() {
    _$GPokemonDetailData _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetailData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPokemonDetailData', 'G__typename'),
              pokemon: _pokemon?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon';
        _pokemon?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon extends GPokemonDetailData_pokemon {
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
  @override
  final GPokemonDetailData_pokemon_weight? weight;
  @override
  final GPokemonDetailData_pokemon_height? height;

  factory _$GPokemonDetailData_pokemon(
          [void Function(GPokemonDetailData_pokemonBuilder)? updates]) =>
      (new GPokemonDetailData_pokemonBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon._(
      {required this.G__typename,
      this.maxHP,
      this.image,
      required this.id,
      this.name,
      this.weight,
      this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPokemonDetailData_pokemon', 'id');
  }

  @override
  GPokemonDetailData_pokemon rebuild(
          void Function(GPokemonDetailData_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemonBuilder toBuilder() =>
      new GPokemonDetailData_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon &&
        G__typename == other.G__typename &&
        maxHP == other.maxHP &&
        image == other.image &&
        id == other.id &&
        name == other.name &&
        weight == other.weight &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), maxHP.hashCode),
                        image.hashCode),
                    id.hashCode),
                name.hashCode),
            weight.hashCode),
        height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon')
          ..add('G__typename', G__typename)
          ..add('maxHP', maxHP)
          ..add('image', image)
          ..add('id', id)
          ..add('name', name)
          ..add('weight', weight)
          ..add('height', height))
        .toString();
  }
}

class GPokemonDetailData_pokemonBuilder
    implements
        Builder<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder> {
  _$GPokemonDetailData_pokemon? _$v;

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

  GPokemonDetailData_pokemon_weightBuilder? _weight;
  GPokemonDetailData_pokemon_weightBuilder get weight =>
      _$this._weight ??= new GPokemonDetailData_pokemon_weightBuilder();
  set weight(GPokemonDetailData_pokemon_weightBuilder? weight) =>
      _$this._weight = weight;

  GPokemonDetailData_pokemon_heightBuilder? _height;
  GPokemonDetailData_pokemon_heightBuilder get height =>
      _$this._height ??= new GPokemonDetailData_pokemon_heightBuilder();
  set height(GPokemonDetailData_pokemon_heightBuilder? height) =>
      _$this._height = height;

  GPokemonDetailData_pokemonBuilder() {
    GPokemonDetailData_pokemon._initializeBuilder(this);
  }

  GPokemonDetailData_pokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _maxHP = $v.maxHP;
      _image = $v.image;
      _id = $v.id;
      _name = $v.name;
      _weight = $v.weight?.toBuilder();
      _height = $v.height?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon build() => _build();

  _$GPokemonDetailData_pokemon _build() {
    _$GPokemonDetailData_pokemon _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetailData_pokemon._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPokemonDetailData_pokemon', 'G__typename'),
              maxHP: maxHP,
              image: image,
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPokemonDetailData_pokemon', 'id'),
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
            r'GPokemonDetailData_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_weight
    extends GPokemonDetailData_pokemon_weight {
  @override
  final String G__typename;
  @override
  final String? minimum;
  @override
  final String? maximum;

  factory _$GPokemonDetailData_pokemon_weight(
          [void Function(GPokemonDetailData_pokemon_weightBuilder)? updates]) =>
      (new GPokemonDetailData_pokemon_weightBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_weight._(
      {required this.G__typename, this.minimum, this.maximum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon_weight', 'G__typename');
  }

  @override
  GPokemonDetailData_pokemon_weight rebuild(
          void Function(GPokemonDetailData_pokemon_weightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_weightBuilder toBuilder() =>
      new GPokemonDetailData_pokemon_weightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_weight &&
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
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_weight')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GPokemonDetailData_pokemon_weightBuilder
    implements
        Builder<GPokemonDetailData_pokemon_weight,
            GPokemonDetailData_pokemon_weightBuilder> {
  _$GPokemonDetailData_pokemon_weight? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  GPokemonDetailData_pokemon_weightBuilder() {
    GPokemonDetailData_pokemon_weight._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_weightBuilder get _$this {
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
  void replace(GPokemonDetailData_pokemon_weight other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon_weight;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_weightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_weight build() => _build();

  _$GPokemonDetailData_pokemon_weight _build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_pokemon_weight._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_weight', 'G__typename'),
            minimum: minimum,
            maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_height
    extends GPokemonDetailData_pokemon_height {
  @override
  final String G__typename;
  @override
  final String? minimum;
  @override
  final String? maximum;

  factory _$GPokemonDetailData_pokemon_height(
          [void Function(GPokemonDetailData_pokemon_heightBuilder)? updates]) =>
      (new GPokemonDetailData_pokemon_heightBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_height._(
      {required this.G__typename, this.minimum, this.maximum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonDetailData_pokemon_height', 'G__typename');
  }

  @override
  GPokemonDetailData_pokemon_height rebuild(
          void Function(GPokemonDetailData_pokemon_heightBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_heightBuilder toBuilder() =>
      new GPokemonDetailData_pokemon_heightBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_height &&
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
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_height')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GPokemonDetailData_pokemon_heightBuilder
    implements
        Builder<GPokemonDetailData_pokemon_height,
            GPokemonDetailData_pokemon_heightBuilder> {
  _$GPokemonDetailData_pokemon_height? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  GPokemonDetailData_pokemon_heightBuilder() {
    GPokemonDetailData_pokemon_height._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_heightBuilder get _$this {
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
  void replace(GPokemonDetailData_pokemon_height other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailData_pokemon_height;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_heightBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_height build() => _build();

  _$GPokemonDetailData_pokemon_height _build() {
    final _$result = _$v ??
        new _$GPokemonDetailData_pokemon_height._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_height', 'G__typename'),
            minimum: minimum,
            maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
