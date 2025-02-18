// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/merge/__generated__/merge_selection_sets.graphql.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/merge/__generated__/merge_selection_sets.graphql.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'merge_selection_sets.graphql.req.gql.g.dart';

abstract class GHeroMerge implements Built<GHeroMerge, GHeroMergeBuilder> {
  GHeroMerge._();

  factory GHeroMerge([void Function(GHeroMergeBuilder b) updates]) =
      _$GHeroMerge;

  static void _initializeBuilder(GHeroMergeBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HeroMerge',
    );

  _i3.GHeroMergeVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroMerge> get serializer => _$gHeroMergeSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroMerge.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroMerge? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroMerge.serializer,
        json,
      );
}
