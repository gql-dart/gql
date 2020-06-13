// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryOperation> _$gQueryOperationSerializer =
    new _$GQueryOperationSerializer();

class _$GQueryOperationSerializer
    implements StructuredSerializer<GQueryOperation> {
  @override
  final Iterable<Type> types = const [GQueryOperation, _$GQueryOperation];
  @override
  final String wireName = 'GQueryOperation';

  @override
  Iterable<Object> serialize(Serializers serializers, GQueryOperation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GQueryOperationVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GQueryOperation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQueryOperationVars))
              as _i3.GQueryOperationVars);
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

class _$GQueryOperation extends GQueryOperation {
  @override
  final _i3.GQueryOperationVars vars;
  @override
  final _i1.Operation operation;

  factory _$GQueryOperation([void Function(GQueryOperationBuilder) updates]) =>
      (new GQueryOperationBuilder()..update(updates)).build();

  _$GQueryOperation._({this.vars, this.operation}) : super._() {
    if (vars == null) {
      throw new BuiltValueNullFieldError('GQueryOperation', 'vars');
    }
    if (operation == null) {
      throw new BuiltValueNullFieldError('GQueryOperation', 'operation');
    }
  }

  @override
  GQueryOperation rebuild(void Function(GQueryOperationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationBuilder toBuilder() =>
      new GQueryOperationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperation &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQueryOperation')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GQueryOperationBuilder
    implements Builder<GQueryOperation, GQueryOperationBuilder> {
  _$GQueryOperation _$v;

  _i3.GQueryOperationVarsBuilder _vars;
  _i3.GQueryOperationVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQueryOperationVarsBuilder();
  set vars(_i3.GQueryOperationVarsBuilder vars) => _$this._vars = vars;

  _i1.Operation _operation;
  _i1.Operation get operation => _$this._operation;
  set operation(_i1.Operation operation) => _$this._operation = operation;

  GQueryOperationBuilder() {
    GQueryOperation._initializeBuilder(this);
  }

  GQueryOperationBuilder get _$this {
    if (_$v != null) {
      _vars = _$v.vars?.toBuilder();
      _operation = _$v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQueryOperation;
  }

  @override
  void update(void Function(GQueryOperationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQueryOperation build() {
    _$GQueryOperation _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperation._(vars: vars.build(), operation: operation);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQueryOperation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
