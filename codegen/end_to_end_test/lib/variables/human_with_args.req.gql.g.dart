// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanWithArgs> _$gHumanWithArgsSerializer =
    new _$GHumanWithArgsSerializer();

class _$GHumanWithArgsSerializer
    implements StructuredSerializer<GHumanWithArgs> {
  @override
  final Iterable<Type> types = const [GHumanWithArgs, _$GHumanWithArgs];
  @override
  final String wireName = 'GHumanWithArgs';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHumanWithArgs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHumanWithArgsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHumanWithArgs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHumanWithArgsVars))!
              as _i3.GHumanWithArgsVars);
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

class _$GHumanWithArgs extends GHumanWithArgs {
  @override
  final _i3.GHumanWithArgsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHumanWithArgs([void Function(GHumanWithArgsBuilder)? updates]) =>
      (new GHumanWithArgsBuilder()..update(updates)).build();

  _$GHumanWithArgs._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GHumanWithArgs', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GHumanWithArgs', 'operation');
  }

  @override
  GHumanWithArgs rebuild(void Function(GHumanWithArgsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsBuilder toBuilder() =>
      new GHumanWithArgsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgs &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHumanWithArgs')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHumanWithArgsBuilder
    implements Builder<GHumanWithArgs, GHumanWithArgsBuilder> {
  _$GHumanWithArgs? _$v;

  _i3.GHumanWithArgsVarsBuilder? _vars;
  _i3.GHumanWithArgsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHumanWithArgsVarsBuilder();
  set vars(_i3.GHumanWithArgsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHumanWithArgsBuilder() {
    GHumanWithArgs._initializeBuilder(this);
  }

  GHumanWithArgsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgs;
  }

  @override
  void update(void Function(GHumanWithArgsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHumanWithArgs build() {
    _$GHumanWithArgs _$result;
    try {
      _$result = _$v ??
          new _$GHumanWithArgs._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GHumanWithArgs', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHumanWithArgs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
