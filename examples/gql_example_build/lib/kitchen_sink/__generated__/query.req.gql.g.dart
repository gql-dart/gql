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
  Iterable<Object?> serialize(Serializers serializers, GQueryOperation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GQueryOperationVars))!
              as _i3.GQueryOperationVars);
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

class _$GQueryOperation extends GQueryOperation {
  @override
  final _i3.GQueryOperationVars vars;
  @override
  final _i1.Operation operation;

  factory _$GQueryOperation([void Function(GQueryOperationBuilder)? updates]) =>
      (new GQueryOperationBuilder()..update(updates))._build();

  _$GQueryOperation._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GQueryOperation', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GQueryOperation', 'operation');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryOperation')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GQueryOperationBuilder
    implements Builder<GQueryOperation, GQueryOperationBuilder> {
  _$GQueryOperation? _$v;

  _i3.GQueryOperationVarsBuilder? _vars;
  _i3.GQueryOperationVarsBuilder get vars =>
      _$this._vars ??= new _i3.GQueryOperationVarsBuilder();
  set vars(_i3.GQueryOperationVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GQueryOperationBuilder() {
    GQueryOperation._initializeBuilder(this);
  }

  GQueryOperationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperation;
  }

  @override
  void update(void Function(GQueryOperationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperation build() => _build();

  _$GQueryOperation _build() {
    _$GQueryOperation _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperation._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GQueryOperation', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GQueryOperation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
