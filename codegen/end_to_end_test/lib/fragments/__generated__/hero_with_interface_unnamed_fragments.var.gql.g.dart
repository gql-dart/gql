// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_unnamed_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceUnnamedFragmentsVars>
    _$gHeroWithInterfaceUnnamedFragmentsVarsSerializer =
    new _$GHeroWithInterfaceUnnamedFragmentsVarsSerializer();

class _$GHeroWithInterfaceUnnamedFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithInterfaceUnnamedFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceUnnamedFragmentsVars,
    _$GHeroWithInterfaceUnnamedFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithInterfaceUnnamedFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceUnnamedFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'episode',
      serializers.serialize(object.episode,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceUnnamedFragmentsVarsBuilder();

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

class _$GHeroWithInterfaceUnnamedFragmentsVars
    extends GHeroWithInterfaceUnnamedFragmentsVars {
  @override
  final _i1.GEpisode episode;

  factory _$GHeroWithInterfaceUnnamedFragmentsVars(
          [void Function(GHeroWithInterfaceUnnamedFragmentsVarsBuilder)?
              updates]) =>
      (new GHeroWithInterfaceUnnamedFragmentsVarsBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceUnnamedFragmentsVars._({required this.episode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GHeroWithInterfaceUnnamedFragmentsVars', 'episode');
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsVars rebuild(
          void Function(GHeroWithInterfaceUnnamedFragmentsVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceUnnamedFragmentsVarsBuilder toBuilder() =>
      new GHeroWithInterfaceUnnamedFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceUnnamedFragmentsVars &&
        episode == other.episode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceUnnamedFragmentsVars')
          ..add('episode', episode))
        .toString();
  }
}

class GHeroWithInterfaceUnnamedFragmentsVarsBuilder
    implements
        Builder<GHeroWithInterfaceUnnamedFragmentsVars,
            GHeroWithInterfaceUnnamedFragmentsVarsBuilder> {
  _$GHeroWithInterfaceUnnamedFragmentsVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  GHeroWithInterfaceUnnamedFragmentsVarsBuilder();

  GHeroWithInterfaceUnnamedFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceUnnamedFragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceUnnamedFragmentsVars;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceUnnamedFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceUnnamedFragmentsVars build() => _build();

  _$GHeroWithInterfaceUnnamedFragmentsVars _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceUnnamedFragmentsVars._(
          episode: BuiltValueNullFieldError.checkNotNull(
              episode, r'GHeroWithInterfaceUnnamedFragmentsVars', 'episode'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
