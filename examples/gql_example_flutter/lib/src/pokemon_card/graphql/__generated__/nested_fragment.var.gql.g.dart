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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
