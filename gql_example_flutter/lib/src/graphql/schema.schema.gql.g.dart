// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<pokemonInput> _$pokemonInputSerializer =
    new _$pokemonInputSerializer();

class _$pokemonInputSerializer implements StructuredSerializer<pokemonInput> {
  @override
  final Iterable<Type> types = const [pokemonInput, _$pokemonInput];
  @override
  final String wireName = 'pokemonInput';

  @override
  Iterable<Object> serialize(Serializers serializers, pokemonInput object,
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
  pokemonInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new pokemonInputBuilder();

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

class _$pokemonInput extends pokemonInput {
  @override
  final String id;
  @override
  final String name;

  factory _$pokemonInput([void Function(pokemonInputBuilder) updates]) =>
      (new pokemonInputBuilder()..update(updates)).build();

  _$pokemonInput._({this.id, this.name}) : super._();

  @override
  pokemonInput rebuild(void Function(pokemonInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  pokemonInputBuilder toBuilder() => new pokemonInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is pokemonInput && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('pokemonInput')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class pokemonInputBuilder
    implements Builder<pokemonInput, pokemonInputBuilder> {
  _$pokemonInput _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  pokemonInputBuilder();

  pokemonInputBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(pokemonInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$pokemonInput;
  }

  @override
  void update(void Function(pokemonInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$pokemonInput build() {
    final _$result = _$v ?? new _$pokemonInput._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
