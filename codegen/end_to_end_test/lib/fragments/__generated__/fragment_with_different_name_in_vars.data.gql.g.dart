// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_with_different_name_in_vars.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDifferentNameData> _$gDifferentNameDataSerializer =
    new _$GDifferentNameDataSerializer();
Serializer<GDifferentNameData_friendsConnection>
    _$gDifferentNameDataFriendsConnectionSerializer =
    new _$GDifferentNameData_friendsConnectionSerializer();

class _$GDifferentNameDataSerializer
    implements StructuredSerializer<GDifferentNameData> {
  @override
  final Iterable<Type> types = const [GDifferentNameData, _$GDifferentNameData];
  @override
  final String wireName = 'GDifferentNameData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDifferentNameData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'friendsConnection',
      serializers.serialize(object.friendsConnection,
          specifiedType: const FullType(GDifferentNameData_friendsConnection)),
    ];

    return result;
  }

  @override
  GDifferentNameData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDifferentNameDataBuilder();

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
        case 'friendsConnection':
          result.friendsConnection.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDifferentNameData_friendsConnection))!
              as GDifferentNameData_friendsConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$GDifferentNameData_friendsConnectionSerializer
    implements StructuredSerializer<GDifferentNameData_friendsConnection> {
  @override
  final Iterable<Type> types = const [
    GDifferentNameData_friendsConnection,
    _$GDifferentNameData_friendsConnection
  ];
  @override
  final String wireName = 'GDifferentNameData_friendsConnection';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDifferentNameData_friendsConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.totalCount;
    if (value != null) {
      result
        ..add('totalCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GDifferentNameData_friendsConnection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDifferentNameData_friendsConnectionBuilder();

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
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDifferentNameData extends GDifferentNameData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GDifferentNameData_friendsConnection friendsConnection;

  factory _$GDifferentNameData(
          [void Function(GDifferentNameDataBuilder)? updates]) =>
      (new GDifferentNameDataBuilder()..update(updates))._build();

  _$GDifferentNameData._(
      {required this.G__typename,
      required this.id,
      required this.friendsConnection})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDifferentNameData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GDifferentNameData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        friendsConnection, r'GDifferentNameData', 'friendsConnection');
  }

  @override
  GDifferentNameData rebuild(
          void Function(GDifferentNameDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDifferentNameDataBuilder toBuilder() =>
      new GDifferentNameDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDifferentNameData &&
        G__typename == other.G__typename &&
        id == other.id &&
        friendsConnection == other.friendsConnection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, friendsConnection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDifferentNameData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('friendsConnection', friendsConnection))
        .toString();
  }
}

class GDifferentNameDataBuilder
    implements Builder<GDifferentNameData, GDifferentNameDataBuilder> {
  _$GDifferentNameData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDifferentNameData_friendsConnectionBuilder? _friendsConnection;
  GDifferentNameData_friendsConnectionBuilder get friendsConnection =>
      _$this._friendsConnection ??=
          new GDifferentNameData_friendsConnectionBuilder();
  set friendsConnection(
          GDifferentNameData_friendsConnectionBuilder? friendsConnection) =>
      _$this._friendsConnection = friendsConnection;

  GDifferentNameDataBuilder() {
    GDifferentNameData._initializeBuilder(this);
  }

  GDifferentNameDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _friendsConnection = $v.friendsConnection.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDifferentNameData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDifferentNameData;
  }

  @override
  void update(void Function(GDifferentNameDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDifferentNameData build() => _build();

  _$GDifferentNameData _build() {
    _$GDifferentNameData _$result;
    try {
      _$result = _$v ??
          new _$GDifferentNameData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDifferentNameData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDifferentNameData', 'id'),
              friendsConnection: friendsConnection.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friendsConnection';
        friendsConnection.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDifferentNameData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDifferentNameData_friendsConnection
    extends GDifferentNameData_friendsConnection {
  @override
  final String G__typename;
  @override
  final int? totalCount;

  factory _$GDifferentNameData_friendsConnection(
          [void Function(GDifferentNameData_friendsConnectionBuilder)?
              updates]) =>
      (new GDifferentNameData_friendsConnectionBuilder()..update(updates))
          ._build();

  _$GDifferentNameData_friendsConnection._(
      {required this.G__typename, this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDifferentNameData_friendsConnection', 'G__typename');
  }

  @override
  GDifferentNameData_friendsConnection rebuild(
          void Function(GDifferentNameData_friendsConnectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDifferentNameData_friendsConnectionBuilder toBuilder() =>
      new GDifferentNameData_friendsConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDifferentNameData_friendsConnection &&
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
    return (newBuiltValueToStringHelper(r'GDifferentNameData_friendsConnection')
          ..add('G__typename', G__typename)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class GDifferentNameData_friendsConnectionBuilder
    implements
        Builder<GDifferentNameData_friendsConnection,
            GDifferentNameData_friendsConnectionBuilder> {
  _$GDifferentNameData_friendsConnection? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  GDifferentNameData_friendsConnectionBuilder() {
    GDifferentNameData_friendsConnection._initializeBuilder(this);
  }

  GDifferentNameData_friendsConnectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDifferentNameData_friendsConnection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDifferentNameData_friendsConnection;
  }

  @override
  void update(
      void Function(GDifferentNameData_friendsConnectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDifferentNameData_friendsConnection build() => _build();

  _$GDifferentNameData_friendsConnection _build() {
    final _$result = _$v ??
        new _$GDifferentNameData_friendsConnection._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDifferentNameData_friendsConnection', 'G__typename'),
            totalCount: totalCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
