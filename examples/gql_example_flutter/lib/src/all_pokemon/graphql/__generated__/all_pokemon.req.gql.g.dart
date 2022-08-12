// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemon> _$gAllPokemonSerializer = new _$GAllPokemonSerializer();

class _$GAllPokemonSerializer implements StructuredSerializer<GAllPokemon> {
  @override
  final Iterable<Type> types = const [GAllPokemon, _$GAllPokemon];
  @override
  final String wireName = 'GAllPokemon';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllPokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAllPokemonVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GAllPokemon deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAllPokemonVars))!
              as _i3.GAllPokemonVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemon extends GAllPokemon {
  @override
  final _i3.GAllPokemonVars vars;
  @override
  final _i1.Operation operation;

  factory _$GAllPokemon([void Function(GAllPokemonBuilder)? updates]) =>
      (new GAllPokemonBuilder()..update(updates))._build();

  _$GAllPokemon._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GAllPokemon', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GAllPokemon', 'operation');
  }

  @override
  GAllPokemon rebuild(void Function(GAllPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonBuilder toBuilder() => new GAllPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemon &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemon')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GAllPokemonBuilder implements Builder<GAllPokemon, GAllPokemonBuilder> {
  _$GAllPokemon? _$v;

  _i3.GAllPokemonVarsBuilder? _vars;
  _i3.GAllPokemonVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAllPokemonVarsBuilder();
  set vars(_i3.GAllPokemonVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GAllPokemonBuilder() {
    GAllPokemon._initializeBuilder(this);
  }

  GAllPokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemon;
  }

  @override
  void update(void Function(GAllPokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemon build() => _build();

  _$GAllPokemon _build() {
    _$GAllPokemon _$result;
    try {
      _$result = _$v ??
          new _$GAllPokemon._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GAllPokemon', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAllPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
