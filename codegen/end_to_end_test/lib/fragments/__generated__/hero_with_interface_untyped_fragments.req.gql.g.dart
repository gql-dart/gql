// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_untyped_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithoutFragments> _$gHeroWithoutFragmentsSerializer =
    new _$GHeroWithoutFragmentsSerializer();

class _$GHeroWithoutFragmentsSerializer
    implements StructuredSerializer<GHeroWithoutFragments> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragments,
    _$GHeroWithoutFragments
  ];
  @override
  final String wireName = 'GHeroWithoutFragments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWithoutFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWithoutFragments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroWithoutFragmentsVars))!
              as _i3.GHeroWithoutFragmentsVars);
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

class _$GHeroWithoutFragments extends GHeroWithoutFragments {
  @override
  final _i3.GHeroWithoutFragmentsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWithoutFragments(
          [void Function(GHeroWithoutFragmentsBuilder)? updates]) =>
      (new GHeroWithoutFragmentsBuilder()..update(updates))._build();

  _$GHeroWithoutFragments._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GHeroWithoutFragments', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWithoutFragments', 'operation');
  }

  @override
  GHeroWithoutFragments rebuild(
          void Function(GHeroWithoutFragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsBuilder toBuilder() =>
      new GHeroWithoutFragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragments &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithoutFragments')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWithoutFragmentsBuilder
    implements Builder<GHeroWithoutFragments, GHeroWithoutFragmentsBuilder> {
  _$GHeroWithoutFragments? _$v;

  _i3.GHeroWithoutFragmentsVarsBuilder? _vars;
  _i3.GHeroWithoutFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithoutFragmentsVarsBuilder();
  set vars(_i3.GHeroWithoutFragmentsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWithoutFragmentsBuilder() {
    GHeroWithoutFragments._initializeBuilder(this);
  }

  GHeroWithoutFragmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithoutFragments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragments;
  }

  @override
  void update(void Function(GHeroWithoutFragmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragments build() => _build();

  _$GHeroWithoutFragments _build() {
    _$GHeroWithoutFragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithoutFragments._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroWithoutFragments', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithoutFragments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
