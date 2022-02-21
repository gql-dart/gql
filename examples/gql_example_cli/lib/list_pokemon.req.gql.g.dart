// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemon.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GListPokemon> _$gListPokemonSerializer =
    new _$GListPokemonSerializer();

class _$GListPokemonSerializer implements StructuredSerializer<GListPokemon> {
  @override
  final Iterable<Type> types = const [GListPokemon, _$GListPokemon];
  @override
  final String wireName = 'GListPokemon';

  @override
  Iterable<Object?> serialize(Serializers serializers, GListPokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GListPokemonVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GListPokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GListPokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GListPokemonVars))!
              as _i3.GListPokemonVars);
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

class _$GListPokemon extends GListPokemon {
  @override
  final _i3.GListPokemonVars vars;
  @override
  final _i1.Operation operation;

  factory _$GListPokemon([void Function(GListPokemonBuilder)? updates]) =>
      (new GListPokemonBuilder()..update(updates)).build();

  _$GListPokemon._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GListPokemon', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GListPokemon', 'operation');
  }

  @override
  GListPokemon rebuild(void Function(GListPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GListPokemonBuilder toBuilder() => new GListPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GListPokemon &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GListPokemon')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GListPokemonBuilder
    implements Builder<GListPokemon, GListPokemonBuilder> {
  _$GListPokemon? _$v;

  _i3.GListPokemonVarsBuilder? _vars;
  _i3.GListPokemonVarsBuilder get vars =>
      _$this._vars ??= new _i3.GListPokemonVarsBuilder();
  set vars(_i3.GListPokemonVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GListPokemonBuilder() {
    GListPokemon._initializeBuilder(this);
  }

  GListPokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GListPokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GListPokemon;
  }

  @override
  void update(void Function(GListPokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GListPokemon build() {
    _$GListPokemon _$result;
    try {
      _$result = _$v ??
          new _$GListPokemon._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GListPokemon', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GListPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
