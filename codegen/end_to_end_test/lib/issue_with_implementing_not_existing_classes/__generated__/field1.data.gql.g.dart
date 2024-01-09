// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field1.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField1Data> _$gField1DataSerializer = new _$GField1DataSerializer();

class _$GField1DataSerializer implements StructuredSerializer<GField1Data> {
  @override
  final Iterable<Type> types = const [GField1Data, _$GField1Data];
  @override
  final String wireName = 'GField1Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField1Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GField1Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GField1DataBuilder();

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

class _$GField1Data extends GField1Data {
  @override
  final String G__typename;

  factory _$GField1Data([void Function(GField1DataBuilder)? updates]) =>
      (new GField1DataBuilder()..update(updates))._build();

  _$GField1Data._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GField1Data', 'G__typename');
  }

  @override
  GField1Data rebuild(void Function(GField1DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField1DataBuilder toBuilder() => new GField1DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField1Data && G__typename == other.G__typename;
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
    return (newBuiltValueToStringHelper(r'GField1Data')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GField1DataBuilder implements Builder<GField1Data, GField1DataBuilder> {
  _$GField1Data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GField1DataBuilder() {
    GField1Data._initializeBuilder(this);
  }

  GField1DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GField1Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField1Data;
  }

  @override
  void update(void Function(GField1DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField1Data build() => _build();

  _$GField1Data _build() {
    final _$result = _$v ??
        new _$GField1Data._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GField1Data', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
