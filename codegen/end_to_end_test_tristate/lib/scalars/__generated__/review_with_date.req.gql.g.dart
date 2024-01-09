// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_with_date.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReviewWithDate> _$gReviewWithDateSerializer =
    new _$GReviewWithDateSerializer();

class _$GReviewWithDateSerializer
    implements StructuredSerializer<GReviewWithDate> {
  @override
  final Iterable<Type> types = const [GReviewWithDate, _$GReviewWithDate];
  @override
  final String wireName = 'GReviewWithDate';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReviewWithDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GReviewWithDateVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GReviewWithDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReviewWithDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GReviewWithDateVars))!
              as _i3.GReviewWithDateVars);
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

class _$GReviewWithDate extends GReviewWithDate {
  @override
  final _i3.GReviewWithDateVars vars;
  @override
  final _i1.Operation operation;

  factory _$GReviewWithDate([void Function(GReviewWithDateBuilder)? updates]) =>
      (new GReviewWithDateBuilder()..update(updates))._build();

  _$GReviewWithDate._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GReviewWithDate', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GReviewWithDate', 'operation');
  }

  @override
  GReviewWithDate rebuild(void Function(GReviewWithDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewWithDateBuilder toBuilder() =>
      new GReviewWithDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewWithDate &&
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
    return (newBuiltValueToStringHelper(r'GReviewWithDate')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GReviewWithDateBuilder
    implements Builder<GReviewWithDate, GReviewWithDateBuilder> {
  _$GReviewWithDate? _$v;

  _i3.GReviewWithDateVarsBuilder? _vars;
  _i3.GReviewWithDateVarsBuilder get vars =>
      _$this._vars ??= new _i3.GReviewWithDateVarsBuilder();
  set vars(_i3.GReviewWithDateVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GReviewWithDateBuilder() {
    GReviewWithDate._initializeBuilder(this);
  }

  GReviewWithDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewWithDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewWithDate;
  }

  @override
  void update(void Function(GReviewWithDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewWithDate build() => _build();

  _$GReviewWithDate _build() {
    _$GReviewWithDate _$result;
    try {
      _$result = _$v ??
          new _$GReviewWithDate._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GReviewWithDate', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewWithDate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
