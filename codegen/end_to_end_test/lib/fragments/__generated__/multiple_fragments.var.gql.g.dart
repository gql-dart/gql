// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWith2FragmentsVars> _$gHeroWith2FragmentsVarsSerializer =
    new _$GHeroWith2FragmentsVarsSerializer();
Serializer<GheroNameVars> _$gheroNameVarsSerializer =
    new _$GheroNameVarsSerializer();
Serializer<GheroIdVars> _$gheroIdVarsSerializer = new _$GheroIdVarsSerializer();

class _$GHeroWith2FragmentsVarsSerializer
    implements StructuredSerializer<GHeroWith2FragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWith2FragmentsVars,
    _$GHeroWith2FragmentsVars
  ];
  @override
  final String wireName = 'GHeroWith2FragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWith2FragmentsVars object,
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
  GHeroWith2FragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWith2FragmentsVarsBuilder();

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

class _$GheroNameVarsSerializer implements StructuredSerializer<GheroNameVars> {
  @override
  final Iterable<Type> types = const [GheroNameVars, _$GheroNameVars];
  @override
  final String wireName = 'GheroNameVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroNameVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroNameVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GheroNameVarsBuilder().build();
  }
}

class _$GheroIdVarsSerializer implements StructuredSerializer<GheroIdVars> {
  @override
  final Iterable<Type> types = const [GheroIdVars, _$GheroIdVars];
  @override
  final String wireName = 'GheroIdVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GheroIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GheroIdVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GheroIdVarsBuilder().build();
  }
}

class _$GHeroWith2FragmentsVars extends GHeroWith2FragmentsVars {
  @override
  final int? first;

  factory _$GHeroWith2FragmentsVars(
          [void Function(GHeroWith2FragmentsVarsBuilder)? updates]) =>
      (new GHeroWith2FragmentsVarsBuilder()..update(updates))._build();

  _$GHeroWith2FragmentsVars._({this.first}) : super._();

  @override
  GHeroWith2FragmentsVars rebuild(
          void Function(GHeroWith2FragmentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWith2FragmentsVarsBuilder toBuilder() =>
      new GHeroWith2FragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWith2FragmentsVars && first == other.first;
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
    return (newBuiltValueToStringHelper(r'GHeroWith2FragmentsVars')
          ..add('first', first))
        .toString();
  }
}

class GHeroWith2FragmentsVarsBuilder
    implements
        Builder<GHeroWith2FragmentsVars, GHeroWith2FragmentsVarsBuilder> {
  _$GHeroWith2FragmentsVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  GHeroWith2FragmentsVarsBuilder();

  GHeroWith2FragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWith2FragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWith2FragmentsVars;
  }

  @override
  void update(void Function(GHeroWith2FragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWith2FragmentsVars build() => _build();

  _$GHeroWith2FragmentsVars _build() {
    final _$result = _$v ?? new _$GHeroWith2FragmentsVars._(first: first);
    replace(_$result);
    return _$result;
  }
}

class _$GheroNameVars extends GheroNameVars {
  factory _$GheroNameVars([void Function(GheroNameVarsBuilder)? updates]) =>
      (new GheroNameVarsBuilder()..update(updates))._build();

  _$GheroNameVars._() : super._();

  @override
  GheroNameVars rebuild(void Function(GheroNameVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroNameVarsBuilder toBuilder() => new GheroNameVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroNameVars;
  }

  @override
  int get hashCode {
    return 669227084;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GheroNameVars').toString();
  }
}

class GheroNameVarsBuilder
    implements Builder<GheroNameVars, GheroNameVarsBuilder> {
  _$GheroNameVars? _$v;

  GheroNameVarsBuilder();

  @override
  void replace(GheroNameVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroNameVars;
  }

  @override
  void update(void Function(GheroNameVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroNameVars build() => _build();

  _$GheroNameVars _build() {
    final _$result = _$v ?? new _$GheroNameVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GheroIdVars extends GheroIdVars {
  factory _$GheroIdVars([void Function(GheroIdVarsBuilder)? updates]) =>
      (new GheroIdVarsBuilder()..update(updates))._build();

  _$GheroIdVars._() : super._();

  @override
  GheroIdVars rebuild(void Function(GheroIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroIdVarsBuilder toBuilder() => new GheroIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroIdVars;
  }

  @override
  int get hashCode {
    return 474459980;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GheroIdVars').toString();
  }
}

class GheroIdVarsBuilder implements Builder<GheroIdVars, GheroIdVarsBuilder> {
  _$GheroIdVars? _$v;

  GheroIdVarsBuilder();

  @override
  void replace(GheroIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroIdVars;
  }

  @override
  void update(void Function(GheroIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroIdVars build() => _build();

  _$GheroIdVars _build() {
    final _$result = _$v ?? new _$GheroIdVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
