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
  Iterable<Object?> serialize(Serializers serializers, GShape object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
  GShape deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GShapeVars))!
              as _i3.GShapeVars);
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

class _$GShape extends GShape {
  @override
  final _i3.GShapeVars vars;
  @override
  final _i1.Operation operation;

  factory _$GShape([void Function(GShapeBuilder)? updates]) =>
      (new GShapeBuilder()..update(updates))._build();

  _$GShape._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GShape', 'vars');
    BuiltValueNullFieldError.checkNotNull(operation, r'GShape', 'operation');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GShape')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GShapeBuilder implements Builder<GShape, GShapeBuilder> {
  _$GShape? _$v;

  _i3.GShapeVarsBuilder? _vars;
  _i3.GShapeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GShapeVarsBuilder();
  set vars(_i3.GShapeVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GShapeBuilder() {
    GShape._initializeBuilder(this);
  }

  GShapeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GShape other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GShape;
  }

  @override
  void update(void Function(GShapeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GShape build() => _build();

  _$GShape _build() {
    _$GShape _$result;
    try {
      _$result = _$v ??
          new _$GShape._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GShape', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GShape', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
