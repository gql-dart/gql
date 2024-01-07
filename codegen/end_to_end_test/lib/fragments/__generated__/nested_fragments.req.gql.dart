// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/nested_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/nested_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'nested_fragments.req.gql.g.dart';

abstract class GTestQuery implements Built<GTestQuery, GTestQueryBuilder> {
  GTestQuery._();

  factory GTestQuery([void Function(GTestQueryBuilder b) updates]) =
      _$GTestQuery;

  static void _initializeBuilder(GTestQueryBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'TestQuery',
    );

  _i3.GTestQueryVars get vars;
  _i1.Operation get operation;
  static Serializer<GTestQuery> get serializer => _$gTestQuerySerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GTestQuery.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTestQuery? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GTestQuery.serializer,
        json,
      );
}
