// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_activities.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GActivityAData> _$gActivityADataSerializer =
    new _$GActivityADataSerializer();
Serializer<GActivityAData_activityData> _$gActivityADataActivityDataSerializer =
    new _$GActivityAData_activityDataSerializer();
Serializer<GActivityBData> _$gActivityBDataSerializer =
    new _$GActivityBDataSerializer();
Serializer<GActivityBData_activity__base>
    _$gActivityBDataActivityBaseSerializer =
    new _$GActivityBData_activity__baseSerializer();
Serializer<GActivityBData_activity__asActivityA>
    _$gActivityBDataActivityAsActivityASerializer =
    new _$GActivityBData_activity__asActivityASerializer();
Serializer<GActivityBData_activity__asActivityA_activityData>
    _$gActivityBDataActivityAsActivityAActivityDataSerializer =
    new _$GActivityBData_activity__asActivityA_activityDataSerializer();
Serializer<GItemData> _$gItemDataSerializer = new _$GItemDataSerializer();
Serializer<GItemConnectionData> _$gItemConnectionDataSerializer =
    new _$GItemConnectionDataSerializer();
Serializer<GItemConnectionData_edges> _$gItemConnectionDataEdgesSerializer =
    new _$GItemConnectionData_edgesSerializer();
Serializer<GItemEdgeData> _$gItemEdgeDataSerializer =
    new _$GItemEdgeDataSerializer();

class _$GActivityADataSerializer
    implements StructuredSerializer<GActivityAData> {
  @override
  final Iterable<Type> types = const [GActivityAData, _$GActivityAData];
  @override
  final String wireName = 'GActivityAData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GActivityAData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.activityData;
    if (value != null) {
      result
        ..add('activityData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GActivityAData_activityData)));
    }
    return result;
  }

  @override
  GActivityAData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GActivityADataBuilder();

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
        case 'activityData':
          result.activityData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GActivityAData_activityData))!
              as GActivityAData_activityData);
          break;
      }
    }

    return result.build();
  }
}

class _$GActivityAData_activityDataSerializer
    implements StructuredSerializer<GActivityAData_activityData> {
  @override
  final Iterable<Type> types = const [
    GActivityAData_activityData,
    _$GActivityAData_activityData
  ];
  @override
  final String wireName = 'GActivityAData_activityData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GActivityAData_activityData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GActivityAData_activityData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GActivityAData_activityDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GActivityBDataSerializer
    implements StructuredSerializer<GActivityBData> {
  @override
  final Iterable<Type> types = const [GActivityBData, _$GActivityBData];
  @override
  final String wireName = 'GActivityBData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GActivityBData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GActivityBData_activity)));
    }
    return result;
  }

  @override
  GActivityBData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GActivityBDataBuilder();

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
        case 'activity':
          result.activity = serializers.deserialize(value,
                  specifiedType: const FullType(GActivityBData_activity))
              as GActivityBData_activity?;
          break;
      }
    }

    return result.build();
  }
}

class _$GActivityBData_activity__baseSerializer
    implements StructuredSerializer<GActivityBData_activity__base> {
  @override
  final Iterable<Type> types = const [
    GActivityBData_activity__base,
    _$GActivityBData_activity__base
  ];
  @override
  final String wireName = 'GActivityBData_activity__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GActivityBData_activity__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GActivityBData_activity__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GActivityBData_activity__baseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GActivityBData_activity__asActivityASerializer
    implements StructuredSerializer<GActivityBData_activity__asActivityA> {
  @override
  final Iterable<Type> types = const [
    GActivityBData_activity__asActivityA,
    _$GActivityBData_activity__asActivityA
  ];
  @override
  final String wireName = 'GActivityBData_activity__asActivityA';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GActivityBData_activity__asActivityA object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.activityData;
    if (value != null) {
      result
        ..add('activityData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GActivityBData_activity__asActivityA_activityData)));
    }
    return result;
  }

  @override
  GActivityBData_activity__asActivityA deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GActivityBData_activity__asActivityABuilder();

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
        case 'activityData':
          result.activityData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GActivityBData_activity__asActivityA_activityData))!
              as GActivityBData_activity__asActivityA_activityData);
          break;
      }
    }

    return result.build();
  }
}

class _$GActivityBData_activity__asActivityA_activityDataSerializer
    implements
        StructuredSerializer<
            GActivityBData_activity__asActivityA_activityData> {
  @override
  final Iterable<Type> types = const [
    GActivityBData_activity__asActivityA_activityData,
    _$GActivityBData_activity__asActivityA_activityData
  ];
  @override
  final String wireName = 'GActivityBData_activity__asActivityA_activityData';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GActivityBData_activity__asActivityA_activityData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GActivityBData_activity__asActivityA_activityData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GActivityBData_activity__asActivityA_activityDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GItemDataSerializer implements StructuredSerializer<GItemData> {
  @override
  final Iterable<Type> types = const [GItemData, _$GItemData];
  @override
  final String wireName = 'GItemData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GItemData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GItemData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GItemDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GItemConnectionDataSerializer
    implements StructuredSerializer<GItemConnectionData> {
  @override
  final Iterable<Type> types = const [
    GItemConnectionData,
    _$GItemConnectionData
  ];
  @override
  final String wireName = 'GItemConnectionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GItemConnectionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'edges',
      serializers.serialize(object.edges,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GItemConnectionData_edges)])),
    ];

    return result;
  }

  @override
  GItemConnectionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GItemConnectionDataBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'edges':
          result.edges.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GItemConnectionData_edges)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GItemConnectionData_edgesSerializer
    implements StructuredSerializer<GItemConnectionData_edges> {
  @override
  final Iterable<Type> types = const [
    GItemConnectionData_edges,
    _$GItemConnectionData_edges
  ];
  @override
  final String wireName = 'GItemConnectionData_edges';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GItemConnectionData_edges object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GItemConnectionData_edges deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GItemConnectionData_edgesBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GItemEdgeDataSerializer implements StructuredSerializer<GItemEdgeData> {
  @override
  final Iterable<Type> types = const [GItemEdgeData, _$GItemEdgeData];
  @override
  final String wireName = 'GItemEdgeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GItemEdgeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GItemEdgeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GItemEdgeDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GActivityAData extends GActivityAData {
  @override
  final String G__typename;
  @override
  final GActivityAData_activityData? activityData;

  factory _$GActivityAData([void Function(GActivityADataBuilder)? updates]) =>
      (new GActivityADataBuilder()..update(updates))._build();

  _$GActivityAData._({required this.G__typename, this.activityData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GActivityAData', 'G__typename');
  }

  @override
  GActivityAData rebuild(void Function(GActivityADataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityADataBuilder toBuilder() =>
      new GActivityADataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityAData &&
        G__typename == other.G__typename &&
        activityData == other.activityData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, activityData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GActivityAData')
          ..add('G__typename', G__typename)
          ..add('activityData', activityData))
        .toString();
  }
}

class GActivityADataBuilder
    implements Builder<GActivityAData, GActivityADataBuilder> {
  _$GActivityAData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityAData_activityDataBuilder? _activityData;
  GActivityAData_activityDataBuilder get activityData =>
      _$this._activityData ??= new GActivityAData_activityDataBuilder();
  set activityData(GActivityAData_activityDataBuilder? activityData) =>
      _$this._activityData = activityData;

  GActivityADataBuilder() {
    GActivityAData._initializeBuilder(this);
  }

  GActivityADataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _activityData = $v.activityData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityAData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityAData;
  }

  @override
  void update(void Function(GActivityADataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityAData build() => _build();

  _$GActivityAData _build() {
    _$GActivityAData _$result;
    try {
      _$result = _$v ??
          new _$GActivityAData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GActivityAData', 'G__typename'),
              activityData: _activityData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'activityData';
        _activityData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GActivityAData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GActivityAData_activityData extends GActivityAData_activityData {
  @override
  final String G__typename;

  factory _$GActivityAData_activityData(
          [void Function(GActivityAData_activityDataBuilder)? updates]) =>
      (new GActivityAData_activityDataBuilder()..update(updates))._build();

  _$GActivityAData_activityData._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GActivityAData_activityData', 'G__typename');
  }

  @override
  GActivityAData_activityData rebuild(
          void Function(GActivityAData_activityDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityAData_activityDataBuilder toBuilder() =>
      new GActivityAData_activityDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityAData_activityData &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GActivityAData_activityData')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GActivityAData_activityDataBuilder
    implements
        Builder<GActivityAData_activityData,
            GActivityAData_activityDataBuilder> {
  _$GActivityAData_activityData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityAData_activityDataBuilder() {
    GActivityAData_activityData._initializeBuilder(this);
  }

  GActivityAData_activityDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityAData_activityData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityAData_activityData;
  }

  @override
  void update(void Function(GActivityAData_activityDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityAData_activityData build() => _build();

  _$GActivityAData_activityData _build() {
    final _$result = _$v ??
        new _$GActivityAData_activityData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GActivityAData_activityData', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GActivityBData extends GActivityBData {
  @override
  final String G__typename;
  @override
  final GActivityBData_activity? activity;

  factory _$GActivityBData([void Function(GActivityBDataBuilder)? updates]) =>
      (new GActivityBDataBuilder()..update(updates))._build();

  _$GActivityBData._({required this.G__typename, this.activity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GActivityBData', 'G__typename');
  }

  @override
  GActivityBData rebuild(void Function(GActivityBDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityBDataBuilder toBuilder() =>
      new GActivityBDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityBData &&
        G__typename == other.G__typename &&
        activity == other.activity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, activity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GActivityBData')
          ..add('G__typename', G__typename)
          ..add('activity', activity))
        .toString();
  }
}

class GActivityBDataBuilder
    implements Builder<GActivityBData, GActivityBDataBuilder> {
  _$GActivityBData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityBData_activity? _activity;
  GActivityBData_activity? get activity => _$this._activity;
  set activity(GActivityBData_activity? activity) =>
      _$this._activity = activity;

  GActivityBDataBuilder() {
    GActivityBData._initializeBuilder(this);
  }

  GActivityBDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _activity = $v.activity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityBData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityBData;
  }

  @override
  void update(void Function(GActivityBDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityBData build() => _build();

  _$GActivityBData _build() {
    final _$result = _$v ??
        new _$GActivityBData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GActivityBData', 'G__typename'),
            activity: activity);
    replace(_$result);
    return _$result;
  }
}

class _$GActivityBData_activity__base extends GActivityBData_activity__base {
  @override
  final String G__typename;

  factory _$GActivityBData_activity__base(
          [void Function(GActivityBData_activity__baseBuilder)? updates]) =>
      (new GActivityBData_activity__baseBuilder()..update(updates))._build();

  _$GActivityBData_activity__base._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GActivityBData_activity__base', 'G__typename');
  }

  @override
  GActivityBData_activity__base rebuild(
          void Function(GActivityBData_activity__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityBData_activity__baseBuilder toBuilder() =>
      new GActivityBData_activity__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityBData_activity__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GActivityBData_activity__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GActivityBData_activity__baseBuilder
    implements
        Builder<GActivityBData_activity__base,
            GActivityBData_activity__baseBuilder> {
  _$GActivityBData_activity__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityBData_activity__baseBuilder() {
    GActivityBData_activity__base._initializeBuilder(this);
  }

  GActivityBData_activity__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityBData_activity__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityBData_activity__base;
  }

  @override
  void update(void Function(GActivityBData_activity__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityBData_activity__base build() => _build();

  _$GActivityBData_activity__base _build() {
    final _$result = _$v ??
        new _$GActivityBData_activity__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GActivityBData_activity__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GActivityBData_activity__asActivityA
    extends GActivityBData_activity__asActivityA {
  @override
  final String G__typename;
  @override
  final GActivityBData_activity__asActivityA_activityData? activityData;

  factory _$GActivityBData_activity__asActivityA(
          [void Function(GActivityBData_activity__asActivityABuilder)?
              updates]) =>
      (new GActivityBData_activity__asActivityABuilder()..update(updates))
          ._build();

  _$GActivityBData_activity__asActivityA._(
      {required this.G__typename, this.activityData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GActivityBData_activity__asActivityA', 'G__typename');
  }

  @override
  GActivityBData_activity__asActivityA rebuild(
          void Function(GActivityBData_activity__asActivityABuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityBData_activity__asActivityABuilder toBuilder() =>
      new GActivityBData_activity__asActivityABuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityBData_activity__asActivityA &&
        G__typename == other.G__typename &&
        activityData == other.activityData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, activityData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GActivityBData_activity__asActivityA')
          ..add('G__typename', G__typename)
          ..add('activityData', activityData))
        .toString();
  }
}

class GActivityBData_activity__asActivityABuilder
    implements
        Builder<GActivityBData_activity__asActivityA,
            GActivityBData_activity__asActivityABuilder> {
  _$GActivityBData_activity__asActivityA? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityBData_activity__asActivityA_activityDataBuilder? _activityData;
  GActivityBData_activity__asActivityA_activityDataBuilder get activityData =>
      _$this._activityData ??=
          new GActivityBData_activity__asActivityA_activityDataBuilder();
  set activityData(
          GActivityBData_activity__asActivityA_activityDataBuilder?
              activityData) =>
      _$this._activityData = activityData;

  GActivityBData_activity__asActivityABuilder() {
    GActivityBData_activity__asActivityA._initializeBuilder(this);
  }

  GActivityBData_activity__asActivityABuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _activityData = $v.activityData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityBData_activity__asActivityA other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityBData_activity__asActivityA;
  }

  @override
  void update(
      void Function(GActivityBData_activity__asActivityABuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityBData_activity__asActivityA build() => _build();

  _$GActivityBData_activity__asActivityA _build() {
    _$GActivityBData_activity__asActivityA _$result;
    try {
      _$result = _$v ??
          new _$GActivityBData_activity__asActivityA._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GActivityBData_activity__asActivityA', 'G__typename'),
              activityData: _activityData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'activityData';
        _activityData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GActivityBData_activity__asActivityA',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GActivityBData_activity__asActivityA_activityData
    extends GActivityBData_activity__asActivityA_activityData {
  @override
  final String G__typename;

  factory _$GActivityBData_activity__asActivityA_activityData(
          [void Function(
                  GActivityBData_activity__asActivityA_activityDataBuilder)?
              updates]) =>
      (new GActivityBData_activity__asActivityA_activityDataBuilder()
            ..update(updates))
          ._build();

  _$GActivityBData_activity__asActivityA_activityData._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GActivityBData_activity__asActivityA_activityData', 'G__typename');
  }

  @override
  GActivityBData_activity__asActivityA_activityData rebuild(
          void Function(
                  GActivityBData_activity__asActivityA_activityDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityBData_activity__asActivityA_activityDataBuilder toBuilder() =>
      new GActivityBData_activity__asActivityA_activityDataBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityBData_activity__asActivityA_activityData &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GActivityBData_activity__asActivityA_activityData')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GActivityBData_activity__asActivityA_activityDataBuilder
    implements
        Builder<GActivityBData_activity__asActivityA_activityData,
            GActivityBData_activity__asActivityA_activityDataBuilder> {
  _$GActivityBData_activity__asActivityA_activityData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GActivityBData_activity__asActivityA_activityDataBuilder() {
    GActivityBData_activity__asActivityA_activityData._initializeBuilder(this);
  }

  GActivityBData_activity__asActivityA_activityDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GActivityBData_activity__asActivityA_activityData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityBData_activity__asActivityA_activityData;
  }

  @override
  void update(
      void Function(GActivityBData_activity__asActivityA_activityDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityBData_activity__asActivityA_activityData build() => _build();

  _$GActivityBData_activity__asActivityA_activityData _build() {
    final _$result = _$v ??
        new _$GActivityBData_activity__asActivityA_activityData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GActivityBData_activity__asActivityA_activityData',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GItemData extends GItemData {
  @override
  final String G__typename;

  factory _$GItemData([void Function(GItemDataBuilder)? updates]) =>
      (new GItemDataBuilder()..update(updates))._build();

  _$GItemData._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GItemData', 'G__typename');
  }

  @override
  GItemData rebuild(void Function(GItemDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemDataBuilder toBuilder() => new GItemDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemData && G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GItemData')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GItemDataBuilder implements Builder<GItemData, GItemDataBuilder> {
  _$GItemData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GItemDataBuilder() {
    GItemData._initializeBuilder(this);
  }

  GItemDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GItemData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemData;
  }

  @override
  void update(void Function(GItemDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemData build() => _build();

  _$GItemData _build() {
    final _$result = _$v ??
        new _$GItemData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GItemData', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GItemConnectionData extends GItemConnectionData {
  @override
  final String G__typename;
  @override
  final int count;
  @override
  final BuiltList<GItemConnectionData_edges> edges;

  factory _$GItemConnectionData(
          [void Function(GItemConnectionDataBuilder)? updates]) =>
      (new GItemConnectionDataBuilder()..update(updates))._build();

  _$GItemConnectionData._(
      {required this.G__typename, required this.count, required this.edges})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GItemConnectionData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        count, r'GItemConnectionData', 'count');
    BuiltValueNullFieldError.checkNotNull(
        edges, r'GItemConnectionData', 'edges');
  }

  @override
  GItemConnectionData rebuild(
          void Function(GItemConnectionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemConnectionDataBuilder toBuilder() =>
      new GItemConnectionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemConnectionData &&
        G__typename == other.G__typename &&
        count == other.count &&
        edges == other.edges;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, edges.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GItemConnectionData')
          ..add('G__typename', G__typename)
          ..add('count', count)
          ..add('edges', edges))
        .toString();
  }
}

class GItemConnectionDataBuilder
    implements Builder<GItemConnectionData, GItemConnectionDataBuilder> {
  _$GItemConnectionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  ListBuilder<GItemConnectionData_edges>? _edges;
  ListBuilder<GItemConnectionData_edges> get edges =>
      _$this._edges ??= new ListBuilder<GItemConnectionData_edges>();
  set edges(ListBuilder<GItemConnectionData_edges>? edges) =>
      _$this._edges = edges;

  GItemConnectionDataBuilder() {
    GItemConnectionData._initializeBuilder(this);
  }

  GItemConnectionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _count = $v.count;
      _edges = $v.edges.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GItemConnectionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemConnectionData;
  }

  @override
  void update(void Function(GItemConnectionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemConnectionData build() => _build();

  _$GItemConnectionData _build() {
    _$GItemConnectionData _$result;
    try {
      _$result = _$v ??
          new _$GItemConnectionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GItemConnectionData', 'G__typename'),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, r'GItemConnectionData', 'count'),
              edges: edges.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edges';
        edges.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GItemConnectionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GItemConnectionData_edges extends GItemConnectionData_edges {
  @override
  final String G__typename;

  factory _$GItemConnectionData_edges(
          [void Function(GItemConnectionData_edgesBuilder)? updates]) =>
      (new GItemConnectionData_edgesBuilder()..update(updates))._build();

  _$GItemConnectionData_edges._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GItemConnectionData_edges', 'G__typename');
  }

  @override
  GItemConnectionData_edges rebuild(
          void Function(GItemConnectionData_edgesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemConnectionData_edgesBuilder toBuilder() =>
      new GItemConnectionData_edgesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemConnectionData_edges &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GItemConnectionData_edges')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GItemConnectionData_edgesBuilder
    implements
        Builder<GItemConnectionData_edges, GItemConnectionData_edgesBuilder> {
  _$GItemConnectionData_edges? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GItemConnectionData_edgesBuilder() {
    GItemConnectionData_edges._initializeBuilder(this);
  }

  GItemConnectionData_edgesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GItemConnectionData_edges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemConnectionData_edges;
  }

  @override
  void update(void Function(GItemConnectionData_edgesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemConnectionData_edges build() => _build();

  _$GItemConnectionData_edges _build() {
    final _$result = _$v ??
        new _$GItemConnectionData_edges._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GItemConnectionData_edges', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GItemEdgeData extends GItemEdgeData {
  @override
  final String G__typename;

  factory _$GItemEdgeData([void Function(GItemEdgeDataBuilder)? updates]) =>
      (new GItemEdgeDataBuilder()..update(updates))._build();

  _$GItemEdgeData._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GItemEdgeData', 'G__typename');
  }

  @override
  GItemEdgeData rebuild(void Function(GItemEdgeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemEdgeDataBuilder toBuilder() => new GItemEdgeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemEdgeData && G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GItemEdgeData')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GItemEdgeDataBuilder
    implements Builder<GItemEdgeData, GItemEdgeDataBuilder> {
  _$GItemEdgeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GItemEdgeDataBuilder() {
    GItemEdgeData._initializeBuilder(this);
  }

  GItemEdgeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GItemEdgeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemEdgeData;
  }

  @override
  void update(void Function(GItemEdgeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemEdgeData build() => _build();

  _$GItemEdgeData _build() {
    final _$result = _$v ??
        new _$GItemEdgeData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GItemEdgeData', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
