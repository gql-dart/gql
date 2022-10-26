// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_inline_fragment.var.gql.g.dart';

abstract class GHeroWithInlineFragmentsVars
    implements
        Built<GHeroWithInlineFragmentsVars,
            GHeroWithInlineFragmentsVarsBuilder> {
  GHeroWithInlineFragmentsVars._();

  factory GHeroWithInlineFragmentsVars(
          [Function(GHeroWithInlineFragmentsVarsBuilder b) updates]) =
      _$GHeroWithInlineFragmentsVars;

  bool get skipName;
  static Serializer<GHeroWithInlineFragmentsVars> get serializer =>
      _$gHeroWithInlineFragmentsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GHeroWithInlineFragmentsVars.serializer, this) as Map<String, dynamic>);
  static GHeroWithInlineFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithInlineFragmentsVars.serializer, json);
}
