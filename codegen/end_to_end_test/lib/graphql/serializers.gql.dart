import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:end_to_end_test/graphql/schema.schema.gql.dart'
    show GEpisode, GLengthUnit, GReviewInput, GColorInput;
import 'package:end_to_end_test/interfaces/hero_for_episode.data.gql.dart'
    show
        GHeroForEpisodeData,
        GHeroForEpisodeData_hero,
        GHeroForEpisodeData_hero__base,
        GHeroForEpisodeData_hero__asDroid;
import 'package:end_to_end_test/interfaces/hero_for_episode.var.gql.dart'
    show GHeroForEpisodeVars;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GHeroForEpisodeData,
  GHeroForEpisodeData_hero,
  GHeroForEpisodeData_hero__base,
  GHeroForEpisodeData_hero__asDroid,
  GEpisode,
  GLengthUnit,
  GReviewInput,
  GColorInput,
  GHeroForEpisodeVars
])
final Serializers serializers = _serializersBuilder.build();
