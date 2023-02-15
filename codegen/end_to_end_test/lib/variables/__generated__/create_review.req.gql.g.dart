// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateReview> _$gCreateReviewSerializer =
    new _$GCreateReviewSerializer();

class _$GCreateReviewSerializer implements StructuredSerializer<GCreateReview> {
  @override
  final Iterable<Type> types = const [GCreateReview, _$GCreateReview];
  @override
  final String wireName = 'GCreateReview';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreateReviewVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GCreateReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateReviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GCreateReviewVars))!
              as _i3.GCreateReviewVars);
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

class _$GCreateReview extends GCreateReview {
  @override
  final _i3.GCreateReviewVars vars;
  @override
  final _i1.Operation operation;

  factory _$GCreateReview([void Function(GCreateReviewBuilder)? updates]) =>
      (new GCreateReviewBuilder()..update(updates))._build();

  _$GCreateReview._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GCreateReview', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GCreateReview', 'operation');
  }

  @override
  GCreateReview rebuild(void Function(GCreateReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateReviewBuilder toBuilder() => new GCreateReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateReview &&
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
    return (newBuiltValueToStringHelper(r'GCreateReview')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GCreateReviewBuilder
    implements Builder<GCreateReview, GCreateReviewBuilder> {
  _$GCreateReview? _$v;

  _i3.GCreateReviewVarsBuilder? _vars;
  _i3.GCreateReviewVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreateReviewVarsBuilder();
  set vars(_i3.GCreateReviewVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GCreateReviewBuilder() {
    GCreateReview._initializeBuilder(this);
  }

  GCreateReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateReview;
  }

  @override
  void update(void Function(GCreateReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateReview build() => _build();

  _$GCreateReview _build() {
    _$GCreateReview _$result;
    try {
      _$result = _$v ??
          new _$GCreateReview._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GCreateReview', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateReview', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
