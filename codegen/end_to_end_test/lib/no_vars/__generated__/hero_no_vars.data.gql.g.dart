// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_no_vars.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroNoVarsData> _$gHeroNoVarsDataSerializer =
    new _$GHeroNoVarsDataSerializer();

class _$GHeroNoVarsDataSerializer
    implements StructuredSerializer<GHeroNoVarsData> {
  @override
  final Iterable<Type> types = const [GHeroNoVarsData, _$GHeroNoVarsData];
  @override
  final String wireName = 'GHeroNoVarsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroNoVarsData object,
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
            specifiedType: const FullType(_i1.GheroFieldsFragmentData__base)));
    }
    return result;
  }

  @override
  GHeroNoVarsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsDataBuilder();

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
          result.hero.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GheroFieldsFragmentData__base))!
              as _i1.GheroFieldsFragmentData__base);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroNoVarsData extends GHeroNoVarsData {
  @override
  final String G__typename;
  @override
  final _i1.GheroFieldsFragmentData__base? hero;

  factory _$GHeroNoVarsData([void Function(GHeroNoVarsDataBuilder)? updates]) =>
      (new GHeroNoVarsDataBuilder()..update(updates))._build();

  _$GHeroNoVarsData._({required this.G__typename, this.hero}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroNoVarsData', 'G__typename');
  }

  @override
  GHeroNoVarsData rebuild(void Function(GHeroNoVarsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsDataBuilder toBuilder() =>
      new GHeroNoVarsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVarsData &&
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
    return (newBuiltValueToStringHelper(r'GHeroNoVarsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroNoVarsDataBuilder
    implements Builder<GHeroNoVarsData, GHeroNoVarsDataBuilder> {
  _$GHeroNoVarsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i1.GheroFieldsFragmentData__baseBuilder? _hero;
  _i1.GheroFieldsFragmentData__baseBuilder get hero =>
      _$this._hero ??= new _i1.GheroFieldsFragmentData__baseBuilder();
  set hero(_i1.GheroFieldsFragmentData__baseBuilder? hero) =>
      _$this._hero = hero;

  GHeroNoVarsDataBuilder() {
    GHeroNoVarsData._initializeBuilder(this);
  }

  GHeroNoVarsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroNoVarsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroNoVarsData;
  }

  @override
  void update(void Function(GHeroNoVarsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroNoVarsData build() => _build();

  _$GHeroNoVarsData _build() {
    _$GHeroNoVarsData _$result;
    try {
      _$result = _$v ??
          new _$GHeroNoVarsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHeroNoVarsData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroNoVarsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
