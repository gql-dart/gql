// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_duplicate_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSearchResultsQuery> _$gSearchResultsQuerySerializer =
    _$GSearchResultsQuerySerializer();

class _$GSearchResultsQuerySerializer
    implements StructuredSerializer<GSearchResultsQuery> {
  @override
  final Iterable<Type> types = const [
    GSearchResultsQuery,
    _$GSearchResultsQuery
  ];
  @override
  final String wireName = 'GSearchResultsQuery';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchResultsQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GSearchResultsQueryVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GSearchResultsQuery deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GSearchResultsQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GSearchResultsQueryVars))!
              as _i3.GSearchResultsQueryVars);
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

class _$GSearchResultsQuery extends GSearchResultsQuery {
  @override
  final _i3.GSearchResultsQueryVars vars;
  @override
  final _i1.Operation operation;

  factory _$GSearchResultsQuery(
          [void Function(GSearchResultsQueryBuilder)? updates]) =>
      (GSearchResultsQueryBuilder()..update(updates))._build();

  _$GSearchResultsQuery._({required this.vars, required this.operation})
      : super._();
  @override
  GSearchResultsQuery rebuild(
          void Function(GSearchResultsQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchResultsQueryBuilder toBuilder() =>
      GSearchResultsQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchResultsQuery &&
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
    return (newBuiltValueToStringHelper(r'GSearchResultsQuery')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GSearchResultsQueryBuilder
    implements Builder<GSearchResultsQuery, GSearchResultsQueryBuilder> {
  _$GSearchResultsQuery? _$v;

  _i3.GSearchResultsQueryVarsBuilder? _vars;
  _i3.GSearchResultsQueryVarsBuilder get vars =>
      _$this._vars ??= _i3.GSearchResultsQueryVarsBuilder();
  set vars(_i3.GSearchResultsQueryVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GSearchResultsQueryBuilder() {
    GSearchResultsQuery._initializeBuilder(this);
  }

  GSearchResultsQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchResultsQuery other) {
    _$v = other as _$GSearchResultsQuery;
  }

  @override
  void update(void Function(GSearchResultsQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchResultsQuery build() => _build();

  _$GSearchResultsQuery _build() {
    _$GSearchResultsQuery _$result;
    try {
      _$result = _$v ??
          _$GSearchResultsQuery._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GSearchResultsQuery', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GSearchResultsQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
