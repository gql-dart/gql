// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_custom_field.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateCustomField> _$gCreateCustomFieldSerializer =
    new _$GCreateCustomFieldSerializer();

class _$GCreateCustomFieldSerializer
    implements StructuredSerializer<GCreateCustomField> {
  @override
  final Iterable<Type> types = const [GCreateCustomField, _$GCreateCustomField];
  @override
  final String wireName = 'GCreateCustomField';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCustomField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreateCustomFieldVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GCreateCustomField deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCustomFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GCreateCustomFieldVars))!
              as _i3.GCreateCustomFieldVars);
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

class _$GCreateCustomField extends GCreateCustomField {
  @override
  final _i3.GCreateCustomFieldVars vars;
  @override
  final _i1.Operation operation;

  factory _$GCreateCustomField(
          [void Function(GCreateCustomFieldBuilder)? updates]) =>
      (new GCreateCustomFieldBuilder()..update(updates))._build();

  _$GCreateCustomField._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GCreateCustomField', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GCreateCustomField', 'operation');
  }

  @override
  GCreateCustomField rebuild(
          void Function(GCreateCustomFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCustomFieldBuilder toBuilder() =>
      new GCreateCustomFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCustomField &&
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
    return (newBuiltValueToStringHelper(r'GCreateCustomField')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GCreateCustomFieldBuilder
    implements Builder<GCreateCustomField, GCreateCustomFieldBuilder> {
  _$GCreateCustomField? _$v;

  _i3.GCreateCustomFieldVarsBuilder? _vars;
  _i3.GCreateCustomFieldVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreateCustomFieldVarsBuilder();
  set vars(_i3.GCreateCustomFieldVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GCreateCustomFieldBuilder() {
    GCreateCustomField._initializeBuilder(this);
  }

  GCreateCustomFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCustomField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCustomField;
  }

  @override
  void update(void Function(GCreateCustomFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCustomField build() => _build();

  _$GCreateCustomField _build() {
    _$GCreateCustomField _$result;
    try {
      _$result = _$v ??
          new _$GCreateCustomField._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GCreateCustomField', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateCustomField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
