// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GHeroSkipFragmentVars extends GHeroSkipFragmentVars {
  @override
  final bool skipDetails;

  factory _$GHeroSkipFragmentVars(
          [void Function(GHeroSkipFragmentVarsBuilder)? updates]) =>
      (new GHeroSkipFragmentVarsBuilder()..update(updates))._build();

  _$GHeroSkipFragmentVars._({required this.skipDetails}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        skipDetails, r'GHeroSkipFragmentVars', 'skipDetails');
  }

  @override
  GHeroSkipFragmentVars rebuild(
          void Function(GHeroSkipFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentVarsBuilder toBuilder() =>
      new GHeroSkipFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragmentVars && skipDetails == other.skipDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skipDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentVars')
          ..add('skipDetails', skipDetails))
        .toString();
  }
}

class GHeroSkipFragmentVarsBuilder
    implements Builder<GHeroSkipFragmentVars, GHeroSkipFragmentVarsBuilder> {
  _$GHeroSkipFragmentVars? _$v;

  bool? _skipDetails;
  bool? get skipDetails => _$this._skipDetails;
  set skipDetails(bool? skipDetails) => _$this._skipDetails = skipDetails;

  GHeroSkipFragmentVarsBuilder();

  GHeroSkipFragmentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skipDetails = $v.skipDetails;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragmentVars;
  }

  @override
  void update(void Function(GHeroSkipFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragmentVars build() => _build();

  _$GHeroSkipFragmentVars _build() {
    final _$result = _$v ??
        new _$GHeroSkipFragmentVars._(
            skipDetails: BuiltValueNullFieldError.checkNotNull(
                skipDetails, r'GHeroSkipFragmentVars', 'skipDetails'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroDetailVars extends GHeroDetailVars {
  factory _$GHeroDetailVars([void Function(GHeroDetailVarsBuilder)? updates]) =>
      (new GHeroDetailVarsBuilder()..update(updates))._build();

  _$GHeroDetailVars._() : super._();

  @override
  GHeroDetailVars rebuild(void Function(GHeroDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroDetailVarsBuilder toBuilder() =>
      new GHeroDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroDetailVars;
  }

  @override
  int get hashCode {
    return 140740630;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHeroDetailVars').toString();
  }
}

class GHeroDetailVarsBuilder
    implements Builder<GHeroDetailVars, GHeroDetailVarsBuilder> {
  _$GHeroDetailVars? _$v;

  GHeroDetailVarsBuilder();

  @override
  void replace(GHeroDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroDetailVars;
  }

  @override
  void update(void Function(GHeroDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroDetailVars build() => _build();

  _$GHeroDetailVars _build() {
    final _$result = _$v ?? new _$GHeroDetailVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
