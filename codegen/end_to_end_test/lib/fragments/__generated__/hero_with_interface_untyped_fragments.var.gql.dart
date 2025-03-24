// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_interface_untyped_fragments.var.gql.g.dart';

abstract class GHeroWithoutFragmentsVars
    implements
        Built<GHeroWithoutFragmentsVars, GHeroWithoutFragmentsVarsBuilder> {
  GHeroWithoutFragmentsVars._();

  factory GHeroWithoutFragmentsVars(
          [void Function(GHeroWithoutFragmentsVarsBuilder b) updates]) =
      _$GHeroWithoutFragmentsVars;

  factory GHeroWithoutFragmentsVars.create({required _i1.GEpisode episode}) =>
      GHeroWithoutFragmentsVars((b) => b..episode = episode);

  _i1.GEpisode get episode;
  static Serializer<GHeroWithoutFragmentsVars> get serializer =>
      _$gHeroWithoutFragmentsVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroWithoutFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroWithoutFragmentsVars.serializer,
        json,
      );
}
