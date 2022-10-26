// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'merge_selection_sets.graphql_skip.var.gql.g.dart';

abstract class GHeroMergeSkipVars
    implements Built<GHeroMergeSkipVars, GHeroMergeSkipVarsBuilder> {
  GHeroMergeSkipVars._();

  factory GHeroMergeSkipVars([Function(GHeroMergeSkipVarsBuilder b) updates]) =
      _$GHeroMergeSkipVars;

  bool get withName;
  static Serializer<GHeroMergeSkipVars> get serializer =>
      _$gHeroMergeSkipVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroMergeSkipVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroMergeSkipVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroMergeSkipVars.serializer, json);
}
