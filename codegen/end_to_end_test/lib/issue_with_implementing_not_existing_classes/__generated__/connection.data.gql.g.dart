// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GConnectionData> _$gConnectionDataSerializer =
    new _$GConnectionDataSerializer();
Serializer<GConnectionData_field1> _$gConnectionDataField1Serializer =
    new _$GConnectionData_field1Serializer();
Serializer<GConnectionData_field1_field11>
    _$gConnectionDataField1Field11Serializer =
    new _$GConnectionData_field1_field11Serializer();
Serializer<GConnectionData_field1_field11_field111>
    _$gConnectionDataField1Field11Field111Serializer =
    new _$GConnectionData_field1_field11_field111Serializer();
Serializer<GConnectionData_field2> _$gConnectionDataField2Serializer =
    new _$GConnectionData_field2Serializer();

class _$GConnectionDataSerializer
    implements StructuredSerializer<GConnectionData> {
  @override
  final Iterable<Type> types = const [GConnectionData, _$GConnectionData];
  @override
  final String wireName = 'GConnectionData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GConnectionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'field1',
      serializers.serialize(object.field1,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GConnectionData_field1)])),
      'field2',
      serializers.serialize(object.field2,
          specifiedType: const FullType(GConnectionData_field2)),
    ];

    return result;
  }

  @override
  GConnectionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GConnectionDataBuilder();

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
        case 'field1':
          result.field1.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GConnectionData_field1)
              ]))! as BuiltList<Object?>);
          break;
        case 'field2':
          result.field2.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GConnectionData_field2))!
              as GConnectionData_field2);
          break;
      }
    }

    return result.build();
  }
}

class _$GConnectionData_field1Serializer
    implements StructuredSerializer<GConnectionData_field1> {
  @override
  final Iterable<Type> types = const [
    GConnectionData_field1,
    _$GConnectionData_field1
  ];
  @override
  final String wireName = 'GConnectionData_field1';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GConnectionData_field1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'field11',
      serializers.serialize(object.field11,
          specifiedType: const FullType(GConnectionData_field1_field11)),
    ];

    return result;
  }

  @override
  GConnectionData_field1 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GConnectionData_field1Builder();

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
        case 'field11':
          result.field11.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GConnectionData_field1_field11))!
              as GConnectionData_field1_field11);
          break;
      }
    }

    return result.build();
  }
}

class _$GConnectionData_field1_field11Serializer
    implements StructuredSerializer<GConnectionData_field1_field11> {
  @override
  final Iterable<Type> types = const [
    GConnectionData_field1_field11,
    _$GConnectionData_field1_field11
  ];
  @override
  final String wireName = 'GConnectionData_field1_field11';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GConnectionData_field1_field11 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'field111',
      serializers.serialize(object.field111,
          specifiedType:
              const FullType(GConnectionData_field1_field11_field111)),
    ];

    return result;
  }

  @override
  GConnectionData_field1_field11 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GConnectionData_field1_field11Builder();

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
        case 'field111':
          result.field111.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GConnectionData_field1_field11_field111))!
              as GConnectionData_field1_field11_field111);
          break;
      }
    }

    return result.build();
  }
}

class _$GConnectionData_field1_field11_field111Serializer
    implements StructuredSerializer<GConnectionData_field1_field11_field111> {
  @override
  final Iterable<Type> types = const [
    GConnectionData_field1_field11_field111,
    _$GConnectionData_field1_field11_field111
  ];
  @override
  final String wireName = 'GConnectionData_field1_field11_field111';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GConnectionData_field1_field11_field111 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GConnectionData_field1_field11_field111 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GConnectionData_field1_field11_field111Builder();

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

class _$GConnectionData_field2Serializer
    implements StructuredSerializer<GConnectionData_field2> {
  @override
  final Iterable<Type> types = const [
    GConnectionData_field2,
    _$GConnectionData_field2
  ];
  @override
  final String wireName = 'GConnectionData_field2';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GConnectionData_field2 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GConnectionData_field2 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GConnectionData_field2Builder();

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

class _$GConnectionData extends GConnectionData {
  @override
  final String G__typename;
  @override
  final BuiltList<GConnectionData_field1> field1;
  @override
  final GConnectionData_field2 field2;

  factory _$GConnectionData([void Function(GConnectionDataBuilder)? updates]) =>
      (new GConnectionDataBuilder()..update(updates))._build();

  _$GConnectionData._(
      {required this.G__typename, required this.field1, required this.field2})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GConnectionData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(field1, r'GConnectionData', 'field1');
    BuiltValueNullFieldError.checkNotNull(field2, r'GConnectionData', 'field2');
  }

  @override
  GConnectionData rebuild(void Function(GConnectionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionDataBuilder toBuilder() =>
      new GConnectionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionData &&
        G__typename == other.G__typename &&
        field1 == other.field1 &&
        field2 == other.field2;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, field1.hashCode);
    _$hash = $jc(_$hash, field2.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GConnectionData')
          ..add('G__typename', G__typename)
          ..add('field1', field1)
          ..add('field2', field2))
        .toString();
  }
}

class GConnectionDataBuilder
    implements Builder<GConnectionData, GConnectionDataBuilder> {
  _$GConnectionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GConnectionData_field1>? _field1;
  ListBuilder<GConnectionData_field1> get field1 =>
      _$this._field1 ??= new ListBuilder<GConnectionData_field1>();
  set field1(ListBuilder<GConnectionData_field1>? field1) =>
      _$this._field1 = field1;

  GConnectionData_field2Builder? _field2;
  GConnectionData_field2Builder get field2 =>
      _$this._field2 ??= new GConnectionData_field2Builder();
  set field2(GConnectionData_field2Builder? field2) => _$this._field2 = field2;

  GConnectionDataBuilder() {
    GConnectionData._initializeBuilder(this);
  }

  GConnectionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _field1 = $v.field1.toBuilder();
      _field2 = $v.field2.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GConnectionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionData;
  }

  @override
  void update(void Function(GConnectionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionData build() => _build();

  _$GConnectionData _build() {
    _$GConnectionData _$result;
    try {
      _$result = _$v ??
          new _$GConnectionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GConnectionData', 'G__typename'),
              field1: field1.build(),
              field2: field2.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'field1';
        field1.build();
        _$failedField = 'field2';
        field2.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GConnectionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GConnectionData_field1 extends GConnectionData_field1 {
  @override
  final String G__typename;
  @override
  final GConnectionData_field1_field11 field11;

  factory _$GConnectionData_field1(
          [void Function(GConnectionData_field1Builder)? updates]) =>
      (new GConnectionData_field1Builder()..update(updates))._build();

  _$GConnectionData_field1._({required this.G__typename, required this.field11})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GConnectionData_field1', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        field11, r'GConnectionData_field1', 'field11');
  }

  @override
  GConnectionData_field1 rebuild(
          void Function(GConnectionData_field1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionData_field1Builder toBuilder() =>
      new GConnectionData_field1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionData_field1 &&
        G__typename == other.G__typename &&
        field11 == other.field11;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, field11.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GConnectionData_field1')
          ..add('G__typename', G__typename)
          ..add('field11', field11))
        .toString();
  }
}

class GConnectionData_field1Builder
    implements Builder<GConnectionData_field1, GConnectionData_field1Builder> {
  _$GConnectionData_field1? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GConnectionData_field1_field11Builder? _field11;
  GConnectionData_field1_field11Builder get field11 =>
      _$this._field11 ??= new GConnectionData_field1_field11Builder();
  set field11(GConnectionData_field1_field11Builder? field11) =>
      _$this._field11 = field11;

  GConnectionData_field1Builder() {
    GConnectionData_field1._initializeBuilder(this);
  }

  GConnectionData_field1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _field11 = $v.field11.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GConnectionData_field1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionData_field1;
  }

  @override
  void update(void Function(GConnectionData_field1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionData_field1 build() => _build();

  _$GConnectionData_field1 _build() {
    _$GConnectionData_field1 _$result;
    try {
      _$result = _$v ??
          new _$GConnectionData_field1._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GConnectionData_field1', 'G__typename'),
              field11: field11.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'field11';
        field11.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GConnectionData_field1', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GConnectionData_field1_field11 extends GConnectionData_field1_field11 {
  @override
  final String G__typename;
  @override
  final GConnectionData_field1_field11_field111 field111;

  factory _$GConnectionData_field1_field11(
          [void Function(GConnectionData_field1_field11Builder)? updates]) =>
      (new GConnectionData_field1_field11Builder()..update(updates))._build();

  _$GConnectionData_field1_field11._(
      {required this.G__typename, required this.field111})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GConnectionData_field1_field11', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        field111, r'GConnectionData_field1_field11', 'field111');
  }

  @override
  GConnectionData_field1_field11 rebuild(
          void Function(GConnectionData_field1_field11Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionData_field1_field11Builder toBuilder() =>
      new GConnectionData_field1_field11Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionData_field1_field11 &&
        G__typename == other.G__typename &&
        field111 == other.field111;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, field111.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GConnectionData_field1_field11')
          ..add('G__typename', G__typename)
          ..add('field111', field111))
        .toString();
  }
}

class GConnectionData_field1_field11Builder
    implements
        Builder<GConnectionData_field1_field11,
            GConnectionData_field1_field11Builder> {
  _$GConnectionData_field1_field11? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GConnectionData_field1_field11_field111Builder? _field111;
  GConnectionData_field1_field11_field111Builder get field111 =>
      _$this._field111 ??= new GConnectionData_field1_field11_field111Builder();
  set field111(GConnectionData_field1_field11_field111Builder? field111) =>
      _$this._field111 = field111;

  GConnectionData_field1_field11Builder() {
    GConnectionData_field1_field11._initializeBuilder(this);
  }

  GConnectionData_field1_field11Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _field111 = $v.field111.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GConnectionData_field1_field11 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionData_field1_field11;
  }

  @override
  void update(void Function(GConnectionData_field1_field11Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionData_field1_field11 build() => _build();

  _$GConnectionData_field1_field11 _build() {
    _$GConnectionData_field1_field11 _$result;
    try {
      _$result = _$v ??
          new _$GConnectionData_field1_field11._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GConnectionData_field1_field11', 'G__typename'),
              field111: field111.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'field111';
        field111.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GConnectionData_field1_field11', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GConnectionData_field1_field11_field111
    extends GConnectionData_field1_field11_field111 {
  @override
  final String G__typename;

  factory _$GConnectionData_field1_field11_field111(
          [void Function(GConnectionData_field1_field11_field111Builder)?
              updates]) =>
      (new GConnectionData_field1_field11_field111Builder()..update(updates))
          ._build();

  _$GConnectionData_field1_field11_field111._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GConnectionData_field1_field11_field111', 'G__typename');
  }

  @override
  GConnectionData_field1_field11_field111 rebuild(
          void Function(GConnectionData_field1_field11_field111Builder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionData_field1_field11_field111Builder toBuilder() =>
      new GConnectionData_field1_field11_field111Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionData_field1_field11_field111 &&
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
            r'GConnectionData_field1_field11_field111')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GConnectionData_field1_field11_field111Builder
    implements
        Builder<GConnectionData_field1_field11_field111,
            GConnectionData_field1_field11_field111Builder> {
  _$GConnectionData_field1_field11_field111? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GConnectionData_field1_field11_field111Builder() {
    GConnectionData_field1_field11_field111._initializeBuilder(this);
  }

  GConnectionData_field1_field11_field111Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GConnectionData_field1_field11_field111 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionData_field1_field11_field111;
  }

  @override
  void update(
      void Function(GConnectionData_field1_field11_field111Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionData_field1_field11_field111 build() => _build();

  _$GConnectionData_field1_field11_field111 _build() {
    final _$result = _$v ??
        new _$GConnectionData_field1_field11_field111._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GConnectionData_field1_field11_field111', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GConnectionData_field2 extends GConnectionData_field2 {
  @override
  final String G__typename;

  factory _$GConnectionData_field2(
          [void Function(GConnectionData_field2Builder)? updates]) =>
      (new GConnectionData_field2Builder()..update(updates))._build();

  _$GConnectionData_field2._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GConnectionData_field2', 'G__typename');
  }

  @override
  GConnectionData_field2 rebuild(
          void Function(GConnectionData_field2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionData_field2Builder toBuilder() =>
      new GConnectionData_field2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionData_field2 && G__typename == other.G__typename;
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
    return (newBuiltValueToStringHelper(r'GConnectionData_field2')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GConnectionData_field2Builder
    implements Builder<GConnectionData_field2, GConnectionData_field2Builder> {
  _$GConnectionData_field2? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GConnectionData_field2Builder() {
    GConnectionData_field2._initializeBuilder(this);
  }

  GConnectionData_field2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GConnectionData_field2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionData_field2;
  }

  @override
  void update(void Function(GConnectionData_field2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionData_field2 build() => _build();

  _$GConnectionData_field2 _build() {
    final _$result = _$v ??
        new _$GConnectionData_field2._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GConnectionData_field2', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
