// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDimensionsVars> _$gDimensionsVarsSerializer =
    new _$GDimensionsVarsSerializer();

class _$GDimensionsVarsSerializer
    implements StructuredSerializer<GDimensionsVars> {
  @override
  final Iterable<Type> types = const [GDimensionsVars, _$GDimensionsVars];
  @override
  final String wireName = 'GDimensionsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDimensionsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GDimensionsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GDimensionsVarsBuilder().build();
  }
}

class _$GDimensionsVars extends GDimensionsVars {
  factory _$GDimensionsVars([void Function(GDimensionsVarsBuilder)? updates]) =>
      (new GDimensionsVarsBuilder()..update(updates))._build();

  _$GDimensionsVars._() : super._();

  @override
  GDimensionsVars rebuild(void Function(GDimensionsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDimensionsVarsBuilder toBuilder() =>
      new GDimensionsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDimensionsVars;
  }

  @override
  int get hashCode {
    return 198966443;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GDimensionsVars').toString();
  }
}

class GDimensionsVarsBuilder
    implements Builder<GDimensionsVars, GDimensionsVarsBuilder> {
  _$GDimensionsVars? _$v;

  GDimensionsVarsBuilder();

  @override
  void replace(GDimensionsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDimensionsVars;
  }

  @override
  void update(void Function(GDimensionsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDimensionsVars build() => _build();

  _$GDimensionsVars _build() {
    final _$result = _$v ?? new _$GDimensionsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
