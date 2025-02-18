// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql_skip.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeSkip> _$gHeroMergeSkipSerializer =
    new _$GHeroMergeSkipSerializer();

class _$GHeroMergeSkipSerializer
    implements StructuredSerializer<GHeroMergeSkip> {
  @override
  final Iterable<Type> types = const [GHeroMergeSkip, _$GHeroMergeSkip];
  @override
  final String wireName = 'GHeroMergeSkip';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroMergeSkip object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroMergeSkipVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroMergeSkip deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeSkipBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroMergeSkipVars))!
              as _i3.GHeroMergeSkipVars);
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

class _$GHeroMergeSkip extends GHeroMergeSkip {
  @override
  final _i3.GHeroMergeSkipVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroMergeSkip([void Function(GHeroMergeSkipBuilder)? updates]) =>
      (new GHeroMergeSkipBuilder()..update(updates))._build();

  _$GHeroMergeSkip._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroMergeSkip', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroMergeSkip', 'operation');
  }

  @override
  GHeroMergeSkip rebuild(void Function(GHeroMergeSkipBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeSkipBuilder toBuilder() =>
      new GHeroMergeSkipBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeSkip &&
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
    return (newBuiltValueToStringHelper(r'GHeroMergeSkip')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroMergeSkipBuilder
    implements Builder<GHeroMergeSkip, GHeroMergeSkipBuilder> {
  _$GHeroMergeSkip? _$v;

  _i3.GHeroMergeSkipVarsBuilder? _vars;
  _i3.GHeroMergeSkipVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroMergeSkipVarsBuilder();
  set vars(_i3.GHeroMergeSkipVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroMergeSkipBuilder() {
    GHeroMergeSkip._initializeBuilder(this);
  }

  GHeroMergeSkipBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMergeSkip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeSkip;
  }

  @override
  void update(void Function(GHeroMergeSkipBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeSkip build() => _build();

  _$GHeroMergeSkip _build() {
    _$GHeroMergeSkip _$result;
    try {
      _$result = _$v ??
          new _$GHeroMergeSkip._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroMergeSkip', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroMergeSkip', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
