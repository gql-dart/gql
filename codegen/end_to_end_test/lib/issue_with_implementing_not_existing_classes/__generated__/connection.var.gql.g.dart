// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GConnectionVars> _$gConnectionVarsSerializer =
    new _$GConnectionVarsSerializer();

class _$GConnectionVarsSerializer
    implements StructuredSerializer<GConnectionVars> {
  @override
  final Iterable<Type> types = const [GConnectionVars, _$GConnectionVars];
  @override
  final String wireName = 'GConnectionVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GConnectionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GConnectionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GConnectionVarsBuilder().build();
  }
}

class _$GConnectionVars extends GConnectionVars {
  factory _$GConnectionVars([void Function(GConnectionVarsBuilder)? updates]) =>
      (new GConnectionVarsBuilder()..update(updates))._build();

  _$GConnectionVars._() : super._();

  @override
  GConnectionVars rebuild(void Function(GConnectionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GConnectionVarsBuilder toBuilder() =>
      new GConnectionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GConnectionVars;
  }

  @override
  int get hashCode {
    return 532823377;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GConnectionVars').toString();
  }
}

class GConnectionVarsBuilder
    implements Builder<GConnectionVars, GConnectionVarsBuilder> {
  _$GConnectionVars? _$v;

  GConnectionVarsBuilder();

  @override
  void replace(GConnectionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GConnectionVars;
  }

  @override
  void update(void Function(GConnectionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GConnectionVars build() => _build();

  _$GConnectionVars _build() {
    final _$result = _$v ?? new _$GConnectionVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
