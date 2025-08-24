// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/nested_duplicate_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/nested_duplicate_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'nested_duplicate_fragments.req.gql.g.dart';

abstract class GSearchResultsQuery
    implements Built<GSearchResultsQuery, GSearchResultsQueryBuilder> {
  GSearchResultsQuery._();

  factory GSearchResultsQuery(
          [void Function(GSearchResultsQueryBuilder b) updates]) =
      _$GSearchResultsQuery;

  static void _initializeBuilder(GSearchResultsQueryBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'SearchResultsQuery',
    );

  _i3.GSearchResultsQueryVars get vars;
  _i1.Operation get operation;
  static Serializer<GSearchResultsQuery> get serializer =>
      _$gSearchResultsQuerySerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GSearchResultsQuery.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSearchResultsQuery? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GSearchResultsQuery.serializer,
        json,
      );
}
