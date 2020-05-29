// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/schema.schema.gql.dart' as _i1;
import 'package:end_to_end_test/graphql/serializers.gql.dart' as _i2;

part 'hero_for_episode.var.gql.g.dart';

abstract class GHeroForEpisodeVars
    implements Built<GHeroForEpisodeVars, GHeroForEpisodeVarsBuilder> {
  GHeroForEpisodeVars._();

  factory GHeroForEpisodeVars(
      [Function(GHeroForEpisodeVarsBuilder b) updates]) = _$GHeroForEpisodeVars;

  _i1.GEpisode get ep;
  static Serializer<GHeroForEpisodeVars> get serializer =>
      _$gHeroForEpisodeVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GHeroForEpisodeVars.serializer, this);
  static GHeroForEpisodeVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GHeroForEpisodeVars.serializer, json);
}
