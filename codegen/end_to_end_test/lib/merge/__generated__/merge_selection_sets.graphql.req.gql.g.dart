// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMerge> _$gHeroMergeSerializer = new _$GHeroMergeSerializer();

class _$GHeroMergeSerializer implements StructuredSerializer<GHeroMerge> {
  @override
  final Iterable<Type> types = const [GHeroMerge, _$GHeroMerge];
  @override
  final String wireName = 'GHeroMerge';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroMerge object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroMergeVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroMerge deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroMergeVars))!
              as _i3.GHeroMergeVars);
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

class _$GHeroMerge extends GHeroMerge {
  @override
  final _i3.GHeroMergeVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroMerge([void Function(GHeroMergeBuilder)? updates]) =>
      (new GHeroMergeBuilder()..update(updates))._build();

  _$GHeroMerge._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroMerge', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroMerge', 'operation');
  }

  @override
  GHeroMerge rebuild(void Function(GHeroMergeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeBuilder toBuilder() => new GHeroMergeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMerge &&
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
    return (newBuiltValueToStringHelper(r'GHeroMerge')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroMergeBuilder implements Builder<GHeroMerge, GHeroMergeBuilder> {
  _$GHeroMerge? _$v;

  _i3.GHeroMergeVarsBuilder? _vars;
  _i3.GHeroMergeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroMergeVarsBuilder();
  set vars(_i3.GHeroMergeVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroMergeBuilder() {
    GHeroMerge._initializeBuilder(this);
  }

  GHeroMergeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMerge other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMerge;
  }

  @override
  void update(void Function(GHeroMergeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMerge build() => _build();

  _$GHeroMerge _build() {
    _$GHeroMerge _$result;
    try {
      _$result = _$v ??
          new _$GHeroMerge._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroMerge', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroMerge', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
