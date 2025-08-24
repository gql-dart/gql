// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'list_argument.data.gql.g.dart';

abstract class GreviewsWithListArgumentData
    implements
        Built<GreviewsWithListArgumentData,
            GreviewsWithListArgumentDataBuilder> {
  GreviewsWithListArgumentData._();

  factory GreviewsWithListArgumentData(
          [void Function(GreviewsWithListArgumentDataBuilder b) updates]) =
      _$GreviewsWithListArgumentData;

  static void _initializeBuilder(GreviewsWithListArgumentDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GreviewsWithListArgumentData_reviews?>? get reviews;
  static Serializer<GreviewsWithListArgumentData> get serializer =>
      _$greviewsWithListArgumentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GreviewsWithListArgumentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GreviewsWithListArgumentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GreviewsWithListArgumentData.serializer,
        json,
      );
}

abstract class GreviewsWithListArgumentData_reviews
    implements
        Built<GreviewsWithListArgumentData_reviews,
            GreviewsWithListArgumentData_reviewsBuilder> {
  GreviewsWithListArgumentData_reviews._();

  factory GreviewsWithListArgumentData_reviews(
      [void Function(GreviewsWithListArgumentData_reviewsBuilder b)
          updates]) = _$GreviewsWithListArgumentData_reviews;

  static void _initializeBuilder(
          GreviewsWithListArgumentData_reviewsBuilder b) =>
      b..G__typename = 'Review';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.GEpisode? get episode;
  static Serializer<GreviewsWithListArgumentData_reviews> get serializer =>
      _$greviewsWithListArgumentDataReviewsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GreviewsWithListArgumentData_reviews.serializer,
        this,
      ) as Map<String, dynamic>);

  static GreviewsWithListArgumentData_reviews? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GreviewsWithListArgumentData_reviews.serializer,
        json,
      );
}
