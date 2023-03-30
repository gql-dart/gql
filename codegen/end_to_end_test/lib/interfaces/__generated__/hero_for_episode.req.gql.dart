// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/interfaces/__generated__/hero_for_episode.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/interfaces/__generated__/hero_for_episode.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_for_episode.req.gql.g.dart';

abstract class GHeroForEpisode
    implements Built<GHeroForEpisode, GHeroForEpisodeBuilder> {
  GHeroForEpisode._();

  factory GHeroForEpisode([Function(GHeroForEpisodeBuilder b) updates]) =
      _$GHeroForEpisode;

  static void _initializeBuilder(GHeroForEpisodeBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HeroForEpisode',
    );
  _i3.GHeroForEpisodeVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroForEpisode> get serializer =>
      _$gHeroForEpisodeSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroForEpisode.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroForEpisode? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroForEpisode.serializer,
        json,
      );
}
