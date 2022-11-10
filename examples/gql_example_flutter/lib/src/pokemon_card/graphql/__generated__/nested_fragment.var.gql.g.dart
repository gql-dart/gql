// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GNestedFragmentVars> _$gNestedFragmentVarsSerializer =
    new _$GNestedFragmentVarsSerializer();

class _$GNestedFragmentVarsSerializer
    implements StructuredSerializer<GNestedFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GNestedFragmentVars,
    _$GNestedFragmentVars
  ];
  @override
  final String wireName = 'GNestedFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GNestedFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GNestedFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GNestedFragmentVarsBuilder().build();
  }
}

class _$GNestedFragmentVars extends GNestedFragmentVars {
  factory _$GNestedFragmentVars(
          [void Function(GNestedFragmentVarsBuilder)? updates]) =>
      (new GNestedFragmentVarsBuilder()..update(updates))._build();

  _$GNestedFragmentVars._() : super._();

  @override
  GNestedFragmentVars rebuild(
          void Function(GNestedFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GNestedFragmentVarsBuilder toBuilder() =>
      new GNestedFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GNestedFragmentVars;
  }

  @override
  int get hashCode {
    return 824719722;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GNestedFragmentVars').toString();
  }
}

class GNestedFragmentVarsBuilder
    implements Builder<GNestedFragmentVars, GNestedFragmentVarsBuilder> {
  _$GNestedFragmentVars? _$v;

  GNestedFragmentVarsBuilder();

  @override
  void replace(GNestedFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GNestedFragmentVars;
  }

  @override
  void update(void Function(GNestedFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GNestedFragmentVars build() => _build();

  _$GNestedFragmentVars _build() {
    final _$result = _$v ?? new _$GNestedFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
