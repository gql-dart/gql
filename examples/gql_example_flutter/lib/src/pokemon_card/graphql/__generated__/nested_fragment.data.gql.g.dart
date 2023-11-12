// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragmentData> _$gNestedFragmentDataSerializer =
    new _$GNestedFragmentDataSerializer();

class _$GNestedFragmentDataSerializer
    implements StructuredSerializer<GNestedFragmentData> {
  @override
  final Iterable<Type> types = const [
    GNestedFragmentData,
    _$GNestedFragmentData
  ];
  @override
  final String wireName = 'GNestedFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNestedFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GNestedFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GNestedFragmentDataBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GNestedFragmentData extends GNestedFragmentData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? name;

  factory _$GNestedFragmentData(
          [void Function(GNestedFragmentDataBuilder)? updates]) =>
      (new GNestedFragmentDataBuilder()..update(updates))._build();

  _$GNestedFragmentData._(
      {required this.G__typename, required this.id, this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GNestedFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GNestedFragmentData', 'id');
  }

  @override
  GNestedFragmentData rebuild(
          void Function(GNestedFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNestedFragmentDataBuilder toBuilder() =>
      new GNestedFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNestedFragmentData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GNestedFragmentData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GNestedFragmentDataBuilder
    implements Builder<GNestedFragmentData, GNestedFragmentDataBuilder> {
  _$GNestedFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GNestedFragmentDataBuilder() {
    GNestedFragmentData._initializeBuilder(this);
  }

  GNestedFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GNestedFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNestedFragmentData;
  }

  @override
  void update(void Function(GNestedFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GNestedFragmentData build() => _build();

  _$GNestedFragmentData _build() {
    final _$result = _$v ??
        new _$GNestedFragmentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GNestedFragmentData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GNestedFragmentData', 'id'),
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
