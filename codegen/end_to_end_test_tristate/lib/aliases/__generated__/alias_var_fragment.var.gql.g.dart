// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alias_var_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GPostsVars extends GPostsVars {
  @override
  final String userId;

  factory _$GPostsVars([void Function(GPostsVarsBuilder)? updates]) =>
      (new GPostsVarsBuilder()..update(updates))._build();

  _$GPostsVars._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'GPostsVars', 'userId');
  }

  @override
  GPostsVars rebuild(void Function(GPostsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsVarsBuilder toBuilder() => new GPostsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsVars && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostsVars')..add('userId', userId))
        .toString();
  }
}

class GPostsVarsBuilder implements Builder<GPostsVars, GPostsVarsBuilder> {
  _$GPostsVars? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GPostsVarsBuilder();

  GPostsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsVars;
  }

  @override
  void update(void Function(GPostsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsVars build() => _build();

  _$GPostsVars _build() {
    final _$result = _$v ??
        new _$GPostsVars._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GPostsVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentVars extends GPostFragmentVars {
  @override
  final String userId;

  factory _$GPostFragmentVars(
          [void Function(GPostFragmentVarsBuilder)? updates]) =>
      (new GPostFragmentVarsBuilder()..update(updates))._build();

  _$GPostFragmentVars._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, r'GPostFragmentVars', 'userId');
  }

  @override
  GPostFragmentVars rebuild(void Function(GPostFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentVarsBuilder toBuilder() =>
      new GPostFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentVars && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostFragmentVars')
          ..add('userId', userId))
        .toString();
  }
}

class GPostFragmentVarsBuilder
    implements Builder<GPostFragmentVars, GPostFragmentVarsBuilder> {
  _$GPostFragmentVars? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GPostFragmentVarsBuilder();

  GPostFragmentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentVars;
  }

  @override
  void update(void Function(GPostFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentVars build() => _build();

  _$GPostFragmentVars _build() {
    final _$result = _$v ??
        new _$GPostFragmentVars._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'GPostFragmentVars', 'userId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
