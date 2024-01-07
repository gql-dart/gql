// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_with_scalar_var.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPostsWithFixedVariableData>
    _$gPostsWithFixedVariableDataSerializer =
    new _$GPostsWithFixedVariableDataSerializer();
Serializer<GPostFragmentForUser1Data> _$gPostFragmentForUser1DataSerializer =
    new _$GPostFragmentForUser1DataSerializer();
Serializer<GPostFragmentForUser1Data_favoritedUsers>
    _$gPostFragmentForUser1DataFavoritedUsersSerializer =
    new _$GPostFragmentForUser1Data_favoritedUsersSerializer();
Serializer<GPostFragmentForUser2Data> _$gPostFragmentForUser2DataSerializer =
    new _$GPostFragmentForUser2DataSerializer();
Serializer<GPostFragmentForUser2Data_favoritedUsers>
    _$gPostFragmentForUser2DataFavoritedUsersSerializer =
    new _$GPostFragmentForUser2Data_favoritedUsersSerializer();

class _$GPostsWithFixedVariableDataSerializer
    implements StructuredSerializer<GPostsWithFixedVariableData> {
  @override
  final Iterable<Type> types = const [
    GPostsWithFixedVariableData,
    _$GPostsWithFixedVariableData
  ];
  @override
  final String wireName = 'GPostsWithFixedVariableData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostsWithFixedVariableData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'posts',
      serializers.serialize(object.posts,
          specifiedType: const FullType(GPostFragmentForUser2Data)),
    ];

    return result;
  }

  @override
  GPostsWithFixedVariableData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsWithFixedVariableDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'posts':
          result.posts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPostFragmentForUser2Data))!
              as GPostFragmentForUser2Data);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentForUser1DataSerializer
    implements StructuredSerializer<GPostFragmentForUser1Data> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentForUser1Data,
    _$GPostFragmentForUser1Data
  ];
  @override
  final String wireName = 'GPostFragmentForUser1Data';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentForUser1Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.favoritedUsers;
    if (value != null) {
      result
        ..add('favoritedUsers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPostFragmentForUser1Data_favoritedUsers)));
    }
    return result;
  }

  @override
  GPostFragmentForUser1Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentForUser1DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'favoritedUsers':
          result.favoritedUsers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPostFragmentForUser1Data_favoritedUsers))!
              as GPostFragmentForUser1Data_favoritedUsers);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentForUser1Data_favoritedUsersSerializer
    implements StructuredSerializer<GPostFragmentForUser1Data_favoritedUsers> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentForUser1Data_favoritedUsers,
    _$GPostFragmentForUser1Data_favoritedUsers
  ];
  @override
  final String wireName = 'GPostFragmentForUser1Data_favoritedUsers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentForUser1Data_favoritedUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'totalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPostFragmentForUser1Data_favoritedUsers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentForUser1Data_favoritedUsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentForUser2DataSerializer
    implements StructuredSerializer<GPostFragmentForUser2Data> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentForUser2Data,
    _$GPostFragmentForUser2Data
  ];
  @override
  final String wireName = 'GPostFragmentForUser2Data';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentForUser2Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.favoritedUsers;
    if (value != null) {
      result
        ..add('favoritedUsers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPostFragmentForUser2Data_favoritedUsers)));
    }
    return result;
  }

  @override
  GPostFragmentForUser2Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentForUser2DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'favoritedUsers':
          result.favoritedUsers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPostFragmentForUser2Data_favoritedUsers))!
              as GPostFragmentForUser2Data_favoritedUsers);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentForUser2Data_favoritedUsersSerializer
    implements StructuredSerializer<GPostFragmentForUser2Data_favoritedUsers> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentForUser2Data_favoritedUsers,
    _$GPostFragmentForUser2Data_favoritedUsers
  ];
  @override
  final String wireName = 'GPostFragmentForUser2Data_favoritedUsers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentForUser2Data_favoritedUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'totalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPostFragmentForUser2Data_favoritedUsers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentForUser2Data_favoritedUsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPostsWithFixedVariableData extends GPostsWithFixedVariableData {
  @override
  final String G__typename;
  @override
  final GPostFragmentForUser2Data posts;

  factory _$GPostsWithFixedVariableData(
          [void Function(GPostsWithFixedVariableDataBuilder)? updates]) =>
      (new GPostsWithFixedVariableDataBuilder()..update(updates))._build();

  _$GPostsWithFixedVariableData._(
      {required this.G__typename, required this.posts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostsWithFixedVariableData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        posts, r'GPostsWithFixedVariableData', 'posts');
  }

  @override
  GPostsWithFixedVariableData rebuild(
          void Function(GPostsWithFixedVariableDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsWithFixedVariableDataBuilder toBuilder() =>
      new GPostsWithFixedVariableDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsWithFixedVariableData &&
        G__typename == other.G__typename &&
        posts == other.posts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostsWithFixedVariableData')
          ..add('G__typename', G__typename)
          ..add('posts', posts))
        .toString();
  }
}

class GPostsWithFixedVariableDataBuilder
    implements
        Builder<GPostsWithFixedVariableData,
            GPostsWithFixedVariableDataBuilder> {
  _$GPostsWithFixedVariableData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPostFragmentForUser2DataBuilder? _posts;
  GPostFragmentForUser2DataBuilder get posts =>
      _$this._posts ??= new GPostFragmentForUser2DataBuilder();
  set posts(GPostFragmentForUser2DataBuilder? posts) => _$this._posts = posts;

  GPostsWithFixedVariableDataBuilder() {
    GPostsWithFixedVariableData._initializeBuilder(this);
  }

  GPostsWithFixedVariableDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _posts = $v.posts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsWithFixedVariableData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsWithFixedVariableData;
  }

  @override
  void update(void Function(GPostsWithFixedVariableDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsWithFixedVariableData build() => _build();

  _$GPostsWithFixedVariableData _build() {
    _$GPostsWithFixedVariableData _$result;
    try {
      _$result = _$v ??
          new _$GPostsWithFixedVariableData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostsWithFixedVariableData', 'G__typename'),
              posts: posts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostsWithFixedVariableData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentForUser1Data extends GPostFragmentForUser1Data {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GPostFragmentForUser1Data_favoritedUsers? favoritedUsers;

  factory _$GPostFragmentForUser1Data(
          [void Function(GPostFragmentForUser1DataBuilder)? updates]) =>
      (new GPostFragmentForUser1DataBuilder()..update(updates))._build();

  _$GPostFragmentForUser1Data._(
      {required this.G__typename, required this.id, this.favoritedUsers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostFragmentForUser1Data', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPostFragmentForUser1Data', 'id');
  }

  @override
  GPostFragmentForUser1Data rebuild(
          void Function(GPostFragmentForUser1DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentForUser1DataBuilder toBuilder() =>
      new GPostFragmentForUser1DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentForUser1Data &&
        G__typename == other.G__typename &&
        id == other.id &&
        favoritedUsers == other.favoritedUsers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, favoritedUsers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostFragmentForUser1Data')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('favoritedUsers', favoritedUsers))
        .toString();
  }
}

class GPostFragmentForUser1DataBuilder
    implements
        Builder<GPostFragmentForUser1Data, GPostFragmentForUser1DataBuilder> {
  _$GPostFragmentForUser1Data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostFragmentForUser1Data_favoritedUsersBuilder? _favoritedUsers;
  GPostFragmentForUser1Data_favoritedUsersBuilder get favoritedUsers =>
      _$this._favoritedUsers ??=
          new GPostFragmentForUser1Data_favoritedUsersBuilder();
  set favoritedUsers(
          GPostFragmentForUser1Data_favoritedUsersBuilder? favoritedUsers) =>
      _$this._favoritedUsers = favoritedUsers;

  GPostFragmentForUser1DataBuilder() {
    GPostFragmentForUser1Data._initializeBuilder(this);
  }

  GPostFragmentForUser1DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _favoritedUsers = $v.favoritedUsers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentForUser1Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentForUser1Data;
  }

  @override
  void update(void Function(GPostFragmentForUser1DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentForUser1Data build() => _build();

  _$GPostFragmentForUser1Data _build() {
    _$GPostFragmentForUser1Data _$result;
    try {
      _$result = _$v ??
          new _$GPostFragmentForUser1Data._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostFragmentForUser1Data', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPostFragmentForUser1Data', 'id'),
              favoritedUsers: _favoritedUsers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favoritedUsers';
        _favoritedUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostFragmentForUser1Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentForUser1Data_favoritedUsers
    extends GPostFragmentForUser1Data_favoritedUsers {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostFragmentForUser1Data_favoritedUsers(
          [void Function(GPostFragmentForUser1Data_favoritedUsersBuilder)?
              updates]) =>
      (new GPostFragmentForUser1Data_favoritedUsersBuilder()..update(updates))
          ._build();

  _$GPostFragmentForUser1Data_favoritedUsers._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPostFragmentForUser1Data_favoritedUsers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostFragmentForUser1Data_favoritedUsers', 'totalCount');
  }

  @override
  GPostFragmentForUser1Data_favoritedUsers rebuild(
          void Function(GPostFragmentForUser1Data_favoritedUsersBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentForUser1Data_favoritedUsersBuilder toBuilder() =>
      new GPostFragmentForUser1Data_favoritedUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentForUser1Data_favoritedUsers &&
        G__typename == other.G__typename &&
        totalCount == other.totalCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPostFragmentForUser1Data_favoritedUsers')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostFragmentForUser1Data_favoritedUsersBuilder
    implements
        Builder<GPostFragmentForUser1Data_favoritedUsers,
            GPostFragmentForUser1Data_favoritedUsersBuilder> {
  _$GPostFragmentForUser1Data_favoritedUsers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostFragmentForUser1Data_favoritedUsersBuilder() {
    GPostFragmentForUser1Data_favoritedUsers._initializeBuilder(this);
  }

  GPostFragmentForUser1Data_favoritedUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentForUser1Data_favoritedUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentForUser1Data_favoritedUsers;
  }

  @override
  void update(
      void Function(GPostFragmentForUser1Data_favoritedUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentForUser1Data_favoritedUsers build() => _build();

  _$GPostFragmentForUser1Data_favoritedUsers _build() {
    final _$result = _$v ??
        new _$GPostFragmentForUser1Data_favoritedUsers._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPostFragmentForUser1Data_favoritedUsers', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(totalCount,
                r'GPostFragmentForUser1Data_favoritedUsers', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentForUser2Data extends GPostFragmentForUser2Data {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GPostFragmentForUser2Data_favoritedUsers? favoritedUsers;

  factory _$GPostFragmentForUser2Data(
          [void Function(GPostFragmentForUser2DataBuilder)? updates]) =>
      (new GPostFragmentForUser2DataBuilder()..update(updates))._build();

  _$GPostFragmentForUser2Data._(
      {required this.G__typename, required this.id, this.favoritedUsers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostFragmentForUser2Data', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPostFragmentForUser2Data', 'id');
  }

  @override
  GPostFragmentForUser2Data rebuild(
          void Function(GPostFragmentForUser2DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentForUser2DataBuilder toBuilder() =>
      new GPostFragmentForUser2DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentForUser2Data &&
        G__typename == other.G__typename &&
        id == other.id &&
        favoritedUsers == other.favoritedUsers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, favoritedUsers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostFragmentForUser2Data')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('favoritedUsers', favoritedUsers))
        .toString();
  }
}

class GPostFragmentForUser2DataBuilder
    implements
        Builder<GPostFragmentForUser2Data, GPostFragmentForUser2DataBuilder> {
  _$GPostFragmentForUser2Data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostFragmentForUser2Data_favoritedUsersBuilder? _favoritedUsers;
  GPostFragmentForUser2Data_favoritedUsersBuilder get favoritedUsers =>
      _$this._favoritedUsers ??=
          new GPostFragmentForUser2Data_favoritedUsersBuilder();
  set favoritedUsers(
          GPostFragmentForUser2Data_favoritedUsersBuilder? favoritedUsers) =>
      _$this._favoritedUsers = favoritedUsers;

  GPostFragmentForUser2DataBuilder() {
    GPostFragmentForUser2Data._initializeBuilder(this);
  }

  GPostFragmentForUser2DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _favoritedUsers = $v.favoritedUsers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentForUser2Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentForUser2Data;
  }

  @override
  void update(void Function(GPostFragmentForUser2DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentForUser2Data build() => _build();

  _$GPostFragmentForUser2Data _build() {
    _$GPostFragmentForUser2Data _$result;
    try {
      _$result = _$v ??
          new _$GPostFragmentForUser2Data._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostFragmentForUser2Data', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPostFragmentForUser2Data', 'id'),
              favoritedUsers: _favoritedUsers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favoritedUsers';
        _favoritedUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostFragmentForUser2Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentForUser2Data_favoritedUsers
    extends GPostFragmentForUser2Data_favoritedUsers {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostFragmentForUser2Data_favoritedUsers(
          [void Function(GPostFragmentForUser2Data_favoritedUsersBuilder)?
              updates]) =>
      (new GPostFragmentForUser2Data_favoritedUsersBuilder()..update(updates))
          ._build();

  _$GPostFragmentForUser2Data_favoritedUsers._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPostFragmentForUser2Data_favoritedUsers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostFragmentForUser2Data_favoritedUsers', 'totalCount');
  }

  @override
  GPostFragmentForUser2Data_favoritedUsers rebuild(
          void Function(GPostFragmentForUser2Data_favoritedUsersBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentForUser2Data_favoritedUsersBuilder toBuilder() =>
      new GPostFragmentForUser2Data_favoritedUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentForUser2Data_favoritedUsers &&
        G__typename == other.G__typename &&
        totalCount == other.totalCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPostFragmentForUser2Data_favoritedUsers')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostFragmentForUser2Data_favoritedUsersBuilder
    implements
        Builder<GPostFragmentForUser2Data_favoritedUsers,
            GPostFragmentForUser2Data_favoritedUsersBuilder> {
  _$GPostFragmentForUser2Data_favoritedUsers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostFragmentForUser2Data_favoritedUsersBuilder() {
    GPostFragmentForUser2Data_favoritedUsers._initializeBuilder(this);
  }

  GPostFragmentForUser2Data_favoritedUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentForUser2Data_favoritedUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentForUser2Data_favoritedUsers;
  }

  @override
  void update(
      void Function(GPostFragmentForUser2Data_favoritedUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentForUser2Data_favoritedUsers build() => _build();

  _$GPostFragmentForUser2Data_favoritedUsers _build() {
    final _$result = _$v ??
        new _$GPostFragmentForUser2Data_favoritedUsers._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPostFragmentForUser2Data_favoritedUsers', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(totalCount,
                r'GPostFragmentForUser2Data_favoritedUsers', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
