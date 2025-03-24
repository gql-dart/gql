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
        GHeroWithInterfaceSubTypedFragmentsData_hero,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends,
        GheroFieldsFragmentData,
        GheroFieldsFragmentData__asHuman_friends,
        GhumanFieldsFragmentData_friends,
        GHeroWithInterfaceSubTypedFragmentsData,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
        GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
        GHeroWithInterfaceSubTypedFragmentsData_hero__base,
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
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_untyped_fragments.data.gql.dart'
    show
        GHeroWithoutFragmentsData_hero,
        GHeroWithoutFragmentsData_hero__asHuman_friends,
        GHeroWithoutFragmentsData,
        GHeroWithoutFragmentsData_hero__asDroid,
        GHeroWithoutFragmentsData_hero__asHuman,
        GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
        GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
        GHeroWithoutFragmentsData_hero__asHuman_friends__base,
        GHeroWithoutFragmentsData_hero__base;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_untyped_fragments.req.gql.dart'
    show GHeroWithoutFragments;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_untyped_fragments.var.gql.dart'
    show GHeroWithoutFragmentsVars;
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
import 'package:end_to_end_test/fragments/__generated__/nested_duplicate_fragments.data.gql.dart'
    show
        GSearchResultsQueryData_search,
        GCharacterBasicData,
        GCharacterDetailsData,
        GCharacterDetailsData_friends,
        GCharacterDetailsData_friends_friendsConnection,
        GCharacterDetailsData_friends_friendsConnection_friends,
        GFriendInfoData,
        GFriendInfoData_friendsConnection,
        GFriendInfoData_friendsConnection_friends,
        GSearchResultsQueryData,
        GSearchResultsQueryData_search__asDroid,
        GSearchResultsQueryData_search__asDroid_friends,
        GSearchResultsQueryData_search__asDroid_friends_friendsConnection,
        GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends,
        GSearchResultsQueryData_search__asHuman,
        GSearchResultsQueryData_search__asHuman_friends,
        GSearchResultsQueryData_search__asHuman_friends_friendsConnection,
        GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends,
        GSearchResultsQueryData_search__base;
import 'package:end_to_end_test/fragments/__generated__/nested_duplicate_fragments.req.gql.dart'
    show GSearchResultsQuery;
import 'package:end_to_end_test/fragments/__generated__/nested_duplicate_fragments.var.gql.dart'
    show
        GCharacterBasicVars,
        GCharacterDetailsVars,
        GFriendInfoVars,
        GSearchResultsQueryVars;
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    show
        GColorInput,
        GCustomFieldInput,
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
import 'package:end_to_end_test/variables/__generated__/create_custom_field.data.gql.dart'
    show GCreateCustomFieldData;
import 'package:end_to_end_test/variables/__generated__/create_custom_field.req.gql.dart'
    show GCreateCustomField;
import 'package:end_to_end_test/variables/__generated__/create_custom_field.var.gql.dart'
    show GCreateCustomFieldVars;
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
import 'package:end_to_end_test/variables/__generated__/list_argument.data.gql.dart'
    show GreviewsWithListArgumentData, GreviewsWithListArgumentData_reviews;
import 'package:end_to_end_test/variables/__generated__/list_argument.req.gql.dart'
    show GreviewsWithListArgument;
import 'package:end_to_end_test/variables/__generated__/list_argument.var.gql.dart'
    show GreviewsWithListArgumentVars;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(DateSerializer())
  ..add(CustomFieldSerializer())
  ..add(GHeroForEpisodeData_hero.serializer)
  ..add(GHeroWithInterfaceSubTypedFragmentsData_hero.serializer)
  ..add(
      GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends.serializer)
  ..add(GHeroWithoutFragmentsData_hero.serializer)
  ..add(GHeroWithoutFragmentsData_hero__asHuman_friends.serializer)
  ..add(GSearchResultsQueryData_search.serializer)
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
  GCharacterBasicData,
  GCharacterBasicVars,
  GCharacterDetailsData,
  GCharacterDetailsData_friends,
  GCharacterDetailsData_friends_friendsConnection,
  GCharacterDetailsData_friends_friendsConnection_friends,
  GCharacterDetailsVars,
  GColorInput,
  GCreateCustomField,
  GCreateCustomFieldData,
  GCreateCustomFieldVars,
  GCreateReview,
  GCreateReviewData,
  GCreateReviewData_createReview,
  GCreateReviewVars,
  GCustomFieldInput,
  GDroidFragmentData,
  GDroidFragmentVars,
  GEpisode,
  GFriendInfoData,
  GFriendInfoData_friendsConnection,
  GFriendInfoData_friendsConnection_friends,
  GFriendInfoVars,
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
  GHeroWithInterfaceSubTypedFragmentsData_hero__asDroid,
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman,
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asDroid,
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__asHuman,
  GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends__base,
  GHeroWithInterfaceSubTypedFragmentsData_hero__base,
  GHeroWithInterfaceSubTypedFragmentsVars,
  GHeroWithoutFragments,
  GHeroWithoutFragmentsData,
  GHeroWithoutFragmentsData_hero__asDroid,
  GHeroWithoutFragmentsData_hero__asHuman,
  GHeroWithoutFragmentsData_hero__asHuman_friends__asDroid,
  GHeroWithoutFragmentsData_hero__asHuman_friends__asHuman,
  GHeroWithoutFragmentsData_hero__asHuman_friends__base,
  GHeroWithoutFragmentsData_hero__base,
  GHeroWithoutFragmentsVars,
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
  GSearchResultsQuery,
  GSearchResultsQueryData,
  GSearchResultsQueryData_search__asDroid,
  GSearchResultsQueryData_search__asDroid_friends,
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection,
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends,
  GSearchResultsQueryData_search__asHuman,
  GSearchResultsQueryData_search__asHuman_friends,
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection,
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends,
  GSearchResultsQueryData_search__base,
  GSearchResultsQueryVars,
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
  GreviewsWithListArgument,
  GreviewsWithListArgumentData,
  GreviewsWithListArgumentData_reviews,
  GreviewsWithListArgumentVars,
])
final Serializers serializers = _serializersBuilder.build();
