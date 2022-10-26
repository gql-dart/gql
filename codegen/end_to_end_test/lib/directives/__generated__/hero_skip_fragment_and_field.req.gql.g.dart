// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip_fragment_and_field.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipFragment> _$gHeroSkipFragmentSerializer =
    new _$GHeroSkipFragmentSerializer();

class _$GHeroSkipFragmentSerializer
    implements StructuredSerializer<GHeroSkipFragment> {
  @override
  final Iterable<Type> types = const [GHeroSkipFragment, _$GHeroSkipFragment];
  @override
  final String wireName = 'GHeroSkipFragment';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroSkipFragment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroSkipFragmentVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroSkipFragment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipFragmentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroSkipFragmentVars))!
              as _i3.GHeroSkipFragmentVars);
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

class _$GHeroSkipFragment extends GHeroSkipFragment {
  @override
  final _i3.GHeroSkipFragmentVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroSkipFragment(
          [void Function(GHeroSkipFragmentBuilder)? updates]) =>
      (new GHeroSkipFragmentBuilder()..update(updates))._build();

  _$GHeroSkipFragment._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroSkipFragment', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroSkipFragment', 'operation');
  }

  @override
  GHeroSkipFragment rebuild(void Function(GHeroSkipFragmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentBuilder toBuilder() =>
      new GHeroSkipFragmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragment &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragment')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroSkipFragmentBuilder
    implements Builder<GHeroSkipFragment, GHeroSkipFragmentBuilder> {
  _$GHeroSkipFragment? _$v;

  _i3.GHeroSkipFragmentVarsBuilder? _vars;
  _i3.GHeroSkipFragmentVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroSkipFragmentVarsBuilder();
  set vars(_i3.GHeroSkipFragmentVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroSkipFragmentBuilder() {
    GHeroSkipFragment._initializeBuilder(this);
  }

  GHeroSkipFragmentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipFragment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragment;
  }

  @override
  void update(void Function(GHeroSkipFragmentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragment build() => _build();

  _$GHeroSkipFragment _build() {
    _$GHeroSkipFragment _$result;
    try {
      _$result = _$v ??
          new _$GHeroSkipFragment._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroSkipFragment', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroSkipFragment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
