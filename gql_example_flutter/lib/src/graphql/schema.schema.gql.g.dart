// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonInput> _$pokemonInputSerializer =
    new _$PokemonInputSerializer();

class _$PokemonInputSerializer implements StructuredSerializer<PokemonInput> {
  @override
  final Iterable<Type> types = const [PokemonInput, _$PokemonInput];
  @override
  final String wireName = 'PokemonInput';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonInputBuilder();

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
      }
    }

    return result.build();
  }
}

class _$PokemonInput extends PokemonInput {
  @override
  final String id;
  @override
  final String name;

  factory _$PokemonInput([void Function(PokemonInputBuilder) updates]) =>
      (new PokemonInputBuilder()..update(updates)).build();

  _$PokemonInput._({this.id, this.name}) : super._();

  @override
  PokemonInput rebuild(void Function(PokemonInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonInputBuilder toBuilder() => new PokemonInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonInput && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonInput')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class PokemonInputBuilder
    implements Builder<PokemonInput, PokemonInputBuilder> {
  _$PokemonInput _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PokemonInputBuilder();

  PokemonInputBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonInput;
  }

  @override
  void update(void Function(PokemonInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonInput build() {
    final _$result = _$v ?? new _$PokemonInput._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
