// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field2.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField2Data> _$gField2DataSerializer = new _$GField2DataSerializer();

class _$GField2DataSerializer implements StructuredSerializer<GField2Data> {
  @override
  final Iterable<Type> types = const [GField2Data, _$GField2Data];
  @override
  final String wireName = 'GField2Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField2Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GField2Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GField2DataBuilder();

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

class _$GField2Data extends GField2Data {
  @override
  final String G__typename;

  factory _$GField2Data([void Function(GField2DataBuilder)? updates]) =>
      (new GField2DataBuilder()..update(updates))._build();

  _$GField2Data._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GField2Data', 'G__typename');
  }

  @override
  GField2Data rebuild(void Function(GField2DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField2DataBuilder toBuilder() => new GField2DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField2Data && G__typename == other.G__typename;
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
    return (newBuiltValueToStringHelper(r'GField2Data')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GField2DataBuilder implements Builder<GField2Data, GField2DataBuilder> {
  _$GField2Data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GField2DataBuilder() {
    GField2Data._initializeBuilder(this);
  }

  GField2DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GField2Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField2Data;
  }

  @override
  void update(void Function(GField2DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField2Data build() => _build();

  _$GField2Data _build() {
    final _$result = _$v ??
        new _$GField2Data._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GField2Data', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
