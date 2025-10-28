// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments_on_interface.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetBooksVars> _$gGetBooksVarsSerializer =
    _$GGetBooksVarsSerializer();
Serializer<GAuthorFragmentVars> _$gAuthorFragmentVarsSerializer =
    _$GAuthorFragmentVarsSerializer();
Serializer<GBookFragmentVars> _$gBookFragmentVarsSerializer =
    _$GBookFragmentVarsSerializer();

class _$GGetBooksVarsSerializer implements StructuredSerializer<GGetBooksVars> {
  @override
  final Iterable<Type> types = const [GGetBooksVars, _$GGetBooksVars];
  @override
  final String wireName = 'GGetBooksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetBooksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetBooksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return GGetBooksVarsBuilder().build();
  }
}

class _$GAuthorFragmentVarsSerializer
    implements StructuredSerializer<GAuthorFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GAuthorFragmentVars,
    _$GAuthorFragmentVars
  ];
  @override
  final String wireName = 'GAuthorFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAuthorFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return GAuthorFragmentVarsBuilder().build();
  }
}

class _$GBookFragmentVarsSerializer
    implements StructuredSerializer<GBookFragmentVars> {
  @override
  final Iterable<Type> types = const [GBookFragmentVars, _$GBookFragmentVars];
  @override
  final String wireName = 'GBookFragmentVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GBookFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GBookFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return GBookFragmentVarsBuilder().build();
  }
}

class _$GGetBooksVars extends GGetBooksVars {
  factory _$GGetBooksVars([void Function(GGetBooksVarsBuilder)? updates]) =>
      (GGetBooksVarsBuilder()..update(updates))._build();

  _$GGetBooksVars._() : super._();
  @override
  GGetBooksVars rebuild(void Function(GGetBooksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksVarsBuilder toBuilder() => GGetBooksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksVars;
  }

  @override
  int get hashCode {
    return 53836182;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetBooksVars').toString();
  }
}

class GGetBooksVarsBuilder
    implements Builder<GGetBooksVars, GGetBooksVarsBuilder> {
  _$GGetBooksVars? _$v;

  GGetBooksVarsBuilder();

  @override
  void replace(GGetBooksVars other) {
    _$v = other as _$GGetBooksVars;
  }

  @override
  void update(void Function(GGetBooksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksVars build() => _build();

  _$GGetBooksVars _build() {
    final _$result = _$v ?? _$GGetBooksVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GAuthorFragmentVars extends GAuthorFragmentVars {
  factory _$GAuthorFragmentVars(
          [void Function(GAuthorFragmentVarsBuilder)? updates]) =>
      (GAuthorFragmentVarsBuilder()..update(updates))._build();

  _$GAuthorFragmentVars._() : super._();
  @override
  GAuthorFragmentVars rebuild(
          void Function(GAuthorFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorFragmentVarsBuilder toBuilder() =>
      GAuthorFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorFragmentVars;
  }

  @override
  int get hashCode {
    return 102842534;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GAuthorFragmentVars').toString();
  }
}

class GAuthorFragmentVarsBuilder
    implements Builder<GAuthorFragmentVars, GAuthorFragmentVarsBuilder> {
  _$GAuthorFragmentVars? _$v;

  GAuthorFragmentVarsBuilder();

  @override
  void replace(GAuthorFragmentVars other) {
    _$v = other as _$GAuthorFragmentVars;
  }

  @override
  void update(void Function(GAuthorFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAuthorFragmentVars build() => _build();

  _$GAuthorFragmentVars _build() {
    final _$result = _$v ?? _$GAuthorFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentVars extends GBookFragmentVars {
  factory _$GBookFragmentVars(
          [void Function(GBookFragmentVarsBuilder)? updates]) =>
      (GBookFragmentVarsBuilder()..update(updates))._build();

  _$GBookFragmentVars._() : super._();
  @override
  GBookFragmentVars rebuild(void Function(GBookFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentVarsBuilder toBuilder() =>
      GBookFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentVars;
  }

  @override
  int get hashCode {
    return 845341956;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GBookFragmentVars').toString();
  }
}

class GBookFragmentVarsBuilder
    implements Builder<GBookFragmentVars, GBookFragmentVarsBuilder> {
  _$GBookFragmentVars? _$v;

  GBookFragmentVarsBuilder();

  @override
  void replace(GBookFragmentVars other) {
    _$v = other as _$GBookFragmentVars;
  }

  @override
  void update(void Function(GBookFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentVars build() => _build();

  _$GBookFragmentVars _build() {
    final _$result = _$v ?? _$GBookFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
