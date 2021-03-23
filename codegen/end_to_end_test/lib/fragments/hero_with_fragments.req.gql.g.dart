// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragments> _$gHeroWithFragmentsSerializer =
    new _$GHeroWithFragmentsSerializer();

class _$GHeroWithFragmentsSerializer
    implements StructuredSerializer<GHeroWithFragments> {
  @override
  final Iterable<Type> types = const [GHeroWithFragments, _$GHeroWithFragments];
  @override
  final String wireName = 'GHeroWithFragments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWithFragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWithFragments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroWithFragmentsVars))!
              as _i3.GHeroWithFragmentsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation)) as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragments extends GHeroWithFragments {
  @override
  final _i3.GHeroWithFragmentsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWithFragments(
          [void Function(GHeroWithFragmentsBuilder)? updates]) =>
      (new GHeroWithFragmentsBuilder()..update(updates)).build();

  _$GHeroWithFragments._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GHeroWithFragments', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GHeroWithFragments', 'operation');
  }

  @override
  GHeroWithFragments rebuild(
          void Function(GHeroWithFragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsBuilder toBuilder() =>
      new GHeroWithFragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragments &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroWithFragments')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWithFragmentsBuilder
    implements Builder<GHeroWithFragments, GHeroWithFragmentsBuilder> {
  _$GHeroWithFragments? _$v;

  _i3.GHeroWithFragmentsVarsBuilder? _vars;
  _i3.GHeroWithFragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithFragmentsVarsBuilder();
  set vars(_i3.GHeroWithFragmentsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWithFragmentsBuilder() {
    GHeroWithFragments._initializeBuilder(this);
  }

  GHeroWithFragmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragments;
  }

  @override
  void update(void Function(GHeroWithFragmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroWithFragments build() {
    _$GHeroWithFragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragments._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GHeroWithFragments', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroWithFragments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
