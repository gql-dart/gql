// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTestQueryVars> _$gTestQueryVarsSerializer =
    new _$GTestQueryVarsSerializer();
Serializer<GUserFragmentVars> _$gUserFragmentVarsSerializer =
    new _$GUserFragmentVarsSerializer();

class _$GTestQueryVarsSerializer
    implements StructuredSerializer<GTestQueryVars> {
  @override
  final Iterable<Type> types = const [GTestQueryVars, _$GTestQueryVars];
  @override
  final String wireName = 'GTestQueryVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTestQueryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GTestQueryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GTestQueryVarsBuilder().build();
  }
}

class _$GUserFragmentVarsSerializer
    implements StructuredSerializer<GUserFragmentVars> {
  @override
  final Iterable<Type> types = const [GUserFragmentVars, _$GUserFragmentVars];
  @override
  final String wireName = 'GUserFragmentVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GUserFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserFragmentVarsBuilder().build();
  }
}

class _$GTestQueryVars extends GTestQueryVars {
  factory _$GTestQueryVars([void Function(GTestQueryVarsBuilder)? updates]) =>
      (new GTestQueryVarsBuilder()..update(updates))._build();

  _$GTestQueryVars._() : super._();

  @override
  GTestQueryVars rebuild(void Function(GTestQueryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTestQueryVarsBuilder toBuilder() =>
      new GTestQueryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTestQueryVars;
  }

  @override
  int get hashCode {
    return 546902809;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GTestQueryVars').toString();
  }
}

class GTestQueryVarsBuilder
    implements Builder<GTestQueryVars, GTestQueryVarsBuilder> {
  _$GTestQueryVars? _$v;

  GTestQueryVarsBuilder();

  @override
  void replace(GTestQueryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTestQueryVars;
  }

  @override
  void update(void Function(GTestQueryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTestQueryVars build() => _build();

  _$GTestQueryVars _build() {
    final _$result = _$v ?? new _$GTestQueryVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GUserFragmentVars extends GUserFragmentVars {
  factory _$GUserFragmentVars(
          [void Function(GUserFragmentVarsBuilder)? updates]) =>
      (new GUserFragmentVarsBuilder()..update(updates))._build();

  _$GUserFragmentVars._() : super._();

  @override
  GUserFragmentVars rebuild(void Function(GUserFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFragmentVarsBuilder toBuilder() =>
      new GUserFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFragmentVars;
  }

  @override
  int get hashCode {
    return 203572066;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GUserFragmentVars').toString();
  }
}

class GUserFragmentVarsBuilder
    implements Builder<GUserFragmentVars, GUserFragmentVarsBuilder> {
  _$GUserFragmentVars? _$v;

  GUserFragmentVarsBuilder();

  @override
  void replace(GUserFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFragmentVars;
  }

  @override
  void update(void Function(GUserFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFragmentVars build() => _build();

  _$GUserFragmentVars _build() {
    final _$result = _$v ?? new _$GUserFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
