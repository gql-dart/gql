// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'merge_selection_sets.graphql.var.gql.g.dart';

abstract class GHeroMergeVars
    implements Built<GHeroMergeVars, GHeroMergeVarsBuilder> {
  GHeroMergeVars._();

  factory GHeroMergeVars([Function(GHeroMergeVarsBuilder b) updates]) =
      _$GHeroMergeVars;

  static Serializer<GHeroMergeVars> get serializer =>
      _$gHeroMergeVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeVars.serializer, json);
}
