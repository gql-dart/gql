// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_subtyped_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceSubTypedFragmentsVars>
    _$gHeroWithInterfaceSubTypedFragmentsVarsSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsVarsSerializer();
Serializer<GheroFieldsFragmentVars> _$gheroFieldsFragmentVarsSerializer =
    new _$GheroFieldsFragmentVarsSerializer();
Serializer<GhumanFieldsFragmentVars> _$ghumanFieldsFragmentVarsSerializer =
    new _$GhumanFieldsFragmentVarsSerializer();

class _$GHeroWithInterfaceSubTypedFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithInterfaceSubTypedFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsVars,
    _$GHeroWithInterfaceSubTypedFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceSubTypedFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'episode',
      serializers.serialize(object.episode,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceSubTypedFragmentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode))! as _i1.GEpisode;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentVarsSerializer
    implements StructuredSerializer<GheroFieldsFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentVars,
    _$GheroFieldsFragmentVars
  ];
  @override
  final String wireName = 'GheroFieldsFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroFieldsFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GheroFieldsFragmentVarsBuilder().build();
  }
}

class _$GhumanFieldsFragmentVarsSerializer
    implements StructuredSerializer<GhumanFieldsFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentVars,
    _$GhumanFieldsFragmentVars
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GhumanFieldsFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GhumanFieldsFragmentVarsBuilder().build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsVars
    extends GHeroWithInterfaceSubTypedFragmentsVars {
  @override
  final _i1.GEpisode episode;

  factory _$GHeroWithInterfaceSubTypedFragmentsVars(
          [void Function(GHeroWithInterfaceSubTypedFragmentsVarsBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsVarsBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsVars._({required this.episode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GHeroWithInterfaceSubTypedFragmentsVars', 'episode');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsVars rebuild(
          void Function(GHeroWithInterfaceSubTypedFragmentsVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsVarsBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsVars &&
        episode == other.episode;
  }

  @override
  int get hashCode {
    return $jf($jc(0, episode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsVars')
          ..add('episode', episode))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsVarsBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsVars,
            GHeroWithInterfaceSubTypedFragmentsVarsBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  GHeroWithInterfaceSubTypedFragmentsVarsBuilder();

  GHeroWithInterfaceSubTypedFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsVars;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsVars build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsVars _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsVars._(
            episode: BuiltValueNullFieldError.checkNotNull(episode,
                r'GHeroWithInterfaceSubTypedFragmentsVars', 'episode'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentVars extends GheroFieldsFragmentVars {
  factory _$GheroFieldsFragmentVars(
          [void Function(GheroFieldsFragmentVarsBuilder)? updates]) =>
      (new GheroFieldsFragmentVarsBuilder()..update(updates))._build();

  _$GheroFieldsFragmentVars._() : super._();

  @override
  GheroFieldsFragmentVars rebuild(
          void Function(GheroFieldsFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentVarsBuilder toBuilder() =>
      new GheroFieldsFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentVars;
  }

  @override
  int get hashCode {
    return 964700462;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GheroFieldsFragmentVars').toString();
  }
}

class GheroFieldsFragmentVarsBuilder
    implements
        Builder<GheroFieldsFragmentVars, GheroFieldsFragmentVarsBuilder> {
  _$GheroFieldsFragmentVars? _$v;

  GheroFieldsFragmentVarsBuilder();

  @override
  void replace(GheroFieldsFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentVars;
  }

  @override
  void update(void Function(GheroFieldsFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentVars build() => _build();

  _$GheroFieldsFragmentVars _build() {
    final _$result = _$v ?? new _$GheroFieldsFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentVars extends GhumanFieldsFragmentVars {
  factory _$GhumanFieldsFragmentVars(
          [void Function(GhumanFieldsFragmentVarsBuilder)? updates]) =>
      (new GhumanFieldsFragmentVarsBuilder()..update(updates))._build();

  _$GhumanFieldsFragmentVars._() : super._();

  @override
  GhumanFieldsFragmentVars rebuild(
          void Function(GhumanFieldsFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentVarsBuilder toBuilder() =>
      new GhumanFieldsFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentVars;
  }

  @override
  int get hashCode {
    return 101332054;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GhumanFieldsFragmentVars').toString();
  }
}

class GhumanFieldsFragmentVarsBuilder
    implements
        Builder<GhumanFieldsFragmentVars, GhumanFieldsFragmentVarsBuilder> {
  _$GhumanFieldsFragmentVars? _$v;

  GhumanFieldsFragmentVarsBuilder();

  @override
  void replace(GhumanFieldsFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentVars;
  }

  @override
  void update(void Function(GhumanFieldsFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentVars build() => _build();

  _$GhumanFieldsFragmentVars _build() {
    final _$result = _$v ?? new _$GhumanFieldsFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
