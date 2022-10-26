// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_duplicated_fields_due_to_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsDuplicationVars>
    _$gHeroWithFragmentsDuplicationVarsSerializer =
    new _$GHeroWithFragmentsDuplicationVarsSerializer();
Serializer<GheroDataVars> _$gheroDataVarsSerializer =
    new _$GheroDataVarsSerializer();

class _$GHeroWithFragmentsDuplicationVarsSerializer
    implements StructuredSerializer<GHeroWithFragmentsDuplicationVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsDuplicationVars,
    _$GHeroWithFragmentsDuplicationVars
  ];
  @override
  final String wireName = 'GHeroWithFragmentsDuplicationVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsDuplicationVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHeroWithFragmentsDuplicationVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHeroWithFragmentsDuplicationVarsBuilder().build();
  }
}

class _$GheroDataVarsSerializer implements StructuredSerializer<GheroDataVars> {
  @override
  final Iterable<Type> types = const [GheroDataVars, _$GheroDataVars];
  @override
  final String wireName = 'GheroDataVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GheroDataVarsBuilder().build();
  }
}

class _$GHeroWithFragmentsDuplicationVars
    extends GHeroWithFragmentsDuplicationVars {
  factory _$GHeroWithFragmentsDuplicationVars(
          [void Function(GHeroWithFragmentsDuplicationVarsBuilder)? updates]) =>
      (new GHeroWithFragmentsDuplicationVarsBuilder()..update(updates))
          ._build();

  _$GHeroWithFragmentsDuplicationVars._() : super._();

  @override
  GHeroWithFragmentsDuplicationVars rebuild(
          void Function(GHeroWithFragmentsDuplicationVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDuplicationVarsBuilder toBuilder() =>
      new GHeroWithFragmentsDuplicationVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsDuplicationVars;
  }

  @override
  int get hashCode {
    return 296781944;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHeroWithFragmentsDuplicationVars')
        .toString();
  }
}

class GHeroWithFragmentsDuplicationVarsBuilder
    implements
        Builder<GHeroWithFragmentsDuplicationVars,
            GHeroWithFragmentsDuplicationVarsBuilder> {
  _$GHeroWithFragmentsDuplicationVars? _$v;

  GHeroWithFragmentsDuplicationVarsBuilder();

  @override
  void replace(GHeroWithFragmentsDuplicationVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsDuplicationVars;
  }

  @override
  void update(
      void Function(GHeroWithFragmentsDuplicationVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsDuplicationVars build() => _build();

  _$GHeroWithFragmentsDuplicationVars _build() {
    final _$result = _$v ?? new _$GHeroWithFragmentsDuplicationVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataVars extends GheroDataVars {
  factory _$GheroDataVars([void Function(GheroDataVarsBuilder)? updates]) =>
      (new GheroDataVarsBuilder()..update(updates))._build();

  _$GheroDataVars._() : super._();

  @override
  GheroDataVars rebuild(void Function(GheroDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataVarsBuilder toBuilder() => new GheroDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataVars;
  }

  @override
  int get hashCode {
    return 172200517;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GheroDataVars').toString();
  }
}

class GheroDataVarsBuilder
    implements Builder<GheroDataVars, GheroDataVarsBuilder> {
  _$GheroDataVars? _$v;

  GheroDataVarsBuilder();

  @override
  void replace(GheroDataVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroDataVars;
  }

  @override
  void update(void Function(GheroDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroDataVars build() => _build();

  _$GheroDataVars _build() {
    final _$result = _$v ?? new _$GheroDataVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
