// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field11.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField11Vars> _$gField11VarsSerializer =
    new _$GField11VarsSerializer();

class _$GField11VarsSerializer implements StructuredSerializer<GField11Vars> {
  @override
  final Iterable<Type> types = const [GField11Vars, _$GField11Vars];
  @override
  final String wireName = 'GField11Vars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField11Vars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GField11Vars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GField11VarsBuilder().build();
  }
}

class _$GField11Vars extends GField11Vars {
  factory _$GField11Vars([void Function(GField11VarsBuilder)? updates]) =>
      (new GField11VarsBuilder()..update(updates))._build();

  _$GField11Vars._() : super._();

  @override
  GField11Vars rebuild(void Function(GField11VarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField11VarsBuilder toBuilder() => new GField11VarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField11Vars;
  }

  @override
  int get hashCode {
    return 602136233;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GField11Vars').toString();
  }
}

class GField11VarsBuilder
    implements Builder<GField11Vars, GField11VarsBuilder> {
  _$GField11Vars? _$v;

  GField11VarsBuilder();

  @override
  void replace(GField11Vars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField11Vars;
  }

  @override
  void update(void Function(GField11VarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField11Vars build() => _build();

  _$GField11Vars _build() {
    final _$result = _$v ?? new _$GField11Vars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
