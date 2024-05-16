// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonCardData> _$gPokemonCardDataSerializer =
    new _$GPokemonCardDataSerializer();

class _$GPokemonCardDataSerializer
    implements StructuredSerializer<GPokemonCardData> {
  @override
  final Iterable<Type> types = const [GPokemonCardData, _$GPokemonCardData];
  @override
  final String wireName = 'GPokemonCardData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPokemonCardData object,
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
    return result;
  }

  @override
  GPokemonCardData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonCardDataBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maxHP':
          result.maxHP = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCardData extends GPokemonCardData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? name;
  @override
  final int? maxHP;
  @override
  final String? image;

  factory _$GPokemonCardData(
          [void Function(GPokemonCardDataBuilder)? updates]) =>
      (new GPokemonCardDataBuilder()..update(updates))._build();

  _$GPokemonCardData._(
      {required this.G__typename,
      required this.id,
      this.name,
      this.maxHP,
      this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPokemonCardData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPokemonCardData', 'id');
  }

  @override
  GPokemonCardData rebuild(void Function(GPokemonCardDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCardDataBuilder toBuilder() =>
      new GPokemonCardDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCardData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        maxHP == other.maxHP &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, maxHP.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCardData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('maxHP', maxHP)
          ..add('image', image))
        .toString();
  }
}

class GPokemonCardDataBuilder
    implements Builder<GPokemonCardData, GPokemonCardDataBuilder> {
  _$GPokemonCardData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _maxHP;
  int? get maxHP => _$this._maxHP;
  set maxHP(int? maxHP) => _$this._maxHP = maxHP;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  GPokemonCardDataBuilder() {
    GPokemonCardData._initializeBuilder(this);
  }

  GPokemonCardDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _maxHP = $v.maxHP;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCardData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonCardData;
  }

  @override
  void update(void Function(GPokemonCardDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCardData build() => _build();

  _$GPokemonCardData _build() {
    final _$result = _$v ??
        new _$GPokemonCardData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonCardData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonCardData', 'id'),
            name: name,
            maxHP: maxHP,
            image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
