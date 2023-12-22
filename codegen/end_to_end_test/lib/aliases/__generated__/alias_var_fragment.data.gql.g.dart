// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alias_var_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPostsData> _$gPostsDataSerializer = new _$GPostsDataSerializer();
Serializer<GPostsData_posts> _$gPostsDataPostsSerializer =
    new _$GPostsData_postsSerializer();
Serializer<GPostsData_posts_isFavorited>
    _$gPostsDataPostsIsFavoritedSerializer =
    new _$GPostsData_posts_isFavoritedSerializer();
Serializer<GPostsData_posts_isLiked> _$gPostsDataPostsIsLikedSerializer =
    new _$GPostsData_posts_isLikedSerializer();
Serializer<GPostFragmentData> _$gPostFragmentDataSerializer =
    new _$GPostFragmentDataSerializer();
Serializer<GPostFragmentData_isFavorited>
    _$gPostFragmentDataIsFavoritedSerializer =
    new _$GPostFragmentData_isFavoritedSerializer();
Serializer<GPostFragmentData_isLiked> _$gPostFragmentDataIsLikedSerializer =
    new _$GPostFragmentData_isLikedSerializer();

class _$GPostsDataSerializer implements StructuredSerializer<GPostsData> {
  @override
  final Iterable<Type> types = const [GPostsData, _$GPostsData];
  @override
  final String wireName = 'GPostsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.posts;
    if (value != null) {
      result
        ..add('posts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType.nullable(GPostsData_posts)])));
    }
    return result;
  }

  @override
  GPostsData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsDataBuilder();

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
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GPostsData_posts)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostsData_postsSerializer
    implements StructuredSerializer<GPostsData_posts> {
  @override
  final Iterable<Type> types = const [GPostsData_posts, _$GPostsData_posts];
  @override
  final String wireName = 'GPostsData_posts';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostsData_posts object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isFavorited;
    if (value != null) {
      result
        ..add('isFavorited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPostsData_posts_isFavorited)));
    }
    value = object.isLiked;
    if (value != null) {
      result
        ..add('isLiked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPostsData_posts_isLiked)));
    }
    return result;
  }

  @override
  GPostsData_posts deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsData_postsBuilder();

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
        case 'isFavorited':
          result.isFavorited.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPostsData_posts_isFavorited))!
              as GPostsData_posts_isFavorited);
          break;
        case 'isLiked':
          result.isLiked.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPostsData_posts_isLiked))!
              as GPostsData_posts_isLiked);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostsData_posts_isFavoritedSerializer
    implements StructuredSerializer<GPostsData_posts_isFavorited> {
  @override
  final Iterable<Type> types = const [
    GPostsData_posts_isFavorited,
    _$GPostsData_posts_isFavorited
  ];
  @override
  final String wireName = 'GPostsData_posts_isFavorited';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostsData_posts_isFavorited object,
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
  GPostsData_posts_isFavorited deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsData_posts_isFavoritedBuilder();

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

class _$GPostsData_posts_isLikedSerializer
    implements StructuredSerializer<GPostsData_posts_isLiked> {
  @override
  final Iterable<Type> types = const [
    GPostsData_posts_isLiked,
    _$GPostsData_posts_isLiked
  ];
  @override
  final String wireName = 'GPostsData_posts_isLiked';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostsData_posts_isLiked object,
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
  GPostsData_posts_isLiked deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsData_posts_isLikedBuilder();

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

class _$GPostFragmentDataSerializer
    implements StructuredSerializer<GPostFragmentData> {
  @override
  final Iterable<Type> types = const [GPostFragmentData, _$GPostFragmentData];
  @override
  final String wireName = 'GPostFragmentData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPostFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isFavorited;
    if (value != null) {
      result
        ..add('isFavorited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPostFragmentData_isFavorited)));
    }
    value = object.isLiked;
    if (value != null) {
      result
        ..add('isLiked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPostFragmentData_isLiked)));
    }
    return result;
  }

  @override
  GPostFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentDataBuilder();

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
        case 'isFavorited':
          result.isFavorited.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPostFragmentData_isFavorited))!
              as GPostFragmentData_isFavorited);
          break;
        case 'isLiked':
          result.isLiked.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPostFragmentData_isLiked))!
              as GPostFragmentData_isLiked);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentData_isFavoritedSerializer
    implements StructuredSerializer<GPostFragmentData_isFavorited> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentData_isFavorited,
    _$GPostFragmentData_isFavorited
  ];
  @override
  final String wireName = 'GPostFragmentData_isFavorited';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentData_isFavorited object,
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
  GPostFragmentData_isFavorited deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentData_isFavoritedBuilder();

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

class _$GPostFragmentData_isLikedSerializer
    implements StructuredSerializer<GPostFragmentData_isLiked> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentData_isLiked,
    _$GPostFragmentData_isLiked
  ];
  @override
  final String wireName = 'GPostFragmentData_isLiked';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentData_isLiked object,
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
  GPostFragmentData_isLiked deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostFragmentData_isLikedBuilder();

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

class _$GPostsData extends GPostsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPostsData_posts?>? posts;

  factory _$GPostsData([void Function(GPostsDataBuilder)? updates]) =>
      (new GPostsDataBuilder()..update(updates))._build();

  _$GPostsData._({required this.G__typename, this.posts}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostsData', 'G__typename');
  }

  @override
  GPostsData rebuild(void Function(GPostsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsDataBuilder toBuilder() => new GPostsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsData &&
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
    return (newBuiltValueToStringHelper(r'GPostsData')
          ..add('G__typename', G__typename)
          ..add('posts', posts))
        .toString();
  }
}

class GPostsDataBuilder implements Builder<GPostsData, GPostsDataBuilder> {
  _$GPostsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPostsData_posts?>? _posts;
  ListBuilder<GPostsData_posts?> get posts =>
      _$this._posts ??= new ListBuilder<GPostsData_posts?>();
  set posts(ListBuilder<GPostsData_posts?>? posts) => _$this._posts = posts;

  GPostsDataBuilder() {
    GPostsData._initializeBuilder(this);
  }

  GPostsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _posts = $v.posts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsData;
  }

  @override
  void update(void Function(GPostsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsData build() => _build();

  _$GPostsData _build() {
    _$GPostsData _$result;
    try {
      _$result = _$v ??
          new _$GPostsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostsData', 'G__typename'),
              posts: _posts?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        _posts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostsData_posts extends GPostsData_posts {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GPostsData_posts_isFavorited? isFavorited;
  @override
  final GPostsData_posts_isLiked? isLiked;

  factory _$GPostsData_posts(
          [void Function(GPostsData_postsBuilder)? updates]) =>
      (new GPostsData_postsBuilder()..update(updates))._build();

  _$GPostsData_posts._(
      {required this.G__typename,
      required this.id,
      this.isFavorited,
      this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostsData_posts', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPostsData_posts', 'id');
  }

  @override
  GPostsData_posts rebuild(void Function(GPostsData_postsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsData_postsBuilder toBuilder() =>
      new GPostsData_postsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsData_posts &&
        G__typename == other.G__typename &&
        id == other.id &&
        isFavorited == other.isFavorited &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isFavorited.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostsData_posts')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isFavorited', isFavorited)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GPostsData_postsBuilder
    implements Builder<GPostsData_posts, GPostsData_postsBuilder> {
  _$GPostsData_posts? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostsData_posts_isFavoritedBuilder? _isFavorited;
  GPostsData_posts_isFavoritedBuilder get isFavorited =>
      _$this._isFavorited ??= new GPostsData_posts_isFavoritedBuilder();
  set isFavorited(GPostsData_posts_isFavoritedBuilder? isFavorited) =>
      _$this._isFavorited = isFavorited;

  GPostsData_posts_isLikedBuilder? _isLiked;
  GPostsData_posts_isLikedBuilder get isLiked =>
      _$this._isLiked ??= new GPostsData_posts_isLikedBuilder();
  set isLiked(GPostsData_posts_isLikedBuilder? isLiked) =>
      _$this._isLiked = isLiked;

  GPostsData_postsBuilder() {
    GPostsData_posts._initializeBuilder(this);
  }

  GPostsData_postsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isFavorited = $v.isFavorited?.toBuilder();
      _isLiked = $v.isLiked?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsData_posts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsData_posts;
  }

  @override
  void update(void Function(GPostsData_postsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsData_posts build() => _build();

  _$GPostsData_posts _build() {
    _$GPostsData_posts _$result;
    try {
      _$result = _$v ??
          new _$GPostsData_posts._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostsData_posts', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPostsData_posts', 'id'),
              isFavorited: _isFavorited?.build(),
              isLiked: _isLiked?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'isFavorited';
        _isFavorited?.build();
        _$failedField = 'isLiked';
        _isLiked?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostsData_posts', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostsData_posts_isFavorited extends GPostsData_posts_isFavorited {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostsData_posts_isFavorited(
          [void Function(GPostsData_posts_isFavoritedBuilder)? updates]) =>
      (new GPostsData_posts_isFavoritedBuilder()..update(updates))._build();

  _$GPostsData_posts_isFavorited._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostsData_posts_isFavorited', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostsData_posts_isFavorited', 'totalCount');
  }

  @override
  GPostsData_posts_isFavorited rebuild(
          void Function(GPostsData_posts_isFavoritedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsData_posts_isFavoritedBuilder toBuilder() =>
      new GPostsData_posts_isFavoritedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsData_posts_isFavorited &&
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
    return (newBuiltValueToStringHelper(r'GPostsData_posts_isFavorited')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostsData_posts_isFavoritedBuilder
    implements
        Builder<GPostsData_posts_isFavorited,
            GPostsData_posts_isFavoritedBuilder> {
  _$GPostsData_posts_isFavorited? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostsData_posts_isFavoritedBuilder() {
    GPostsData_posts_isFavorited._initializeBuilder(this);
  }

  GPostsData_posts_isFavoritedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsData_posts_isFavorited other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsData_posts_isFavorited;
  }

  @override
  void update(void Function(GPostsData_posts_isFavoritedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsData_posts_isFavorited build() => _build();

  _$GPostsData_posts_isFavorited _build() {
    final _$result = _$v ??
        new _$GPostsData_posts_isFavorited._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPostsData_posts_isFavorited', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(
                totalCount, r'GPostsData_posts_isFavorited', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostsData_posts_isLiked extends GPostsData_posts_isLiked {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostsData_posts_isLiked(
          [void Function(GPostsData_posts_isLikedBuilder)? updates]) =>
      (new GPostsData_posts_isLikedBuilder()..update(updates))._build();

  _$GPostsData_posts_isLiked._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostsData_posts_isLiked', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostsData_posts_isLiked', 'totalCount');
  }

  @override
  GPostsData_posts_isLiked rebuild(
          void Function(GPostsData_posts_isLikedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsData_posts_isLikedBuilder toBuilder() =>
      new GPostsData_posts_isLikedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsData_posts_isLiked &&
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
    return (newBuiltValueToStringHelper(r'GPostsData_posts_isLiked')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostsData_posts_isLikedBuilder
    implements
        Builder<GPostsData_posts_isLiked, GPostsData_posts_isLikedBuilder> {
  _$GPostsData_posts_isLiked? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostsData_posts_isLikedBuilder() {
    GPostsData_posts_isLiked._initializeBuilder(this);
  }

  GPostsData_posts_isLikedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsData_posts_isLiked other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsData_posts_isLiked;
  }

  @override
  void update(void Function(GPostsData_posts_isLikedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsData_posts_isLiked build() => _build();

  _$GPostsData_posts_isLiked _build() {
    final _$result = _$v ??
        new _$GPostsData_posts_isLiked._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPostsData_posts_isLiked', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(
                totalCount, r'GPostsData_posts_isLiked', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentData extends GPostFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GPostFragmentData_isFavorited? isFavorited;
  @override
  final GPostFragmentData_isLiked? isLiked;

  factory _$GPostFragmentData(
          [void Function(GPostFragmentDataBuilder)? updates]) =>
      (new GPostFragmentDataBuilder()..update(updates))._build();

  _$GPostFragmentData._(
      {required this.G__typename,
      required this.id,
      this.isFavorited,
      this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPostFragmentData', 'id');
  }

  @override
  GPostFragmentData rebuild(void Function(GPostFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentDataBuilder toBuilder() =>
      new GPostFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentData &&
        G__typename == other.G__typename &&
        id == other.id &&
        isFavorited == other.isFavorited &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isFavorited.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isFavorited', isFavorited)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GPostFragmentDataBuilder
    implements Builder<GPostFragmentData, GPostFragmentDataBuilder> {
  _$GPostFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPostFragmentData_isFavoritedBuilder? _isFavorited;
  GPostFragmentData_isFavoritedBuilder get isFavorited =>
      _$this._isFavorited ??= new GPostFragmentData_isFavoritedBuilder();
  set isFavorited(GPostFragmentData_isFavoritedBuilder? isFavorited) =>
      _$this._isFavorited = isFavorited;

  GPostFragmentData_isLikedBuilder? _isLiked;
  GPostFragmentData_isLikedBuilder get isLiked =>
      _$this._isLiked ??= new GPostFragmentData_isLikedBuilder();
  set isLiked(GPostFragmentData_isLikedBuilder? isLiked) =>
      _$this._isLiked = isLiked;

  GPostFragmentDataBuilder() {
    GPostFragmentData._initializeBuilder(this);
  }

  GPostFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isFavorited = $v.isFavorited?.toBuilder();
      _isLiked = $v.isLiked?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentData;
  }

  @override
  void update(void Function(GPostFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentData build() => _build();

  _$GPostFragmentData _build() {
    _$GPostFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GPostFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPostFragmentData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPostFragmentData', 'id'),
              isFavorited: _isFavorited?.build(),
              isLiked: _isLiked?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'isFavorited';
        _isFavorited?.build();
        _$failedField = 'isLiked';
        _isLiked?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentData_isFavorited extends GPostFragmentData_isFavorited {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostFragmentData_isFavorited(
          [void Function(GPostFragmentData_isFavoritedBuilder)? updates]) =>
      (new GPostFragmentData_isFavoritedBuilder()..update(updates))._build();

  _$GPostFragmentData_isFavorited._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostFragmentData_isFavorited', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostFragmentData_isFavorited', 'totalCount');
  }

  @override
  GPostFragmentData_isFavorited rebuild(
          void Function(GPostFragmentData_isFavoritedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentData_isFavoritedBuilder toBuilder() =>
      new GPostFragmentData_isFavoritedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentData_isFavorited &&
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
    return (newBuiltValueToStringHelper(r'GPostFragmentData_isFavorited')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostFragmentData_isFavoritedBuilder
    implements
        Builder<GPostFragmentData_isFavorited,
            GPostFragmentData_isFavoritedBuilder> {
  _$GPostFragmentData_isFavorited? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostFragmentData_isFavoritedBuilder() {
    GPostFragmentData_isFavorited._initializeBuilder(this);
  }

  GPostFragmentData_isFavoritedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentData_isFavorited other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentData_isFavorited;
  }

  @override
  void update(void Function(GPostFragmentData_isFavoritedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentData_isFavorited build() => _build();

  _$GPostFragmentData_isFavorited _build() {
    final _$result = _$v ??
        new _$GPostFragmentData_isFavorited._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPostFragmentData_isFavorited', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(
                totalCount, r'GPostFragmentData_isFavorited', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentData_isLiked extends GPostFragmentData_isLiked {
  @override
  final String G__typename;
  @override
  final int totalCount;

  factory _$GPostFragmentData_isLiked(
          [void Function(GPostFragmentData_isLikedBuilder)? updates]) =>
      (new GPostFragmentData_isLikedBuilder()..update(updates))._build();

  _$GPostFragmentData_isLiked._(
      {required this.G__typename, required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPostFragmentData_isLiked', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'GPostFragmentData_isLiked', 'totalCount');
  }

  @override
  GPostFragmentData_isLiked rebuild(
          void Function(GPostFragmentData_isLikedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentData_isLikedBuilder toBuilder() =>
      new GPostFragmentData_isLikedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentData_isLiked &&
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
    return (newBuiltValueToStringHelper(r'GPostFragmentData_isLiked')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GPostFragmentData_isLikedBuilder
    implements
        Builder<GPostFragmentData_isLiked, GPostFragmentData_isLikedBuilder> {
  _$GPostFragmentData_isLiked? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GPostFragmentData_isLikedBuilder() {
    GPostFragmentData_isLiked._initializeBuilder(this);
  }

  GPostFragmentData_isLikedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostFragmentData_isLiked other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentData_isLiked;
  }

  @override
  void update(void Function(GPostFragmentData_isLikedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentData_isLiked build() => _build();

  _$GPostFragmentData_isLiked _build() {
    final _$result = _$v ??
        new _$GPostFragmentData_isLiked._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPostFragmentData_isLiked', 'G__typename'),
            totalCount: BuiltValueNullFieldError.checkNotNull(
                totalCount, r'GPostFragmentData_isLiked', 'totalCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
