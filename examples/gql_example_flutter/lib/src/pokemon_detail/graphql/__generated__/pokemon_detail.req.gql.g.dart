// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetail> _$gPokemonDetailSerializer =
    new _$GPokemonDetailSerializer();

class _$GPokemonDetailSerializer
    implements StructuredSerializer<GPokemonDetail> {
  @override
  final Iterable<Type> types = const [GPokemonDetail, _$GPokemonDetail];
  @override
  final String wireName = 'GPokemonDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPokemonDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPokemonDetailVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GPokemonDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPokemonDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GPokemonDetailVars))!
              as _i3.GPokemonDetailVars);
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

class _$GPokemonDetail extends GPokemonDetail {
  @override
  final _i3.GPokemonDetailVars vars;
  @override
  final _i1.Operation operation;

  factory _$GPokemonDetail([void Function(GPokemonDetailBuilder)? updates]) =>
      (new GPokemonDetailBuilder()..update(updates))._build();

  _$GPokemonDetail._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GPokemonDetail', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GPokemonDetail', 'operation');
  }

  @override
  GPokemonDetail rebuild(void Function(GPokemonDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailBuilder toBuilder() =>
      new GPokemonDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetail &&
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
    return (newBuiltValueToStringHelper(r'GPokemonDetail')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GPokemonDetailBuilder
    implements Builder<GPokemonDetail, GPokemonDetailBuilder> {
  _$GPokemonDetail? _$v;

  _i3.GPokemonDetailVarsBuilder? _vars;
  _i3.GPokemonDetailVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPokemonDetailVarsBuilder();
  set vars(_i3.GPokemonDetailVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GPokemonDetailBuilder() {
    GPokemonDetail._initializeBuilder(this);
  }

  GPokemonDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPokemonDetail;
  }

  @override
  void update(void Function(GPokemonDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetail build() => _build();

  _$GPokemonDetail _build() {
    _$GPokemonDetail _$result;
    try {
      _$result = _$v ??
          new _$GPokemonDetail._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GPokemonDetail', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPokemonDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
