// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql_skip.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeSkipVars> _$gHeroMergeSkipVarsSerializer =
    new _$GHeroMergeSkipVarsSerializer();

class _$GHeroMergeSkipVarsSerializer
    implements StructuredSerializer<GHeroMergeSkipVars> {
  @override
  final Iterable<Type> types = const [GHeroMergeSkipVars, _$GHeroMergeSkipVars];
  @override
  final String wireName = 'GHeroMergeSkipVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroMergeSkipVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'withName',
      serializers.serialize(object.withName,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroMergeSkipVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeSkipVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'withName':
          result.withName = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroMergeSkipVars extends GHeroMergeSkipVars {
  @override
  final bool withName;

  factory _$GHeroMergeSkipVars(
          [void Function(GHeroMergeSkipVarsBuilder)? updates]) =>
      (new GHeroMergeSkipVarsBuilder()..update(updates))._build();

  _$GHeroMergeSkipVars._({required this.withName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        withName, r'GHeroMergeSkipVars', 'withName');
  }

  @override
  GHeroMergeSkipVars rebuild(
          void Function(GHeroMergeSkipVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeSkipVarsBuilder toBuilder() =>
      new GHeroMergeSkipVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeSkipVars && withName == other.withName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, withName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroMergeSkipVars')
          ..add('withName', withName))
        .toString();
  }
}

class GHeroMergeSkipVarsBuilder
    implements Builder<GHeroMergeSkipVars, GHeroMergeSkipVarsBuilder> {
  _$GHeroMergeSkipVars? _$v;

  bool? _withName;
  bool? get withName => _$this._withName;
  set withName(bool? withName) => _$this._withName = withName;

  GHeroMergeSkipVarsBuilder();

  GHeroMergeSkipVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _withName = $v.withName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMergeSkipVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeSkipVars;
  }

  @override
  void update(void Function(GHeroMergeSkipVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeSkipVars build() => _build();

  _$GHeroMergeSkipVars _build() {
    final _$result = _$v ??
        new _$GHeroMergeSkipVars._(
            withName: BuiltValueNullFieldError.checkNotNull(
                withName, r'GHeroMergeSkipVars', 'withName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
