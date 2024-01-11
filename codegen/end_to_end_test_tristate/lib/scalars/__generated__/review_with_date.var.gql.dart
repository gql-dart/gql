// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i3;
import 'package:gql_tristate_value/gql_tristate_value.dart' as _i1;

part 'review_with_date.var.gql.g.dart';

abstract class GReviewWithDateVars
    implements Built<GReviewWithDateVars, GReviewWithDateVarsBuilder> {
  GReviewWithDateVars._();

  factory GReviewWithDateVars(
          [void Function(GReviewWithDateVarsBuilder b) updates]) =
      _$GReviewWithDateVars;

  factory GReviewWithDateVars.create({
    required _i1.Value<_i2.GEpisode> episode,
    required _i2.GReviewInput review,
    required _i1.Value<DateTime> createdAt,
  }) =>
      GReviewWithDateVars((b) => b
        ..episode = episode
        ..review = review.toBuilder()
        ..createdAt = createdAt);

  static void _initializeBuilder(GReviewWithDateVarsBuilder b) => b
    ..episode = const _i1.AbsentValue()
    ..createdAt = const _i1.AbsentValue();

  _i1.Value<_i2.GEpisode> get episode;
  _i2.GReviewInput get review;
  _i1.Value<DateTime> get createdAt;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GReviewWithDateVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewWithDateVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GReviewWithDateVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewWithDateVars> get serializer =>
      GReviewWithDateVarsSerializer();
}

final class GReviewWithDateVarsSerializer
    extends StructuredSerializer<GReviewWithDateVars> {
  final String wireName = 'GReviewWithDateVars';

  final Iterable<Type> types = const [
    GReviewWithDateVars,
    _$GReviewWithDateVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewWithDateVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$episodevalue = object.episode;
    if (_$episodevalue case _i1.PresentValue(value: final _$value)) {
      result.add('episode');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(_i2.GEpisode)));
    }
    result.add('review');
    result.add(serializers.serialize(object.review,
        specifiedType: const FullType(_i2.GReviewInput)));
    final _$createdAtvalue = object.createdAt;
    if (_$createdAtvalue case _i1.PresentValue(value: final _$value)) {
      result.add('createdAt');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  GReviewWithDateVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewWithDateVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEpisode)) as _i2.GEpisode;
          builder.episode = _i1.PresentValue(_$fieldValue);
          break;
        case 'review':
          var _$fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GReviewInput))
              as _i2.GReviewInput;
          builder.review.replace(_$fieldValue);
          break;
        case 'createdAt':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          builder.createdAt = _i1.PresentValue(_$fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
