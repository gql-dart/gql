// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTestQuery> _$gTestQuerySerializer = new _$GTestQuerySerializer();

class _$GTestQuerySerializer implements StructuredSerializer<GTestQuery> {
  @override
  final Iterable<Type> types = const [GTestQuery, _$GTestQuery];
  @override
  final String wireName = 'GTestQuery';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTestQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GTestQueryVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GTestQuery deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTestQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GTestQueryVars))!
              as _i3.GTestQueryVars);
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

class _$GTestQuery extends GTestQuery {
  @override
  final _i3.GTestQueryVars vars;
  @override
  final _i1.Operation operation;

  factory _$GTestQuery([void Function(GTestQueryBuilder)? updates]) =>
      (new GTestQueryBuilder()..update(updates))._build();

  _$GTestQuery._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GTestQuery', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GTestQuery', 'operation');
  }

  @override
  GTestQuery rebuild(void Function(GTestQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTestQueryBuilder toBuilder() => new GTestQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTestQuery &&
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
    return (newBuiltValueToStringHelper(r'GTestQuery')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GTestQueryBuilder implements Builder<GTestQuery, GTestQueryBuilder> {
  _$GTestQuery? _$v;

  _i3.GTestQueryVarsBuilder? _vars;
  _i3.GTestQueryVarsBuilder get vars =>
      _$this._vars ??= new _i3.GTestQueryVarsBuilder();
  set vars(_i3.GTestQueryVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GTestQueryBuilder() {
    GTestQuery._initializeBuilder(this);
  }

  GTestQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTestQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTestQuery;
  }

  @override
  void update(void Function(GTestQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTestQuery build() => _build();

  _$GTestQuery _build() {
    _$GTestQuery _$result;
    try {
      _$result = _$v ??
          new _$GTestQuery._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GTestQuery', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTestQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
