// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_star.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRemoveStar> _$gRemoveStarSerializer = new _$GRemoveStarSerializer();

class _$GRemoveStarSerializer implements StructuredSerializer<GRemoveStar> {
  @override
  final Iterable<Type> types = const [GRemoveStar, _$GRemoveStar];
  @override
  final String wireName = 'GRemoveStar';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRemoveStar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GRemoveStarVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GRemoveStar deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GRemoveStarVars))!
              as _i3.GRemoveStarVars);
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

class _$GRemoveStar extends GRemoveStar {
  @override
  final _i3.GRemoveStarVars vars;
  @override
  final _i1.Operation operation;

  factory _$GRemoveStar([void Function(GRemoveStarBuilder)? updates]) =>
      (new GRemoveStarBuilder()..update(updates)).build();

  _$GRemoveStar._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GRemoveStar', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GRemoveStar', 'operation');
  }

  @override
  GRemoveStar rebuild(void Function(GRemoveStarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarBuilder toBuilder() => new GRemoveStarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStar &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRemoveStar')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GRemoveStarBuilder implements Builder<GRemoveStar, GRemoveStarBuilder> {
  _$GRemoveStar? _$v;

  _i3.GRemoveStarVarsBuilder? _vars;
  _i3.GRemoveStarVarsBuilder get vars =>
      _$this._vars ??= new _i3.GRemoveStarVarsBuilder();
  set vars(_i3.GRemoveStarVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GRemoveStarBuilder() {
    GRemoveStar._initializeBuilder(this);
  }

  GRemoveStarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStar;
  }

  @override
  void update(void Function(GRemoveStarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRemoveStar build() {
    _$GRemoveStar _$result;
    try {
      _$result = _$v ??
          new _$GRemoveStar._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GRemoveStar', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GRemoveStar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
