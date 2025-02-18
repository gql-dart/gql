// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GHeroSkipVars extends GHeroSkipVars {
  @override
  final bool skipName;

  factory _$GHeroSkipVars([void Function(GHeroSkipVarsBuilder)? updates]) =>
      (new GHeroSkipVarsBuilder()..update(updates))._build();

  _$GHeroSkipVars._({required this.skipName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        skipName, r'GHeroSkipVars', 'skipName');
  }

  @override
  GHeroSkipVars rebuild(void Function(GHeroSkipVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipVarsBuilder toBuilder() => new GHeroSkipVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipVars && skipName == other.skipName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skipName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipVars')
          ..add('skipName', skipName))
        .toString();
  }
}

class GHeroSkipVarsBuilder
    implements Builder<GHeroSkipVars, GHeroSkipVarsBuilder> {
  _$GHeroSkipVars? _$v;

  bool? _skipName;
  bool? get skipName => _$this._skipName;
  set skipName(bool? skipName) => _$this._skipName = skipName;

  GHeroSkipVarsBuilder();

  GHeroSkipVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skipName = $v.skipName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipVars;
  }

  @override
  void update(void Function(GHeroSkipVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipVars build() => _build();

  _$GHeroSkipVars _build() {
    final _$result = _$v ??
        new _$GHeroSkipVars._(
            skipName: BuiltValueNullFieldError.checkNotNull(
                skipName, r'GHeroSkipVars', 'skipName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
