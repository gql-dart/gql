// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_untyped_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithoutFragmentsVars> _$gHeroWithoutFragmentsVarsSerializer =
    new _$GHeroWithoutFragmentsVarsSerializer();

class _$GHeroWithoutFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithoutFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithoutFragmentsVars,
    _$GHeroWithoutFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithoutFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithoutFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'episode',
      serializers.serialize(object.episode,
          specifiedType: const FullType(_i1.GEpisode)),
    ];

    return result;
  }

  @override
  GHeroWithoutFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithoutFragmentsVarsBuilder();

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

class _$GHeroWithoutFragmentsVars extends GHeroWithoutFragmentsVars {
  @override
  final _i1.GEpisode episode;

  factory _$GHeroWithoutFragmentsVars(
          [void Function(GHeroWithoutFragmentsVarsBuilder)? updates]) =>
      (new GHeroWithoutFragmentsVarsBuilder()..update(updates))._build();

  _$GHeroWithoutFragmentsVars._({required this.episode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GHeroWithoutFragmentsVars', 'episode');
  }

  @override
  GHeroWithoutFragmentsVars rebuild(
          void Function(GHeroWithoutFragmentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithoutFragmentsVarsBuilder toBuilder() =>
      new GHeroWithoutFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithoutFragmentsVars && episode == other.episode;
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
    return (newBuiltValueToStringHelper(r'GHeroWithoutFragmentsVars')
          ..add('episode', episode))
        .toString();
  }
}

class GHeroWithoutFragmentsVarsBuilder
    implements
        Builder<GHeroWithoutFragmentsVars, GHeroWithoutFragmentsVarsBuilder> {
  _$GHeroWithoutFragmentsVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  GHeroWithoutFragmentsVarsBuilder();

  GHeroWithoutFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithoutFragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithoutFragmentsVars;
  }

  @override
  void update(void Function(GHeroWithoutFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithoutFragmentsVars build() => _build();

  _$GHeroWithoutFragmentsVars _build() {
    final _$result = _$v ??
        new _$GHeroWithoutFragmentsVars._(
            episode: BuiltValueNullFieldError.checkNotNull(
                episode, r'GHeroWithoutFragmentsVars', 'episode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
