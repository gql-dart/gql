import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:end_to_end_test/aliases/__generated__/alias_var_fragment.data.gql.dart'
    show
        GPostFragmentData,
        GPostFragmentData_isFavorited,
        GPostFragmentData_isLiked,
        GPostsData,
        GPostsData_posts,
        GPostsData_posts_isFavorited,
        GPostsData_posts_isLiked;
import 'package:end_to_end_test/aliases/__generated__/alias_var_fragment.req.gql.dart'
    show GPosts;
import 'package:end_to_end_test/aliases/__generated__/alias_var_fragment.var.gql.dart'
    show GPostFragmentVars, GPostsVars;
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
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.data.gql.dart'
    show
        GPostFragmentForUser1Data,
        GPostFragmentForUser1Data_favoritedUsers,
        GPostsWithFixedVariableData,
        GPostsWithFixedVariableData_posts,
        GPostsWithFixedVariableData_posts_favoritedUsers;
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.req.gql.dart'
    show GPostsWithFixedVariable;
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.var.gql.dart'
    show GPostFragmentForUser1Vars, GPostsWithFixedVariableVars;
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
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart'
    show
        GheroFieldsFragmentData,
        GheroFieldsFragmentData__asHuman_friends,
        GhumanFieldsFragmentData_friends,
        GHeroWithInterfaceSubTypedFragmentsData,
        GHeroWithInterfaceSubTypedFragmentsData_hero,
        GdroidFieldsFragmentData,
        GheroFieldsFragmentData__asDroid,
        GheroFieldsFragmentData__asHuman,
        GheroFieldsFragmentData__asHuman_friends__asDroid,
        GheroFieldsFragmentData__asHuman_friends__asHuman,
        GheroFieldsFragmentData__asHuman_friends__base,
        GheroFieldsFragmentData__base,
        GhumanFieldsFragmentData,
        GhumanFieldsFragmentData_friends__asDroid,
        GhumanFieldsFragmentData_friends__asHuman,
        GhumanFieldsFragmentData_friends__base;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.req.gql.dart'
    show GHeroWithInterfaceSubTypedFragments;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.var.gql.dart'
    show
        GHeroWithInterfaceSubTypedFragmentsVars,
        GdroidFieldsFragmentVars,
        GheroFieldsFragmentVars,
        GhumanFieldsFragmentVars;
import 'package:end_to_end_test/fragments/__generated__/multiple_fragments.data.gql.dart'
    show
        GHeroWith2FragmentsData,
        GHeroWith2FragmentsData_hero,
        GheroIdData,
        GheroNameData;
import 'package:end_to_end_test/fragments/__generated__/multiple_fragments.req.gql.dart'
    show GHeroWith2Fragments;
import 'package:end_to_end_test/fragments/__generated__/multiple_fragments.var.gql.dart'
    show GHeroWith2FragmentsVars, GheroIdVars, GheroNameVars;
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    show
        GColorInput,
        GEpisode,
        GISODate,
        GJson,
        GLengthUnit,
        GPostFavoritesInput,
        GPostLikesInput,
        GReviewInput;
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
  ..add(GheroFieldsFragmentData.serializer)
  ..add(GheroFieldsFragmentData__asHuman_friends.serializer)
  ..add(GhumanFieldsFragmentData_friends.serializer)
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
  GHeroWith2Fragments,
  GHeroWith2FragmentsData,
  GHeroWith2FragmentsData_hero,
  GHeroWith2FragmentsVars,
  GHeroWithFragments,
  GHeroWithFragmentsData,
  GHeroWithFragmentsData_hero,
  GHeroWithFragmentsData_hero_friendsConnection,
  GHeroWithFragmentsData_hero_friendsConnection_edges,
  GHeroWithFragmentsData_hero_friendsConnection_edges_node,
  GHeroWithFragmentsVars,
  GHeroWithInterfaceSubTypedFragments,
  GHeroWithInterfaceSubTypedFragmentsData,
  GHeroWithInterfaceSubTypedFragmentsData_hero,
  GHeroWithInterfaceSubTypedFragmentsVars,
  GHumanWithArgs,
  GHumanWithArgsData,
  GHumanWithArgsData_human,
  GHumanWithArgsVars,
  GISODate,
  GJson,
  GLengthUnit,
  GPostFavoritesInput,
  GPostFragmentData,
  GPostFragmentData_isFavorited,
  GPostFragmentData_isLiked,
  GPostFragmentForUser1Data,
  GPostFragmentForUser1Data_favoritedUsers,
  GPostFragmentForUser1Vars,
  GPostFragmentVars,
  GPostLikesInput,
  GPosts,
  GPostsData,
  GPostsData_posts,
  GPostsData_posts_isFavorited,
  GPostsData_posts_isLiked,
  GPostsVars,
  GPostsWithFixedVariable,
  GPostsWithFixedVariableData,
  GPostsWithFixedVariableData_posts,
  GPostsWithFixedVariableData_posts_favoritedUsers,
  GPostsWithFixedVariableVars,
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
  GdroidFieldsFragmentData,
  GdroidFieldsFragmentVars,
  GheroDataData,
  GheroDataVars,
  GheroFieldsFragmentData__asDroid,
  GheroFieldsFragmentData__asHuman,
  GheroFieldsFragmentData__asHuman_friends__asDroid,
  GheroFieldsFragmentData__asHuman_friends__asHuman,
  GheroFieldsFragmentData__asHuman_friends__base,
  GheroFieldsFragmentData__base,
  GheroFieldsFragmentVars,
  GheroIdData,
  GheroIdVars,
  GheroNameData,
  GheroNameVars,
  GhumanFieldsFragmentData,
  GhumanFieldsFragmentData_friends__asDroid,
  GhumanFieldsFragmentData_friends__asHuman,
  GhumanFieldsFragmentData_friends__base,
  GhumanFieldsFragmentVars,
])
final Serializers serializers = _serializersBuilder.build();
