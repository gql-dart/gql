// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_argument.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GreviewsWithListArgumentData>
    _$greviewsWithListArgumentDataSerializer =
    new _$GreviewsWithListArgumentDataSerializer();
Serializer<GreviewsWithListArgumentData_reviews>
    _$greviewsWithListArgumentDataReviewsSerializer =
    new _$GreviewsWithListArgumentData_reviewsSerializer();

class _$GreviewsWithListArgumentDataSerializer
    implements StructuredSerializer<GreviewsWithListArgumentData> {
  @override
  final Iterable<Type> types = const [
    GreviewsWithListArgumentData,
    _$GreviewsWithListArgumentData
  ];
  @override
  final String wireName = 'GreviewsWithListArgumentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GreviewsWithListArgumentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reviews;
    if (value != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GreviewsWithListArgumentData_reviews)
            ])));
    }
    return result;
  }

  @override
  GreviewsWithListArgumentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreviewsWithListArgumentDataBuilder();

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
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GreviewsWithListArgumentData_reviews)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GreviewsWithListArgumentData_reviewsSerializer
    implements StructuredSerializer<GreviewsWithListArgumentData_reviews> {
  @override
  final Iterable<Type> types = const [
    GreviewsWithListArgumentData_reviews,
    _$GreviewsWithListArgumentData_reviews
  ];
  @override
  final String wireName = 'GreviewsWithListArgumentData_reviews';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GreviewsWithListArgumentData_reviews object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.episode;
    if (value != null) {
      result
        ..add('episode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GEpisode)));
    }
    return result;
  }

  @override
  GreviewsWithListArgumentData_reviews deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreviewsWithListArgumentData_reviewsBuilder();

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
        case 'episode':
          result.episode = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEpisode)) as _i2.GEpisode?;
          break;
      }
    }

    return result.build();
  }
}

class _$GreviewsWithListArgumentData extends GreviewsWithListArgumentData {
  @override
  final String G__typename;
  @override
  final BuiltList<GreviewsWithListArgumentData_reviews?>? reviews;

  factory _$GreviewsWithListArgumentData(
          [void Function(GreviewsWithListArgumentDataBuilder)? updates]) =>
      (new GreviewsWithListArgumentDataBuilder()..update(updates))._build();

  _$GreviewsWithListArgumentData._({required this.G__typename, this.reviews})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GreviewsWithListArgumentData', 'G__typename');
  }

  @override
  GreviewsWithListArgumentData rebuild(
          void Function(GreviewsWithListArgumentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreviewsWithListArgumentDataBuilder toBuilder() =>
      new GreviewsWithListArgumentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GreviewsWithListArgumentData &&
        G__typename == other.G__typename &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reviews.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GreviewsWithListArgumentData')
          ..add('G__typename', G__typename)
          ..add('reviews', reviews))
        .toString();
  }
}

class GreviewsWithListArgumentDataBuilder
    implements
        Builder<GreviewsWithListArgumentData,
            GreviewsWithListArgumentDataBuilder> {
  _$GreviewsWithListArgumentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GreviewsWithListArgumentData_reviews?>? _reviews;
  ListBuilder<GreviewsWithListArgumentData_reviews?> get reviews =>
      _$this._reviews ??=
          new ListBuilder<GreviewsWithListArgumentData_reviews?>();
  set reviews(ListBuilder<GreviewsWithListArgumentData_reviews?>? reviews) =>
      _$this._reviews = reviews;

  GreviewsWithListArgumentDataBuilder() {
    GreviewsWithListArgumentData._initializeBuilder(this);
  }

  GreviewsWithListArgumentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reviews = $v.reviews?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GreviewsWithListArgumentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GreviewsWithListArgumentData;
  }

  @override
  void update(void Function(GreviewsWithListArgumentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GreviewsWithListArgumentData build() => _build();

  _$GreviewsWithListArgumentData _build() {
    _$GreviewsWithListArgumentData _$result;
    try {
      _$result = _$v ??
          new _$GreviewsWithListArgumentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GreviewsWithListArgumentData', 'G__typename'),
              reviews: _reviews?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reviews';
        _reviews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GreviewsWithListArgumentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GreviewsWithListArgumentData_reviews
    extends GreviewsWithListArgumentData_reviews {
  @override
  final String G__typename;
  @override
  final _i2.GEpisode? episode;

  factory _$GreviewsWithListArgumentData_reviews(
          [void Function(GreviewsWithListArgumentData_reviewsBuilder)?
              updates]) =>
      (new GreviewsWithListArgumentData_reviewsBuilder()..update(updates))
          ._build();

  _$GreviewsWithListArgumentData_reviews._(
      {required this.G__typename, this.episode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GreviewsWithListArgumentData_reviews', 'G__typename');
  }

  @override
  GreviewsWithListArgumentData_reviews rebuild(
          void Function(GreviewsWithListArgumentData_reviewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreviewsWithListArgumentData_reviewsBuilder toBuilder() =>
      new GreviewsWithListArgumentData_reviewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GreviewsWithListArgumentData_reviews &&
        G__typename == other.G__typename &&
        episode == other.episode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GreviewsWithListArgumentData_reviews')
          ..add('G__typename', G__typename)
          ..add('episode', episode))
        .toString();
  }
}

class GreviewsWithListArgumentData_reviewsBuilder
    implements
        Builder<GreviewsWithListArgumentData_reviews,
            GreviewsWithListArgumentData_reviewsBuilder> {
  _$GreviewsWithListArgumentData_reviews? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GEpisode? _episode;
  _i2.GEpisode? get episode => _$this._episode;
  set episode(_i2.GEpisode? episode) => _$this._episode = episode;

  GreviewsWithListArgumentData_reviewsBuilder() {
    GreviewsWithListArgumentData_reviews._initializeBuilder(this);
  }

  GreviewsWithListArgumentData_reviewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _episode = $v.episode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GreviewsWithListArgumentData_reviews other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GreviewsWithListArgumentData_reviews;
  }

  @override
  void update(
      void Function(GreviewsWithListArgumentData_reviewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GreviewsWithListArgumentData_reviews build() => _build();

  _$GreviewsWithListArgumentData_reviews _build() {
    final _$result = _$v ??
        new _$GreviewsWithListArgumentData_reviews._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GreviewsWithListArgumentData_reviews', 'G__typename'),
            episode: episode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
