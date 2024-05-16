// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailVars> _$gPokemonDetailVarsSerializer =
    new _$GPokemonDetailVarsSerializer();

class _$GPokemonDetailVarsSerializer
    implements StructuredSerializer<GPokemonDetailVars> {
  @override
  final Iterable<Type> types = const [GPokemonDetailVars, _$GPokemonDetailVars];
  @override
  final String wireName = 'GPokemonDetailVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
  GPokemonDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$GPokemonDetailVars extends GPokemonDetailVars {
  @override
  final String? id;
  @override
  final String? name;

  factory _$GPokemonDetailVars(
          [void Function(GPokemonDetailVarsBuilder)? updates]) =>
      (new GPokemonDetailVarsBuilder()..update(updates))._build();

  _$GPokemonDetailVars._({this.id, this.name}) : super._();

  @override
  GPokemonDetailVars rebuild(
          void Function(GPokemonDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailVarsBuilder toBuilder() =>
      new GPokemonDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailVars && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailVars')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailVarsBuilder
    implements Builder<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  _$GPokemonDetailVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailVarsBuilder();

  GPokemonDetailVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetailVars;
  }

  @override
  void update(void Function(GPokemonDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailVars build() => _build();

  _$GPokemonDetailVars _build() {
    final _$result = _$v ?? new _$GPokemonDetailVars._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
