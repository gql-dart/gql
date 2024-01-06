// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_repro/graphql/__generated__/query.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test_repro/graphql/__generated__/query.var.gql.dart'
    as _i3;
import 'package:end_to_end_test_repro/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'query.req.gql.g.dart';

abstract class GReproQuery implements Built<GReproQuery, GReproQueryBuilder> {
  GReproQuery._();

  factory GReproQuery([void Function(GReproQueryBuilder b) updates]) =
      _$GReproQuery;

  static void _initializeBuilder(GReproQueryBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'ReproQuery',
    );

  _i3.GReproQueryVars get vars;
  _i1.Operation get operation;
  static Serializer<GReproQuery> get serializer => _$gReproQuerySerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GReproQuery.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReproQuery? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GReproQuery.serializer,
        json,
      );
}