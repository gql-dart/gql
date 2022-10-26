// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeVars> _$gHeroMergeVarsSerializer =
    new _$GHeroMergeVarsSerializer();

class _$GHeroMergeVarsSerializer
    implements StructuredSerializer<GHeroMergeVars> {
  @override
  final Iterable<Type> types = const [GHeroMergeVars, _$GHeroMergeVars];
  @override
  final String wireName = 'GHeroMergeVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroMergeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHeroMergeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHeroMergeVarsBuilder().build();
  }
}

class _$GHeroMergeVars extends GHeroMergeVars {
  factory _$GHeroMergeVars([void Function(GHeroMergeVarsBuilder)? updates]) =>
      (new GHeroMergeVarsBuilder()..update(updates))._build();

  _$GHeroMergeVars._() : super._();

  @override
  GHeroMergeVars rebuild(void Function(GHeroMergeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeVarsBuilder toBuilder() =>
      new GHeroMergeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeVars;
  }

  @override
  int get hashCode {
    return 224841185;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHeroMergeVars').toString();
  }
}

class GHeroMergeVarsBuilder
    implements Builder<GHeroMergeVars, GHeroMergeVarsBuilder> {
  _$GHeroMergeVars? _$v;

  GHeroMergeVarsBuilder();

  @override
  void replace(GHeroMergeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeVars;
  }

  @override
  void update(void Function(GHeroMergeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeVars build() => _build();

  _$GHeroMergeVars _build() {
    final _$result = _$v ?? new _$GHeroMergeVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
