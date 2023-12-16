// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_with_scalar_var.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPostsWithFixedVariable> _$gPostsWithFixedVariableSerializer =
    new _$GPostsWithFixedVariableSerializer();

class _$GPostsWithFixedVariableSerializer
    implements StructuredSerializer<GPostsWithFixedVariable> {
  @override
  final Iterable<Type> types = const [
    GPostsWithFixedVariable,
    _$GPostsWithFixedVariable
  ];
  @override
  final String wireName = 'GPostsWithFixedVariable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostsWithFixedVariable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPostsWithFixedVariableVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GPostsWithFixedVariable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsWithFixedVariableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GPostsWithFixedVariableVars))!
              as _i3.GPostsWithFixedVariableVars);
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

class _$GPostsWithFixedVariable extends GPostsWithFixedVariable {
  @override
  final _i3.GPostsWithFixedVariableVars vars;
  @override
  final _i1.Operation operation;

  factory _$GPostsWithFixedVariable(
          [void Function(GPostsWithFixedVariableBuilder)? updates]) =>
      (new GPostsWithFixedVariableBuilder()..update(updates))._build();

  _$GPostsWithFixedVariable._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GPostsWithFixedVariable', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GPostsWithFixedVariable', 'operation');
  }

  @override
  GPostsWithFixedVariable rebuild(
          void Function(GPostsWithFixedVariableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsWithFixedVariableBuilder toBuilder() =>
      new GPostsWithFixedVariableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsWithFixedVariable &&
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
    return (newBuiltValueToStringHelper(r'GPostsWithFixedVariable')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GPostsWithFixedVariableBuilder
    implements
        Builder<GPostsWithFixedVariable, GPostsWithFixedVariableBuilder> {
  _$GPostsWithFixedVariable? _$v;

  _i3.GPostsWithFixedVariableVarsBuilder? _vars;
  _i3.GPostsWithFixedVariableVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPostsWithFixedVariableVarsBuilder();
  set vars(_i3.GPostsWithFixedVariableVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GPostsWithFixedVariableBuilder() {
    GPostsWithFixedVariable._initializeBuilder(this);
  }

  GPostsWithFixedVariableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsWithFixedVariable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsWithFixedVariable;
  }

  @override
  void update(void Function(GPostsWithFixedVariableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsWithFixedVariable build() => _build();

  _$GPostsWithFixedVariable _build() {
    _$GPostsWithFixedVariable _$result;
    try {
      _$result = _$v ??
          new _$GPostsWithFixedVariable._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GPostsWithFixedVariable', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostsWithFixedVariable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
