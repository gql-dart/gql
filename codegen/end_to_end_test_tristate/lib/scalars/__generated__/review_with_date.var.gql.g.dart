// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_with_date.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GReviewWithDateVars extends GReviewWithDateVars {
  @override
  final _i1.Value<_i2.GEpisode> episode;
  @override
  final _i2.GReviewInput review;
  @override
  final _i1.Value<DateTime> createdAt;

  factory _$GReviewWithDateVars(
          [void Function(GReviewWithDateVarsBuilder)? updates]) =>
      (new GReviewWithDateVarsBuilder()..update(updates))._build();

  _$GReviewWithDateVars._(
      {required this.episode, required this.review, required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'GReviewWithDateVars', 'episode');
    BuiltValueNullFieldError.checkNotNull(
        review, r'GReviewWithDateVars', 'review');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GReviewWithDateVars', 'createdAt');
  }

  @override
  GReviewWithDateVars rebuild(
          void Function(GReviewWithDateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReviewWithDateVarsBuilder toBuilder() =>
      new GReviewWithDateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReviewWithDateVars &&
        episode == other.episode &&
        review == other.review &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReviewWithDateVars')
          ..add('episode', episode)
          ..add('review', review)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GReviewWithDateVarsBuilder
    implements Builder<GReviewWithDateVars, GReviewWithDateVarsBuilder> {
  _$GReviewWithDateVars? _$v;

  _i1.Value<_i2.GEpisode>? _episode;
  _i1.Value<_i2.GEpisode>? get episode => _$this._episode;
  set episode(_i1.Value<_i2.GEpisode>? episode) => _$this._episode = episode;

  _i2.GReviewInputBuilder? _review;
  _i2.GReviewInputBuilder get review =>
      _$this._review ??= new _i2.GReviewInputBuilder();
  set review(_i2.GReviewInputBuilder? review) => _$this._review = review;

  _i1.Value<DateTime>? _createdAt;
  _i1.Value<DateTime>? get createdAt => _$this._createdAt;
  set createdAt(_i1.Value<DateTime>? createdAt) =>
      _$this._createdAt = createdAt;

  GReviewWithDateVarsBuilder() {
    GReviewWithDateVars._initializeBuilder(this);
  }

  GReviewWithDateVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode;
      _review = $v.review.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReviewWithDateVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReviewWithDateVars;
  }

  @override
  void update(void Function(GReviewWithDateVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReviewWithDateVars build() => _build();

  _$GReviewWithDateVars _build() {
    _$GReviewWithDateVars _$result;
    try {
      _$result = _$v ??
          new _$GReviewWithDateVars._(
              episode: BuiltValueNullFieldError.checkNotNull(
                  episode, r'GReviewWithDateVars', 'episode'),
              review: review.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GReviewWithDateVars', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'review';
        review.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReviewWithDateVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
