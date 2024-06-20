// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_inline_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInlineFragmentsData>
    _$gHeroWithInlineFragmentsDataSerializer =
    new _$GHeroWithInlineFragmentsDataSerializer();
Serializer<GHeroWithInlineFragmentsData_hero__base>
    _$gHeroWithInlineFragmentsDataHeroBaseSerializer =
    new _$GHeroWithInlineFragmentsData_hero__baseSerializer();

class _$GHeroWithInlineFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithInlineFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInlineFragmentsData,
    _$GHeroWithInlineFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithInlineFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInlineFragmentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.hero;
    if (value != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GHeroWithInlineFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithInlineFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInlineFragmentsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'hero':
          result.hero = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GHeroWithInlineFragmentsData_hero))
              as GHeroWithInlineFragmentsData_hero?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInlineFragmentsData_hero__baseSerializer
    implements StructuredSerializer<GHeroWithInlineFragmentsData_hero__base> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInlineFragmentsData_hero__base,
    _$GHeroWithInlineFragmentsData_hero__base
  ];
  @override
  final String wireName = 'GHeroWithInlineFragmentsData_hero__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInlineFragmentsData_hero__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithInlineFragmentsData_hero__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInlineFragmentsData_hero__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInlineFragmentsData extends GHeroWithInlineFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithInlineFragmentsData_hero? hero;

  factory _$GHeroWithInlineFragmentsData(
          [void Function(GHeroWithInlineFragmentsDataBuilder)? updates]) =>
      (new GHeroWithInlineFragmentsDataBuilder()..update(updates))._build();

  _$GHeroWithInlineFragmentsData._({required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithInlineFragmentsData', 'G__typename');
  }

  @override
  GHeroWithInlineFragmentsData rebuild(
          void Function(GHeroWithInlineFragmentsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInlineFragmentsDataBuilder toBuilder() =>
      new GHeroWithInlineFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInlineFragmentsData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hero.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithInlineFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithInlineFragmentsDataBuilder
    implements
        Builder<GHeroWithInlineFragmentsData,
            GHeroWithInlineFragmentsDataBuilder> {
  _$GHeroWithInlineFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInlineFragmentsData_hero? _hero;
  GHeroWithInlineFragmentsData_hero? get hero => _$this._hero;
  set hero(GHeroWithInlineFragmentsData_hero? hero) => _$this._hero = hero;

  GHeroWithInlineFragmentsDataBuilder() {
    GHeroWithInlineFragmentsData._initializeBuilder(this);
  }

  GHeroWithInlineFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInlineFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInlineFragmentsData;
  }

  @override
  void update(void Function(GHeroWithInlineFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInlineFragmentsData build() => _build();

  _$GHeroWithInlineFragmentsData _build() {
    final _$result = _$v ??
        new _$GHeroWithInlineFragmentsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHeroWithInlineFragmentsData', 'G__typename'),
            hero: hero);
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInlineFragmentsData_hero__base
    extends GHeroWithInlineFragmentsData_hero__base {
  @override
  final String G__typename;

  factory _$GHeroWithInlineFragmentsData_hero__base(
          [void Function(GHeroWithInlineFragmentsData_hero__baseBuilder)?
              updates]) =>
      (new GHeroWithInlineFragmentsData_hero__baseBuilder()..update(updates))
          ._build();

  _$GHeroWithInlineFragmentsData_hero__base._({required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithInlineFragmentsData_hero__base', 'G__typename');
  }

  @override
  GHeroWithInlineFragmentsData_hero__base rebuild(
          void Function(GHeroWithInlineFragmentsData_hero__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInlineFragmentsData_hero__baseBuilder toBuilder() =>
      new GHeroWithInlineFragmentsData_hero__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInlineFragmentsData_hero__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInlineFragmentsData_hero__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GHeroWithInlineFragmentsData_hero__baseBuilder
    implements
        Builder<GHeroWithInlineFragmentsData_hero__base,
            GHeroWithInlineFragmentsData_hero__baseBuilder> {
  _$GHeroWithInlineFragmentsData_hero__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInlineFragmentsData_hero__baseBuilder() {
    GHeroWithInlineFragmentsData_hero__base._initializeBuilder(this);
  }

  GHeroWithInlineFragmentsData_hero__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInlineFragmentsData_hero__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInlineFragmentsData_hero__base;
  }

  @override
  void update(
      void Function(GHeroWithInlineFragmentsData_hero__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInlineFragmentsData_hero__base build() => _build();

  _$GHeroWithInlineFragmentsData_hero__base _build() {
    final _$result = _$v ??
        new _$GHeroWithInlineFragmentsData_hero__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithInlineFragmentsData_hero__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
