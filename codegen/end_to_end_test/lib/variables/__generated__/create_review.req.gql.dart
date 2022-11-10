// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/variables/__generated__/create_review.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/variables/__generated__/create_review.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'create_review.req.gql.g.dart';

abstract class GCreateReview
    implements Built<GCreateReview, GCreateReviewBuilder> {
  GCreateReview._();

  factory GCreateReview([Function(GCreateReviewBuilder b) updates]) =
      _$GCreateReview;

  static void _initializeBuilder(GCreateReviewBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'CreateReview',
    );
  _i3.GCreateReviewVars get vars;
  _i1.Operation get operation;
  static Serializer<GCreateReview> get serializer => _$gCreateReviewSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GCreateReview.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateReview? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GCreateReview.serializer,
        json,
      );
}
