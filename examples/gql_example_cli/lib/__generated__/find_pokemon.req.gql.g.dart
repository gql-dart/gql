// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_pokemon.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFindPokemon> _$gFindPokemonSerializer = _$GFindPokemonSerializer();

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
    final result = GFindPokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
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
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
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
      (GFindPokemonBuilder()..update(updates))._build();

  _$GFindPokemon._({required this.vars, required this.operation}) : super._();
  @override
  GFindPokemon rebuild(void Function(GFindPokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonBuilder toBuilder() => GFindPokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemon &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFindPokemon')
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
      _$this._vars ??= _i3.GFindPokemonVarsBuilder();
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
    _$v = other as _$GFindPokemon;
  }

  @override
  void update(void Function(GFindPokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFindPokemon build() => _build();

  _$GFindPokemon _build() {
    _$GFindPokemon _$result;
    try {
      _$result = _$v ??
          _$GFindPokemon._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GFindPokemon', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GFindPokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
