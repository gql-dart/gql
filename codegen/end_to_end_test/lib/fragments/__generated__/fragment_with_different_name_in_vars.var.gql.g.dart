// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_with_different_name_in_vars.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDifferentNameVars> _$gDifferentNameVarsSerializer =
    new _$GDifferentNameVarsSerializer();

class _$GDifferentNameVarsSerializer
    implements StructuredSerializer<GDifferentNameVars> {
  @override
  final Iterable<Type> types = const [GDifferentNameVars, _$GDifferentNameVars];
  @override
  final String wireName = 'GDifferentNameVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDifferentNameVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.start;
    if (value != null) {
      result
        ..add('start')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GDifferentNameVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDifferentNameVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'start':
          result.start = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDifferentNameVars extends GDifferentNameVars {
  @override
  final int? start;

  factory _$GDifferentNameVars(
          [void Function(GDifferentNameVarsBuilder)? updates]) =>
      (new GDifferentNameVarsBuilder()..update(updates))._build();

  _$GDifferentNameVars._({this.start}) : super._();

  @override
  GDifferentNameVars rebuild(
          void Function(GDifferentNameVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDifferentNameVarsBuilder toBuilder() =>
      new GDifferentNameVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDifferentNameVars && start == other.start;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDifferentNameVars')
          ..add('start', start))
        .toString();
  }
}

class GDifferentNameVarsBuilder
    implements Builder<GDifferentNameVars, GDifferentNameVarsBuilder> {
  _$GDifferentNameVars? _$v;

  int? _start;
  int? get start => _$this._start;
  set start(int? start) => _$this._start = start;

  GDifferentNameVarsBuilder();

  GDifferentNameVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _start = $v.start;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDifferentNameVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDifferentNameVars;
  }

  @override
  void update(void Function(GDifferentNameVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDifferentNameVars build() => _build();

  _$GDifferentNameVars _build() {
    final _$result = _$v ?? new _$GDifferentNameVars._(start: start);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
