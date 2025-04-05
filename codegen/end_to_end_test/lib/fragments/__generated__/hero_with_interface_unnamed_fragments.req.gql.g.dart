// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_unnamed_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceUnnamedFragments>
    _$gHeroWithInterfaceUnnamedFragmentsSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsSerializer();

class _$GHeroWithInterfaceUnnamedFragmentsSerializer
    implements StructuredSerializer<GHeroWithInterfaceUnnamedFragments> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragments,
    _$GHeroWithInterfaceUnnamedFragments
  ];
  @override
  final String wireName = 'GHeroWithInterfaceUnnamedFragments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceUnnamedFragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GHeroWithInterfaceUnnamedFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceUnnamedFragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.GHeroWithInterfaceUnnamedFragmentsVars))!
              as _i3.GHeroWithInterfaceUnnamedFragmentsVars);
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

class _$GHeroWithInterfaceUnnamedFragments
    extends GHeroWithInterfaceUnnamedFragments {
  @override
  final _i3.GHeroWithInterfaceUnnamedFragmentsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWithInterfaceUnnamedFragments(
          [void Function(GHeroWithInterfaceUnnamedFragmentsBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragments._(
      {required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GHeroWithInterfaceUnnamedFragments', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWithInterfaceUnnamedFragments', 'operation');
  }

  @override
  GHeroWithInterfaceUnnamedFragments rebuild(
          void Function(GHeroWithInterfaceUnnamedFragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragments &&
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
    return (newBuiltValueToStringHelper(r'GHeroWithInterfaceUnnamedFragments')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragments,
            GHeroWithInterfaceUnnamedFragmentsBuilder> {
  _$GHeroWithInterfaceUnnamedFragments? _$v;

  _i3.GHeroWithInterfaceUnnamedFragmentsVarsBuilder? _vars;
  _i3.GHeroWithInterfaceUnnamedFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithInterfaceUnnamedFragmentsVarsBuilder();
  set vars(_i3.GHeroWithInterfaceUnnamedFragmentsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWithInterfaceUnnamedFragmentsBuilder() {
    GHeroWithInterfaceUnnamedFragments._initializeBuilder(this);
  }

  GHeroWithInterfaceUnnamedFragmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceUnnamedFragments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragments;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceUnnamedFragmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragments build() => _build();

  _$GHeroWithInterfaceUnnamedFragments _build() {
    _$GHeroWithInterfaceUnnamedFragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceUnnamedFragments._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  r'GHeroWithInterfaceUnnamedFragments', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceUnnamedFragments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
