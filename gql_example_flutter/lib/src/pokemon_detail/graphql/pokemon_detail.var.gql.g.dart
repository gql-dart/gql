// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonDetailVars> _$pokemonDetailVarsSerializer =
    new _$PokemonDetailVarsSerializer();

class _$PokemonDetailVarsSerializer
    implements StructuredSerializer<PokemonDetailVars> {
  @override
  final Iterable<Type> types = const [PokemonDetailVars, _$PokemonDetailVars];
  @override
  final String wireName = 'PokemonDetailVars';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(_i1.pokemonInput)));
    }
    return result;
  }

  @override
  PokemonDetailVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.pokemonInput))
              as _i1.pokemonInput);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetailVars extends PokemonDetailVars {
  @override
  final _i1.pokemonInput input;

  factory _$PokemonDetailVars(
          [void Function(PokemonDetailVarsBuilder) updates]) =>
      (new PokemonDetailVarsBuilder()..update(updates)).build();

  _$PokemonDetailVars._({this.input}) : super._();

  @override
  PokemonDetailVars rebuild(void Function(PokemonDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailVarsBuilder toBuilder() =>
      new PokemonDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailVars && input == other.input;
  }

  @override
  int get hashCode {
    return $jf($jc(0, input.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailVars')
          ..add('input', input))
        .toString();
  }
}

class PokemonDetailVarsBuilder
    implements Builder<PokemonDetailVars, PokemonDetailVarsBuilder> {
  _$PokemonDetailVars _$v;

  _i1.pokemonInputBuilder _input;
  _i1.pokemonInputBuilder get input =>
      _$this._input ??= new _i1.pokemonInputBuilder();
  set input(_i1.pokemonInputBuilder input) => _$this._input = input;

  PokemonDetailVarsBuilder();

  PokemonDetailVarsBuilder get _$this {
    if (_$v != null) {
      _input = _$v.input?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailVars;
  }

  @override
  void update(void Function(PokemonDetailVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailVars build() {
    _$PokemonDetailVars _$result;
    try {
      _$result = _$v ?? new _$PokemonDetailVars._(input: _input?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'input';
        _input?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetailVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
