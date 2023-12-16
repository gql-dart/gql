// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_custom_field.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateCustomFieldData> _$gCreateCustomFieldDataSerializer =
    new _$GCreateCustomFieldDataSerializer();

class _$GCreateCustomFieldDataSerializer
    implements StructuredSerializer<GCreateCustomFieldData> {
  @override
  final Iterable<Type> types = const [
    GCreateCustomFieldData,
    _$GCreateCustomFieldData
  ];
  @override
  final String wireName = 'GCreateCustomFieldData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCustomFieldData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createCustomField;
    if (value != null) {
      result
        ..add('createCustomField')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.CustomField)));
    }
    return result;
  }

  @override
  GCreateCustomFieldData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCustomFieldDataBuilder();

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
        case 'createCustomField':
          result.createCustomField = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.CustomField))
              as _i1.CustomField?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateCustomFieldData extends GCreateCustomFieldData {
  @override
  final String G__typename;
  @override
  final _i1.CustomField? createCustomField;

  factory _$GCreateCustomFieldData(
          [void Function(GCreateCustomFieldDataBuilder)? updates]) =>
      (new GCreateCustomFieldDataBuilder()..update(updates))._build();

  _$GCreateCustomFieldData._(
      {required this.G__typename, this.createCustomField})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateCustomFieldData', 'G__typename');
  }

  @override
  GCreateCustomFieldData rebuild(
          void Function(GCreateCustomFieldDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCustomFieldDataBuilder toBuilder() =>
      new GCreateCustomFieldDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCustomFieldData &&
        G__typename == other.G__typename &&
        createCustomField == other.createCustomField;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createCustomField.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCustomFieldData')
          ..add('G__typename', G__typename)
          ..add('createCustomField', createCustomField))
        .toString();
  }
}

class GCreateCustomFieldDataBuilder
    implements Builder<GCreateCustomFieldData, GCreateCustomFieldDataBuilder> {
  _$GCreateCustomFieldData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i1.CustomField? _createCustomField;
  _i1.CustomField? get createCustomField => _$this._createCustomField;
  set createCustomField(_i1.CustomField? createCustomField) =>
      _$this._createCustomField = createCustomField;

  GCreateCustomFieldDataBuilder() {
    GCreateCustomFieldData._initializeBuilder(this);
  }

  GCreateCustomFieldDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createCustomField = $v.createCustomField;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCustomFieldData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCustomFieldData;
  }

  @override
  void update(void Function(GCreateCustomFieldDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCustomFieldData build() => _build();

  _$GCreateCustomFieldData _build() {
    final _$result = _$v ??
        new _$GCreateCustomFieldData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateCustomFieldData', 'G__typename'),
            createCustomField: createCustomField);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
