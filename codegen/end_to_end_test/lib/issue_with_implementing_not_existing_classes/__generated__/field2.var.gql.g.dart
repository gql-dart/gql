// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field2.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GField2Vars> _$gField2VarsSerializer = new _$GField2VarsSerializer();

class _$GField2VarsSerializer implements StructuredSerializer<GField2Vars> {
  @override
  final Iterable<Type> types = const [GField2Vars, _$GField2Vars];
  @override
  final String wireName = 'GField2Vars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GField2Vars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GField2Vars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GField2VarsBuilder().build();
  }
}

class _$GField2Vars extends GField2Vars {
  factory _$GField2Vars([void Function(GField2VarsBuilder)? updates]) =>
      (new GField2VarsBuilder()..update(updates))._build();

  _$GField2Vars._() : super._();

  @override
  GField2Vars rebuild(void Function(GField2VarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GField2VarsBuilder toBuilder() => new GField2VarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GField2Vars;
  }

  @override
  int get hashCode {
    return 845131540;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GField2Vars').toString();
  }
}

class GField2VarsBuilder implements Builder<GField2Vars, GField2VarsBuilder> {
  _$GField2Vars? _$v;

  GField2VarsBuilder();

  @override
  void replace(GField2Vars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GField2Vars;
  }

  @override
  void update(void Function(GField2VarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GField2Vars build() => _build();

  _$GField2Vars _build() {
    final _$result = _$v ?? new _$GField2Vars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
