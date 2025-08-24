// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsVars> _$gHeroWithFragmentsVarsSerializer =
    _$GHeroWithFragmentsVarsSerializer();
Serializer<GheroDataVars> _$gheroDataVarsSerializer =
    _$GheroDataVarsSerializer();
Serializer<GcomparisonFieldsVars> _$gcomparisonFieldsVarsSerializer =
    _$GcomparisonFieldsVarsSerializer();

class _$GHeroWithFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsVars,
    _$GHeroWithFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GHeroWithFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GHeroWithFragmentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroDataVarsSerializer implements StructuredSerializer<GheroDataVars> {
  @override
  final Iterable<Type> types = const [GheroDataVars, _$GheroDataVars];
  @override
  final String wireName = 'GheroDataVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return GheroDataVarsBuilder().build();
  }
}

class _$GcomparisonFieldsVarsSerializer
    implements StructuredSerializer<GcomparisonFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GcomparisonFieldsVars,
    _$GcomparisonFieldsVars
  ];
  @override
  final String wireName = 'GcomparisonFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcomparisonFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.first;
    if (value != null) {
      result
        ..add('first')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GcomparisonFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GcomparisonFieldsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithFragmentsVars extends GHeroWithFragmentsVars {
  @override
  final int? first;

  factory _$GHeroWithFragmentsVars(
          [void Function(GHeroWithFragmentsVarsBuilder)? updates]) =>
      (GHeroWithFragmentsVarsBuilder()..update(updates))._build();

  _$GHeroWithFragmentsVars._({this.first}) : super._();
  @override
  GHeroWithFragmentsVars rebuild(
          void Function(GHeroWithFragmentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsVarsBuilder toBuilder() =>
      GHeroWithFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsVars && first == other.first;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsVars')
          ..add('first', first))
        .toString();
  }
}

class GHeroWithFragmentsVarsBuilder
    implements Builder<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  _$GHeroWithFragmentsVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  GHeroWithFragmentsVarsBuilder();

  GHeroWithFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsVars other) {
    _$v = other as _$GHeroWithFragmentsVars;
  }

  @override
  void update(void Function(GHeroWithFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsVars build() => _build();

  _$GHeroWithFragmentsVars _build() {
    final _$result = _$v ??
        _$GHeroWithFragmentsVars._(
          first: first,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GheroDataVars extends GheroDataVars {
  factory _$GheroDataVars([void Function(GheroDataVarsBuilder)? updates]) =>
      (GheroDataVarsBuilder()..update(updates))._build();

  _$GheroDataVars._() : super._();
  @override
  GheroDataVars rebuild(void Function(GheroDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroDataVarsBuilder toBuilder() => GheroDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroDataVars;
  }

  @override
  int get hashCode {
    return 172200517;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GheroDataVars').toString();
  }
}

class GheroDataVarsBuilder
    implements Builder<GheroDataVars, GheroDataVarsBuilder> {
  _$GheroDataVars? _$v;

  GheroDataVarsBuilder();

  @override
  void replace(GheroDataVars other) {
    _$v = other as _$GheroDataVars;
  }

  @override
  void update(void Function(GheroDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroDataVars build() => _build();

  _$GheroDataVars _build() {
    final _$result = _$v ?? _$GheroDataVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GcomparisonFieldsVars extends GcomparisonFieldsVars {
  @override
  final int? first;

  factory _$GcomparisonFieldsVars(
          [void Function(GcomparisonFieldsVarsBuilder)? updates]) =>
      (GcomparisonFieldsVarsBuilder()..update(updates))._build();

  _$GcomparisonFieldsVars._({this.first}) : super._();
  @override
  GcomparisonFieldsVars rebuild(
          void Function(GcomparisonFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcomparisonFieldsVarsBuilder toBuilder() =>
      GcomparisonFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcomparisonFieldsVars && first == other.first;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GcomparisonFieldsVars')
          ..add('first', first))
        .toString();
  }
}

class GcomparisonFieldsVarsBuilder
    implements Builder<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  _$GcomparisonFieldsVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  GcomparisonFieldsVarsBuilder();

  GcomparisonFieldsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcomparisonFieldsVars other) {
    _$v = other as _$GcomparisonFieldsVars;
  }

  @override
  void update(void Function(GcomparisonFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcomparisonFieldsVars build() => _build();

  _$GcomparisonFieldsVars _build() {
    final _$result = _$v ??
        _$GcomparisonFieldsVars._(
          first: first,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
