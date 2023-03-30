// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(GAliasedHero.serializer)
      ..add(GAliasedHeroData.serializer)
      ..add(GAliasedHeroData_empireHero.serializer)
      ..add(GAliasedHeroData_jediHero.serializer)
      ..add(GAliasedHeroVars.serializer)
      ..add(GColorInput.serializer)
      ..add(GCreateReview.serializer)
      ..add(GCreateReviewData.serializer)
      ..add(GCreateReviewData_createReview.serializer)
      ..add(GCreateReviewVars.serializer)
      ..add(GDroidFragmentData.serializer)
      ..add(GDroidFragmentVars.serializer)
      ..add(GEpisode.serializer)
      ..add(GHeroForEpisode.serializer)
      ..add(GHeroForEpisodeData.serializer)
      ..add(GHeroForEpisodeData_hero__asDroid.serializer)
      ..add(GHeroForEpisodeData_hero__asDroid_friends.serializer)
      ..add(GHeroForEpisodeData_hero__base.serializer)
      ..add(GHeroForEpisodeData_hero__base_friends.serializer)
      ..add(GHeroForEpisodeVars.serializer)
      ..add(GHeroNoVars.serializer)
      ..add(GHeroNoVarsData.serializer)
      ..add(GHeroNoVarsData_hero.serializer)
      ..add(GHeroNoVarsVars.serializer)
      ..add(GHeroWith2Fragments.serializer)
      ..add(GHeroWith2FragmentsData.serializer)
      ..add(GHeroWith2FragmentsData_hero.serializer)
      ..add(GHeroWith2FragmentsVars.serializer)
      ..add(GHeroWithFragments.serializer)
      ..add(GHeroWithFragmentsData.serializer)
      ..add(GHeroWithFragmentsData_hero.serializer)
      ..add(GHeroWithFragmentsData_hero_friendsConnection.serializer)
      ..add(GHeroWithFragmentsData_hero_friendsConnection_edges.serializer)
      ..add(GHeroWithFragmentsData_hero_friendsConnection_edges_node.serializer)
      ..add(GHeroWithFragmentsVars.serializer)
      ..add(GHeroWithInterfaceSubTypedFragments.serializer)
      ..add(GHeroWithInterfaceSubTypedFragmentsData.serializer)
      ..add(GHeroWithInterfaceSubTypedFragmentsData_hero.serializer)
      ..add(GHeroWithInterfaceSubTypedFragmentsVars.serializer)
      ..add(GHumanWithArgs.serializer)
      ..add(GHumanWithArgsData.serializer)
      ..add(GHumanWithArgsData_human.serializer)
      ..add(GHumanWithArgsVars.serializer)
      ..add(GISODate.serializer)
      ..add(GJson.serializer)
      ..add(GLengthUnit.serializer)
      ..add(GPostFavoritesInput.serializer)
      ..add(GPostFragmentData.serializer)
      ..add(GPostFragmentData_isFavorited.serializer)
      ..add(GPostFragmentData_isLiked.serializer)
      ..add(GPostFragmentForUser1Data.serializer)
      ..add(GPostFragmentForUser1Data_favoritedUsers.serializer)
      ..add(GPostFragmentForUser1Vars.serializer)
      ..add(GPostFragmentVars.serializer)
      ..add(GPostLikesInput.serializer)
      ..add(GPosts.serializer)
      ..add(GPostsData.serializer)
      ..add(GPostsData_posts.serializer)
      ..add(GPostsData_posts_isFavorited.serializer)
      ..add(GPostsData_posts_isLiked.serializer)
      ..add(GPostsVars.serializer)
      ..add(GPostsWithFixedVariable.serializer)
      ..add(GPostsWithFixedVariableData.serializer)
      ..add(GPostsWithFixedVariableData_posts.serializer)
      ..add(GPostsWithFixedVariableData_posts_favoritedUsers.serializer)
      ..add(GPostsWithFixedVariableVars.serializer)
      ..add(GReviewInput.serializer)
      ..add(GReviewWithDate.serializer)
      ..add(GReviewWithDateData.serializer)
      ..add(GReviewWithDateData_createReview.serializer)
      ..add(GReviewWithDateVars.serializer)
      ..add(GcomparisonFieldsData.serializer)
      ..add(GcomparisonFieldsData_friendsConnection.serializer)
      ..add(GcomparisonFieldsData_friendsConnection_edges.serializer)
      ..add(GcomparisonFieldsData_friendsConnection_edges_node.serializer)
      ..add(GcomparisonFieldsVars.serializer)
      ..add(GdroidFieldsFragmentData.serializer)
      ..add(GdroidFieldsFragmentVars.serializer)
      ..add(GheroDataData.serializer)
      ..add(GheroDataVars.serializer)
      ..add(GheroFieldsFragmentData__asDroid.serializer)
      ..add(GheroFieldsFragmentData__asHuman.serializer)
      ..add(GheroFieldsFragmentData__asHuman_friends__asDroid.serializer)
      ..add(GheroFieldsFragmentData__asHuman_friends__asHuman.serializer)
      ..add(GheroFieldsFragmentData__asHuman_friends__base.serializer)
      ..add(GheroFieldsFragmentData__base.serializer)
      ..add(GheroFieldsFragmentVars.serializer)
      ..add(GheroIdData.serializer)
      ..add(GheroIdVars.serializer)
      ..add(GheroNameData.serializer)
      ..add(GheroNameVars.serializer)
      ..add(GhumanFieldsFragmentData.serializer)
      ..add(GhumanFieldsFragmentData_friends__asDroid.serializer)
      ..add(GhumanFieldsFragmentData_friends__asHuman.serializer)
      ..add(GhumanFieldsFragmentData_friends__base.serializer)
      ..add(GhumanFieldsFragmentVars.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DateTime)]),
          () => new ListBuilder<DateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CustomField)]),
          () => new ListBuilder<CustomField>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(DateTime)]),
          () => new ListBuilder<DateTime?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(GEpisode)]),
          () => new ListBuilder<GEpisode?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(GEpisode)]),
          () => new ListBuilder<GEpisode?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GHeroForEpisodeData_hero__asDroid_friends)
          ]),
          () => new ListBuilder<GHeroForEpisodeData_hero__asDroid_friends?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GHeroForEpisodeData_hero__base_friends)
          ]),
          () => new ListBuilder<GHeroForEpisodeData_hero__base_friends?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GHeroWithFragmentsData_hero_friendsConnection_edges)
          ]),
          () => new ListBuilder<
              GHeroWithFragmentsData_hero_friendsConnection_edges?>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType.nullable(GPostsData_posts)]),
          () => new ListBuilder<GPostsData_posts?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GPostsWithFixedVariableData_posts)
          ]),
          () => new ListBuilder<GPostsWithFixedVariableData_posts?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GcomparisonFieldsData_friendsConnection_edges)
          ]),
          () =>
              new ListBuilder<GcomparisonFieldsData_friendsConnection_edges?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GheroFieldsFragmentData__asHuman_friends)
          ]),
          () => new ListBuilder<GheroFieldsFragmentData__asHuman_friends?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GhumanFieldsFragmentData_friends)
          ]),
          () => new ListBuilder<GhumanFieldsFragmentData_friends?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
