import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:end_to_end_test/aliases/aliased_hero.data.gql.dart'
    show
        GAliasedHeroData,
        GAliasedHeroData_empireHero,
        GAliasedHeroData_jediHero;
import 'package:end_to_end_test/aliases/aliased_hero.var.gql.dart'
    show GAliasedHeroVars;
import 'package:end_to_end_test/date_serializer.dart' show DateSerializer;
import 'package:end_to_end_test/fragments/hero_with_fragments.data.gql.dart'
    show
        GHeroWithFragmentsData,
        GHeroWithFragmentsData_hero,
        GHeroWithFragmentsData_hero_friendsConnection,
        GHeroWithFragmentsData_hero_friendsConnection_edges,
        GHeroWithFragmentsData_hero_friendsConnection_edges_node;
import 'package:end_to_end_test/fragments/hero_with_fragments.var.gql.dart'
    show GHeroWithFragmentsVars;
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
import 'package:end_to_end_test/scalars/review_with_date.data.gql.dart'
    show GReviewWithDateData, GReviewWithDateData_createReview;
import 'package:end_to_end_test/scalars/review_with_date.var.gql.dart'
    show GReviewWithDateVars;
import 'package:end_to_end_test/variables/create_review.data.gql.dart'
    show GCreateReviewData, GCreateReviewData_createReview;
import 'package:end_to_end_test/variables/create_review.var.gql.dart'
    show GCreateReviewVars;
import 'package:end_to_end_test/variables/human_with_args.data.gql.dart'
    show GHumanWithArgsData, GHumanWithArgsData_human;
import 'package:end_to_end_test/variables/human_with_args.var.gql.dart'
    show GHumanWithArgsVars;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(DateSerializer())
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GHeroWithFragmentsData,
  GHeroWithFragmentsData_hero,
  GHeroWithFragmentsData_hero_friendsConnection,
  GHeroWithFragmentsData_hero_friendsConnection_edges,
  GHeroWithFragmentsData_hero_friendsConnection_edges_node,
  GReviewWithDateData,
  GReviewWithDateData_createReview,
  GCreateReviewData,
  GCreateReviewData_createReview,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GAliasedHeroData,
  GAliasedHeroData_empireHero,
  GAliasedHeroData_jediHero,
  GHeroForEpisodeData,
  GHeroForEpisodeData_hero,
  GHeroForEpisodeData_hero__base,
  GHeroForEpisodeData_hero__asDroid,
  GEpisode,
  GLengthUnit,
  GReviewInput,
  GColorInput,
  GHeroWithFragmentsVars,
  GReviewWithDateVars,
  GCreateReviewVars,
  GHumanWithArgsVars,
  GAliasedHeroVars,
  GHeroForEpisodeVars
])
final Serializers serializers = _serializersBuilder.build();
