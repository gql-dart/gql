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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
