// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_pokemon.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFindPokemon> _$gFindPokemonSerializer =
    new _$GFindPokemonSerializer();

class _$GFindPokemonSerializer implements StructuredSerializer<GFindPokemon> {
  @override
  final Iterable<Type> types = const [GFindPokemon, _$GFindPokemon];
  @override
  final String wireName = 'GFindPokemon';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFindPokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GFindPokemonVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GFindPokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GFindPokemonVars))!
              as _i3.GFindPokemonVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation)) as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GFindPokemon extends GFindPokemon {
  @override
  final _i3.GFindPokemonVars vars;
  @override
  final _i1.Operation operation;

  factory _$GFindPokemon([void Function(GFindPokemonBuilder)? updates]) =>
      (new GFindPokemonBuilder()..update(updates)).build();

  _$GFindPokemon._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GFindPokemon', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GFindPokemon', 'operation');
  }

  @override
  GFindPokemon rebuild(void Function(GFindPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonBuilder toBuilder() => new GFindPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemon &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFindPokemon')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GFindPokemonBuilder
    implements Builder<GFindPokemon, GFindPokemonBuilder> {
  _$GFindPokemon? _$v;

  _i3.GFindPokemonVarsBuilder? _vars;
  _i3.GFindPokemonVarsBuilder get vars =>
      _$this._vars ??= new _i3.GFindPokemonVarsBuilder();
  set vars(_i3.GFindPokemonVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GFindPokemonBuilder() {
    GFindPokemon._initializeBuilder(this);
  }

  GFindPokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemon;
  }

  @override
  void update(void Function(GFindPokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFindPokemon build() {
    _$GFindPokemon _$result;
    try {
      _$result = _$v ??
          new _$GFindPokemon._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GFindPokemon', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GFindPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
