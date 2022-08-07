import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:end_to_end_test/aliases/__generated__/aliased_hero.data.gql.dart'
    show
        GAliasedHeroData,
        GAliasedHeroData_empireHero,
        GAliasedHeroData_jediHero;
import 'package:end_to_end_test/aliases/__generated__/aliased_hero.req.gql.dart'
    show GAliasedHero;
import 'package:end_to_end_test/aliases/__generated__/aliased_hero.var.gql.dart'
    show GAliasedHeroVars;
import 'package:end_to_end_test/custom_field.dart';
import 'package:end_to_end_test/custom_field_serializer.dart'
    show CustomFieldSerializer;
import 'package:end_to_end_test/date_serializer.dart' show DateSerializer;
import 'package:end_to_end_test/fragments/__generated__/hero_with_fragments.data.gql.dart'
    show
        GHeroWithFragmentsData,
        GHeroWithFragmentsData_hero,
        GHeroWithFragmentsData_hero_friendsConnection,
        GHeroWithFragmentsData_hero_friendsConnection_edges,
        GHeroWithFragmentsData_hero_friendsConnection_edges_node,
        GcomparisonFieldsData,
        GcomparisonFieldsData_friendsConnection,
        GcomparisonFieldsData_friendsConnection_edges,
        GcomparisonFieldsData_friendsConnection_edges_node,
        GheroDataData;
import 'package:end_to_end_test/fragments/__generated__/hero_with_fragments.req.gql.dart'
    show GHeroWithFragments;
import 'package:end_to_end_test/fragments/__generated__/hero_with_fragments.var.gql.dart'
    show GHeroWithFragmentsVars, GcomparisonFieldsVars, GheroDataVars;
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    show GColorInput, GEpisode, GISODate, GLengthUnit, GReviewInput;
import 'package:end_to_end_test/interfaces/__generated__/hero_for_episode.data.gql.dart'
    show
        GHeroForEpisodeData_hero,
        GDroidFragmentData,
        GHeroForEpisodeData,
        GHeroForEpisodeData_hero__asDroid,
        GHeroForEpisodeData_hero__asDroid_friends,
        GHeroForEpisodeData_hero__base,
        GHeroForEpisodeData_hero__base_friends;
import 'package:end_to_end_test/interfaces/__generated__/hero_for_episode.req.gql.dart'
    show GHeroForEpisode;
import 'package:end_to_end_test/interfaces/__generated__/hero_for_episode.var.gql.dart'
    show GDroidFragmentVars, GHeroForEpisodeVars;
import 'package:end_to_end_test/no_vars/__generated__/hero_no_vars.data.gql.dart'
    show GHeroNoVarsData, GHeroNoVarsData_hero;
import 'package:end_to_end_test/no_vars/__generated__/hero_no_vars.req.gql.dart'
    show GHeroNoVars;
import 'package:end_to_end_test/no_vars/__generated__/hero_no_vars.var.gql.dart'
    show GHeroNoVarsVars;
import 'package:end_to_end_test/scalars/__generated__/review_with_date.data.gql.dart'
    show GReviewWithDateData, GReviewWithDateData_createReview;
import 'package:end_to_end_test/scalars/__generated__/review_with_date.req.gql.dart'
    show GReviewWithDate;
import 'package:end_to_end_test/scalars/__generated__/review_with_date.var.gql.dart'
    show GReviewWithDateVars;
import 'package:end_to_end_test/variables/__generated__/create_review.data.gql.dart'
    show GCreateReviewData, GCreateReviewData_createReview;
import 'package:end_to_end_test/variables/__generated__/create_review.req.gql.dart'
    show GCreateReview;
import 'package:end_to_end_test/variables/__generated__/create_review.var.gql.dart'
    show GCreateReviewVars;
import 'package:end_to_end_test/variables/__generated__/human_with_args.data.gql.dart'
    show GHumanWithArgsData, GHumanWithArgsData_human;
import 'package:end_to_end_test/variables/__generated__/human_with_args.req.gql.dart'
    show GHumanWithArgs;
import 'package:end_to_end_test/variables/__generated__/human_with_args.var.gql.dart'
    show GHumanWithArgsVars;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(CustomFieldSerializer())
  ..add(GHeroForEpisodeData_hero.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAliasedHero,
  GAliasedHeroData,
  GAliasedHeroData_empireHero,
  GAliasedHeroData_jediHero,
  GAliasedHeroVars,
  GColorInput,
  GCreateReview,
  GCreateReviewData,
  GCreateReviewData_createReview,
  GCreateReviewVars,
  GDroidFragmentData,
  GDroidFragmentVars,
  GEpisode,
  GHeroForEpisode,
  GHeroForEpisodeData,
  GHeroForEpisodeData_hero__asDroid,
  GHeroForEpisodeData_hero__asDroid_friends,
  GHeroForEpisodeData_hero__base,
  GHeroForEpisodeData_hero__base_friends,
  GHeroForEpisodeVars,
  GHeroNoVars,
  GHeroNoVarsData,
  GHeroNoVarsData_hero,
  GHeroNoVarsVars,
  GHeroWithFragments,
  GHeroWithFragmentsData,
  GHeroWithFragmentsData_hero,
  GHeroWithFragmentsData_hero_friendsConnection,
  GHeroWithFragmentsData_hero_friendsConnection_edges,
  GHeroWithFragmentsData_hero_friendsConnection_edges_node,
  GHeroWithFragmentsVars,
  GHumanWithArgs,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GHumanWithArgsVars,
  GISODate,
  GLengthUnit,
  GReviewInput,
  GReviewWithDate,
  GReviewWithDateData,
  GReviewWithDateData_createReview,
  GReviewWithDateVars,
  GcomparisonFieldsData,
  GcomparisonFieldsData_friendsConnection,
  GcomparisonFieldsData_friendsConnection_edges,
  GcomparisonFieldsData_friendsConnection_edges_node,
  GcomparisonFieldsVars,
  GheroDataData,
  GheroDataVars
])
final Serializers serializers = _serializersBuilder.build();
