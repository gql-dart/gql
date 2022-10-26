// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/merge/__generated__/merge_selection_sets.graphql_skip.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/merge/__generated__/merge_selection_sets.graphql_skip.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'merge_selection_sets.graphql_skip.req.gql.g.dart';

abstract class GHeroMergeSkip
    implements Built<GHeroMergeSkip, GHeroMergeSkipBuilder> {
  GHeroMergeSkip._();

  factory GHeroMergeSkip([Function(GHeroMergeSkipBuilder b) updates]) =
      _$GHeroMergeSkip;

  static void _initializeBuilder(GHeroMergeSkipBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'HeroMergeSkip');
  _i3.GHeroMergeSkipVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroMergeSkip> get serializer =>
      _$gHeroMergeSkipSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GHeroMergeSkip.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeSkip? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GHeroMergeSkip.serializer, json);
}
