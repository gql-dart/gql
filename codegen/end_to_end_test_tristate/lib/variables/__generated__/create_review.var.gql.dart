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

part 'create_review.var.gql.g.dart';

abstract class GCreateReviewVars
    implements Built<GCreateReviewVars, GCreateReviewVarsBuilder> {
  GCreateReviewVars._();

  factory GCreateReviewVars(
          [void Function(GCreateReviewVarsBuilder b) updates]) =
      _$GCreateReviewVars;

  factory GCreateReviewVars.create({
    required _i1.Value<_i2.GEpisode> episode,
    required _i2.GReviewInput review,
  }) =>
      GCreateReviewVars((b) => b
        ..episode = episode
        ..review = review.toBuilder());

  static void _initializeBuilder(GCreateReviewVarsBuilder b) =>
      b..episode = const _i1.AbsentValue();

  _i1.Value<_i2.GEpisode> get episode;
  _i2.GReviewInput get review;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GCreateReviewVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateReviewVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GCreateReviewVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GCreateReviewVars> get serializer =>
      GCreateReviewVarsSerializer();
}

final class GCreateReviewVarsSerializer
    extends StructuredSerializer<GCreateReviewVars> {
  final String wireName = 'GCreateReviewVars';

  final Iterable<Type> types = const [GCreateReviewVars, _$GCreateReviewVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GCreateReviewVars object, {
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
    return result;
  }

  GCreateReviewVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GCreateReviewVarsBuilder();
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
      }
    }
    return builder.build();
  }
}
