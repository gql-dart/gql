// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_for_episode.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroForEpisode> _$gHeroForEpisodeSerializer =
    new _$GHeroForEpisodeSerializer();

class _$GHeroForEpisodeSerializer
    implements StructuredSerializer<GHeroForEpisode> {
  @override
  final Iterable<Type> types = const [GHeroForEpisode, _$GHeroForEpisode];
  @override
  final String wireName = 'GHeroForEpisode';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroForEpisode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroForEpisodeVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroForEpisode deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroForEpisodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroForEpisodeVars))!
              as _i3.GHeroForEpisodeVars);
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

class _$GHeroForEpisode extends GHeroForEpisode {
  @override
  final _i3.GHeroForEpisodeVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroForEpisode([void Function(GHeroForEpisodeBuilder)? updates]) =>
      (new GHeroForEpisodeBuilder()..update(updates)).build();

  _$GHeroForEpisode._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GHeroForEpisode', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GHeroForEpisode', 'operation');
  }

  @override
  GHeroForEpisode rebuild(void Function(GHeroForEpisodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroForEpisodeBuilder toBuilder() =>
      new GHeroForEpisodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroForEpisode &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GHeroForEpisode')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroForEpisodeBuilder
    implements Builder<GHeroForEpisode, GHeroForEpisodeBuilder> {
  _$GHeroForEpisode? _$v;

  _i3.GHeroForEpisodeVarsBuilder? _vars;
  _i3.GHeroForEpisodeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroForEpisodeVarsBuilder();
  set vars(_i3.GHeroForEpisodeVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroForEpisodeBuilder() {
    GHeroForEpisode._initializeBuilder(this);
  }

  GHeroForEpisodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroForEpisode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroForEpisode;
  }

  @override
  void update(void Function(GHeroForEpisodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GHeroForEpisode build() {
    _$GHeroForEpisode _$result;
    try {
      _$result = _$v ??
          new _$GHeroForEpisode._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GHeroForEpisode', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GHeroForEpisode', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
