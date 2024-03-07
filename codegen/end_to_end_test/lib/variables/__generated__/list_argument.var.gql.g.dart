// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_argument.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GreviewsWithListArgumentVars>
    _$greviewsWithListArgumentVarsSerializer =
    new _$GreviewsWithListArgumentVarsSerializer();

class _$GreviewsWithListArgumentVarsSerializer
    implements StructuredSerializer<GreviewsWithListArgumentVars> {
  @override
  final Iterable<Type> types = const [
    GreviewsWithListArgumentVars,
    _$GreviewsWithListArgumentVars
  ];
  @override
  final String wireName = 'GreviewsWithListArgumentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GreviewsWithListArgumentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'episode',
      serializers.serialize(object.episode,
          specifiedType: const FullType(_i1.GEpisode)),
    ];
    Object? value;
    value = object.stars;
    if (value != null) {
      result
        ..add('stars')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  GreviewsWithListArgumentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreviewsWithListArgumentVarsBuilder();

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
        case 'stars':
          result.stars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GreviewsWithListArgumentVars extends GreviewsWithListArgumentVars {
  @override
  final _i1.GEpisode episode;
  @override
  final BuiltList<int>? stars;

  factory _$GreviewsWithListArgumentVars(
          [void Function(GreviewsWithListArgumentVarsBuilder)? updates]) =>
      (new GreviewsWithListArgumentVarsBuilder()..update(updates))._build();

  _$GreviewsWithListArgumentVars._({required this.episode, this.stars})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GreviewsWithListArgumentVars', 'episode');
  }

  @override
  GreviewsWithListArgumentVars rebuild(
          void Function(GreviewsWithListArgumentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreviewsWithListArgumentVarsBuilder toBuilder() =>
      new GreviewsWithListArgumentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GreviewsWithListArgumentVars &&
        episode == other.episode &&
        stars == other.stars;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, stars.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GreviewsWithListArgumentVars')
          ..add('episode', episode)
          ..add('stars', stars))
        .toString();
  }
}

class GreviewsWithListArgumentVarsBuilder
    implements
        Builder<GreviewsWithListArgumentVars,
            GreviewsWithListArgumentVarsBuilder> {
  _$GreviewsWithListArgumentVars? _$v;

  _i1.GEpisode? _episode;
  _i1.GEpisode? get episode => _$this._episode;
  set episode(_i1.GEpisode? episode) => _$this._episode = episode;

  ListBuilder<int>? _stars;
  ListBuilder<int> get stars => _$this._stars ??= new ListBuilder<int>();
  set stars(ListBuilder<int>? stars) => _$this._stars = stars;

  GreviewsWithListArgumentVarsBuilder();

  GreviewsWithListArgumentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _stars = $v.stars?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GreviewsWithListArgumentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GreviewsWithListArgumentVars;
  }

  @override
  void update(void Function(GreviewsWithListArgumentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GreviewsWithListArgumentVars build() => _build();

  _$GreviewsWithListArgumentVars _build() {
    _$GreviewsWithListArgumentVars _$result;
    try {
      _$result = _$v ??
          new _$GreviewsWithListArgumentVars._(
              episode: BuiltValueNullFieldError.checkNotNull(
                  episode, r'GreviewsWithListArgumentVars', 'episode'),
              stars: _stars?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stars';
        _stars?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GreviewsWithListArgumentVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
