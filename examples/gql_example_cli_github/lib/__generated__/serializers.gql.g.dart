// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(GAcceptEnterpriseAdministratorInvitationInput.serializer)
      ..add(GAcceptTopicSuggestionInput.serializer)
      ..add(GActionExecutionCapabilitySetting.serializer)
      ..add(GAddAssigneesToAssignableInput.serializer)
      ..add(GAddCommentInput.serializer)
      ..add(GAddLabelsToLabelableInput.serializer)
      ..add(GAddProjectCardInput.serializer)
      ..add(GAddProjectColumnInput.serializer)
      ..add(GAddPullRequestReviewCommentInput.serializer)
      ..add(GAddPullRequestReviewInput.serializer)
      ..add(GAddReactionInput.serializer)
      ..add(GAddStar.serializer)
      ..add(GAddStarData.serializer)
      ..add(GAddStarData_action.serializer)
      ..add(GAddStarData_action_starrable.serializer)
      ..add(GAddStarInput.serializer)
      ..add(GAddStarVars.serializer)
      ..add(GArchiveRepositoryInput.serializer)
      ..add(GAuditLogOrder.serializer)
      ..add(GAuditLogOrderField.serializer)
      ..add(GCancelEnterpriseAdminInvitationInput.serializer)
      ..add(GChangeUserStatusInput.serializer)
      ..add(GClearLabelsFromLabelableInput.serializer)
      ..add(GCloneProjectInput.serializer)
      ..add(GCloneTemplateRepositoryInput.serializer)
      ..add(GCloseIssueInput.serializer)
      ..add(GClosePullRequestInput.serializer)
      ..add(GCollaboratorAffiliation.serializer)
      ..add(GCommentAuthorAssociation.serializer)
      ..add(GCommentCannotUpdateReason.serializer)
      ..add(GCommitAuthor.serializer)
      ..add(GCommitContributionOrder.serializer)
      ..add(GCommitContributionOrderField.serializer)
      ..add(GContributionOrder.serializer)
      ..add(GContributionOrderField.serializer)
      ..add(GConvertProjectCardNoteToIssueInput.serializer)
      ..add(GCreateBranchProtectionRuleInput.serializer)
      ..add(GCreateEnterpriseOrganizationInput.serializer)
      ..add(GCreateIssueInput.serializer)
      ..add(GCreateProjectInput.serializer)
      ..add(GCreatePullRequestInput.serializer)
      ..add(GCreateRefInput.serializer)
      ..add(GCreateRepositoryInput.serializer)
      ..add(GCreateTeamDiscussionCommentInput.serializer)
      ..add(GCreateTeamDiscussionInput.serializer)
      ..add(GDate.serializer)
      ..add(GDateTime.serializer)
      ..add(GDeclineTopicSuggestionInput.serializer)
      ..add(GDefaultRepositoryPermissionField.serializer)
      ..add(GDeleteBranchProtectionRuleInput.serializer)
      ..add(GDeleteDeploymentInput.serializer)
      ..add(GDeleteIssueCommentInput.serializer)
      ..add(GDeleteIssueInput.serializer)
      ..add(GDeleteProjectCardInput.serializer)
      ..add(GDeleteProjectColumnInput.serializer)
      ..add(GDeleteProjectInput.serializer)
      ..add(GDeletePullRequestReviewCommentInput.serializer)
      ..add(GDeletePullRequestReviewInput.serializer)
      ..add(GDeleteRefInput.serializer)
      ..add(GDeleteTeamDiscussionCommentInput.serializer)
      ..add(GDeleteTeamDiscussionInput.serializer)
      ..add(GDeploymentOrder.serializer)
      ..add(GDeploymentOrderField.serializer)
      ..add(GDeploymentState.serializer)
      ..add(GDeploymentStatusState.serializer)
      ..add(GDismissPullRequestReviewInput.serializer)
      ..add(GDraftPullRequestReviewComment.serializer)
      ..add(GEnterpriseAdministratorInvitationOrder.serializer)
      ..add(GEnterpriseAdministratorInvitationOrderField.serializer)
      ..add(GEnterpriseAdministratorRole.serializer)
      ..add(GEnterpriseDefaultRepositoryPermissionSettingValue.serializer)
      ..add(GEnterpriseEnabledDisabledSettingValue.serializer)
      ..add(GEnterpriseEnabledSettingValue.serializer)
      ..add(GEnterpriseMemberOrder.serializer)
      ..add(GEnterpriseMemberOrderField.serializer)
      ..add(GEnterpriseMembersCanCreateRepositoriesSettingValue.serializer)
      ..add(GEnterpriseMembersCanMakePurchasesSettingValue.serializer)
      ..add(GEnterpriseServerInstallationOrder.serializer)
      ..add(GEnterpriseServerInstallationOrderField.serializer)
      ..add(GEnterpriseServerUserAccountEmailOrder.serializer)
      ..add(GEnterpriseServerUserAccountEmailOrderField.serializer)
      ..add(GEnterpriseServerUserAccountOrder.serializer)
      ..add(GEnterpriseServerUserAccountOrderField.serializer)
      ..add(GEnterpriseServerUserAccountsUploadOrder.serializer)
      ..add(GEnterpriseServerUserAccountsUploadOrderField.serializer)
      ..add(GEnterpriseServerUserAccountsUploadSyncState.serializer)
      ..add(GEnterpriseUserAccountMembershipRole.serializer)
      ..add(GEnterpriseUserDeployment.serializer)
      ..add(GFollowUserInput.serializer)
      ..add(GFundingPlatform.serializer)
      ..add(GGistOrder.serializer)
      ..add(GGistOrderField.serializer)
      ..add(GGistPrivacy.serializer)
      ..add(GGitObjectID.serializer)
      ..add(GGitSSHRemote.serializer)
      ..add(GGitSignatureState.serializer)
      ..add(GGitTimestamp.serializer)
      ..add(GHTML.serializer)
      ..add(GIdentityProviderConfigurationState.serializer)
      ..add(GInviteEnterpriseAdminInput.serializer)
      ..add(GIssueFilters.serializer)
      ..add(GIssueOrder.serializer)
      ..add(GIssueOrderField.serializer)
      ..add(GIssueState.serializer)
      ..add(GIssueTimelineItemsItemType.serializer)
      ..add(GLabelOrder.serializer)
      ..add(GLabelOrderField.serializer)
      ..add(GLanguageOrder.serializer)
      ..add(GLanguageOrderField.serializer)
      ..add(GLinkRepositoryToProjectInput.serializer)
      ..add(GLockLockableInput.serializer)
      ..add(GLockReason.serializer)
      ..add(GMergeBranchInput.serializer)
      ..add(GMergePullRequestInput.serializer)
      ..add(GMergeableState.serializer)
      ..add(GMilestoneOrder.serializer)
      ..add(GMilestoneOrderField.serializer)
      ..add(GMilestoneState.serializer)
      ..add(GMoveProjectCardInput.serializer)
      ..add(GMoveProjectColumnInput.serializer)
      ..add(GOauthApplicationCreateAuditEntryState.serializer)
      ..add(GOperationType.serializer)
      ..add(GOrderDirection.serializer)
      ..add(GOrgAddMemberAuditEntryPermission.serializer)
      ..add(GOrgCreateAuditEntryBillingPlan.serializer)
      ..add(GOrgRemoveBillingManagerAuditEntryReason.serializer)
      ..add(GOrgRemoveMemberAuditEntryMembershipType.serializer)
      ..add(GOrgRemoveMemberAuditEntryReason.serializer)
      ..add(GOrgRemoveOutsideCollaboratorAuditEntryMembershipType.serializer)
      ..add(GOrgRemoveOutsideCollaboratorAuditEntryReason.serializer)
      ..add(
          GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission.serializer)
      ..add(GOrgUpdateMemberAuditEntryPermission.serializer)
      ..add(GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
          .serializer)
      ..add(GOrganizationInvitationRole.serializer)
      ..add(GOrganizationInvitationType.serializer)
      ..add(GOrganizationMemberRole.serializer)
      ..add(GOrganizationMembersCanCreateRepositoriesSettingValue.serializer)
      ..add(GOrganizationOrder.serializer)
      ..add(GOrganizationOrderField.serializer)
      ..add(GPinnableItemType.serializer)
      ..add(GPreciseDateTime.serializer)
      ..add(GProjectCardArchivedState.serializer)
      ..add(GProjectCardState.serializer)
      ..add(GProjectColumnPurpose.serializer)
      ..add(GProjectOrder.serializer)
      ..add(GProjectOrderField.serializer)
      ..add(GProjectState.serializer)
      ..add(GProjectTemplate.serializer)
      ..add(GPullRequestMergeMethod.serializer)
      ..add(GPullRequestOrder.serializer)
      ..add(GPullRequestOrderField.serializer)
      ..add(GPullRequestReviewCommentState.serializer)
      ..add(GPullRequestReviewEvent.serializer)
      ..add(GPullRequestReviewState.serializer)
      ..add(GPullRequestState.serializer)
      ..add(GPullRequestTimelineItemsItemType.serializer)
      ..add(GPullRequestUpdateState.serializer)
      ..add(GReactionContent.serializer)
      ..add(GReactionOrder.serializer)
      ..add(GReactionOrderField.serializer)
      ..add(GReadRepositories.serializer)
      ..add(GReadRepositoriesData.serializer)
      ..add(GReadRepositoriesData_viewer.serializer)
      ..add(GReadRepositoriesData_viewer_repositories.serializer)
      ..add(GReadRepositoriesData_viewer_repositories_nodes.serializer)
      ..add(GReadRepositoriesVars.serializer)
      ..add(GRefOrder.serializer)
      ..add(GRefOrderField.serializer)
      ..add(GRegenerateEnterpriseIdentityProviderRecoveryCodesInput.serializer)
      ..add(GRegistryPackageDependencyType.serializer)
      ..add(GRegistryPackageMetadatum.serializer)
      ..add(GRegistryPackageType.serializer)
      ..add(GReleaseOrder.serializer)
      ..add(GReleaseOrderField.serializer)
      ..add(GRemoveAssigneesFromAssignableInput.serializer)
      ..add(GRemoveEnterpriseAdminInput.serializer)
      ..add(GRemoveEnterpriseOrganizationInput.serializer)
      ..add(GRemoveLabelsFromLabelableInput.serializer)
      ..add(GRemoveOutsideCollaboratorInput.serializer)
      ..add(GRemoveReactionInput.serializer)
      ..add(GRemoveStar.serializer)
      ..add(GRemoveStarData.serializer)
      ..add(GRemoveStarData_action.serializer)
      ..add(GRemoveStarData_action_starrable.serializer)
      ..add(GRemoveStarInput.serializer)
      ..add(GRemoveStarVars.serializer)
      ..add(GReopenIssueInput.serializer)
      ..add(GReopenPullRequestInput.serializer)
      ..add(GRepoAccessAuditEntryVisibility.serializer)
      ..add(GRepoAddMemberAuditEntryVisibility.serializer)
      ..add(GRepoArchivedAuditEntryVisibility.serializer)
      ..add(GRepoChangeMergeSettingAuditEntryMergeType.serializer)
      ..add(GRepoCreateAuditEntryVisibility.serializer)
      ..add(GRepoDestroyAuditEntryVisibility.serializer)
      ..add(GRepoRemoveMemberAuditEntryVisibility.serializer)
      ..add(GRepositoryAffiliation.serializer)
      ..add(GRepositoryContributionType.serializer)
      ..add(GRepositoryInvitationOrder.serializer)
      ..add(GRepositoryInvitationOrderField.serializer)
      ..add(GRepositoryLockReason.serializer)
      ..add(GRepositoryOrder.serializer)
      ..add(GRepositoryOrderField.serializer)
      ..add(GRepositoryPermission.serializer)
      ..add(GRepositoryPrivacy.serializer)
      ..add(GRepositoryVisibility.serializer)
      ..add(GRequestReviewsInput.serializer)
      ..add(GResolveReviewThreadInput.serializer)
      ..add(GSamlDigestAlgorithm.serializer)
      ..add(GSamlSignatureAlgorithm.serializer)
      ..add(GSavedReplyOrder.serializer)
      ..add(GSavedReplyOrderField.serializer)
      ..add(GSearchType.serializer)
      ..add(GSecurityAdvisoryEcosystem.serializer)
      ..add(GSecurityAdvisoryIdentifierFilter.serializer)
      ..add(GSecurityAdvisoryIdentifierType.serializer)
      ..add(GSecurityAdvisoryOrder.serializer)
      ..add(GSecurityAdvisoryOrderField.serializer)
      ..add(GSecurityAdvisorySeverity.serializer)
      ..add(GSecurityVulnerabilityOrder.serializer)
      ..add(GSecurityVulnerabilityOrderField.serializer)
      ..add(GSponsorsTierOrder.serializer)
      ..add(GSponsorsTierOrderField.serializer)
      ..add(GSponsorshipOrder.serializer)
      ..add(GSponsorshipOrderField.serializer)
      ..add(GSponsorshipPrivacy.serializer)
      ..add(GStarOrder.serializer)
      ..add(GStarOrderField.serializer)
      ..add(GStatusState.serializer)
      ..add(GSubmitPullRequestReviewInput.serializer)
      ..add(GSubscriptionState.serializer)
      ..add(GTeamDiscussionCommentOrder.serializer)
      ..add(GTeamDiscussionCommentOrderField.serializer)
      ..add(GTeamDiscussionOrder.serializer)
      ..add(GTeamDiscussionOrderField.serializer)
      ..add(GTeamMemberOrder.serializer)
      ..add(GTeamMemberOrderField.serializer)
      ..add(GTeamMemberRole.serializer)
      ..add(GTeamMembershipType.serializer)
      ..add(GTeamOrder.serializer)
      ..add(GTeamOrderField.serializer)
      ..add(GTeamPrivacy.serializer)
      ..add(GTeamRepositoryOrder.serializer)
      ..add(GTeamRepositoryOrderField.serializer)
      ..add(GTeamRole.serializer)
      ..add(GTopicSuggestionDeclineReason.serializer)
      ..add(GTransferIssueInput.serializer)
      ..add(GURI.serializer)
      ..add(GUnarchiveRepositoryInput.serializer)
      ..add(GUnfollowUserInput.serializer)
      ..add(GUnlinkRepositoryFromProjectInput.serializer)
      ..add(GUnlockLockableInput.serializer)
      ..add(GUnmarkIssueAsDuplicateInput.serializer)
      ..add(GUnresolveReviewThreadInput.serializer)
      ..add(GUpdateBranchProtectionRuleInput.serializer)
      ..add(GUpdateEnterpriseActionExecutionCapabilitySettingInput.serializer)
      ..add(GUpdateEnterpriseAdministratorRoleInput.serializer)
      ..add(
          GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput.serializer)
      ..add(GUpdateEnterpriseDefaultRepositoryPermissionSettingInput.serializer)
      ..add(GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
          .serializer)
      ..add(
          GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput.serializer)
      ..add(GUpdateEnterpriseMembersCanDeleteIssuesSettingInput.serializer)
      ..add(
          GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput.serializer)
      ..add(
          GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput.serializer)
      ..add(GUpdateEnterpriseMembersCanMakePurchasesSettingInput.serializer)
      ..add(GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
          .serializer)
      ..add(GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
          .serializer)
      ..add(GUpdateEnterpriseOrganizationProjectsSettingInput.serializer)
      ..add(GUpdateEnterpriseProfileInput.serializer)
      ..add(GUpdateEnterpriseRepositoryProjectsSettingInput.serializer)
      ..add(GUpdateEnterpriseTeamDiscussionsSettingInput.serializer)
      ..add(GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
          .serializer)
      ..add(GUpdateIssueCommentInput.serializer)
      ..add(GUpdateIssueInput.serializer)
      ..add(GUpdateProjectCardInput.serializer)
      ..add(GUpdateProjectColumnInput.serializer)
      ..add(GUpdateProjectInput.serializer)
      ..add(GUpdatePullRequestInput.serializer)
      ..add(GUpdatePullRequestReviewCommentInput.serializer)
      ..add(GUpdatePullRequestReviewInput.serializer)
      ..add(GUpdateRefInput.serializer)
      ..add(GUpdateRepositoryInput.serializer)
      ..add(GUpdateSubscriptionInput.serializer)
      ..add(GUpdateTeamDiscussionCommentInput.serializer)
      ..add(GUpdateTeamDiscussionInput.serializer)
      ..add(GUpdateTopicsInput.serializer)
      ..add(GUserBlockDuration.serializer)
      ..add(GUserStatusOrder.serializer)
      ..add(GUserStatusOrderField.serializer)
      ..add(GX509Certificate.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GIssueState)]),
          () => new ListBuilder<GIssueState>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GDraftPullRequestReviewComment)]),
          () => new ListBuilder<GDraftPullRequestReviewComment?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GReadRepositoriesData_viewer_repositories_nodes)
          ]),
          () => new ListBuilder<
              GReadRepositoriesData_viewer_repositories_nodes?>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
