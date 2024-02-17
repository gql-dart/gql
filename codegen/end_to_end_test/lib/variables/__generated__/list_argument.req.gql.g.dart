// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_argument.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GreviewsWithListArgument> _$greviewsWithListArgumentSerializer =
    new _$GreviewsWithListArgumentSerializer();

class _$GreviewsWithListArgumentSerializer
    implements StructuredSerializer<GreviewsWithListArgument> {
  @override
  final Iterable<Type> types = const [
    GreviewsWithListArgument,
    _$GreviewsWithListArgument
  ];
  @override
  final String wireName = 'GreviewsWithListArgument';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GreviewsWithListArgument object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GreviewsWithListArgumentVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GreviewsWithListArgument deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreviewsWithListArgumentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GreviewsWithListArgumentVars))!
              as _i3.GreviewsWithListArgumentVars);
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

class _$GreviewsWithListArgument extends GreviewsWithListArgument {
  @override
  final _i3.GreviewsWithListArgumentVars vars;
  @override
  final _i1.Operation operation;

  factory _$GreviewsWithListArgument(
          [void Function(GreviewsWithListArgumentBuilder)? updates]) =>
      (new GreviewsWithListArgumentBuilder()..update(updates))._build();

  _$GreviewsWithListArgument._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GreviewsWithListArgument', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GreviewsWithListArgument', 'operation');
  }

  @override
  GreviewsWithListArgument rebuild(
          void Function(GreviewsWithListArgumentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreviewsWithListArgumentBuilder toBuilder() =>
      new GreviewsWithListArgumentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GreviewsWithListArgument &&
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
    return (newBuiltValueToStringHelper(r'GreviewsWithListArgument')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GreviewsWithListArgumentBuilder
    implements
        Builder<GreviewsWithListArgument, GreviewsWithListArgumentBuilder> {
  _$GreviewsWithListArgument? _$v;

  _i3.GreviewsWithListArgumentVarsBuilder? _vars;
  _i3.GreviewsWithListArgumentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GreviewsWithListArgumentVarsBuilder();
  set vars(_i3.GreviewsWithListArgumentVarsBuilder? vars) =>
      _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GreviewsWithListArgumentBuilder() {
    GreviewsWithListArgument._initializeBuilder(this);
  }

  GreviewsWithListArgumentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GreviewsWithListArgument other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GreviewsWithListArgument;
  }

  @override
  void update(void Function(GreviewsWithListArgumentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GreviewsWithListArgument build() => _build();

  _$GreviewsWithListArgument _build() {
    _$GreviewsWithListArgument _$result;
    try {
      _$result = _$v ??
          new _$GreviewsWithListArgument._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GreviewsWithListArgument', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GreviewsWithListArgument', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
