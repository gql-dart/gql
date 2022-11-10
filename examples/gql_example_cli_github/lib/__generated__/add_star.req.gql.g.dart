// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_star.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddStar> _$gAddStarSerializer = new _$GAddStarSerializer();

class _$GAddStarSerializer implements StructuredSerializer<GAddStar> {
  @override
  final Iterable<Type> types = const [GAddStar, _$GAddStar];
  @override
  final String wireName = 'GAddStar';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddStar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAddStarVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GAddStar deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAddStarVars))!
              as _i3.GAddStarVars);
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

class _$GAddStar extends GAddStar {
  @override
  final _i3.GAddStarVars vars;
  @override
  final _i1.Operation operation;

  factory _$GAddStar([void Function(GAddStarBuilder)? updates]) =>
      (new GAddStarBuilder()..update(updates))._build();

  _$GAddStar._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GAddStar', 'vars');
    BuiltValueNullFieldError.checkNotNull(operation, r'GAddStar', 'operation');
  }

  @override
  GAddStar rebuild(void Function(GAddStarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddStarBuilder toBuilder() => new GAddStarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddStar &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddStar')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GAddStarBuilder implements Builder<GAddStar, GAddStarBuilder> {
  _$GAddStar? _$v;

  _i3.GAddStarVarsBuilder? _vars;
  _i3.GAddStarVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAddStarVarsBuilder();
  set vars(_i3.GAddStarVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GAddStarBuilder() {
    GAddStar._initializeBuilder(this);
  }

  GAddStarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddStar;
  }

  @override
  void update(void Function(GAddStarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddStar build() => _build();

  _$GAddStar _build() {
    _$GAddStar _$result;
    try {
      _$result = _$v ??
          new _$GAddStar._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GAddStar', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddStar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
