// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/custom_field.dart' as _i3;
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'review_with_date.data.gql.g.dart';

abstract class GReviewWithDateData
    implements Built<GReviewWithDateData, GReviewWithDateDataBuilder> {
  GReviewWithDateData._();

  factory GReviewWithDateData(
      [Function(GReviewWithDateDataBuilder b) updates]) = _$GReviewWithDateData;

  static void _initializeBuilder(GReviewWithDateDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReviewWithDateData_createReview? get createReview;
  static Serializer<GReviewWithDateData> get serializer =>
      _$gReviewWithDateDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewWithDateData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewWithDateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewWithDateData.serializer,
        json,
      );
}

abstract class GReviewWithDateData_createReview
    implements
        Built<GReviewWithDateData_createReview,
            GReviewWithDateData_createReviewBuilder> {
  GReviewWithDateData_createReview._();

  factory GReviewWithDateData_createReview(
          [Function(GReviewWithDateData_createReviewBuilder b) updates]) =
      _$GReviewWithDateData_createReview;

  static void _initializeBuilder(GReviewWithDateData_createReviewBuilder b) =>
      b..G__typename = 'Review';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.GEpisode? get episode;
  int get stars;
  String? get commentary;
  DateTime? get createdAt;
  BuiltList<DateTime> get seenOn;
  BuiltList<_i3.CustomField> get custom;
  static Serializer<GReviewWithDateData_createReview> get serializer =>
      _$gReviewWithDateDataCreateReviewSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReviewWithDateData_createReview.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewWithDateData_createReview? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReviewWithDateData_createReview.serializer,
        json,
      );
}
