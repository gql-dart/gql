// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field1.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField1Vars> _$gField1VarsSerializer = new _$GField1VarsSerializer();

class _$GField1VarsSerializer implements StructuredSerializer<GField1Vars> {
  @override
  final Iterable<Type> types = const [GField1Vars, _$GField1Vars];
  @override
  final String wireName = 'GField1Vars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField1Vars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GField1Vars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GField1VarsBuilder().build();
  }
}

class _$GField1Vars extends GField1Vars {
  factory _$GField1Vars([void Function(GField1VarsBuilder)? updates]) =>
      (new GField1VarsBuilder()..update(updates))._build();

  _$GField1Vars._() : super._();

  @override
  GField1Vars rebuild(void Function(GField1VarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField1VarsBuilder toBuilder() => new GField1VarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField1Vars;
  }

  @override
  int get hashCode {
    return 849080424;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GField1Vars').toString();
  }
}

class GField1VarsBuilder implements Builder<GField1Vars, GField1VarsBuilder> {
  _$GField1Vars? _$v;

  GField1VarsBuilder();

  @override
  void replace(GField1Vars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField1Vars;
  }

  @override
  void update(void Function(GField1VarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField1Vars build() => _build();

  _$GField1Vars _build() {
    final _$result = _$v ?? new _$GField1Vars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
