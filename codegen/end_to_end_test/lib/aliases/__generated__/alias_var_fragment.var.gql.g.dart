// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alias_var_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPostsVars> _$gPostsVarsSerializer = new _$GPostsVarsSerializer();
Serializer<GPostFragmentVars> _$gPostFragmentVarsSerializer =
    new _$GPostFragmentVarsSerializer();

class _$GPostsVarsSerializer implements StructuredSerializer<GPostsVars> {
  @override
  final Iterable<Type> types = const [GPostsVars, _$GPostsVars];
  @override
  final String wireName = 'GPostsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPostsVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentVarsSerializer
    implements StructuredSerializer<GPostFragmentVars> {
  @override
  final Iterable<Type> types = const [GPostFragmentVars, _$GPostFragmentVars];
  @override
  final String wireName = 'GPostFragmentVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPostFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

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
