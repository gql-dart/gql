// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReproQuery> _$gReproQuerySerializer = new _$GReproQuerySerializer();

class _$GReproQuerySerializer implements StructuredSerializer<GReproQuery> {
  @override
  final Iterable<Type> types = const [GReproQuery, _$GReproQuery];
  @override
  final String wireName = 'GReproQuery';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReproQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GReproQueryVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GReproQuery deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReproQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GReproQueryVars))!
              as _i3.GReproQueryVars);
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

class _$GReproQuery extends GReproQuery {
  @override
  final _i3.GReproQueryVars vars;
  @override
  final _i1.Operation operation;

  factory _$GReproQuery([void Function(GReproQueryBuilder)? updates]) =>
      (new GReproQueryBuilder()..update(updates))._build();

  _$GReproQuery._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GReproQuery', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GReproQuery', 'operation');
  }

  @override
  GReproQuery rebuild(void Function(GReproQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReproQueryBuilder toBuilder() => new GReproQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReproQuery &&
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
    return (newBuiltValueToStringHelper(r'GReproQuery')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GReproQueryBuilder implements Builder<GReproQuery, GReproQueryBuilder> {
  _$GReproQuery? _$v;

  _i3.GReproQueryVarsBuilder? _vars;
  _i3.GReproQueryVarsBuilder get vars =>
      _$this._vars ??= new _i3.GReproQueryVarsBuilder();
  set vars(_i3.GReproQueryVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GReproQueryBuilder() {
    GReproQuery._initializeBuilder(this);
  }

  GReproQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReproQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReproQuery;
  }

  @override
  void update(void Function(GReproQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReproQuery build() => _build();

  _$GReproQuery _build() {
    _$GReproQuery _$result;
    try {
      _$result = _$v ??
          new _$GReproQuery._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GReproQuery', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReproQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
