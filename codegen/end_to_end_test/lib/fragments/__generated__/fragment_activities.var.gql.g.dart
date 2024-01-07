// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_activities.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GActivityAVars> _$gActivityAVarsSerializer =
    new _$GActivityAVarsSerializer();
Serializer<GActivityBVars> _$gActivityBVarsSerializer =
    new _$GActivityBVarsSerializer();
Serializer<GItemVars> _$gItemVarsSerializer = new _$GItemVarsSerializer();
Serializer<GItemConnectionVars> _$gItemConnectionVarsSerializer =
    new _$GItemConnectionVarsSerializer();
Serializer<GItemEdgeVars> _$gItemEdgeVarsSerializer =
    new _$GItemEdgeVarsSerializer();

class _$GActivityAVarsSerializer
    implements StructuredSerializer<GActivityAVars> {
  @override
  final Iterable<Type> types = const [GActivityAVars, _$GActivityAVars];
  @override
  final String wireName = 'GActivityAVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GActivityAVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GActivityAVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GActivityAVarsBuilder().build();
  }
}

class _$GActivityBVarsSerializer
    implements StructuredSerializer<GActivityBVars> {
  @override
  final Iterable<Type> types = const [GActivityBVars, _$GActivityBVars];
  @override
  final String wireName = 'GActivityBVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GActivityBVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GActivityBVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GActivityBVarsBuilder().build();
  }
}

class _$GItemVarsSerializer implements StructuredSerializer<GItemVars> {
  @override
  final Iterable<Type> types = const [GItemVars, _$GItemVars];
  @override
  final String wireName = 'GItemVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GItemVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GItemVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GItemVarsBuilder().build();
  }
}

class _$GItemConnectionVarsSerializer
    implements StructuredSerializer<GItemConnectionVars> {
  @override
  final Iterable<Type> types = const [
    GItemConnectionVars,
    _$GItemConnectionVars
  ];
  @override
  final String wireName = 'GItemConnectionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GItemConnectionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GItemConnectionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GItemConnectionVarsBuilder().build();
  }
}

class _$GItemEdgeVarsSerializer implements StructuredSerializer<GItemEdgeVars> {
  @override
  final Iterable<Type> types = const [GItemEdgeVars, _$GItemEdgeVars];
  @override
  final String wireName = 'GItemEdgeVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GItemEdgeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GItemEdgeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GItemEdgeVarsBuilder().build();
  }
}

class _$GActivityAVars extends GActivityAVars {
  factory _$GActivityAVars([void Function(GActivityAVarsBuilder)? updates]) =>
      (new GActivityAVarsBuilder()..update(updates))._build();

  _$GActivityAVars._() : super._();

  @override
  GActivityAVars rebuild(void Function(GActivityAVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityAVarsBuilder toBuilder() =>
      new GActivityAVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityAVars;
  }

  @override
  int get hashCode {
    return 387328791;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GActivityAVars').toString();
  }
}

class GActivityAVarsBuilder
    implements Builder<GActivityAVars, GActivityAVarsBuilder> {
  _$GActivityAVars? _$v;

  GActivityAVarsBuilder();

  @override
  void replace(GActivityAVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityAVars;
  }

  @override
  void update(void Function(GActivityAVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityAVars build() => _build();

  _$GActivityAVars _build() {
    final _$result = _$v ?? new _$GActivityAVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GActivityBVars extends GActivityBVars {
  factory _$GActivityBVars([void Function(GActivityBVarsBuilder)? updates]) =>
      (new GActivityBVarsBuilder()..update(updates))._build();

  _$GActivityBVars._() : super._();

  @override
  GActivityBVars rebuild(void Function(GActivityBVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GActivityBVarsBuilder toBuilder() =>
      new GActivityBVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GActivityBVars;
  }

  @override
  int get hashCode {
    return 469057560;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GActivityBVars').toString();
  }
}

class GActivityBVarsBuilder
    implements Builder<GActivityBVars, GActivityBVarsBuilder> {
  _$GActivityBVars? _$v;

  GActivityBVarsBuilder();

  @override
  void replace(GActivityBVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GActivityBVars;
  }

  @override
  void update(void Function(GActivityBVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GActivityBVars build() => _build();

  _$GActivityBVars _build() {
    final _$result = _$v ?? new _$GActivityBVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GItemVars extends GItemVars {
  factory _$GItemVars([void Function(GItemVarsBuilder)? updates]) =>
      (new GItemVarsBuilder()..update(updates))._build();

  _$GItemVars._() : super._();

  @override
  GItemVars rebuild(void Function(GItemVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemVarsBuilder toBuilder() => new GItemVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemVars;
  }

  @override
  int get hashCode {
    return 1051824045;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GItemVars').toString();
  }
}

class GItemVarsBuilder implements Builder<GItemVars, GItemVarsBuilder> {
  _$GItemVars? _$v;

  GItemVarsBuilder();

  @override
  void replace(GItemVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemVars;
  }

  @override
  void update(void Function(GItemVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemVars build() => _build();

  _$GItemVars _build() {
    final _$result = _$v ?? new _$GItemVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GItemConnectionVars extends GItemConnectionVars {
  factory _$GItemConnectionVars(
          [void Function(GItemConnectionVarsBuilder)? updates]) =>
      (new GItemConnectionVarsBuilder()..update(updates))._build();

  _$GItemConnectionVars._() : super._();

  @override
  GItemConnectionVars rebuild(
          void Function(GItemConnectionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemConnectionVarsBuilder toBuilder() =>
      new GItemConnectionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemConnectionVars;
  }

  @override
  int get hashCode {
    return 1013798405;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GItemConnectionVars').toString();
  }
}

class GItemConnectionVarsBuilder
    implements Builder<GItemConnectionVars, GItemConnectionVarsBuilder> {
  _$GItemConnectionVars? _$v;

  GItemConnectionVarsBuilder();

  @override
  void replace(GItemConnectionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemConnectionVars;
  }

  @override
  void update(void Function(GItemConnectionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemConnectionVars build() => _build();

  _$GItemConnectionVars _build() {
    final _$result = _$v ?? new _$GItemConnectionVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GItemEdgeVars extends GItemEdgeVars {
  factory _$GItemEdgeVars([void Function(GItemEdgeVarsBuilder)? updates]) =>
      (new GItemEdgeVarsBuilder()..update(updates))._build();

  _$GItemEdgeVars._() : super._();

  @override
  GItemEdgeVars rebuild(void Function(GItemEdgeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GItemEdgeVarsBuilder toBuilder() => new GItemEdgeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GItemEdgeVars;
  }

  @override
  int get hashCode {
    return 699140406;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GItemEdgeVars').toString();
  }
}

class GItemEdgeVarsBuilder
    implements Builder<GItemEdgeVars, GItemEdgeVarsBuilder> {
  _$GItemEdgeVars? _$v;

  GItemEdgeVarsBuilder();

  @override
  void replace(GItemEdgeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GItemEdgeVars;
  }

  @override
  void update(void Function(GItemEdgeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GItemEdgeVars build() => _build();

  _$GItemEdgeVars _build() {
    final _$result = _$v ?? new _$GItemEdgeVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
