// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDimensionsData> _$gDimensionsDataSerializer =
    new _$GDimensionsDataSerializer();

class _$GDimensionsDataSerializer
    implements StructuredSerializer<GDimensionsData> {
  @override
  final Iterable<Type> types = const [GDimensionsData, _$GDimensionsData];
  @override
  final String wireName = 'GDimensionsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDimensionsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDimensionsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDimensionsDataBuilder();

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
        case 'minimum':
          result.minimum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDimensionsData extends GDimensionsData {
  @override
  final String G__typename;
  @override
  final String? minimum;
  @override
  final String? maximum;

  factory _$GDimensionsData([void Function(GDimensionsDataBuilder)? updates]) =>
      (new GDimensionsDataBuilder()..update(updates))._build();

  _$GDimensionsData._({required this.G__typename, this.minimum, this.maximum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDimensionsData', 'G__typename');
  }

  @override
  GDimensionsData rebuild(void Function(GDimensionsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDimensionsDataBuilder toBuilder() =>
      new GDimensionsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDimensionsData &&
        G__typename == other.G__typename &&
        minimum == other.minimum &&
        maximum == other.maximum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), minimum.hashCode), maximum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDimensionsData')
          ..add('G__typename', G__typename)
          ..add('minimum', minimum)
          ..add('maximum', maximum))
        .toString();
  }
}

class GDimensionsDataBuilder
    implements Builder<GDimensionsData, GDimensionsDataBuilder> {
  _$GDimensionsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  GDimensionsDataBuilder() {
    GDimensionsData._initializeBuilder(this);
  }

  GDimensionsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _minimum = $v.minimum;
      _maximum = $v.maximum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDimensionsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDimensionsData;
  }

  @override
  void update(void Function(GDimensionsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDimensionsData build() => _build();

  _$GDimensionsData _build() {
    final _$result = _$v ??
        new _$GDimensionsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDimensionsData', 'G__typename'),
            minimum: minimum,
            maximum: maximum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
