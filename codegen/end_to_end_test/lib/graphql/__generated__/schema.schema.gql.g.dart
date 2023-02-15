// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GEpisode _$gEpisodeNEWHOPE = const GEpisode._('NEWHOPE');
const GEpisode _$gEpisodeEMPIRE = const GEpisode._('EMPIRE');
const GEpisode _$gEpisodeJEDI = const GEpisode._('JEDI');

GEpisode _$gEpisodeValueOf(String name) {
  switch (name) {
    case 'NEWHOPE':
      return _$gEpisodeNEWHOPE;
    case 'EMPIRE':
      return _$gEpisodeEMPIRE;
    case 'JEDI':
      return _$gEpisodeJEDI;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GEpisode> _$gEpisodeValues =
    new BuiltSet<GEpisode>(const <GEpisode>[
  _$gEpisodeNEWHOPE,
  _$gEpisodeEMPIRE,
  _$gEpisodeJEDI,
]);

const GLengthUnit _$gLengthUnitMETER = const GLengthUnit._('METER');
const GLengthUnit _$gLengthUnitFOOT = const GLengthUnit._('FOOT');

GLengthUnit _$gLengthUnitValueOf(String name) {
  switch (name) {
    case 'METER':
      return _$gLengthUnitMETER;
    case 'FOOT':
      return _$gLengthUnitFOOT;
    default:
      return _$gLengthUnitMETER;
  }
}

final BuiltSet<GLengthUnit> _$gLengthUnitValues =
    new BuiltSet<GLengthUnit>(const <GLengthUnit>[
  _$gLengthUnitMETER,
  _$gLengthUnitFOOT,
]);

Serializer<GEpisode> _$gEpisodeSerializer = new _$GEpisodeSerializer();
Serializer<GLengthUnit> _$gLengthUnitSerializer = new _$GLengthUnitSerializer();
Serializer<GReviewInput> _$gReviewInputSerializer =
    new _$GReviewInputSerializer();
Serializer<GColorInput> _$gColorInputSerializer = new _$GColorInputSerializer();
Serializer<GPostLikesInput> _$gPostLikesInputSerializer =
    new _$GPostLikesInputSerializer();
Serializer<GPostFavoritesInput> _$gPostFavoritesInputSerializer =
    new _$GPostFavoritesInputSerializer();

class _$GEpisodeSerializer implements PrimitiveSerializer<GEpisode> {
  @override
  final Iterable<Type> types = const <Type>[GEpisode];
  @override
  final String wireName = 'GEpisode';

  @override
  Object serialize(Serializers serializers, GEpisode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GEpisode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GEpisode.valueOf(serialized as String);
}

class _$GLengthUnitSerializer implements PrimitiveSerializer<GLengthUnit> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'METER': 'METER',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'METER': 'METER',
  };

  @override
  final Iterable<Type> types = const <Type>[GLengthUnit];
  @override
  final String wireName = 'GLengthUnit';

  @override
  Object serialize(Serializers serializers, GLengthUnit object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GLengthUnit deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GLengthUnit.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GReviewInputSerializer implements StructuredSerializer<GReviewInput> {
  @override
  final Iterable<Type> types = const [GReviewInput, _$GReviewInput];
  @override
  final String wireName = 'GReviewInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReviewInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.commentary;
    if (value != null) {
      result
        ..add('commentary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favorite_color;
    if (value != null) {
      result
        ..add('favorite_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GColorInput)));
    }
    value = object.seenOn;
    if (value != null) {
      result
        ..add('seenOn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType.nullable(DateTime)])));
    }
    return result;
  }

  @override
  GReviewInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentary':
          result.commentary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favorite_color':
          result.favorite_color.replace(serializers.deserialize(value,
              specifiedType: const FullType(GColorInput))! as GColorInput);
          break;
        case 'seenOn':
          result.seenOn.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType.nullable(DateTime)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GColorInputSerializer implements StructuredSerializer<GColorInput> {
  @override
  final Iterable<Type> types = const [GColorInput, _$GColorInput];
  @override
  final String wireName = 'GColorInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GColorInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'red',
      serializers.serialize(object.red, specifiedType: const FullType(int)),
      'green',
      serializers.serialize(object.green, specifiedType: const FullType(int)),
      'blue',
      serializers.serialize(object.blue, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GColorInput deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GColorInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'red':
          result.red = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'green':
          result.green = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'blue':
          result.blue = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPostLikesInputSerializer
    implements StructuredSerializer<GPostLikesInput> {
  @override
  final Iterable<Type> types = const [GPostLikesInput, _$GPostLikesInput];
  @override
  final String wireName = 'GPostLikesInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostLikesInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPostLikesInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostLikesInputBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GPostFavoritesInputSerializer
    implements StructuredSerializer<GPostFavoritesInput> {
  @override
  final Iterable<Type> types = const [
    GPostFavoritesInput,
    _$GPostFavoritesInput
  ];
  @override
  final String wireName = 'GPostFavoritesInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFavoritesInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPostFavoritesInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFavoritesInputBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GReviewInput extends GReviewInput {
  @override
  final int stars;
  @override
  final String? commentary;
  @override
  final GColorInput? favorite_color;
  @override
  final BuiltList<DateTime?>? seenOn;

  factory _$GReviewInput([void Function(GReviewInputBuilder)? updates]) =>
      (new GReviewInputBuilder()..update(updates))._build();

  _$GReviewInput._(
      {required this.stars, this.commentary, this.favorite_color, this.seenOn})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(stars, r'GReviewInput', 'stars');
  }

  @override
  GReviewInput rebuild(void Function(GReviewInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewInputBuilder toBuilder() => new GReviewInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewInput &&
        stars == other.stars &&
        commentary == other.commentary &&
        favorite_color == other.favorite_color &&
        seenOn == other.seenOn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stars.hashCode);
    _$hash = $jc(_$hash, commentary.hashCode);
    _$hash = $jc(_$hash, favorite_color.hashCode);
    _$hash = $jc(_$hash, seenOn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewInput')
          ..add('stars', stars)
          ..add('commentary', commentary)
          ..add('favorite_color', favorite_color)
          ..add('seenOn', seenOn))
        .toString();
  }
}

class GReviewInputBuilder
    implements Builder<GReviewInput, GReviewInputBuilder> {
  _$GReviewInput? _$v;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  String? _commentary;
  String? get commentary => _$this._commentary;
  set commentary(String? commentary) => _$this._commentary = commentary;

  GColorInputBuilder? _favorite_color;
  GColorInputBuilder get favorite_color =>
      _$this._favorite_color ??= new GColorInputBuilder();
  set favorite_color(GColorInputBuilder? favorite_color) =>
      _$this._favorite_color = favorite_color;

  ListBuilder<DateTime?>? _seenOn;
  ListBuilder<DateTime?> get seenOn =>
      _$this._seenOn ??= new ListBuilder<DateTime?>();
  set seenOn(ListBuilder<DateTime?>? seenOn) => _$this._seenOn = seenOn;

  GReviewInputBuilder();

  GReviewInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stars = $v.stars;
      _commentary = $v.commentary;
      _favorite_color = $v.favorite_color?.toBuilder();
      _seenOn = $v.seenOn?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewInput;
  }

  @override
  void update(void Function(GReviewInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewInput build() => _build();

  _$GReviewInput _build() {
    _$GReviewInput _$result;
    try {
      _$result = _$v ??
          new _$GReviewInput._(
              stars: BuiltValueNullFieldError.checkNotNull(
                  stars, r'GReviewInput', 'stars'),
              commentary: commentary,
              favorite_color: _favorite_color?.build(),
              seenOn: _seenOn?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favorite_color';
        _favorite_color?.build();
        _$failedField = 'seenOn';
        _seenOn?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewInput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GColorInput extends GColorInput {
  @override
  final int red;
  @override
  final int green;
  @override
  final int blue;

  factory _$GColorInput([void Function(GColorInputBuilder)? updates]) =>
      (new GColorInputBuilder()..update(updates))._build();

  _$GColorInput._({required this.red, required this.green, required this.blue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(red, r'GColorInput', 'red');
    BuiltValueNullFieldError.checkNotNull(green, r'GColorInput', 'green');
    BuiltValueNullFieldError.checkNotNull(blue, r'GColorInput', 'blue');
  }

  @override
  GColorInput rebuild(void Function(GColorInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GColorInputBuilder toBuilder() => new GColorInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GColorInput &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, red.hashCode);
    _$hash = $jc(_$hash, green.hashCode);
    _$hash = $jc(_$hash, blue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GColorInput')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class GColorInputBuilder implements Builder<GColorInput, GColorInputBuilder> {
  _$GColorInput? _$v;

  int? _red;
  int? get red => _$this._red;
  set red(int? red) => _$this._red = red;

  int? _green;
  int? get green => _$this._green;
  set green(int? green) => _$this._green = green;

  int? _blue;
  int? get blue => _$this._blue;
  set blue(int? blue) => _$this._blue = blue;

  GColorInputBuilder();

  GColorInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _red = $v.red;
      _green = $v.green;
      _blue = $v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GColorInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GColorInput;
  }

  @override
  void update(void Function(GColorInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GColorInput build() => _build();

  _$GColorInput _build() {
    final _$result = _$v ??
        new _$GColorInput._(
            red: BuiltValueNullFieldError.checkNotNull(
                red, r'GColorInput', 'red'),
            green: BuiltValueNullFieldError.checkNotNull(
                green, r'GColorInput', 'green'),
            blue: BuiltValueNullFieldError.checkNotNull(
                blue, r'GColorInput', 'blue'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostLikesInput extends GPostLikesInput {
  @override
  final String id;

  factory _$GPostLikesInput([void Function(GPostLikesInputBuilder)? updates]) =>
      (new GPostLikesInputBuilder()..update(updates))._build();

  _$GPostLikesInput._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GPostLikesInput', 'id');
  }

  @override
  GPostLikesInput rebuild(void Function(GPostLikesInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostLikesInputBuilder toBuilder() =>
      new GPostLikesInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostLikesInput && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostLikesInput')..add('id', id))
        .toString();
  }
}

class GPostLikesInputBuilder
    implements Builder<GPostLikesInput, GPostLikesInputBuilder> {
  _$GPostLikesInput? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostLikesInputBuilder();

  GPostLikesInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostLikesInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostLikesInput;
  }

  @override
  void update(void Function(GPostLikesInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostLikesInput build() => _build();

  _$GPostLikesInput _build() {
    final _$result = _$v ??
        new _$GPostLikesInput._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPostLikesInput', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostFavoritesInput extends GPostFavoritesInput {
  @override
  final String id;

  factory _$GPostFavoritesInput(
          [void Function(GPostFavoritesInputBuilder)? updates]) =>
      (new GPostFavoritesInputBuilder()..update(updates))._build();

  _$GPostFavoritesInput._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GPostFavoritesInput', 'id');
  }

  @override
  GPostFavoritesInput rebuild(
          void Function(GPostFavoritesInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFavoritesInputBuilder toBuilder() =>
      new GPostFavoritesInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFavoritesInput && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostFavoritesInput')..add('id', id))
        .toString();
  }
}

class GPostFavoritesInputBuilder
    implements Builder<GPostFavoritesInput, GPostFavoritesInputBuilder> {
  _$GPostFavoritesInput? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostFavoritesInputBuilder();

  GPostFavoritesInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFavoritesInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFavoritesInput;
  }

  @override
  void update(void Function(GPostFavoritesInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFavoritesInput build() => _build();

  _$GPostFavoritesInput _build() {
    final _$result = _$v ??
        new _$GPostFavoritesInput._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPostFavoritesInput', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GISODate extends GISODate {
  @override
  final String value;

  factory _$GISODate([void Function(GISODateBuilder)? updates]) =>
      (new GISODateBuilder()..update(updates))._build();

  _$GISODate._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GISODate', 'value');
  }

  @override
  GISODate rebuild(void Function(GISODateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GISODateBuilder toBuilder() => new GISODateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GISODate && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GISODate')..add('value', value))
        .toString();
  }
}

class GISODateBuilder implements Builder<GISODate, GISODateBuilder> {
  _$GISODate? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GISODateBuilder();

  GISODateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GISODate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GISODate;
  }

  @override
  void update(void Function(GISODateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GISODate build() => _build();

  _$GISODate _build() {
    final _$result = _$v ??
        new _$GISODate._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GISODate', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GJson extends GJson {
  @override
  final String value;

  factory _$GJson([void Function(GJsonBuilder)? updates]) =>
      (new GJsonBuilder()..update(updates))._build();

  _$GJson._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GJson', 'value');
  }

  @override
  GJson rebuild(void Function(GJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GJsonBuilder toBuilder() => new GJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GJson && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GJson')..add('value', value))
        .toString();
  }
}

class GJsonBuilder implements Builder<GJson, GJsonBuilder> {
  _$GJson? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GJsonBuilder();

  GJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GJson;
  }

  @override
  void update(void Function(GJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GJson build() => _build();

  _$GJson _build() {
    final _$result = _$v ??
        new _$GJson._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GJson', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
