// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field11.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField11Data> _$gField11DataSerializer =
    new _$GField11DataSerializer();
Serializer<GField11Data_field111> _$gField11DataField111Serializer =
    new _$GField11Data_field111Serializer();

class _$GField11DataSerializer implements StructuredSerializer<GField11Data> {
  @override
  final Iterable<Type> types = const [GField11Data, _$GField11Data];
  @override
  final String wireName = 'GField11Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField11Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'field111',
      serializers.serialize(object.field111,
          specifiedType: const FullType(GField11Data_field111)),
    ];

    return result;
  }

  @override
  GField11Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GField11DataBuilder();

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
                  specifiedType: const FullType(GField11Data_field111))!
              as GField11Data_field111);
          break;
      }
    }

    return result.build();
  }
}

class _$GField11Data_field111Serializer
    implements StructuredSerializer<GField11Data_field111> {
  @override
  final Iterable<Type> types = const [
    GField11Data_field111,
    _$GField11Data_field111
  ];
  @override
  final String wireName = 'GField11Data_field111';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GField11Data_field111 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GField11Data_field111 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GField11Data_field111Builder();

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

class _$GField11Data extends GField11Data {
  @override
  final String G__typename;
  @override
  final GField11Data_field111 field111;

  factory _$GField11Data([void Function(GField11DataBuilder)? updates]) =>
      (new GField11DataBuilder()..update(updates))._build();

  _$GField11Data._({required this.G__typename, required this.field111})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GField11Data', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        field111, r'GField11Data', 'field111');
  }

  @override
  GField11Data rebuild(void Function(GField11DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField11DataBuilder toBuilder() => new GField11DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField11Data &&
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
    return (newBuiltValueToStringHelper(r'GField11Data')
          ..add('G__typename', G__typename)
          ..add('field111', field111))
        .toString();
  }
}

class GField11DataBuilder
    implements Builder<GField11Data, GField11DataBuilder> {
  _$GField11Data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GField11Data_field111Builder? _field111;
  GField11Data_field111Builder get field111 =>
      _$this._field111 ??= new GField11Data_field111Builder();
  set field111(GField11Data_field111Builder? field111) =>
      _$this._field111 = field111;

  GField11DataBuilder() {
    GField11Data._initializeBuilder(this);
  }

  GField11DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _field111 = $v.field111.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GField11Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField11Data;
  }

  @override
  void update(void Function(GField11DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField11Data build() => _build();

  _$GField11Data _build() {
    _$GField11Data _$result;
    try {
      _$result = _$v ??
          new _$GField11Data._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GField11Data', 'G__typename'),
              field111: field111.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'field111';
        field111.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GField11Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GField11Data_field111 extends GField11Data_field111 {
  @override
  final String G__typename;

  factory _$GField11Data_field111(
          [void Function(GField11Data_field111Builder)? updates]) =>
      (new GField11Data_field111Builder()..update(updates))._build();

  _$GField11Data_field111._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GField11Data_field111', 'G__typename');
  }

  @override
  GField11Data_field111 rebuild(
          void Function(GField11Data_field111Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField11Data_field111Builder toBuilder() =>
      new GField11Data_field111Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField11Data_field111 && G__typename == other.G__typename;
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
    return (newBuiltValueToStringHelper(r'GField11Data_field111')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GField11Data_field111Builder
    implements Builder<GField11Data_field111, GField11Data_field111Builder> {
  _$GField11Data_field111? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GField11Data_field111Builder() {
    GField11Data_field111._initializeBuilder(this);
  }

  GField11Data_field111Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GField11Data_field111 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField11Data_field111;
  }

  @override
  void update(void Function(GField11Data_field111Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField11Data_field111 build() => _build();

  _$GField11Data_field111 _build() {
    final _$result = _$v ??
        new _$GField11Data_field111._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GField11Data_field111', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
