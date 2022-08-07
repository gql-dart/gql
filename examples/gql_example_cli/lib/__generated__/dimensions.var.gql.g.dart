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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
