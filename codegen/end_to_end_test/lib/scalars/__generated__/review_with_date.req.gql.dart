// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/scalars/__generated__/review_with_date.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/scalars/__generated__/review_with_date.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'review_with_date.req.gql.g.dart';

abstract class GReviewWithDate
    implements Built<GReviewWithDate, GReviewWithDateBuilder> {
  GReviewWithDate._();

  factory GReviewWithDate([Function(GReviewWithDateBuilder b) updates]) =
      _$GReviewWithDate;

  static void _initializeBuilder(GReviewWithDateBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'ReviewWithDate',
    );
  _i3.GReviewWithDateVars get vars;
  _i1.Operation get operation;
  static Serializer<GReviewWithDate> get serializer =>
      _$gReviewWithDateSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GReviewWithDate.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewWithDate? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GReviewWithDate.serializer,
        json,
      );
}
