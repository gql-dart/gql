// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GShape> _$gShapeSerializer = new _$GShapeSerializer();

class _$GShapeSerializer implements StructuredSerializer<GShape> {
  @override
  final Iterable<Type> types = const [GShape, _$GShape];
  @override
  final String wireName = 'GShape';

  @override
  Iterable<Object> serialize(Serializers serializers, GShape object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GShapeVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GShape deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i3.GShapeVars)) as _i3.GShapeVars);
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

class _$GShape extends GShape {
  @override
  final _i3.GShapeVars vars;
  @override
  final _i1.Operation operation;

  factory _$GShape([void Function(GShapeBuilder) updates]) =>
      (new GShapeBuilder()..update(updates)).build();

  _$GShape._({this.vars, this.operation}) : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GShape', 'vars');
    }
    if (operation == null) {
      throw new BuiltValueNullFieldError('GShape', 'operation');
    }
  }

  @override
  GShape rebuild(void Function(GShapeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GShapeBuilder toBuilder() => new GShapeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GShape &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GShape')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GShapeBuilder implements Builder<GShape, GShapeBuilder> {
  _$GShape _$v;

  _i3.GShapeVarsBuilder _vars;
  _i3.GShapeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GShapeVarsBuilder();
  set vars(_i3.GShapeVarsBuilder vars) => _$this._vars = vars;

  _i1.Operation _operation;
  _i1.Operation get operation => _$this._operation;
  set operation(_i1.Operation operation) => _$this._operation = operation;

  GShapeBuilder() {
    GShape._initializeBuilder(this);
  }

  GShapeBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _operation = _$v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GShape other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GShape;
  }

  @override
  void update(void Function(GShapeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GShape build() {
    _$GShape _$result;
    try {
      _$result =
          _$v ?? new _$GShape._(vars: vars.build(), operation: operation);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GShape', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
