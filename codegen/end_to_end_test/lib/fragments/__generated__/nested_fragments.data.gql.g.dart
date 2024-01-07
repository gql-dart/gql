// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTestQueryData> _$gTestQueryDataSerializer =
    new _$GTestQueryDataSerializer();
Serializer<GUserFragmentData> _$gUserFragmentDataSerializer =
    new _$GUserFragmentDataSerializer();
Serializer<GUserFragmentData_location> _$gUserFragmentDataLocationSerializer =
    new _$GUserFragmentData_locationSerializer();
Serializer<GUserFragmentData_moderation>
    _$gUserFragmentDataModerationSerializer =
    new _$GUserFragmentData_moderationSerializer();

class _$GTestQueryDataSerializer
    implements StructuredSerializer<GTestQueryData> {
  @override
  final Iterable<Type> types = const [GTestQueryData, _$GTestQueryData];
  @override
  final String wireName = 'GTestQueryData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTestQueryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'currentUser',
      serializers.serialize(object.currentUser,
          specifiedType: const FullType(GUserFragmentData)),
      'currentUser2',
      serializers.serialize(object.currentUser2,
          specifiedType: const FullType(GUserFragmentData)),
    ];

    return result;
  }

  @override
  GTestQueryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTestQueryDataBuilder();

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
        case 'currentUser':
          result.currentUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFragmentData))!
              as GUserFragmentData);
          break;
        case 'currentUser2':
          result.currentUser2.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFragmentData))!
              as GUserFragmentData);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFragmentDataSerializer
    implements StructuredSerializer<GUserFragmentData> {
  @override
  final Iterable<Type> types = const [GUserFragmentData, _$GUserFragmentData];
  @override
  final String wireName = 'GUserFragmentData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserFragmentData_location)));
    }
    value = object.moderation;
    if (value != null) {
      result
        ..add('moderation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserFragmentData_moderation)));
    }
    return result;
  }

  @override
  GUserFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFragmentDataBuilder();

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
        case 'location':
          result.location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFragmentData_location))!
              as GUserFragmentData_location);
          break;
        case 'moderation':
          result.moderation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFragmentData_moderation))!
              as GUserFragmentData_moderation);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFragmentData_locationSerializer
    implements StructuredSerializer<GUserFragmentData_location> {
  @override
  final Iterable<Type> types = const [
    GUserFragmentData_location,
    _$GUserFragmentData_location
  ];
  @override
  final String wireName = 'GUserFragmentData_location';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFragmentData_location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(double)),
      'lng',
      serializers.serialize(object.lng, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GUserFragmentData_location deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFragmentData_locationBuilder();

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
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'lng':
          result.lng = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFragmentData_moderationSerializer
    implements StructuredSerializer<GUserFragmentData_moderation> {
  @override
  final Iterable<Type> types = const [
    GUserFragmentData_moderation,
    _$GUserFragmentData_moderation
  ];
  @override
  final String wireName = 'GUserFragmentData_moderation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFragmentData_moderation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'moderationStatus',
      serializers.serialize(object.moderationStatus,
          specifiedType: const FullType(_i2.GModerationStatus)),
    ];

    return result;
  }

  @override
  GUserFragmentData_moderation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFragmentData_moderationBuilder();

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
        case 'moderationStatus':
          result.moderationStatus = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GModerationStatus))!
              as _i2.GModerationStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$GTestQueryData extends GTestQueryData {
  @override
  final String G__typename;
  @override
  final GUserFragmentData currentUser;
  @override
  final GUserFragmentData currentUser2;

  factory _$GTestQueryData([void Function(GTestQueryDataBuilder)? updates]) =>
      (new GTestQueryDataBuilder()..update(updates))._build();

  _$GTestQueryData._(
      {required this.G__typename,
      required this.currentUser,
      required this.currentUser2})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTestQueryData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        currentUser, r'GTestQueryData', 'currentUser');
    BuiltValueNullFieldError.checkNotNull(
        currentUser2, r'GTestQueryData', 'currentUser2');
  }

  @override
  GTestQueryData rebuild(void Function(GTestQueryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTestQueryDataBuilder toBuilder() =>
      new GTestQueryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTestQueryData &&
        G__typename == other.G__typename &&
        currentUser == other.currentUser &&
        currentUser2 == other.currentUser2;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, currentUser2.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTestQueryData')
          ..add('G__typename', G__typename)
          ..add('currentUser', currentUser)
          ..add('currentUser2', currentUser2))
        .toString();
  }
}

class GTestQueryDataBuilder
    implements Builder<GTestQueryData, GTestQueryDataBuilder> {
  _$GTestQueryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserFragmentDataBuilder? _currentUser;
  GUserFragmentDataBuilder get currentUser =>
      _$this._currentUser ??= new GUserFragmentDataBuilder();
  set currentUser(GUserFragmentDataBuilder? currentUser) =>
      _$this._currentUser = currentUser;

  GUserFragmentDataBuilder? _currentUser2;
  GUserFragmentDataBuilder get currentUser2 =>
      _$this._currentUser2 ??= new GUserFragmentDataBuilder();
  set currentUser2(GUserFragmentDataBuilder? currentUser2) =>
      _$this._currentUser2 = currentUser2;

  GTestQueryDataBuilder() {
    GTestQueryData._initializeBuilder(this);
  }

  GTestQueryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currentUser = $v.currentUser.toBuilder();
      _currentUser2 = $v.currentUser2.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTestQueryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTestQueryData;
  }

  @override
  void update(void Function(GTestQueryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTestQueryData build() => _build();

  _$GTestQueryData _build() {
    _$GTestQueryData _$result;
    try {
      _$result = _$v ??
          new _$GTestQueryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTestQueryData', 'G__typename'),
              currentUser: currentUser.build(),
              currentUser2: currentUser2.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currentUser';
        currentUser.build();
        _$failedField = 'currentUser2';
        currentUser2.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTestQueryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFragmentData extends GUserFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GUserFragmentData_location? location;
  @override
  final GUserFragmentData_moderation? moderation;

  factory _$GUserFragmentData(
          [void Function(GUserFragmentDataBuilder)? updates]) =>
      (new GUserFragmentDataBuilder()..update(updates))._build();

  _$GUserFragmentData._(
      {required this.G__typename,
      required this.id,
      this.location,
      this.moderation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFragmentData', 'id');
  }

  @override
  GUserFragmentData rebuild(void Function(GUserFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFragmentDataBuilder toBuilder() =>
      new GUserFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFragmentData &&
        G__typename == other.G__typename &&
        id == other.id &&
        location == other.location &&
        moderation == other.moderation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, moderation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('location', location)
          ..add('moderation', moderation))
        .toString();
  }
}

class GUserFragmentDataBuilder
    implements Builder<GUserFragmentData, GUserFragmentDataBuilder> {
  _$GUserFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GUserFragmentData_locationBuilder? _location;
  GUserFragmentData_locationBuilder get location =>
      _$this._location ??= new GUserFragmentData_locationBuilder();
  set location(GUserFragmentData_locationBuilder? location) =>
      _$this._location = location;

  GUserFragmentData_moderationBuilder? _moderation;
  GUserFragmentData_moderationBuilder get moderation =>
      _$this._moderation ??= new GUserFragmentData_moderationBuilder();
  set moderation(GUserFragmentData_moderationBuilder? moderation) =>
      _$this._moderation = moderation;

  GUserFragmentDataBuilder() {
    GUserFragmentData._initializeBuilder(this);
  }

  GUserFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _location = $v.location?.toBuilder();
      _moderation = $v.moderation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFragmentData;
  }

  @override
  void update(void Function(GUserFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFragmentData build() => _build();

  _$GUserFragmentData _build() {
    _$GUserFragmentData _$result;
    try {
      _$result = _$v ??
          new _$GUserFragmentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFragmentData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFragmentData', 'id'),
              location: _location?.build(),
              moderation: _moderation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        _location?.build();
        _$failedField = 'moderation';
        _moderation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFragmentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFragmentData_location extends GUserFragmentData_location {
  @override
  final String G__typename;
  @override
  final double lat;
  @override
  final double lng;

  factory _$GUserFragmentData_location(
          [void Function(GUserFragmentData_locationBuilder)? updates]) =>
      (new GUserFragmentData_locationBuilder()..update(updates))._build();

  _$GUserFragmentData_location._(
      {required this.G__typename, required this.lat, required this.lng})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFragmentData_location', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        lat, r'GUserFragmentData_location', 'lat');
    BuiltValueNullFieldError.checkNotNull(
        lng, r'GUserFragmentData_location', 'lng');
  }

  @override
  GUserFragmentData_location rebuild(
          void Function(GUserFragmentData_locationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFragmentData_locationBuilder toBuilder() =>
      new GUserFragmentData_locationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFragmentData_location &&
        G__typename == other.G__typename &&
        lat == other.lat &&
        lng == other.lng;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lng.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFragmentData_location')
          ..add('G__typename', G__typename)
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class GUserFragmentData_locationBuilder
    implements
        Builder<GUserFragmentData_location, GUserFragmentData_locationBuilder> {
  _$GUserFragmentData_location? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  GUserFragmentData_locationBuilder() {
    GUserFragmentData_location._initializeBuilder(this);
  }

  GUserFragmentData_locationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _lat = $v.lat;
      _lng = $v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFragmentData_location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFragmentData_location;
  }

  @override
  void update(void Function(GUserFragmentData_locationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFragmentData_location build() => _build();

  _$GUserFragmentData_location _build() {
    final _$result = _$v ??
        new _$GUserFragmentData_location._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserFragmentData_location', 'G__typename'),
            lat: BuiltValueNullFieldError.checkNotNull(
                lat, r'GUserFragmentData_location', 'lat'),
            lng: BuiltValueNullFieldError.checkNotNull(
                lng, r'GUserFragmentData_location', 'lng'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserFragmentData_moderation extends GUserFragmentData_moderation {
  @override
  final String G__typename;
  @override
  final _i2.GModerationStatus moderationStatus;

  factory _$GUserFragmentData_moderation(
          [void Function(GUserFragmentData_moderationBuilder)? updates]) =>
      (new GUserFragmentData_moderationBuilder()..update(updates))._build();

  _$GUserFragmentData_moderation._(
      {required this.G__typename, required this.moderationStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFragmentData_moderation', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        moderationStatus, r'GUserFragmentData_moderation', 'moderationStatus');
  }

  @override
  GUserFragmentData_moderation rebuild(
          void Function(GUserFragmentData_moderationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFragmentData_moderationBuilder toBuilder() =>
      new GUserFragmentData_moderationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFragmentData_moderation &&
        G__typename == other.G__typename &&
        moderationStatus == other.moderationStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, moderationStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFragmentData_moderation')
          ..add('G__typename', G__typename)
          ..add('moderationStatus', moderationStatus))
        .toString();
  }
}

class GUserFragmentData_moderationBuilder
    implements
        Builder<GUserFragmentData_moderation,
            GUserFragmentData_moderationBuilder> {
  _$GUserFragmentData_moderation? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GModerationStatus? _moderationStatus;
  _i2.GModerationStatus? get moderationStatus => _$this._moderationStatus;
  set moderationStatus(_i2.GModerationStatus? moderationStatus) =>
      _$this._moderationStatus = moderationStatus;

  GUserFragmentData_moderationBuilder() {
    GUserFragmentData_moderation._initializeBuilder(this);
  }

  GUserFragmentData_moderationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _moderationStatus = $v.moderationStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFragmentData_moderation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFragmentData_moderation;
  }

  @override
  void update(void Function(GUserFragmentData_moderationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFragmentData_moderation build() => _build();

  _$GUserFragmentData_moderation _build() {
    final _$result = _$v ??
        new _$GUserFragmentData_moderation._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserFragmentData_moderation', 'G__typename'),
            moderationStatus: BuiltValueNullFieldError.checkNotNull(
                moderationStatus,
                r'GUserFragmentData_moderation',
                'moderationStatus'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
