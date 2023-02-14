// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_subtyped_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceSubTypedFragments>
    _$gHeroWithInterfaceSubTypedFragmentsSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsSerializer();

class _$GHeroWithInterfaceSubTypedFragmentsSerializer
    implements StructuredSerializer<GHeroWithInterfaceSubTypedFragments> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragments,
    _$GHeroWithInterfaceSubTypedFragments
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceSubTypedFragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GHeroWithInterfaceSubTypedFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceSubTypedFragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.GHeroWithInterfaceSubTypedFragmentsVars))!
              as _i3.GHeroWithInterfaceSubTypedFragmentsVars);
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

class _$GHeroWithInterfaceSubTypedFragments
    extends GHeroWithInterfaceSubTypedFragments {
  @override
  final _i3.GHeroWithInterfaceSubTypedFragmentsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWithInterfaceSubTypedFragments(
          [void Function(GHeroWithInterfaceSubTypedFragmentsBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragments._(
      {required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GHeroWithInterfaceSubTypedFragments', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWithInterfaceSubTypedFragments', 'operation');
  }

  @override
  GHeroWithInterfaceSubTypedFragments rebuild(
          void Function(GHeroWithInterfaceSubTypedFragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragments &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithInterfaceSubTypedFragments')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragments,
            GHeroWithInterfaceSubTypedFragmentsBuilder> {
  _$GHeroWithInterfaceSubTypedFragments? _$v;

  _i3.GHeroWithInterfaceSubTypedFragmentsVarsBuilder? _vars;
  _i3.GHeroWithInterfaceSubTypedFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithInterfaceSubTypedFragmentsVarsBuilder();
  set vars(_i3.GHeroWithInterfaceSubTypedFragmentsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWithInterfaceSubTypedFragmentsBuilder() {
    GHeroWithInterfaceSubTypedFragments._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragments;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragments build() => _build();

  _$GHeroWithInterfaceSubTypedFragments _build() {
    _$GHeroWithInterfaceSubTypedFragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceSubTypedFragments._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  r'GHeroWithInterfaceSubTypedFragments', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceSubTypedFragments',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
