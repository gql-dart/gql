// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReproQueryVars> _$gReproQueryVarsSerializer =
    new _$GReproQueryVarsSerializer();
Serializer<GChildFragmentVars> _$gChildFragmentVarsSerializer =
    new _$GChildFragmentVarsSerializer();

class _$GReproQueryVarsSerializer
    implements StructuredSerializer<GReproQueryVars> {
  @override
  final Iterable<Type> types = const [GReproQueryVars, _$GReproQueryVars];
  @override
  final String wireName = 'GReproQueryVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReproQueryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GReproQueryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GReproQueryVarsBuilder().build();
  }
}

class _$GChildFragmentVarsSerializer
    implements StructuredSerializer<GChildFragmentVars> {
  @override
  final Iterable<Type> types = const [GChildFragmentVars, _$GChildFragmentVars];
  @override
  final String wireName = 'GChildFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChildFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GChildFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GChildFragmentVarsBuilder().build();
  }
}

class _$GReproQueryVars extends GReproQueryVars {
  factory _$GReproQueryVars([void Function(GReproQueryVarsBuilder)? updates]) =>
      (new GReproQueryVarsBuilder()..update(updates))._build();

  _$GReproQueryVars._() : super._();

  @override
  GReproQueryVars rebuild(void Function(GReproQueryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReproQueryVarsBuilder toBuilder() =>
      new GReproQueryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReproQueryVars;
  }

  @override
  int get hashCode {
    return 877359792;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GReproQueryVars').toString();
  }
}

class GReproQueryVarsBuilder
    implements Builder<GReproQueryVars, GReproQueryVarsBuilder> {
  _$GReproQueryVars? _$v;

  GReproQueryVarsBuilder();

  @override
  void replace(GReproQueryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReproQueryVars;
  }

  @override
  void update(void Function(GReproQueryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReproQueryVars build() => _build();

  _$GReproQueryVars _build() {
    final _$result = _$v ?? new _$GReproQueryVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GChildFragmentVars extends GChildFragmentVars {
  factory _$GChildFragmentVars(
          [void Function(GChildFragmentVarsBuilder)? updates]) =>
      (new GChildFragmentVarsBuilder()..update(updates))._build();

  _$GChildFragmentVars._() : super._();

  @override
  GChildFragmentVars rebuild(
          void Function(GChildFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChildFragmentVarsBuilder toBuilder() =>
      new GChildFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChildFragmentVars;
  }

  @override
  int get hashCode {
    return 560973822;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GChildFragmentVars').toString();
  }
}

class GChildFragmentVarsBuilder
    implements Builder<GChildFragmentVars, GChildFragmentVarsBuilder> {
  _$GChildFragmentVars? _$v;

  GChildFragmentVarsBuilder();

  @override
  void replace(GChildFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChildFragmentVars;
  }

  @override
  void update(void Function(GChildFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChildFragmentVars build() => _build();

  _$GChildFragmentVars _build() {
    final _$result = _$v ?? new _$GChildFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
