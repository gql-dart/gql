// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i1;

part 'schema.schema.gql.g.dart';

abstract class GAcceptEnterpriseAdministratorInvitationInput
    implements
        Built<GAcceptEnterpriseAdministratorInvitationInput,
            GAcceptEnterpriseAdministratorInvitationInputBuilder> {
  GAcceptEnterpriseAdministratorInvitationInput._();

  factory GAcceptEnterpriseAdministratorInvitationInput(
      [Function(GAcceptEnterpriseAdministratorInvitationInputBuilder b)
          updates]) = _$GAcceptEnterpriseAdministratorInvitationInput;

  String? get clientMutationId;
  String get invitationId;
  static Serializer<GAcceptEnterpriseAdministratorInvitationInput>
      get serializer =>
          _$gAcceptEnterpriseAdministratorInvitationInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAcceptEnterpriseAdministratorInvitationInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAcceptEnterpriseAdministratorInvitationInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAcceptEnterpriseAdministratorInvitationInput.serializer,
        json,
      );
}

abstract class GAcceptTopicSuggestionInput
    implements
        Built<GAcceptTopicSuggestionInput, GAcceptTopicSuggestionInputBuilder> {
  GAcceptTopicSuggestionInput._();

  factory GAcceptTopicSuggestionInput(
          [Function(GAcceptTopicSuggestionInputBuilder b) updates]) =
      _$GAcceptTopicSuggestionInput;

  String? get clientMutationId;
  String get name;
  String get repositoryId;
  static Serializer<GAcceptTopicSuggestionInput> get serializer =>
      _$gAcceptTopicSuggestionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAcceptTopicSuggestionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAcceptTopicSuggestionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAcceptTopicSuggestionInput.serializer,
        json,
      );
}

class GActionExecutionCapabilitySetting extends EnumClass {
  const GActionExecutionCapabilitySetting._(String name) : super(name);

  static const GActionExecutionCapabilitySetting ALL_ACTIONS =
      _$gActionExecutionCapabilitySettingALL_ACTIONS;

  static const GActionExecutionCapabilitySetting DISABLED =
      _$gActionExecutionCapabilitySettingDISABLED;

  static const GActionExecutionCapabilitySetting LOCAL_ACTIONS_ONLY =
      _$gActionExecutionCapabilitySettingLOCAL_ACTIONS_ONLY;

  static const GActionExecutionCapabilitySetting NO_POLICY =
      _$gActionExecutionCapabilitySettingNO_POLICY;

  static Serializer<GActionExecutionCapabilitySetting> get serializer =>
      _$gActionExecutionCapabilitySettingSerializer;

  static BuiltSet<GActionExecutionCapabilitySetting> get values =>
      _$gActionExecutionCapabilitySettingValues;

  static GActionExecutionCapabilitySetting valueOf(String name) =>
      _$gActionExecutionCapabilitySettingValueOf(name);
}

abstract class GAddAssigneesToAssignableInput
    implements
        Built<GAddAssigneesToAssignableInput,
            GAddAssigneesToAssignableInputBuilder> {
  GAddAssigneesToAssignableInput._();

  factory GAddAssigneesToAssignableInput(
          [Function(GAddAssigneesToAssignableInputBuilder b) updates]) =
      _$GAddAssigneesToAssignableInput;

  String get assignableId;
  BuiltList<String> get assigneeIds;
  String? get clientMutationId;
  static Serializer<GAddAssigneesToAssignableInput> get serializer =>
      _$gAddAssigneesToAssignableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddAssigneesToAssignableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddAssigneesToAssignableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddAssigneesToAssignableInput.serializer,
        json,
      );
}

abstract class GAddCommentInput
    implements Built<GAddCommentInput, GAddCommentInputBuilder> {
  GAddCommentInput._();

  factory GAddCommentInput([Function(GAddCommentInputBuilder b) updates]) =
      _$GAddCommentInput;

  String get body;
  String? get clientMutationId;
  String get subjectId;
  static Serializer<GAddCommentInput> get serializer =>
      _$gAddCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddCommentInput.serializer,
        json,
      );
}

abstract class GAddLabelsToLabelableInput
    implements
        Built<GAddLabelsToLabelableInput, GAddLabelsToLabelableInputBuilder> {
  GAddLabelsToLabelableInput._();

  factory GAddLabelsToLabelableInput(
          [Function(GAddLabelsToLabelableInputBuilder b) updates]) =
      _$GAddLabelsToLabelableInput;

  String? get clientMutationId;
  BuiltList<String> get labelIds;
  String get labelableId;
  static Serializer<GAddLabelsToLabelableInput> get serializer =>
      _$gAddLabelsToLabelableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddLabelsToLabelableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddLabelsToLabelableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddLabelsToLabelableInput.serializer,
        json,
      );
}

abstract class GAddProjectCardInput
    implements Built<GAddProjectCardInput, GAddProjectCardInputBuilder> {
  GAddProjectCardInput._();

  factory GAddProjectCardInput(
          [Function(GAddProjectCardInputBuilder b) updates]) =
      _$GAddProjectCardInput;

  String? get clientMutationId;
  String? get contentId;
  String? get note;
  String get projectColumnId;
  static Serializer<GAddProjectCardInput> get serializer =>
      _$gAddProjectCardInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProjectCardInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProjectCardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProjectCardInput.serializer,
        json,
      );
}

abstract class GAddProjectColumnInput
    implements Built<GAddProjectColumnInput, GAddProjectColumnInputBuilder> {
  GAddProjectColumnInput._();

  factory GAddProjectColumnInput(
          [Function(GAddProjectColumnInputBuilder b) updates]) =
      _$GAddProjectColumnInput;

  String? get clientMutationId;
  String get name;
  String get projectId;
  static Serializer<GAddProjectColumnInput> get serializer =>
      _$gAddProjectColumnInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProjectColumnInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProjectColumnInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProjectColumnInput.serializer,
        json,
      );
}

abstract class GAddPullRequestReviewCommentInput
    implements
        Built<GAddPullRequestReviewCommentInput,
            GAddPullRequestReviewCommentInputBuilder> {
  GAddPullRequestReviewCommentInput._();

  factory GAddPullRequestReviewCommentInput(
          [Function(GAddPullRequestReviewCommentInputBuilder b) updates]) =
      _$GAddPullRequestReviewCommentInput;

  String get body;
  String? get clientMutationId;
  GGitObjectID? get commitOID;
  String? get inReplyTo;
  String? get path;
  int? get position;
  String? get pullRequestId;
  String? get pullRequestReviewId;
  static Serializer<GAddPullRequestReviewCommentInput> get serializer =>
      _$gAddPullRequestReviewCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddPullRequestReviewCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddPullRequestReviewCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddPullRequestReviewCommentInput.serializer,
        json,
      );
}

abstract class GAddPullRequestReviewInput
    implements
        Built<GAddPullRequestReviewInput, GAddPullRequestReviewInputBuilder> {
  GAddPullRequestReviewInput._();

  factory GAddPullRequestReviewInput(
          [Function(GAddPullRequestReviewInputBuilder b) updates]) =
      _$GAddPullRequestReviewInput;

  String? get body;
  String? get clientMutationId;
  BuiltList<GDraftPullRequestReviewComment?>? get comments;
  GGitObjectID? get commitOID;
  GPullRequestReviewEvent? get event;
  String get pullRequestId;
  static Serializer<GAddPullRequestReviewInput> get serializer =>
      _$gAddPullRequestReviewInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddPullRequestReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddPullRequestReviewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddPullRequestReviewInput.serializer,
        json,
      );
}

abstract class GAddReactionInput
    implements Built<GAddReactionInput, GAddReactionInputBuilder> {
  GAddReactionInput._();

  factory GAddReactionInput([Function(GAddReactionInputBuilder b) updates]) =
      _$GAddReactionInput;

  String? get clientMutationId;
  GReactionContent get content;
  String get subjectId;
  static Serializer<GAddReactionInput> get serializer =>
      _$gAddReactionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddReactionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddReactionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddReactionInput.serializer,
        json,
      );
}

abstract class GAddStarInput
    implements Built<GAddStarInput, GAddStarInputBuilder> {
  GAddStarInput._();

  factory GAddStarInput([Function(GAddStarInputBuilder b) updates]) =
      _$GAddStarInput;

  String? get clientMutationId;
  String get starrableId;
  static Serializer<GAddStarInput> get serializer => _$gAddStarInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddStarInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddStarInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddStarInput.serializer,
        json,
      );
}

abstract class GArchiveRepositoryInput
    implements Built<GArchiveRepositoryInput, GArchiveRepositoryInputBuilder> {
  GArchiveRepositoryInput._();

  factory GArchiveRepositoryInput(
          [Function(GArchiveRepositoryInputBuilder b) updates]) =
      _$GArchiveRepositoryInput;

  String? get clientMutationId;
  String get repositoryId;
  static Serializer<GArchiveRepositoryInput> get serializer =>
      _$gArchiveRepositoryInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GArchiveRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GArchiveRepositoryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GArchiveRepositoryInput.serializer,
        json,
      );
}

abstract class GAuditLogOrder
    implements Built<GAuditLogOrder, GAuditLogOrderBuilder> {
  GAuditLogOrder._();

  factory GAuditLogOrder([Function(GAuditLogOrderBuilder b) updates]) =
      _$GAuditLogOrder;

  GOrderDirection? get direction;
  GAuditLogOrderField? get field;
  static Serializer<GAuditLogOrder> get serializer =>
      _$gAuditLogOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuditLogOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuditLogOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuditLogOrder.serializer,
        json,
      );
}

class GAuditLogOrderField extends EnumClass {
  const GAuditLogOrderField._(String name) : super(name);

  static const GAuditLogOrderField CREATED_AT = _$gAuditLogOrderFieldCREATED_AT;

  static Serializer<GAuditLogOrderField> get serializer =>
      _$gAuditLogOrderFieldSerializer;

  static BuiltSet<GAuditLogOrderField> get values =>
      _$gAuditLogOrderFieldValues;

  static GAuditLogOrderField valueOf(String name) =>
      _$gAuditLogOrderFieldValueOf(name);
}

abstract class GCancelEnterpriseAdminInvitationInput
    implements
        Built<GCancelEnterpriseAdminInvitationInput,
            GCancelEnterpriseAdminInvitationInputBuilder> {
  GCancelEnterpriseAdminInvitationInput._();

  factory GCancelEnterpriseAdminInvitationInput(
          [Function(GCancelEnterpriseAdminInvitationInputBuilder b) updates]) =
      _$GCancelEnterpriseAdminInvitationInput;

  String? get clientMutationId;
  String get invitationId;
  static Serializer<GCancelEnterpriseAdminInvitationInput> get serializer =>
      _$gCancelEnterpriseAdminInvitationInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelEnterpriseAdminInvitationInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelEnterpriseAdminInvitationInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelEnterpriseAdminInvitationInput.serializer,
        json,
      );
}

abstract class GChangeUserStatusInput
    implements Built<GChangeUserStatusInput, GChangeUserStatusInputBuilder> {
  GChangeUserStatusInput._();

  factory GChangeUserStatusInput(
          [Function(GChangeUserStatusInputBuilder b) updates]) =
      _$GChangeUserStatusInput;

  String? get clientMutationId;
  String? get emoji;
  GDateTime? get expiresAt;
  bool? get limitedAvailability;
  String? get message;
  String? get organizationId;
  static Serializer<GChangeUserStatusInput> get serializer =>
      _$gChangeUserStatusInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeUserStatusInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChangeUserStatusInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeUserStatusInput.serializer,
        json,
      );
}

abstract class GClearLabelsFromLabelableInput
    implements
        Built<GClearLabelsFromLabelableInput,
            GClearLabelsFromLabelableInputBuilder> {
  GClearLabelsFromLabelableInput._();

  factory GClearLabelsFromLabelableInput(
          [Function(GClearLabelsFromLabelableInputBuilder b) updates]) =
      _$GClearLabelsFromLabelableInput;

  String? get clientMutationId;
  String get labelableId;
  static Serializer<GClearLabelsFromLabelableInput> get serializer =>
      _$gClearLabelsFromLabelableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClearLabelsFromLabelableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GClearLabelsFromLabelableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClearLabelsFromLabelableInput.serializer,
        json,
      );
}

abstract class GCloneProjectInput
    implements Built<GCloneProjectInput, GCloneProjectInputBuilder> {
  GCloneProjectInput._();

  factory GCloneProjectInput([Function(GCloneProjectInputBuilder b) updates]) =
      _$GCloneProjectInput;

  String? get body;
  String? get clientMutationId;
  bool get includeWorkflows;
  String get name;
  bool? get public;
  String get sourceId;
  String get targetOwnerId;
  static Serializer<GCloneProjectInput> get serializer =>
      _$gCloneProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCloneProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCloneProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCloneProjectInput.serializer,
        json,
      );
}

abstract class GCloneTemplateRepositoryInput
    implements
        Built<GCloneTemplateRepositoryInput,
            GCloneTemplateRepositoryInputBuilder> {
  GCloneTemplateRepositoryInput._();

  factory GCloneTemplateRepositoryInput(
          [Function(GCloneTemplateRepositoryInputBuilder b) updates]) =
      _$GCloneTemplateRepositoryInput;

  String? get clientMutationId;
  String? get description;
  String get name;
  String get ownerId;
  String get repositoryId;
  GRepositoryVisibility get visibility;
  static Serializer<GCloneTemplateRepositoryInput> get serializer =>
      _$gCloneTemplateRepositoryInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCloneTemplateRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCloneTemplateRepositoryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCloneTemplateRepositoryInput.serializer,
        json,
      );
}

abstract class GCloseIssueInput
    implements Built<GCloseIssueInput, GCloseIssueInputBuilder> {
  GCloseIssueInput._();

  factory GCloseIssueInput([Function(GCloseIssueInputBuilder b) updates]) =
      _$GCloseIssueInput;

  String? get clientMutationId;
  String get issueId;
  static Serializer<GCloseIssueInput> get serializer =>
      _$gCloseIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCloseIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCloseIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCloseIssueInput.serializer,
        json,
      );
}

abstract class GClosePullRequestInput
    implements Built<GClosePullRequestInput, GClosePullRequestInputBuilder> {
  GClosePullRequestInput._();

  factory GClosePullRequestInput(
          [Function(GClosePullRequestInputBuilder b) updates]) =
      _$GClosePullRequestInput;

  String? get clientMutationId;
  String get pullRequestId;
  static Serializer<GClosePullRequestInput> get serializer =>
      _$gClosePullRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClosePullRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GClosePullRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClosePullRequestInput.serializer,
        json,
      );
}

class GCollaboratorAffiliation extends EnumClass {
  const GCollaboratorAffiliation._(String name) : super(name);

  static const GCollaboratorAffiliation ALL = _$gCollaboratorAffiliationALL;

  static const GCollaboratorAffiliation DIRECT =
      _$gCollaboratorAffiliationDIRECT;

  static const GCollaboratorAffiliation OUTSIDE =
      _$gCollaboratorAffiliationOUTSIDE;

  static Serializer<GCollaboratorAffiliation> get serializer =>
      _$gCollaboratorAffiliationSerializer;

  static BuiltSet<GCollaboratorAffiliation> get values =>
      _$gCollaboratorAffiliationValues;

  static GCollaboratorAffiliation valueOf(String name) =>
      _$gCollaboratorAffiliationValueOf(name);
}

class GCommentAuthorAssociation extends EnumClass {
  const GCommentAuthorAssociation._(String name) : super(name);

  static const GCommentAuthorAssociation COLLABORATOR =
      _$gCommentAuthorAssociationCOLLABORATOR;

  static const GCommentAuthorAssociation CONTRIBUTOR =
      _$gCommentAuthorAssociationCONTRIBUTOR;

  static const GCommentAuthorAssociation FIRST_TIMER =
      _$gCommentAuthorAssociationFIRST_TIMER;

  static const GCommentAuthorAssociation FIRST_TIME_CONTRIBUTOR =
      _$gCommentAuthorAssociationFIRST_TIME_CONTRIBUTOR;

  static const GCommentAuthorAssociation MEMBER =
      _$gCommentAuthorAssociationMEMBER;

  static const GCommentAuthorAssociation NONE = _$gCommentAuthorAssociationNONE;

  static const GCommentAuthorAssociation OWNER =
      _$gCommentAuthorAssociationOWNER;

  static Serializer<GCommentAuthorAssociation> get serializer =>
      _$gCommentAuthorAssociationSerializer;

  static BuiltSet<GCommentAuthorAssociation> get values =>
      _$gCommentAuthorAssociationValues;

  static GCommentAuthorAssociation valueOf(String name) =>
      _$gCommentAuthorAssociationValueOf(name);
}

class GCommentCannotUpdateReason extends EnumClass {
  const GCommentCannotUpdateReason._(String name) : super(name);

  static const GCommentCannotUpdateReason ARCHIVED =
      _$gCommentCannotUpdateReasonARCHIVED;

  static const GCommentCannotUpdateReason DENIED =
      _$gCommentCannotUpdateReasonDENIED;

  static const GCommentCannotUpdateReason INSUFFICIENT_ACCESS =
      _$gCommentCannotUpdateReasonINSUFFICIENT_ACCESS;

  static const GCommentCannotUpdateReason LOCKED =
      _$gCommentCannotUpdateReasonLOCKED;

  static const GCommentCannotUpdateReason LOGIN_REQUIRED =
      _$gCommentCannotUpdateReasonLOGIN_REQUIRED;

  static const GCommentCannotUpdateReason MAINTENANCE =
      _$gCommentCannotUpdateReasonMAINTENANCE;

  static const GCommentCannotUpdateReason VERIFIED_EMAIL_REQUIRED =
      _$gCommentCannotUpdateReasonVERIFIED_EMAIL_REQUIRED;

  static Serializer<GCommentCannotUpdateReason> get serializer =>
      _$gCommentCannotUpdateReasonSerializer;

  static BuiltSet<GCommentCannotUpdateReason> get values =>
      _$gCommentCannotUpdateReasonValues;

  static GCommentCannotUpdateReason valueOf(String name) =>
      _$gCommentCannotUpdateReasonValueOf(name);
}

abstract class GCommitAuthor
    implements Built<GCommitAuthor, GCommitAuthorBuilder> {
  GCommitAuthor._();

  factory GCommitAuthor([Function(GCommitAuthorBuilder b) updates]) =
      _$GCommitAuthor;

  BuiltList<String>? get emails;
  String? get id;
  static Serializer<GCommitAuthor> get serializer => _$gCommitAuthorSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommitAuthor.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommitAuthor? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommitAuthor.serializer,
        json,
      );
}

abstract class GCommitContributionOrder
    implements
        Built<GCommitContributionOrder, GCommitContributionOrderBuilder> {
  GCommitContributionOrder._();

  factory GCommitContributionOrder(
          [Function(GCommitContributionOrderBuilder b) updates]) =
      _$GCommitContributionOrder;

  GOrderDirection get direction;
  GCommitContributionOrderField get field;
  static Serializer<GCommitContributionOrder> get serializer =>
      _$gCommitContributionOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommitContributionOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCommitContributionOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommitContributionOrder.serializer,
        json,
      );
}

class GCommitContributionOrderField extends EnumClass {
  const GCommitContributionOrderField._(String name) : super(name);

  static const GCommitContributionOrderField COMMIT_COUNT =
      _$gCommitContributionOrderFieldCOMMIT_COUNT;

  static const GCommitContributionOrderField OCCURRED_AT =
      _$gCommitContributionOrderFieldOCCURRED_AT;

  static Serializer<GCommitContributionOrderField> get serializer =>
      _$gCommitContributionOrderFieldSerializer;

  static BuiltSet<GCommitContributionOrderField> get values =>
      _$gCommitContributionOrderFieldValues;

  static GCommitContributionOrderField valueOf(String name) =>
      _$gCommitContributionOrderFieldValueOf(name);
}

abstract class GContributionOrder
    implements Built<GContributionOrder, GContributionOrderBuilder> {
  GContributionOrder._();

  factory GContributionOrder([Function(GContributionOrderBuilder b) updates]) =
      _$GContributionOrder;

  GOrderDirection get direction;
  GContributionOrderField? get field;
  static Serializer<GContributionOrder> get serializer =>
      _$gContributionOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GContributionOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GContributionOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GContributionOrder.serializer,
        json,
      );
}

class GContributionOrderField extends EnumClass {
  const GContributionOrderField._(String name) : super(name);

  static const GContributionOrderField OCCURRED_AT =
      _$gContributionOrderFieldOCCURRED_AT;

  static Serializer<GContributionOrderField> get serializer =>
      _$gContributionOrderFieldSerializer;

  static BuiltSet<GContributionOrderField> get values =>
      _$gContributionOrderFieldValues;

  static GContributionOrderField valueOf(String name) =>
      _$gContributionOrderFieldValueOf(name);
}

abstract class GConvertProjectCardNoteToIssueInput
    implements
        Built<GConvertProjectCardNoteToIssueInput,
            GConvertProjectCardNoteToIssueInputBuilder> {
  GConvertProjectCardNoteToIssueInput._();

  factory GConvertProjectCardNoteToIssueInput(
          [Function(GConvertProjectCardNoteToIssueInputBuilder b) updates]) =
      _$GConvertProjectCardNoteToIssueInput;

  String? get body;
  String? get clientMutationId;
  String get projectCardId;
  String get repositoryId;
  String? get title;
  static Serializer<GConvertProjectCardNoteToIssueInput> get serializer =>
      _$gConvertProjectCardNoteToIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConvertProjectCardNoteToIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConvertProjectCardNoteToIssueInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConvertProjectCardNoteToIssueInput.serializer,
        json,
      );
}

abstract class GCreateBranchProtectionRuleInput
    implements
        Built<GCreateBranchProtectionRuleInput,
            GCreateBranchProtectionRuleInputBuilder> {
  GCreateBranchProtectionRuleInput._();

  factory GCreateBranchProtectionRuleInput(
          [Function(GCreateBranchProtectionRuleInputBuilder b) updates]) =
      _$GCreateBranchProtectionRuleInput;

  String? get clientMutationId;
  bool? get dismissesStaleReviews;
  bool? get isAdminEnforced;
  String get pattern;
  BuiltList<String>? get pushActorIds;
  String get repositoryId;
  int? get requiredApprovingReviewCount;
  BuiltList<String>? get requiredStatusCheckContexts;
  bool? get requiresApprovingReviews;
  bool? get requiresCodeOwnerReviews;
  bool? get requiresCommitSignatures;
  bool? get requiresStatusChecks;
  bool? get requiresStrictStatusChecks;
  bool? get restrictsPushes;
  bool? get restrictsReviewDismissals;
  BuiltList<String>? get reviewDismissalActorIds;
  static Serializer<GCreateBranchProtectionRuleInput> get serializer =>
      _$gCreateBranchProtectionRuleInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBranchProtectionRuleInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateBranchProtectionRuleInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBranchProtectionRuleInput.serializer,
        json,
      );
}

abstract class GCreateEnterpriseOrganizationInput
    implements
        Built<GCreateEnterpriseOrganizationInput,
            GCreateEnterpriseOrganizationInputBuilder> {
  GCreateEnterpriseOrganizationInput._();

  factory GCreateEnterpriseOrganizationInput(
          [Function(GCreateEnterpriseOrganizationInputBuilder b) updates]) =
      _$GCreateEnterpriseOrganizationInput;

  BuiltList<String> get adminLogins;
  String get billingEmail;
  String? get clientMutationId;
  String get enterpriseId;
  String get login;
  String get profileName;
  static Serializer<GCreateEnterpriseOrganizationInput> get serializer =>
      _$gCreateEnterpriseOrganizationInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateEnterpriseOrganizationInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateEnterpriseOrganizationInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateEnterpriseOrganizationInput.serializer,
        json,
      );
}

abstract class GCreateIssueInput
    implements Built<GCreateIssueInput, GCreateIssueInputBuilder> {
  GCreateIssueInput._();

  factory GCreateIssueInput([Function(GCreateIssueInputBuilder b) updates]) =
      _$GCreateIssueInput;

  BuiltList<String>? get assigneeIds;
  String? get body;
  String? get clientMutationId;
  BuiltList<String>? get labelIds;
  String? get milestoneId;
  BuiltList<String>? get projectIds;
  String get repositoryId;
  String get title;
  static Serializer<GCreateIssueInput> get serializer =>
      _$gCreateIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateIssueInput.serializer,
        json,
      );
}

abstract class GCreateProjectInput
    implements Built<GCreateProjectInput, GCreateProjectInputBuilder> {
  GCreateProjectInput._();

  factory GCreateProjectInput(
      [Function(GCreateProjectInputBuilder b) updates]) = _$GCreateProjectInput;

  String? get body;
  String? get clientMutationId;
  String get name;
  String get ownerId;
  BuiltList<String>? get repositoryIds;
  GProjectTemplate? get template;
  static Serializer<GCreateProjectInput> get serializer =>
      _$gCreateProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateProjectInput.serializer,
        json,
      );
}

abstract class GCreatePullRequestInput
    implements Built<GCreatePullRequestInput, GCreatePullRequestInputBuilder> {
  GCreatePullRequestInput._();

  factory GCreatePullRequestInput(
          [Function(GCreatePullRequestInputBuilder b) updates]) =
      _$GCreatePullRequestInput;

  String get baseRefName;
  String? get body;
  String? get clientMutationId;
  String get headRefName;
  bool? get maintainerCanModify;
  String get repositoryId;
  String get title;
  static Serializer<GCreatePullRequestInput> get serializer =>
      _$gCreatePullRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePullRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreatePullRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePullRequestInput.serializer,
        json,
      );
}

abstract class GCreateRefInput
    implements Built<GCreateRefInput, GCreateRefInputBuilder> {
  GCreateRefInput._();

  factory GCreateRefInput([Function(GCreateRefInputBuilder b) updates]) =
      _$GCreateRefInput;

  String? get clientMutationId;
  String get name;
  GGitObjectID get oid;
  String get repositoryId;
  static Serializer<GCreateRefInput> get serializer =>
      _$gCreateRefInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRefInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRefInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRefInput.serializer,
        json,
      );
}

abstract class GCreateRepositoryInput
    implements Built<GCreateRepositoryInput, GCreateRepositoryInputBuilder> {
  GCreateRepositoryInput._();

  factory GCreateRepositoryInput(
          [Function(GCreateRepositoryInputBuilder b) updates]) =
      _$GCreateRepositoryInput;

  String? get clientMutationId;
  String? get description;
  bool? get hasIssuesEnabled;
  bool? get hasWikiEnabled;
  GURI? get homepageUrl;
  String get name;
  String? get ownerId;
  String? get teamId;
  bool? get template;
  GRepositoryVisibility get visibility;
  static Serializer<GCreateRepositoryInput> get serializer =>
      _$gCreateRepositoryInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRepositoryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRepositoryInput.serializer,
        json,
      );
}

abstract class GCreateTeamDiscussionCommentInput
    implements
        Built<GCreateTeamDiscussionCommentInput,
            GCreateTeamDiscussionCommentInputBuilder> {
  GCreateTeamDiscussionCommentInput._();

  factory GCreateTeamDiscussionCommentInput(
          [Function(GCreateTeamDiscussionCommentInputBuilder b) updates]) =
      _$GCreateTeamDiscussionCommentInput;

  String get body;
  String? get clientMutationId;
  String get discussionId;
  static Serializer<GCreateTeamDiscussionCommentInput> get serializer =>
      _$gCreateTeamDiscussionCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateTeamDiscussionCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateTeamDiscussionCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateTeamDiscussionCommentInput.serializer,
        json,
      );
}

abstract class GCreateTeamDiscussionInput
    implements
        Built<GCreateTeamDiscussionInput, GCreateTeamDiscussionInputBuilder> {
  GCreateTeamDiscussionInput._();

  factory GCreateTeamDiscussionInput(
          [Function(GCreateTeamDiscussionInputBuilder b) updates]) =
      _$GCreateTeamDiscussionInput;

  String get body;
  String? get clientMutationId;
  bool? get private;
  String get teamId;
  String get title;
  static Serializer<GCreateTeamDiscussionInput> get serializer =>
      _$gCreateTeamDiscussionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateTeamDiscussionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateTeamDiscussionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateTeamDiscussionInput.serializer,
        json,
      );
}

abstract class GDate implements Built<GDate, GDateBuilder> {
  GDate._();

  factory GDate([String? value]) =>
      _$GDate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDate> get serializer => _i2.DefaultScalarSerializer<GDate>(
      (Object serialized) => GDate((serialized as String?)));
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GDeclineTopicSuggestionInput
    implements
        Built<GDeclineTopicSuggestionInput,
            GDeclineTopicSuggestionInputBuilder> {
  GDeclineTopicSuggestionInput._();

  factory GDeclineTopicSuggestionInput(
          [Function(GDeclineTopicSuggestionInputBuilder b) updates]) =
      _$GDeclineTopicSuggestionInput;

  String? get clientMutationId;
  String get name;
  GTopicSuggestionDeclineReason get reason;
  String get repositoryId;
  static Serializer<GDeclineTopicSuggestionInput> get serializer =>
      _$gDeclineTopicSuggestionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeclineTopicSuggestionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeclineTopicSuggestionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeclineTopicSuggestionInput.serializer,
        json,
      );
}

class GDefaultRepositoryPermissionField extends EnumClass {
  const GDefaultRepositoryPermissionField._(String name) : super(name);

  static const GDefaultRepositoryPermissionField ADMIN =
      _$gDefaultRepositoryPermissionFieldADMIN;

  static const GDefaultRepositoryPermissionField NONE =
      _$gDefaultRepositoryPermissionFieldNONE;

  static const GDefaultRepositoryPermissionField READ =
      _$gDefaultRepositoryPermissionFieldREAD;

  static const GDefaultRepositoryPermissionField WRITE =
      _$gDefaultRepositoryPermissionFieldWRITE;

  static Serializer<GDefaultRepositoryPermissionField> get serializer =>
      _$gDefaultRepositoryPermissionFieldSerializer;

  static BuiltSet<GDefaultRepositoryPermissionField> get values =>
      _$gDefaultRepositoryPermissionFieldValues;

  static GDefaultRepositoryPermissionField valueOf(String name) =>
      _$gDefaultRepositoryPermissionFieldValueOf(name);
}

abstract class GDeleteBranchProtectionRuleInput
    implements
        Built<GDeleteBranchProtectionRuleInput,
            GDeleteBranchProtectionRuleInputBuilder> {
  GDeleteBranchProtectionRuleInput._();

  factory GDeleteBranchProtectionRuleInput(
          [Function(GDeleteBranchProtectionRuleInputBuilder b) updates]) =
      _$GDeleteBranchProtectionRuleInput;

  String get branchProtectionRuleId;
  String? get clientMutationId;
  static Serializer<GDeleteBranchProtectionRuleInput> get serializer =>
      _$gDeleteBranchProtectionRuleInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteBranchProtectionRuleInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteBranchProtectionRuleInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteBranchProtectionRuleInput.serializer,
        json,
      );
}

abstract class GDeleteDeploymentInput
    implements Built<GDeleteDeploymentInput, GDeleteDeploymentInputBuilder> {
  GDeleteDeploymentInput._();

  factory GDeleteDeploymentInput(
          [Function(GDeleteDeploymentInputBuilder b) updates]) =
      _$GDeleteDeploymentInput;

  String? get clientMutationId;
  String get id;
  static Serializer<GDeleteDeploymentInput> get serializer =>
      _$gDeleteDeploymentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteDeploymentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteDeploymentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteDeploymentInput.serializer,
        json,
      );
}

abstract class GDeleteIssueCommentInput
    implements
        Built<GDeleteIssueCommentInput, GDeleteIssueCommentInputBuilder> {
  GDeleteIssueCommentInput._();

  factory GDeleteIssueCommentInput(
          [Function(GDeleteIssueCommentInputBuilder b) updates]) =
      _$GDeleteIssueCommentInput;

  String? get clientMutationId;
  String get id;
  static Serializer<GDeleteIssueCommentInput> get serializer =>
      _$gDeleteIssueCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteIssueCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteIssueCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteIssueCommentInput.serializer,
        json,
      );
}

abstract class GDeleteIssueInput
    implements Built<GDeleteIssueInput, GDeleteIssueInputBuilder> {
  GDeleteIssueInput._();

  factory GDeleteIssueInput([Function(GDeleteIssueInputBuilder b) updates]) =
      _$GDeleteIssueInput;

  String? get clientMutationId;
  String get issueId;
  static Serializer<GDeleteIssueInput> get serializer =>
      _$gDeleteIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteIssueInput.serializer,
        json,
      );
}

abstract class GDeleteProjectCardInput
    implements Built<GDeleteProjectCardInput, GDeleteProjectCardInputBuilder> {
  GDeleteProjectCardInput._();

  factory GDeleteProjectCardInput(
          [Function(GDeleteProjectCardInputBuilder b) updates]) =
      _$GDeleteProjectCardInput;

  String get cardId;
  String? get clientMutationId;
  static Serializer<GDeleteProjectCardInput> get serializer =>
      _$gDeleteProjectCardInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteProjectCardInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteProjectCardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteProjectCardInput.serializer,
        json,
      );
}

abstract class GDeleteProjectColumnInput
    implements
        Built<GDeleteProjectColumnInput, GDeleteProjectColumnInputBuilder> {
  GDeleteProjectColumnInput._();

  factory GDeleteProjectColumnInput(
          [Function(GDeleteProjectColumnInputBuilder b) updates]) =
      _$GDeleteProjectColumnInput;

  String? get clientMutationId;
  String get columnId;
  static Serializer<GDeleteProjectColumnInput> get serializer =>
      _$gDeleteProjectColumnInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteProjectColumnInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteProjectColumnInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteProjectColumnInput.serializer,
        json,
      );
}

abstract class GDeleteProjectInput
    implements Built<GDeleteProjectInput, GDeleteProjectInputBuilder> {
  GDeleteProjectInput._();

  factory GDeleteProjectInput(
      [Function(GDeleteProjectInputBuilder b) updates]) = _$GDeleteProjectInput;

  String? get clientMutationId;
  String get projectId;
  static Serializer<GDeleteProjectInput> get serializer =>
      _$gDeleteProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteProjectInput.serializer,
        json,
      );
}

abstract class GDeletePullRequestReviewCommentInput
    implements
        Built<GDeletePullRequestReviewCommentInput,
            GDeletePullRequestReviewCommentInputBuilder> {
  GDeletePullRequestReviewCommentInput._();

  factory GDeletePullRequestReviewCommentInput(
          [Function(GDeletePullRequestReviewCommentInputBuilder b) updates]) =
      _$GDeletePullRequestReviewCommentInput;

  String? get clientMutationId;
  String get id;
  static Serializer<GDeletePullRequestReviewCommentInput> get serializer =>
      _$gDeletePullRequestReviewCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePullRequestReviewCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeletePullRequestReviewCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePullRequestReviewCommentInput.serializer,
        json,
      );
}

abstract class GDeletePullRequestReviewInput
    implements
        Built<GDeletePullRequestReviewInput,
            GDeletePullRequestReviewInputBuilder> {
  GDeletePullRequestReviewInput._();

  factory GDeletePullRequestReviewInput(
          [Function(GDeletePullRequestReviewInputBuilder b) updates]) =
      _$GDeletePullRequestReviewInput;

  String? get clientMutationId;
  String get pullRequestReviewId;
  static Serializer<GDeletePullRequestReviewInput> get serializer =>
      _$gDeletePullRequestReviewInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeletePullRequestReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeletePullRequestReviewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeletePullRequestReviewInput.serializer,
        json,
      );
}

abstract class GDeleteRefInput
    implements Built<GDeleteRefInput, GDeleteRefInputBuilder> {
  GDeleteRefInput._();

  factory GDeleteRefInput([Function(GDeleteRefInputBuilder b) updates]) =
      _$GDeleteRefInput;

  String? get clientMutationId;
  String get refId;
  static Serializer<GDeleteRefInput> get serializer =>
      _$gDeleteRefInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteRefInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteRefInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteRefInput.serializer,
        json,
      );
}

abstract class GDeleteTeamDiscussionCommentInput
    implements
        Built<GDeleteTeamDiscussionCommentInput,
            GDeleteTeamDiscussionCommentInputBuilder> {
  GDeleteTeamDiscussionCommentInput._();

  factory GDeleteTeamDiscussionCommentInput(
          [Function(GDeleteTeamDiscussionCommentInputBuilder b) updates]) =
      _$GDeleteTeamDiscussionCommentInput;

  String? get clientMutationId;
  String get id;
  static Serializer<GDeleteTeamDiscussionCommentInput> get serializer =>
      _$gDeleteTeamDiscussionCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteTeamDiscussionCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteTeamDiscussionCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteTeamDiscussionCommentInput.serializer,
        json,
      );
}

abstract class GDeleteTeamDiscussionInput
    implements
        Built<GDeleteTeamDiscussionInput, GDeleteTeamDiscussionInputBuilder> {
  GDeleteTeamDiscussionInput._();

  factory GDeleteTeamDiscussionInput(
          [Function(GDeleteTeamDiscussionInputBuilder b) updates]) =
      _$GDeleteTeamDiscussionInput;

  String? get clientMutationId;
  String get id;
  static Serializer<GDeleteTeamDiscussionInput> get serializer =>
      _$gDeleteTeamDiscussionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteTeamDiscussionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteTeamDiscussionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteTeamDiscussionInput.serializer,
        json,
      );
}

abstract class GDeploymentOrder
    implements Built<GDeploymentOrder, GDeploymentOrderBuilder> {
  GDeploymentOrder._();

  factory GDeploymentOrder([Function(GDeploymentOrderBuilder b) updates]) =
      _$GDeploymentOrder;

  GOrderDirection get direction;
  GDeploymentOrderField get field;
  static Serializer<GDeploymentOrder> get serializer =>
      _$gDeploymentOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeploymentOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeploymentOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeploymentOrder.serializer,
        json,
      );
}

class GDeploymentOrderField extends EnumClass {
  const GDeploymentOrderField._(String name) : super(name);

  static const GDeploymentOrderField CREATED_AT =
      _$gDeploymentOrderFieldCREATED_AT;

  static Serializer<GDeploymentOrderField> get serializer =>
      _$gDeploymentOrderFieldSerializer;

  static BuiltSet<GDeploymentOrderField> get values =>
      _$gDeploymentOrderFieldValues;

  static GDeploymentOrderField valueOf(String name) =>
      _$gDeploymentOrderFieldValueOf(name);
}

class GDeploymentState extends EnumClass {
  const GDeploymentState._(String name) : super(name);

  static const GDeploymentState ABANDONED = _$gDeploymentStateABANDONED;

  static const GDeploymentState ACTIVE = _$gDeploymentStateACTIVE;

  static const GDeploymentState DESTROYED = _$gDeploymentStateDESTROYED;

  static const GDeploymentState ERROR = _$gDeploymentStateERROR;

  static const GDeploymentState FAILURE = _$gDeploymentStateFAILURE;

  static const GDeploymentState INACTIVE = _$gDeploymentStateINACTIVE;

  static const GDeploymentState IN_PROGRESS = _$gDeploymentStateIN_PROGRESS;

  static const GDeploymentState PENDING = _$gDeploymentStatePENDING;

  static const GDeploymentState QUEUED = _$gDeploymentStateQUEUED;

  static Serializer<GDeploymentState> get serializer =>
      _$gDeploymentStateSerializer;

  static BuiltSet<GDeploymentState> get values => _$gDeploymentStateValues;

  static GDeploymentState valueOf(String name) =>
      _$gDeploymentStateValueOf(name);
}

class GDeploymentStatusState extends EnumClass {
  const GDeploymentStatusState._(String name) : super(name);

  static const GDeploymentStatusState ERROR = _$gDeploymentStatusStateERROR;

  static const GDeploymentStatusState FAILURE = _$gDeploymentStatusStateFAILURE;

  static const GDeploymentStatusState INACTIVE =
      _$gDeploymentStatusStateINACTIVE;

  static const GDeploymentStatusState IN_PROGRESS =
      _$gDeploymentStatusStateIN_PROGRESS;

  static const GDeploymentStatusState PENDING = _$gDeploymentStatusStatePENDING;

  static const GDeploymentStatusState QUEUED = _$gDeploymentStatusStateQUEUED;

  static const GDeploymentStatusState SUCCESS = _$gDeploymentStatusStateSUCCESS;

  static Serializer<GDeploymentStatusState> get serializer =>
      _$gDeploymentStatusStateSerializer;

  static BuiltSet<GDeploymentStatusState> get values =>
      _$gDeploymentStatusStateValues;

  static GDeploymentStatusState valueOf(String name) =>
      _$gDeploymentStatusStateValueOf(name);
}

abstract class GDismissPullRequestReviewInput
    implements
        Built<GDismissPullRequestReviewInput,
            GDismissPullRequestReviewInputBuilder> {
  GDismissPullRequestReviewInput._();

  factory GDismissPullRequestReviewInput(
          [Function(GDismissPullRequestReviewInputBuilder b) updates]) =
      _$GDismissPullRequestReviewInput;

  String? get clientMutationId;
  String get message;
  String get pullRequestReviewId;
  static Serializer<GDismissPullRequestReviewInput> get serializer =>
      _$gDismissPullRequestReviewInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDismissPullRequestReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDismissPullRequestReviewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDismissPullRequestReviewInput.serializer,
        json,
      );
}

abstract class GDraftPullRequestReviewComment
    implements
        Built<GDraftPullRequestReviewComment,
            GDraftPullRequestReviewCommentBuilder> {
  GDraftPullRequestReviewComment._();

  factory GDraftPullRequestReviewComment(
          [Function(GDraftPullRequestReviewCommentBuilder b) updates]) =
      _$GDraftPullRequestReviewComment;

  String get body;
  String get path;
  int get position;
  static Serializer<GDraftPullRequestReviewComment> get serializer =>
      _$gDraftPullRequestReviewCommentSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDraftPullRequestReviewComment.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDraftPullRequestReviewComment? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDraftPullRequestReviewComment.serializer,
        json,
      );
}

abstract class GEnterpriseAdministratorInvitationOrder
    implements
        Built<GEnterpriseAdministratorInvitationOrder,
            GEnterpriseAdministratorInvitationOrderBuilder> {
  GEnterpriseAdministratorInvitationOrder._();

  factory GEnterpriseAdministratorInvitationOrder(
      [Function(GEnterpriseAdministratorInvitationOrderBuilder b)
          updates]) = _$GEnterpriseAdministratorInvitationOrder;

  GOrderDirection get direction;
  GEnterpriseAdministratorInvitationOrderField get field;
  static Serializer<GEnterpriseAdministratorInvitationOrder> get serializer =>
      _$gEnterpriseAdministratorInvitationOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseAdministratorInvitationOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseAdministratorInvitationOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseAdministratorInvitationOrder.serializer,
        json,
      );
}

class GEnterpriseAdministratorInvitationOrderField extends EnumClass {
  const GEnterpriseAdministratorInvitationOrderField._(String name)
      : super(name);

  static const GEnterpriseAdministratorInvitationOrderField CREATED_AT =
      _$gEnterpriseAdministratorInvitationOrderFieldCREATED_AT;

  static Serializer<GEnterpriseAdministratorInvitationOrderField>
      get serializer =>
          _$gEnterpriseAdministratorInvitationOrderFieldSerializer;

  static BuiltSet<GEnterpriseAdministratorInvitationOrderField> get values =>
      _$gEnterpriseAdministratorInvitationOrderFieldValues;

  static GEnterpriseAdministratorInvitationOrderField valueOf(String name) =>
      _$gEnterpriseAdministratorInvitationOrderFieldValueOf(name);
}

class GEnterpriseAdministratorRole extends EnumClass {
  const GEnterpriseAdministratorRole._(String name) : super(name);

  static const GEnterpriseAdministratorRole BILLING_MANAGER =
      _$gEnterpriseAdministratorRoleBILLING_MANAGER;

  static const GEnterpriseAdministratorRole OWNER =
      _$gEnterpriseAdministratorRoleOWNER;

  static Serializer<GEnterpriseAdministratorRole> get serializer =>
      _$gEnterpriseAdministratorRoleSerializer;

  static BuiltSet<GEnterpriseAdministratorRole> get values =>
      _$gEnterpriseAdministratorRoleValues;

  static GEnterpriseAdministratorRole valueOf(String name) =>
      _$gEnterpriseAdministratorRoleValueOf(name);
}

class GEnterpriseDefaultRepositoryPermissionSettingValue extends EnumClass {
  const GEnterpriseDefaultRepositoryPermissionSettingValue._(String name)
      : super(name);

  static const GEnterpriseDefaultRepositoryPermissionSettingValue ADMIN =
      _$gEnterpriseDefaultRepositoryPermissionSettingValueADMIN;

  static const GEnterpriseDefaultRepositoryPermissionSettingValue NONE =
      _$gEnterpriseDefaultRepositoryPermissionSettingValueNONE;

  static const GEnterpriseDefaultRepositoryPermissionSettingValue NO_POLICY =
      _$gEnterpriseDefaultRepositoryPermissionSettingValueNO_POLICY;

  static const GEnterpriseDefaultRepositoryPermissionSettingValue READ =
      _$gEnterpriseDefaultRepositoryPermissionSettingValueREAD;

  static const GEnterpriseDefaultRepositoryPermissionSettingValue WRITE =
      _$gEnterpriseDefaultRepositoryPermissionSettingValueWRITE;

  static Serializer<GEnterpriseDefaultRepositoryPermissionSettingValue>
      get serializer =>
          _$gEnterpriseDefaultRepositoryPermissionSettingValueSerializer;

  static BuiltSet<GEnterpriseDefaultRepositoryPermissionSettingValue>
      get values => _$gEnterpriseDefaultRepositoryPermissionSettingValueValues;

  static GEnterpriseDefaultRepositoryPermissionSettingValue valueOf(
          String name) =>
      _$gEnterpriseDefaultRepositoryPermissionSettingValueValueOf(name);
}

class GEnterpriseEnabledDisabledSettingValue extends EnumClass {
  const GEnterpriseEnabledDisabledSettingValue._(String name) : super(name);

  static const GEnterpriseEnabledDisabledSettingValue DISABLED =
      _$gEnterpriseEnabledDisabledSettingValueDISABLED;

  static const GEnterpriseEnabledDisabledSettingValue ENABLED =
      _$gEnterpriseEnabledDisabledSettingValueENABLED;

  static const GEnterpriseEnabledDisabledSettingValue NO_POLICY =
      _$gEnterpriseEnabledDisabledSettingValueNO_POLICY;

  static Serializer<GEnterpriseEnabledDisabledSettingValue> get serializer =>
      _$gEnterpriseEnabledDisabledSettingValueSerializer;

  static BuiltSet<GEnterpriseEnabledDisabledSettingValue> get values =>
      _$gEnterpriseEnabledDisabledSettingValueValues;

  static GEnterpriseEnabledDisabledSettingValue valueOf(String name) =>
      _$gEnterpriseEnabledDisabledSettingValueValueOf(name);
}

class GEnterpriseEnabledSettingValue extends EnumClass {
  const GEnterpriseEnabledSettingValue._(String name) : super(name);

  static const GEnterpriseEnabledSettingValue ENABLED =
      _$gEnterpriseEnabledSettingValueENABLED;

  static const GEnterpriseEnabledSettingValue NO_POLICY =
      _$gEnterpriseEnabledSettingValueNO_POLICY;

  static Serializer<GEnterpriseEnabledSettingValue> get serializer =>
      _$gEnterpriseEnabledSettingValueSerializer;

  static BuiltSet<GEnterpriseEnabledSettingValue> get values =>
      _$gEnterpriseEnabledSettingValueValues;

  static GEnterpriseEnabledSettingValue valueOf(String name) =>
      _$gEnterpriseEnabledSettingValueValueOf(name);
}

abstract class GEnterpriseMemberOrder
    implements Built<GEnterpriseMemberOrder, GEnterpriseMemberOrderBuilder> {
  GEnterpriseMemberOrder._();

  factory GEnterpriseMemberOrder(
          [Function(GEnterpriseMemberOrderBuilder b) updates]) =
      _$GEnterpriseMemberOrder;

  GOrderDirection get direction;
  GEnterpriseMemberOrderField get field;
  static Serializer<GEnterpriseMemberOrder> get serializer =>
      _$gEnterpriseMemberOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseMemberOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseMemberOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseMemberOrder.serializer,
        json,
      );
}

class GEnterpriseMemberOrderField extends EnumClass {
  const GEnterpriseMemberOrderField._(String name) : super(name);

  static const GEnterpriseMemberOrderField CREATED_AT =
      _$gEnterpriseMemberOrderFieldCREATED_AT;

  static const GEnterpriseMemberOrderField LOGIN =
      _$gEnterpriseMemberOrderFieldLOGIN;

  static Serializer<GEnterpriseMemberOrderField> get serializer =>
      _$gEnterpriseMemberOrderFieldSerializer;

  static BuiltSet<GEnterpriseMemberOrderField> get values =>
      _$gEnterpriseMemberOrderFieldValues;

  static GEnterpriseMemberOrderField valueOf(String name) =>
      _$gEnterpriseMemberOrderFieldValueOf(name);
}

class GEnterpriseMembersCanCreateRepositoriesSettingValue extends EnumClass {
  const GEnterpriseMembersCanCreateRepositoriesSettingValue._(String name)
      : super(name);

  static const GEnterpriseMembersCanCreateRepositoriesSettingValue ALL =
      _$gEnterpriseMembersCanCreateRepositoriesSettingValueALL;

  static const GEnterpriseMembersCanCreateRepositoriesSettingValue DISABLED =
      _$gEnterpriseMembersCanCreateRepositoriesSettingValueDISABLED;

  static const GEnterpriseMembersCanCreateRepositoriesSettingValue NO_POLICY =
      _$gEnterpriseMembersCanCreateRepositoriesSettingValueNO_POLICY;

  static const GEnterpriseMembersCanCreateRepositoriesSettingValue PRIVATE =
      _$gEnterpriseMembersCanCreateRepositoriesSettingValuePRIVATE;

  static const GEnterpriseMembersCanCreateRepositoriesSettingValue PUBLIC =
      _$gEnterpriseMembersCanCreateRepositoriesSettingValuePUBLIC;

  static Serializer<GEnterpriseMembersCanCreateRepositoriesSettingValue>
      get serializer =>
          _$gEnterpriseMembersCanCreateRepositoriesSettingValueSerializer;

  static BuiltSet<GEnterpriseMembersCanCreateRepositoriesSettingValue>
      get values => _$gEnterpriseMembersCanCreateRepositoriesSettingValueValues;

  static GEnterpriseMembersCanCreateRepositoriesSettingValue valueOf(
          String name) =>
      _$gEnterpriseMembersCanCreateRepositoriesSettingValueValueOf(name);
}

class GEnterpriseMembersCanMakePurchasesSettingValue extends EnumClass {
  const GEnterpriseMembersCanMakePurchasesSettingValue._(String name)
      : super(name);

  static const GEnterpriseMembersCanMakePurchasesSettingValue DISABLED =
      _$gEnterpriseMembersCanMakePurchasesSettingValueDISABLED;

  static const GEnterpriseMembersCanMakePurchasesSettingValue ENABLED =
      _$gEnterpriseMembersCanMakePurchasesSettingValueENABLED;

  static Serializer<GEnterpriseMembersCanMakePurchasesSettingValue>
      get serializer =>
          _$gEnterpriseMembersCanMakePurchasesSettingValueSerializer;

  static BuiltSet<GEnterpriseMembersCanMakePurchasesSettingValue> get values =>
      _$gEnterpriseMembersCanMakePurchasesSettingValueValues;

  static GEnterpriseMembersCanMakePurchasesSettingValue valueOf(String name) =>
      _$gEnterpriseMembersCanMakePurchasesSettingValueValueOf(name);
}

abstract class GEnterpriseServerInstallationOrder
    implements
        Built<GEnterpriseServerInstallationOrder,
            GEnterpriseServerInstallationOrderBuilder> {
  GEnterpriseServerInstallationOrder._();

  factory GEnterpriseServerInstallationOrder(
          [Function(GEnterpriseServerInstallationOrderBuilder b) updates]) =
      _$GEnterpriseServerInstallationOrder;

  GOrderDirection get direction;
  GEnterpriseServerInstallationOrderField get field;
  static Serializer<GEnterpriseServerInstallationOrder> get serializer =>
      _$gEnterpriseServerInstallationOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseServerInstallationOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseServerInstallationOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseServerInstallationOrder.serializer,
        json,
      );
}

class GEnterpriseServerInstallationOrderField extends EnumClass {
  const GEnterpriseServerInstallationOrderField._(String name) : super(name);

  static const GEnterpriseServerInstallationOrderField CREATED_AT =
      _$gEnterpriseServerInstallationOrderFieldCREATED_AT;

  static const GEnterpriseServerInstallationOrderField CUSTOMER_NAME =
      _$gEnterpriseServerInstallationOrderFieldCUSTOMER_NAME;

  static const GEnterpriseServerInstallationOrderField HOST_NAME =
      _$gEnterpriseServerInstallationOrderFieldHOST_NAME;

  static Serializer<GEnterpriseServerInstallationOrderField> get serializer =>
      _$gEnterpriseServerInstallationOrderFieldSerializer;

  static BuiltSet<GEnterpriseServerInstallationOrderField> get values =>
      _$gEnterpriseServerInstallationOrderFieldValues;

  static GEnterpriseServerInstallationOrderField valueOf(String name) =>
      _$gEnterpriseServerInstallationOrderFieldValueOf(name);
}

abstract class GEnterpriseServerUserAccountEmailOrder
    implements
        Built<GEnterpriseServerUserAccountEmailOrder,
            GEnterpriseServerUserAccountEmailOrderBuilder> {
  GEnterpriseServerUserAccountEmailOrder._();

  factory GEnterpriseServerUserAccountEmailOrder(
          [Function(GEnterpriseServerUserAccountEmailOrderBuilder b) updates]) =
      _$GEnterpriseServerUserAccountEmailOrder;

  GOrderDirection get direction;
  GEnterpriseServerUserAccountEmailOrderField get field;
  static Serializer<GEnterpriseServerUserAccountEmailOrder> get serializer =>
      _$gEnterpriseServerUserAccountEmailOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseServerUserAccountEmailOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseServerUserAccountEmailOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseServerUserAccountEmailOrder.serializer,
        json,
      );
}

class GEnterpriseServerUserAccountEmailOrderField extends EnumClass {
  const GEnterpriseServerUserAccountEmailOrderField._(String name)
      : super(name);

  static const GEnterpriseServerUserAccountEmailOrderField EMAIL =
      _$gEnterpriseServerUserAccountEmailOrderFieldEMAIL;

  static Serializer<GEnterpriseServerUserAccountEmailOrderField>
      get serializer => _$gEnterpriseServerUserAccountEmailOrderFieldSerializer;

  static BuiltSet<GEnterpriseServerUserAccountEmailOrderField> get values =>
      _$gEnterpriseServerUserAccountEmailOrderFieldValues;

  static GEnterpriseServerUserAccountEmailOrderField valueOf(String name) =>
      _$gEnterpriseServerUserAccountEmailOrderFieldValueOf(name);
}

abstract class GEnterpriseServerUserAccountOrder
    implements
        Built<GEnterpriseServerUserAccountOrder,
            GEnterpriseServerUserAccountOrderBuilder> {
  GEnterpriseServerUserAccountOrder._();

  factory GEnterpriseServerUserAccountOrder(
          [Function(GEnterpriseServerUserAccountOrderBuilder b) updates]) =
      _$GEnterpriseServerUserAccountOrder;

  GOrderDirection get direction;
  GEnterpriseServerUserAccountOrderField get field;
  static Serializer<GEnterpriseServerUserAccountOrder> get serializer =>
      _$gEnterpriseServerUserAccountOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseServerUserAccountOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseServerUserAccountOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseServerUserAccountOrder.serializer,
        json,
      );
}

class GEnterpriseServerUserAccountOrderField extends EnumClass {
  const GEnterpriseServerUserAccountOrderField._(String name) : super(name);

  static const GEnterpriseServerUserAccountOrderField LOGIN =
      _$gEnterpriseServerUserAccountOrderFieldLOGIN;

  static const GEnterpriseServerUserAccountOrderField REMOTE_CREATED_AT =
      _$gEnterpriseServerUserAccountOrderFieldREMOTE_CREATED_AT;

  static Serializer<GEnterpriseServerUserAccountOrderField> get serializer =>
      _$gEnterpriseServerUserAccountOrderFieldSerializer;

  static BuiltSet<GEnterpriseServerUserAccountOrderField> get values =>
      _$gEnterpriseServerUserAccountOrderFieldValues;

  static GEnterpriseServerUserAccountOrderField valueOf(String name) =>
      _$gEnterpriseServerUserAccountOrderFieldValueOf(name);
}

abstract class GEnterpriseServerUserAccountsUploadOrder
    implements
        Built<GEnterpriseServerUserAccountsUploadOrder,
            GEnterpriseServerUserAccountsUploadOrderBuilder> {
  GEnterpriseServerUserAccountsUploadOrder._();

  factory GEnterpriseServerUserAccountsUploadOrder(
      [Function(GEnterpriseServerUserAccountsUploadOrderBuilder b)
          updates]) = _$GEnterpriseServerUserAccountsUploadOrder;

  GOrderDirection get direction;
  GEnterpriseServerUserAccountsUploadOrderField get field;
  static Serializer<GEnterpriseServerUserAccountsUploadOrder> get serializer =>
      _$gEnterpriseServerUserAccountsUploadOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnterpriseServerUserAccountsUploadOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEnterpriseServerUserAccountsUploadOrder? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnterpriseServerUserAccountsUploadOrder.serializer,
        json,
      );
}

class GEnterpriseServerUserAccountsUploadOrderField extends EnumClass {
  const GEnterpriseServerUserAccountsUploadOrderField._(String name)
      : super(name);

  static const GEnterpriseServerUserAccountsUploadOrderField CREATED_AT =
      _$gEnterpriseServerUserAccountsUploadOrderFieldCREATED_AT;

  static Serializer<GEnterpriseServerUserAccountsUploadOrderField>
      get serializer =>
          _$gEnterpriseServerUserAccountsUploadOrderFieldSerializer;

  static BuiltSet<GEnterpriseServerUserAccountsUploadOrderField> get values =>
      _$gEnterpriseServerUserAccountsUploadOrderFieldValues;

  static GEnterpriseServerUserAccountsUploadOrderField valueOf(String name) =>
      _$gEnterpriseServerUserAccountsUploadOrderFieldValueOf(name);
}

class GEnterpriseServerUserAccountsUploadSyncState extends EnumClass {
  const GEnterpriseServerUserAccountsUploadSyncState._(String name)
      : super(name);

  static const GEnterpriseServerUserAccountsUploadSyncState FAILURE =
      _$gEnterpriseServerUserAccountsUploadSyncStateFAILURE;

  static const GEnterpriseServerUserAccountsUploadSyncState PENDING =
      _$gEnterpriseServerUserAccountsUploadSyncStatePENDING;

  static const GEnterpriseServerUserAccountsUploadSyncState SUCCESS =
      _$gEnterpriseServerUserAccountsUploadSyncStateSUCCESS;

  static Serializer<GEnterpriseServerUserAccountsUploadSyncState>
      get serializer =>
          _$gEnterpriseServerUserAccountsUploadSyncStateSerializer;

  static BuiltSet<GEnterpriseServerUserAccountsUploadSyncState> get values =>
      _$gEnterpriseServerUserAccountsUploadSyncStateValues;

  static GEnterpriseServerUserAccountsUploadSyncState valueOf(String name) =>
      _$gEnterpriseServerUserAccountsUploadSyncStateValueOf(name);
}

class GEnterpriseUserAccountMembershipRole extends EnumClass {
  const GEnterpriseUserAccountMembershipRole._(String name) : super(name);

  static const GEnterpriseUserAccountMembershipRole MEMBER =
      _$gEnterpriseUserAccountMembershipRoleMEMBER;

  static const GEnterpriseUserAccountMembershipRole OWNER =
      _$gEnterpriseUserAccountMembershipRoleOWNER;

  static Serializer<GEnterpriseUserAccountMembershipRole> get serializer =>
      _$gEnterpriseUserAccountMembershipRoleSerializer;

  static BuiltSet<GEnterpriseUserAccountMembershipRole> get values =>
      _$gEnterpriseUserAccountMembershipRoleValues;

  static GEnterpriseUserAccountMembershipRole valueOf(String name) =>
      _$gEnterpriseUserAccountMembershipRoleValueOf(name);
}

class GEnterpriseUserDeployment extends EnumClass {
  const GEnterpriseUserDeployment._(String name) : super(name);

  static const GEnterpriseUserDeployment CLOUD =
      _$gEnterpriseUserDeploymentCLOUD;

  static const GEnterpriseUserDeployment SERVER =
      _$gEnterpriseUserDeploymentSERVER;

  static Serializer<GEnterpriseUserDeployment> get serializer =>
      _$gEnterpriseUserDeploymentSerializer;

  static BuiltSet<GEnterpriseUserDeployment> get values =>
      _$gEnterpriseUserDeploymentValues;

  static GEnterpriseUserDeployment valueOf(String name) =>
      _$gEnterpriseUserDeploymentValueOf(name);
}

abstract class GFollowUserInput
    implements Built<GFollowUserInput, GFollowUserInputBuilder> {
  GFollowUserInput._();

  factory GFollowUserInput([Function(GFollowUserInputBuilder b) updates]) =
      _$GFollowUserInput;

  String? get clientMutationId;
  String get userId;
  static Serializer<GFollowUserInput> get serializer =>
      _$gFollowUserInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFollowUserInput.serializer,
        json,
      );
}

class GFundingPlatform extends EnumClass {
  const GFundingPlatform._(String name) : super(name);

  static const GFundingPlatform COMMUNITY_BRIDGE =
      _$gFundingPlatformCOMMUNITY_BRIDGE;

  static const GFundingPlatform CUSTOM = _$gFundingPlatformCUSTOM;

  static const GFundingPlatform GITHUB = _$gFundingPlatformGITHUB;

  static const GFundingPlatform ISSUEHUNT = _$gFundingPlatformISSUEHUNT;

  static const GFundingPlatform KO_FI = _$gFundingPlatformKO_FI;

  static const GFundingPlatform LIBERAPAY = _$gFundingPlatformLIBERAPAY;

  static const GFundingPlatform OPEN_COLLECTIVE =
      _$gFundingPlatformOPEN_COLLECTIVE;

  static const GFundingPlatform OTECHIE = _$gFundingPlatformOTECHIE;

  static const GFundingPlatform PATREON = _$gFundingPlatformPATREON;

  static const GFundingPlatform TIDELIFT = _$gFundingPlatformTIDELIFT;

  static Serializer<GFundingPlatform> get serializer =>
      _$gFundingPlatformSerializer;

  static BuiltSet<GFundingPlatform> get values => _$gFundingPlatformValues;

  static GFundingPlatform valueOf(String name) =>
      _$gFundingPlatformValueOf(name);
}

abstract class GGistOrder implements Built<GGistOrder, GGistOrderBuilder> {
  GGistOrder._();

  factory GGistOrder([Function(GGistOrderBuilder b) updates]) = _$GGistOrder;

  GOrderDirection get direction;
  GGistOrderField get field;
  static Serializer<GGistOrder> get serializer => _$gGistOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGistOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGistOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGistOrder.serializer,
        json,
      );
}

class GGistOrderField extends EnumClass {
  const GGistOrderField._(String name) : super(name);

  static const GGistOrderField CREATED_AT = _$gGistOrderFieldCREATED_AT;

  static const GGistOrderField PUSHED_AT = _$gGistOrderFieldPUSHED_AT;

  static const GGistOrderField UPDATED_AT = _$gGistOrderFieldUPDATED_AT;

  static Serializer<GGistOrderField> get serializer =>
      _$gGistOrderFieldSerializer;

  static BuiltSet<GGistOrderField> get values => _$gGistOrderFieldValues;

  static GGistOrderField valueOf(String name) => _$gGistOrderFieldValueOf(name);
}

class GGistPrivacy extends EnumClass {
  const GGistPrivacy._(String name) : super(name);

  static const GGistPrivacy ALL = _$gGistPrivacyALL;

  static const GGistPrivacy PUBLIC = _$gGistPrivacyPUBLIC;

  static const GGistPrivacy SECRET = _$gGistPrivacySECRET;

  static Serializer<GGistPrivacy> get serializer => _$gGistPrivacySerializer;

  static BuiltSet<GGistPrivacy> get values => _$gGistPrivacyValues;

  static GGistPrivacy valueOf(String name) => _$gGistPrivacyValueOf(name);
}

abstract class GGitObjectID
    implements Built<GGitObjectID, GGitObjectIDBuilder> {
  GGitObjectID._();

  factory GGitObjectID([String? value]) =>
      _$GGitObjectID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGitObjectID> get serializer =>
      _i2.DefaultScalarSerializer<GGitObjectID>(
          (Object serialized) => GGitObjectID((serialized as String?)));
}

abstract class GGitSSHRemote
    implements Built<GGitSSHRemote, GGitSSHRemoteBuilder> {
  GGitSSHRemote._();

  factory GGitSSHRemote([String? value]) =>
      _$GGitSSHRemote((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGitSSHRemote> get serializer =>
      _i2.DefaultScalarSerializer<GGitSSHRemote>(
          (Object serialized) => GGitSSHRemote((serialized as String?)));
}

class GGitSignatureState extends EnumClass {
  const GGitSignatureState._(String name) : super(name);

  static const GGitSignatureState BAD_CERT = _$gGitSignatureStateBAD_CERT;

  static const GGitSignatureState BAD_EMAIL = _$gGitSignatureStateBAD_EMAIL;

  static const GGitSignatureState EXPIRED_KEY = _$gGitSignatureStateEXPIRED_KEY;

  static const GGitSignatureState GPGVERIFY_ERROR =
      _$gGitSignatureStateGPGVERIFY_ERROR;

  static const GGitSignatureState GPGVERIFY_UNAVAILABLE =
      _$gGitSignatureStateGPGVERIFY_UNAVAILABLE;

  static const GGitSignatureState INVALID = _$gGitSignatureStateINVALID;

  static const GGitSignatureState MALFORMED_SIG =
      _$gGitSignatureStateMALFORMED_SIG;

  static const GGitSignatureState NOT_SIGNING_KEY =
      _$gGitSignatureStateNOT_SIGNING_KEY;

  static const GGitSignatureState NO_USER = _$gGitSignatureStateNO_USER;

  static const GGitSignatureState OCSP_ERROR = _$gGitSignatureStateOCSP_ERROR;

  static const GGitSignatureState OCSP_PENDING =
      _$gGitSignatureStateOCSP_PENDING;

  static const GGitSignatureState OCSP_REVOKED =
      _$gGitSignatureStateOCSP_REVOKED;

  static const GGitSignatureState UNKNOWN_KEY = _$gGitSignatureStateUNKNOWN_KEY;

  static const GGitSignatureState UNKNOWN_SIG_TYPE =
      _$gGitSignatureStateUNKNOWN_SIG_TYPE;

  static const GGitSignatureState UNSIGNED = _$gGitSignatureStateUNSIGNED;

  static const GGitSignatureState UNVERIFIED_EMAIL =
      _$gGitSignatureStateUNVERIFIED_EMAIL;

  static const GGitSignatureState VALID = _$gGitSignatureStateVALID;

  static Serializer<GGitSignatureState> get serializer =>
      _$gGitSignatureStateSerializer;

  static BuiltSet<GGitSignatureState> get values => _$gGitSignatureStateValues;

  static GGitSignatureState valueOf(String name) =>
      _$gGitSignatureStateValueOf(name);
}

abstract class GGitTimestamp
    implements Built<GGitTimestamp, GGitTimestampBuilder> {
  GGitTimestamp._();

  factory GGitTimestamp([String? value]) =>
      _$GGitTimestamp((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGitTimestamp> get serializer =>
      _i2.DefaultScalarSerializer<GGitTimestamp>(
          (Object serialized) => GGitTimestamp((serialized as String?)));
}

abstract class GHTML implements Built<GHTML, GHTMLBuilder> {
  GHTML._();

  factory GHTML([String? value]) =>
      _$GHTML((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GHTML> get serializer => _i2.DefaultScalarSerializer<GHTML>(
      (Object serialized) => GHTML((serialized as String?)));
}

class GIdentityProviderConfigurationState extends EnumClass {
  const GIdentityProviderConfigurationState._(String name) : super(name);

  static const GIdentityProviderConfigurationState CONFIGURED =
      _$gIdentityProviderConfigurationStateCONFIGURED;

  static const GIdentityProviderConfigurationState ENFORCED =
      _$gIdentityProviderConfigurationStateENFORCED;

  static const GIdentityProviderConfigurationState UNCONFIGURED =
      _$gIdentityProviderConfigurationStateUNCONFIGURED;

  static Serializer<GIdentityProviderConfigurationState> get serializer =>
      _$gIdentityProviderConfigurationStateSerializer;

  static BuiltSet<GIdentityProviderConfigurationState> get values =>
      _$gIdentityProviderConfigurationStateValues;

  static GIdentityProviderConfigurationState valueOf(String name) =>
      _$gIdentityProviderConfigurationStateValueOf(name);
}

abstract class GInviteEnterpriseAdminInput
    implements
        Built<GInviteEnterpriseAdminInput, GInviteEnterpriseAdminInputBuilder> {
  GInviteEnterpriseAdminInput._();

  factory GInviteEnterpriseAdminInput(
          [Function(GInviteEnterpriseAdminInputBuilder b) updates]) =
      _$GInviteEnterpriseAdminInput;

  String? get clientMutationId;
  String? get email;
  String get enterpriseId;
  String? get invitee;
  GEnterpriseAdministratorRole? get role;
  static Serializer<GInviteEnterpriseAdminInput> get serializer =>
      _$gInviteEnterpriseAdminInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInviteEnterpriseAdminInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInviteEnterpriseAdminInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInviteEnterpriseAdminInput.serializer,
        json,
      );
}

abstract class GIssueFilters
    implements Built<GIssueFilters, GIssueFiltersBuilder> {
  GIssueFilters._();

  factory GIssueFilters([Function(GIssueFiltersBuilder b) updates]) =
      _$GIssueFilters;

  String? get assignee;
  String? get createdBy;
  BuiltList<String>? get labels;
  String? get mentioned;
  String? get milestone;
  GDateTime? get since;
  BuiltList<GIssueState>? get states;
  bool? get viewerSubscribed;
  static Serializer<GIssueFilters> get serializer => _$gIssueFiltersSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueFilters.serializer,
        this,
      ) as Map<String, dynamic>);

  static GIssueFilters? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueFilters.serializer,
        json,
      );
}

abstract class GIssueOrder implements Built<GIssueOrder, GIssueOrderBuilder> {
  GIssueOrder._();

  factory GIssueOrder([Function(GIssueOrderBuilder b) updates]) = _$GIssueOrder;

  GOrderDirection get direction;
  GIssueOrderField get field;
  static Serializer<GIssueOrder> get serializer => _$gIssueOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GIssueOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueOrder.serializer,
        json,
      );
}

class GIssueOrderField extends EnumClass {
  const GIssueOrderField._(String name) : super(name);

  static const GIssueOrderField COMMENTS = _$gIssueOrderFieldCOMMENTS;

  static const GIssueOrderField CREATED_AT = _$gIssueOrderFieldCREATED_AT;

  static const GIssueOrderField UPDATED_AT = _$gIssueOrderFieldUPDATED_AT;

  static Serializer<GIssueOrderField> get serializer =>
      _$gIssueOrderFieldSerializer;

  static BuiltSet<GIssueOrderField> get values => _$gIssueOrderFieldValues;

  static GIssueOrderField valueOf(String name) =>
      _$gIssueOrderFieldValueOf(name);
}

class GIssueState extends EnumClass {
  const GIssueState._(String name) : super(name);

  static const GIssueState CLOSED = _$gIssueStateCLOSED;

  static const GIssueState OPEN = _$gIssueStateOPEN;

  static Serializer<GIssueState> get serializer => _$gIssueStateSerializer;

  static BuiltSet<GIssueState> get values => _$gIssueStateValues;

  static GIssueState valueOf(String name) => _$gIssueStateValueOf(name);
}

class GIssueTimelineItemsItemType extends EnumClass {
  const GIssueTimelineItemsItemType._(String name) : super(name);

  static const GIssueTimelineItemsItemType ADDED_TO_PROJECT_EVENT =
      _$gIssueTimelineItemsItemTypeADDED_TO_PROJECT_EVENT;

  static const GIssueTimelineItemsItemType ASSIGNED_EVENT =
      _$gIssueTimelineItemsItemTypeASSIGNED_EVENT;

  static const GIssueTimelineItemsItemType CLOSED_EVENT =
      _$gIssueTimelineItemsItemTypeCLOSED_EVENT;

  static const GIssueTimelineItemsItemType COMMENT_DELETED_EVENT =
      _$gIssueTimelineItemsItemTypeCOMMENT_DELETED_EVENT;

  static const GIssueTimelineItemsItemType CONNECTED_EVENT =
      _$gIssueTimelineItemsItemTypeCONNECTED_EVENT;

  static const GIssueTimelineItemsItemType CONVERTED_NOTE_TO_ISSUE_EVENT =
      _$gIssueTimelineItemsItemTypeCONVERTED_NOTE_TO_ISSUE_EVENT;

  static const GIssueTimelineItemsItemType CROSS_REFERENCED_EVENT =
      _$gIssueTimelineItemsItemTypeCROSS_REFERENCED_EVENT;

  static const GIssueTimelineItemsItemType DEMILESTONED_EVENT =
      _$gIssueTimelineItemsItemTypeDEMILESTONED_EVENT;

  static const GIssueTimelineItemsItemType DISCONNECTED_EVENT =
      _$gIssueTimelineItemsItemTypeDISCONNECTED_EVENT;

  static const GIssueTimelineItemsItemType ISSUE_COMMENT =
      _$gIssueTimelineItemsItemTypeISSUE_COMMENT;

  static const GIssueTimelineItemsItemType LABELED_EVENT =
      _$gIssueTimelineItemsItemTypeLABELED_EVENT;

  static const GIssueTimelineItemsItemType LOCKED_EVENT =
      _$gIssueTimelineItemsItemTypeLOCKED_EVENT;

  static const GIssueTimelineItemsItemType MARKED_AS_DUPLICATE_EVENT =
      _$gIssueTimelineItemsItemTypeMARKED_AS_DUPLICATE_EVENT;

  static const GIssueTimelineItemsItemType MENTIONED_EVENT =
      _$gIssueTimelineItemsItemTypeMENTIONED_EVENT;

  static const GIssueTimelineItemsItemType MILESTONED_EVENT =
      _$gIssueTimelineItemsItemTypeMILESTONED_EVENT;

  static const GIssueTimelineItemsItemType MOVED_COLUMNS_IN_PROJECT_EVENT =
      _$gIssueTimelineItemsItemTypeMOVED_COLUMNS_IN_PROJECT_EVENT;

  static const GIssueTimelineItemsItemType PINNED_EVENT =
      _$gIssueTimelineItemsItemTypePINNED_EVENT;

  static const GIssueTimelineItemsItemType REFERENCED_EVENT =
      _$gIssueTimelineItemsItemTypeREFERENCED_EVENT;

  static const GIssueTimelineItemsItemType REMOVED_FROM_PROJECT_EVENT =
      _$gIssueTimelineItemsItemTypeREMOVED_FROM_PROJECT_EVENT;

  static const GIssueTimelineItemsItemType RENAMED_TITLE_EVENT =
      _$gIssueTimelineItemsItemTypeRENAMED_TITLE_EVENT;

  static const GIssueTimelineItemsItemType REOPENED_EVENT =
      _$gIssueTimelineItemsItemTypeREOPENED_EVENT;

  static const GIssueTimelineItemsItemType SUBSCRIBED_EVENT =
      _$gIssueTimelineItemsItemTypeSUBSCRIBED_EVENT;

  static const GIssueTimelineItemsItemType TRANSFERRED_EVENT =
      _$gIssueTimelineItemsItemTypeTRANSFERRED_EVENT;

  static const GIssueTimelineItemsItemType UNASSIGNED_EVENT =
      _$gIssueTimelineItemsItemTypeUNASSIGNED_EVENT;

  static const GIssueTimelineItemsItemType UNLABELED_EVENT =
      _$gIssueTimelineItemsItemTypeUNLABELED_EVENT;

  static const GIssueTimelineItemsItemType UNLOCKED_EVENT =
      _$gIssueTimelineItemsItemTypeUNLOCKED_EVENT;

  static const GIssueTimelineItemsItemType UNMARKED_AS_DUPLICATE_EVENT =
      _$gIssueTimelineItemsItemTypeUNMARKED_AS_DUPLICATE_EVENT;

  static const GIssueTimelineItemsItemType UNPINNED_EVENT =
      _$gIssueTimelineItemsItemTypeUNPINNED_EVENT;

  static const GIssueTimelineItemsItemType UNSUBSCRIBED_EVENT =
      _$gIssueTimelineItemsItemTypeUNSUBSCRIBED_EVENT;

  static const GIssueTimelineItemsItemType USER_BLOCKED_EVENT =
      _$gIssueTimelineItemsItemTypeUSER_BLOCKED_EVENT;

  static Serializer<GIssueTimelineItemsItemType> get serializer =>
      _$gIssueTimelineItemsItemTypeSerializer;

  static BuiltSet<GIssueTimelineItemsItemType> get values =>
      _$gIssueTimelineItemsItemTypeValues;

  static GIssueTimelineItemsItemType valueOf(String name) =>
      _$gIssueTimelineItemsItemTypeValueOf(name);
}

abstract class GLabelOrder implements Built<GLabelOrder, GLabelOrderBuilder> {
  GLabelOrder._();

  factory GLabelOrder([Function(GLabelOrderBuilder b) updates]) = _$GLabelOrder;

  GOrderDirection get direction;
  GLabelOrderField get field;
  static Serializer<GLabelOrder> get serializer => _$gLabelOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLabelOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLabelOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLabelOrder.serializer,
        json,
      );
}

class GLabelOrderField extends EnumClass {
  const GLabelOrderField._(String name) : super(name);

  static const GLabelOrderField CREATED_AT = _$gLabelOrderFieldCREATED_AT;

  static const GLabelOrderField NAME = _$gLabelOrderFieldNAME;

  static Serializer<GLabelOrderField> get serializer =>
      _$gLabelOrderFieldSerializer;

  static BuiltSet<GLabelOrderField> get values => _$gLabelOrderFieldValues;

  static GLabelOrderField valueOf(String name) =>
      _$gLabelOrderFieldValueOf(name);
}

abstract class GLanguageOrder
    implements Built<GLanguageOrder, GLanguageOrderBuilder> {
  GLanguageOrder._();

  factory GLanguageOrder([Function(GLanguageOrderBuilder b) updates]) =
      _$GLanguageOrder;

  GOrderDirection get direction;
  GLanguageOrderField get field;
  static Serializer<GLanguageOrder> get serializer =>
      _$gLanguageOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLanguageOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLanguageOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLanguageOrder.serializer,
        json,
      );
}

class GLanguageOrderField extends EnumClass {
  const GLanguageOrderField._(String name) : super(name);

  static const GLanguageOrderField SIZE = _$gLanguageOrderFieldSIZE;

  static Serializer<GLanguageOrderField> get serializer =>
      _$gLanguageOrderFieldSerializer;

  static BuiltSet<GLanguageOrderField> get values =>
      _$gLanguageOrderFieldValues;

  static GLanguageOrderField valueOf(String name) =>
      _$gLanguageOrderFieldValueOf(name);
}

abstract class GLinkRepositoryToProjectInput
    implements
        Built<GLinkRepositoryToProjectInput,
            GLinkRepositoryToProjectInputBuilder> {
  GLinkRepositoryToProjectInput._();

  factory GLinkRepositoryToProjectInput(
          [Function(GLinkRepositoryToProjectInputBuilder b) updates]) =
      _$GLinkRepositoryToProjectInput;

  String? get clientMutationId;
  String get projectId;
  String get repositoryId;
  static Serializer<GLinkRepositoryToProjectInput> get serializer =>
      _$gLinkRepositoryToProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLinkRepositoryToProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLinkRepositoryToProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLinkRepositoryToProjectInput.serializer,
        json,
      );
}

abstract class GLockLockableInput
    implements Built<GLockLockableInput, GLockLockableInputBuilder> {
  GLockLockableInput._();

  factory GLockLockableInput([Function(GLockLockableInputBuilder b) updates]) =
      _$GLockLockableInput;

  String? get clientMutationId;
  GLockReason? get lockReason;
  String get lockableId;
  static Serializer<GLockLockableInput> get serializer =>
      _$gLockLockableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLockLockableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLockLockableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLockLockableInput.serializer,
        json,
      );
}

class GLockReason extends EnumClass {
  const GLockReason._(String name) : super(name);

  static const GLockReason OFF_TOPIC = _$gLockReasonOFF_TOPIC;

  static const GLockReason RESOLVED = _$gLockReasonRESOLVED;

  static const GLockReason SPAM = _$gLockReasonSPAM;

  static const GLockReason TOO_HEATED = _$gLockReasonTOO_HEATED;

  static Serializer<GLockReason> get serializer => _$gLockReasonSerializer;

  static BuiltSet<GLockReason> get values => _$gLockReasonValues;

  static GLockReason valueOf(String name) => _$gLockReasonValueOf(name);
}

abstract class GMergeBranchInput
    implements Built<GMergeBranchInput, GMergeBranchInputBuilder> {
  GMergeBranchInput._();

  factory GMergeBranchInput([Function(GMergeBranchInputBuilder b) updates]) =
      _$GMergeBranchInput;

  String get base;
  String? get clientMutationId;
  String? get commitMessage;
  String get head;
  String get repositoryId;
  static Serializer<GMergeBranchInput> get serializer =>
      _$gMergeBranchInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeBranchInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMergeBranchInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeBranchInput.serializer,
        json,
      );
}

abstract class GMergePullRequestInput
    implements Built<GMergePullRequestInput, GMergePullRequestInputBuilder> {
  GMergePullRequestInput._();

  factory GMergePullRequestInput(
          [Function(GMergePullRequestInputBuilder b) updates]) =
      _$GMergePullRequestInput;

  String? get clientMutationId;
  String? get commitBody;
  String? get commitHeadline;
  GGitObjectID? get expectedHeadOid;
  GPullRequestMergeMethod? get mergeMethod;
  String get pullRequestId;
  static Serializer<GMergePullRequestInput> get serializer =>
      _$gMergePullRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergePullRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMergePullRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergePullRequestInput.serializer,
        json,
      );
}

class GMergeableState extends EnumClass {
  const GMergeableState._(String name) : super(name);

  static const GMergeableState CONFLICTING = _$gMergeableStateCONFLICTING;

  static const GMergeableState MERGEABLE = _$gMergeableStateMERGEABLE;

  static const GMergeableState UNKNOWN = _$gMergeableStateUNKNOWN;

  static Serializer<GMergeableState> get serializer =>
      _$gMergeableStateSerializer;

  static BuiltSet<GMergeableState> get values => _$gMergeableStateValues;

  static GMergeableState valueOf(String name) => _$gMergeableStateValueOf(name);
}

abstract class GMilestoneOrder
    implements Built<GMilestoneOrder, GMilestoneOrderBuilder> {
  GMilestoneOrder._();

  factory GMilestoneOrder([Function(GMilestoneOrderBuilder b) updates]) =
      _$GMilestoneOrder;

  GOrderDirection get direction;
  GMilestoneOrderField get field;
  static Serializer<GMilestoneOrder> get serializer =>
      _$gMilestoneOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMilestoneOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMilestoneOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMilestoneOrder.serializer,
        json,
      );
}

class GMilestoneOrderField extends EnumClass {
  const GMilestoneOrderField._(String name) : super(name);

  static const GMilestoneOrderField CREATED_AT =
      _$gMilestoneOrderFieldCREATED_AT;

  static const GMilestoneOrderField DUE_DATE = _$gMilestoneOrderFieldDUE_DATE;

  static const GMilestoneOrderField NUMBER = _$gMilestoneOrderFieldNUMBER;

  static const GMilestoneOrderField UPDATED_AT =
      _$gMilestoneOrderFieldUPDATED_AT;

  static Serializer<GMilestoneOrderField> get serializer =>
      _$gMilestoneOrderFieldSerializer;

  static BuiltSet<GMilestoneOrderField> get values =>
      _$gMilestoneOrderFieldValues;

  static GMilestoneOrderField valueOf(String name) =>
      _$gMilestoneOrderFieldValueOf(name);
}

class GMilestoneState extends EnumClass {
  const GMilestoneState._(String name) : super(name);

  static const GMilestoneState CLOSED = _$gMilestoneStateCLOSED;

  static const GMilestoneState OPEN = _$gMilestoneStateOPEN;

  static Serializer<GMilestoneState> get serializer =>
      _$gMilestoneStateSerializer;

  static BuiltSet<GMilestoneState> get values => _$gMilestoneStateValues;

  static GMilestoneState valueOf(String name) => _$gMilestoneStateValueOf(name);
}

abstract class GMoveProjectCardInput
    implements Built<GMoveProjectCardInput, GMoveProjectCardInputBuilder> {
  GMoveProjectCardInput._();

  factory GMoveProjectCardInput(
          [Function(GMoveProjectCardInputBuilder b) updates]) =
      _$GMoveProjectCardInput;

  String? get afterCardId;
  String get cardId;
  String? get clientMutationId;
  String get columnId;
  static Serializer<GMoveProjectCardInput> get serializer =>
      _$gMoveProjectCardInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMoveProjectCardInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveProjectCardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMoveProjectCardInput.serializer,
        json,
      );
}

abstract class GMoveProjectColumnInput
    implements Built<GMoveProjectColumnInput, GMoveProjectColumnInputBuilder> {
  GMoveProjectColumnInput._();

  factory GMoveProjectColumnInput(
          [Function(GMoveProjectColumnInputBuilder b) updates]) =
      _$GMoveProjectColumnInput;

  String? get afterColumnId;
  String? get clientMutationId;
  String get columnId;
  static Serializer<GMoveProjectColumnInput> get serializer =>
      _$gMoveProjectColumnInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMoveProjectColumnInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveProjectColumnInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMoveProjectColumnInput.serializer,
        json,
      );
}

class GOauthApplicationCreateAuditEntryState extends EnumClass {
  const GOauthApplicationCreateAuditEntryState._(String name) : super(name);

  static const GOauthApplicationCreateAuditEntryState ACTIVE =
      _$gOauthApplicationCreateAuditEntryStateACTIVE;

  static const GOauthApplicationCreateAuditEntryState PENDING_DELETION =
      _$gOauthApplicationCreateAuditEntryStatePENDING_DELETION;

  static const GOauthApplicationCreateAuditEntryState SUSPENDED =
      _$gOauthApplicationCreateAuditEntryStateSUSPENDED;

  static Serializer<GOauthApplicationCreateAuditEntryState> get serializer =>
      _$gOauthApplicationCreateAuditEntryStateSerializer;

  static BuiltSet<GOauthApplicationCreateAuditEntryState> get values =>
      _$gOauthApplicationCreateAuditEntryStateValues;

  static GOauthApplicationCreateAuditEntryState valueOf(String name) =>
      _$gOauthApplicationCreateAuditEntryStateValueOf(name);
}

class GOperationType extends EnumClass {
  const GOperationType._(String name) : super(name);

  static const GOperationType ACCESS = _$gOperationTypeACCESS;

  static const GOperationType AUTHENTICATION = _$gOperationTypeAUTHENTICATION;

  static const GOperationType CREATE = _$gOperationTypeCREATE;

  static const GOperationType MODIFY = _$gOperationTypeMODIFY;

  static const GOperationType REMOVE = _$gOperationTypeREMOVE;

  static const GOperationType RESTORE = _$gOperationTypeRESTORE;

  static const GOperationType TRANSFER = _$gOperationTypeTRANSFER;

  static Serializer<GOperationType> get serializer =>
      _$gOperationTypeSerializer;

  static BuiltSet<GOperationType> get values => _$gOperationTypeValues;

  static GOperationType valueOf(String name) => _$gOperationTypeValueOf(name);
}

class GOrderDirection extends EnumClass {
  const GOrderDirection._(String name) : super(name);

  static const GOrderDirection ASC = _$gOrderDirectionASC;

  static const GOrderDirection DESC = _$gOrderDirectionDESC;

  static Serializer<GOrderDirection> get serializer =>
      _$gOrderDirectionSerializer;

  static BuiltSet<GOrderDirection> get values => _$gOrderDirectionValues;

  static GOrderDirection valueOf(String name) => _$gOrderDirectionValueOf(name);
}

class GOrgAddMemberAuditEntryPermission extends EnumClass {
  const GOrgAddMemberAuditEntryPermission._(String name) : super(name);

  static const GOrgAddMemberAuditEntryPermission ADMIN =
      _$gOrgAddMemberAuditEntryPermissionADMIN;

  static const GOrgAddMemberAuditEntryPermission READ =
      _$gOrgAddMemberAuditEntryPermissionREAD;

  static Serializer<GOrgAddMemberAuditEntryPermission> get serializer =>
      _$gOrgAddMemberAuditEntryPermissionSerializer;

  static BuiltSet<GOrgAddMemberAuditEntryPermission> get values =>
      _$gOrgAddMemberAuditEntryPermissionValues;

  static GOrgAddMemberAuditEntryPermission valueOf(String name) =>
      _$gOrgAddMemberAuditEntryPermissionValueOf(name);
}

class GOrgCreateAuditEntryBillingPlan extends EnumClass {
  const GOrgCreateAuditEntryBillingPlan._(String name) : super(name);

  static const GOrgCreateAuditEntryBillingPlan BUSINESS =
      _$gOrgCreateAuditEntryBillingPlanBUSINESS;

  static const GOrgCreateAuditEntryBillingPlan BUSINESS_PLUS =
      _$gOrgCreateAuditEntryBillingPlanBUSINESS_PLUS;

  static const GOrgCreateAuditEntryBillingPlan FREE =
      _$gOrgCreateAuditEntryBillingPlanFREE;

  static const GOrgCreateAuditEntryBillingPlan TIERED_PER_SEAT =
      _$gOrgCreateAuditEntryBillingPlanTIERED_PER_SEAT;

  static const GOrgCreateAuditEntryBillingPlan UNLIMITED =
      _$gOrgCreateAuditEntryBillingPlanUNLIMITED;

  static Serializer<GOrgCreateAuditEntryBillingPlan> get serializer =>
      _$gOrgCreateAuditEntryBillingPlanSerializer;

  static BuiltSet<GOrgCreateAuditEntryBillingPlan> get values =>
      _$gOrgCreateAuditEntryBillingPlanValues;

  static GOrgCreateAuditEntryBillingPlan valueOf(String name) =>
      _$gOrgCreateAuditEntryBillingPlanValueOf(name);
}

class GOrgRemoveBillingManagerAuditEntryReason extends EnumClass {
  const GOrgRemoveBillingManagerAuditEntryReason._(String name) : super(name);

  static const GOrgRemoveBillingManagerAuditEntryReason
      SAML_EXTERNAL_IDENTITY_MISSING =
      _$gOrgRemoveBillingManagerAuditEntryReasonSAML_EXTERNAL_IDENTITY_MISSING;

  static const GOrgRemoveBillingManagerAuditEntryReason
      SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY =
      _$gOrgRemoveBillingManagerAuditEntryReasonSAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY;

  static const GOrgRemoveBillingManagerAuditEntryReason
      TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE =
      _$gOrgRemoveBillingManagerAuditEntryReasonTWO_FACTOR_REQUIREMENT_NON_COMPLIANCE;

  static Serializer<GOrgRemoveBillingManagerAuditEntryReason> get serializer =>
      _$gOrgRemoveBillingManagerAuditEntryReasonSerializer;

  static BuiltSet<GOrgRemoveBillingManagerAuditEntryReason> get values =>
      _$gOrgRemoveBillingManagerAuditEntryReasonValues;

  static GOrgRemoveBillingManagerAuditEntryReason valueOf(String name) =>
      _$gOrgRemoveBillingManagerAuditEntryReasonValueOf(name);
}

class GOrgRemoveMemberAuditEntryMembershipType extends EnumClass {
  const GOrgRemoveMemberAuditEntryMembershipType._(String name) : super(name);

  static const GOrgRemoveMemberAuditEntryMembershipType ADMIN =
      _$gOrgRemoveMemberAuditEntryMembershipTypeADMIN;

  static const GOrgRemoveMemberAuditEntryMembershipType BILLING_MANAGER =
      _$gOrgRemoveMemberAuditEntryMembershipTypeBILLING_MANAGER;

  static const GOrgRemoveMemberAuditEntryMembershipType DIRECT_MEMBER =
      _$gOrgRemoveMemberAuditEntryMembershipTypeDIRECT_MEMBER;

  static const GOrgRemoveMemberAuditEntryMembershipType OUTSIDE_COLLABORATOR =
      _$gOrgRemoveMemberAuditEntryMembershipTypeOUTSIDE_COLLABORATOR;

  static const GOrgRemoveMemberAuditEntryMembershipType UNAFFILIATED =
      _$gOrgRemoveMemberAuditEntryMembershipTypeUNAFFILIATED;

  static Serializer<GOrgRemoveMemberAuditEntryMembershipType> get serializer =>
      _$gOrgRemoveMemberAuditEntryMembershipTypeSerializer;

  static BuiltSet<GOrgRemoveMemberAuditEntryMembershipType> get values =>
      _$gOrgRemoveMemberAuditEntryMembershipTypeValues;

  static GOrgRemoveMemberAuditEntryMembershipType valueOf(String name) =>
      _$gOrgRemoveMemberAuditEntryMembershipTypeValueOf(name);
}

class GOrgRemoveMemberAuditEntryReason extends EnumClass {
  const GOrgRemoveMemberAuditEntryReason._(String name) : super(name);

  static const GOrgRemoveMemberAuditEntryReason SAML_EXTERNAL_IDENTITY_MISSING =
      _$gOrgRemoveMemberAuditEntryReasonSAML_EXTERNAL_IDENTITY_MISSING;

  static const GOrgRemoveMemberAuditEntryReason
      SAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY =
      _$gOrgRemoveMemberAuditEntryReasonSAML_SSO_ENFORCEMENT_REQUIRES_EXTERNAL_IDENTITY;

  static const GOrgRemoveMemberAuditEntryReason
      TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE =
      _$gOrgRemoveMemberAuditEntryReasonTWO_FACTOR_REQUIREMENT_NON_COMPLIANCE;

  static Serializer<GOrgRemoveMemberAuditEntryReason> get serializer =>
      _$gOrgRemoveMemberAuditEntryReasonSerializer;

  static BuiltSet<GOrgRemoveMemberAuditEntryReason> get values =>
      _$gOrgRemoveMemberAuditEntryReasonValues;

  static GOrgRemoveMemberAuditEntryReason valueOf(String name) =>
      _$gOrgRemoveMemberAuditEntryReasonValueOf(name);
}

class GOrgRemoveOutsideCollaboratorAuditEntryMembershipType extends EnumClass {
  const GOrgRemoveOutsideCollaboratorAuditEntryMembershipType._(String name)
      : super(name);

  static const GOrgRemoveOutsideCollaboratorAuditEntryMembershipType
      BILLING_MANAGER =
      _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeBILLING_MANAGER;

  static const GOrgRemoveOutsideCollaboratorAuditEntryMembershipType
      OUTSIDE_COLLABORATOR =
      _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeOUTSIDE_COLLABORATOR;

  static const GOrgRemoveOutsideCollaboratorAuditEntryMembershipType
      UNAFFILIATED =
      _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeUNAFFILIATED;

  static Serializer<GOrgRemoveOutsideCollaboratorAuditEntryMembershipType>
      get serializer =>
          _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeSerializer;

  static BuiltSet<GOrgRemoveOutsideCollaboratorAuditEntryMembershipType>
      get values =>
          _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeValues;

  static GOrgRemoveOutsideCollaboratorAuditEntryMembershipType valueOf(
          String name) =>
      _$gOrgRemoveOutsideCollaboratorAuditEntryMembershipTypeValueOf(name);
}

class GOrgRemoveOutsideCollaboratorAuditEntryReason extends EnumClass {
  const GOrgRemoveOutsideCollaboratorAuditEntryReason._(String name)
      : super(name);

  static const GOrgRemoveOutsideCollaboratorAuditEntryReason
      SAML_EXTERNAL_IDENTITY_MISSING =
      _$gOrgRemoveOutsideCollaboratorAuditEntryReasonSAML_EXTERNAL_IDENTITY_MISSING;

  static const GOrgRemoveOutsideCollaboratorAuditEntryReason
      TWO_FACTOR_REQUIREMENT_NON_COMPLIANCE =
      _$gOrgRemoveOutsideCollaboratorAuditEntryReasonTWO_FACTOR_REQUIREMENT_NON_COMPLIANCE;

  static Serializer<GOrgRemoveOutsideCollaboratorAuditEntryReason>
      get serializer =>
          _$gOrgRemoveOutsideCollaboratorAuditEntryReasonSerializer;

  static BuiltSet<GOrgRemoveOutsideCollaboratorAuditEntryReason> get values =>
      _$gOrgRemoveOutsideCollaboratorAuditEntryReasonValues;

  static GOrgRemoveOutsideCollaboratorAuditEntryReason valueOf(String name) =>
      _$gOrgRemoveOutsideCollaboratorAuditEntryReasonValueOf(name);
}

class GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission
    extends EnumClass {
  const GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission._(String name)
      : super(name);

  static const GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission ADMIN =
      _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionADMIN;

  static const GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission NONE =
      _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionNONE;

  static const GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission READ =
      _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionREAD;

  static const GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission WRITE =
      _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionWRITE;

  static Serializer<GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission>
      get serializer =>
          _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionSerializer;

  static BuiltSet<GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission>
      get values =>
          _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionValues;

  static GOrgUpdateDefaultRepositoryPermissionAuditEntryPermission valueOf(
          String name) =>
      _$gOrgUpdateDefaultRepositoryPermissionAuditEntryPermissionValueOf(name);
}

class GOrgUpdateMemberAuditEntryPermission extends EnumClass {
  const GOrgUpdateMemberAuditEntryPermission._(String name) : super(name);

  static const GOrgUpdateMemberAuditEntryPermission ADMIN =
      _$gOrgUpdateMemberAuditEntryPermissionADMIN;

  static const GOrgUpdateMemberAuditEntryPermission READ =
      _$gOrgUpdateMemberAuditEntryPermissionREAD;

  static Serializer<GOrgUpdateMemberAuditEntryPermission> get serializer =>
      _$gOrgUpdateMemberAuditEntryPermissionSerializer;

  static BuiltSet<GOrgUpdateMemberAuditEntryPermission> get values =>
      _$gOrgUpdateMemberAuditEntryPermissionValues;

  static GOrgUpdateMemberAuditEntryPermission valueOf(String name) =>
      _$gOrgUpdateMemberAuditEntryPermissionValueOf(name);
}

class GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
    extends EnumClass {
  const GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility._(
      String name)
      : super(name);

  static const GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
      ALL =
      _$gOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityALL;

  static const GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
      PUBLIC =
      _$gOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityPUBLIC;

  static Serializer<
          GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility>
      get serializer =>
          _$gOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilitySerializer;

  static BuiltSet<
          GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility>
      get values =>
          _$gOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityValues;

  static GOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility valueOf(
          String name) =>
      _$gOrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibilityValueOf(
          name);
}

class GOrganizationInvitationRole extends EnumClass {
  const GOrganizationInvitationRole._(String name) : super(name);

  static const GOrganizationInvitationRole ADMIN =
      _$gOrganizationInvitationRoleADMIN;

  static const GOrganizationInvitationRole BILLING_MANAGER =
      _$gOrganizationInvitationRoleBILLING_MANAGER;

  static const GOrganizationInvitationRole DIRECT_MEMBER =
      _$gOrganizationInvitationRoleDIRECT_MEMBER;

  static const GOrganizationInvitationRole REINSTATE =
      _$gOrganizationInvitationRoleREINSTATE;

  static Serializer<GOrganizationInvitationRole> get serializer =>
      _$gOrganizationInvitationRoleSerializer;

  static BuiltSet<GOrganizationInvitationRole> get values =>
      _$gOrganizationInvitationRoleValues;

  static GOrganizationInvitationRole valueOf(String name) =>
      _$gOrganizationInvitationRoleValueOf(name);
}

class GOrganizationInvitationType extends EnumClass {
  const GOrganizationInvitationType._(String name) : super(name);

  static const GOrganizationInvitationType EMAIL =
      _$gOrganizationInvitationTypeEMAIL;

  static const GOrganizationInvitationType USER =
      _$gOrganizationInvitationTypeUSER;

  static Serializer<GOrganizationInvitationType> get serializer =>
      _$gOrganizationInvitationTypeSerializer;

  static BuiltSet<GOrganizationInvitationType> get values =>
      _$gOrganizationInvitationTypeValues;

  static GOrganizationInvitationType valueOf(String name) =>
      _$gOrganizationInvitationTypeValueOf(name);
}

class GOrganizationMemberRole extends EnumClass {
  const GOrganizationMemberRole._(String name) : super(name);

  static const GOrganizationMemberRole ADMIN = _$gOrganizationMemberRoleADMIN;

  static const GOrganizationMemberRole MEMBER = _$gOrganizationMemberRoleMEMBER;

  static Serializer<GOrganizationMemberRole> get serializer =>
      _$gOrganizationMemberRoleSerializer;

  static BuiltSet<GOrganizationMemberRole> get values =>
      _$gOrganizationMemberRoleValues;

  static GOrganizationMemberRole valueOf(String name) =>
      _$gOrganizationMemberRoleValueOf(name);
}

class GOrganizationMembersCanCreateRepositoriesSettingValue extends EnumClass {
  const GOrganizationMembersCanCreateRepositoriesSettingValue._(String name)
      : super(name);

  static const GOrganizationMembersCanCreateRepositoriesSettingValue ALL =
      _$gOrganizationMembersCanCreateRepositoriesSettingValueALL;

  static const GOrganizationMembersCanCreateRepositoriesSettingValue DISABLED =
      _$gOrganizationMembersCanCreateRepositoriesSettingValueDISABLED;

  static const GOrganizationMembersCanCreateRepositoriesSettingValue PRIVATE =
      _$gOrganizationMembersCanCreateRepositoriesSettingValuePRIVATE;

  static Serializer<GOrganizationMembersCanCreateRepositoriesSettingValue>
      get serializer =>
          _$gOrganizationMembersCanCreateRepositoriesSettingValueSerializer;

  static BuiltSet<GOrganizationMembersCanCreateRepositoriesSettingValue>
      get values =>
          _$gOrganizationMembersCanCreateRepositoriesSettingValueValues;

  static GOrganizationMembersCanCreateRepositoriesSettingValue valueOf(
          String name) =>
      _$gOrganizationMembersCanCreateRepositoriesSettingValueValueOf(name);
}

abstract class GOrganizationOrder
    implements Built<GOrganizationOrder, GOrganizationOrderBuilder> {
  GOrganizationOrder._();

  factory GOrganizationOrder([Function(GOrganizationOrderBuilder b) updates]) =
      _$GOrganizationOrder;

  GOrderDirection get direction;
  GOrganizationOrderField get field;
  static Serializer<GOrganizationOrder> get serializer =>
      _$gOrganizationOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOrganizationOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GOrganizationOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOrganizationOrder.serializer,
        json,
      );
}

class GOrganizationOrderField extends EnumClass {
  const GOrganizationOrderField._(String name) : super(name);

  static const GOrganizationOrderField CREATED_AT =
      _$gOrganizationOrderFieldCREATED_AT;

  static const GOrganizationOrderField LOGIN = _$gOrganizationOrderFieldLOGIN;

  static Serializer<GOrganizationOrderField> get serializer =>
      _$gOrganizationOrderFieldSerializer;

  static BuiltSet<GOrganizationOrderField> get values =>
      _$gOrganizationOrderFieldValues;

  static GOrganizationOrderField valueOf(String name) =>
      _$gOrganizationOrderFieldValueOf(name);
}

class GPinnableItemType extends EnumClass {
  const GPinnableItemType._(String name) : super(name);

  static const GPinnableItemType GIST = _$gPinnableItemTypeGIST;

  static const GPinnableItemType ISSUE = _$gPinnableItemTypeISSUE;

  static const GPinnableItemType ORGANIZATION = _$gPinnableItemTypeORGANIZATION;

  static const GPinnableItemType PROJECT = _$gPinnableItemTypePROJECT;

  static const GPinnableItemType PULL_REQUEST = _$gPinnableItemTypePULL_REQUEST;

  static const GPinnableItemType REPOSITORY = _$gPinnableItemTypeREPOSITORY;

  static const GPinnableItemType TEAM = _$gPinnableItemTypeTEAM;

  static const GPinnableItemType USER = _$gPinnableItemTypeUSER;

  static Serializer<GPinnableItemType> get serializer =>
      _$gPinnableItemTypeSerializer;

  static BuiltSet<GPinnableItemType> get values => _$gPinnableItemTypeValues;

  static GPinnableItemType valueOf(String name) =>
      _$gPinnableItemTypeValueOf(name);
}

abstract class GPreciseDateTime
    implements Built<GPreciseDateTime, GPreciseDateTimeBuilder> {
  GPreciseDateTime._();

  factory GPreciseDateTime([String? value]) =>
      _$GPreciseDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPreciseDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GPreciseDateTime>(
          (Object serialized) => GPreciseDateTime((serialized as String?)));
}

class GProjectCardArchivedState extends EnumClass {
  const GProjectCardArchivedState._(String name) : super(name);

  static const GProjectCardArchivedState ARCHIVED =
      _$gProjectCardArchivedStateARCHIVED;

  static const GProjectCardArchivedState NOT_ARCHIVED =
      _$gProjectCardArchivedStateNOT_ARCHIVED;

  static Serializer<GProjectCardArchivedState> get serializer =>
      _$gProjectCardArchivedStateSerializer;

  static BuiltSet<GProjectCardArchivedState> get values =>
      _$gProjectCardArchivedStateValues;

  static GProjectCardArchivedState valueOf(String name) =>
      _$gProjectCardArchivedStateValueOf(name);
}

class GProjectCardState extends EnumClass {
  const GProjectCardState._(String name) : super(name);

  static const GProjectCardState CONTENT_ONLY = _$gProjectCardStateCONTENT_ONLY;

  static const GProjectCardState NOTE_ONLY = _$gProjectCardStateNOTE_ONLY;

  static const GProjectCardState REDACTED = _$gProjectCardStateREDACTED;

  static Serializer<GProjectCardState> get serializer =>
      _$gProjectCardStateSerializer;

  static BuiltSet<GProjectCardState> get values => _$gProjectCardStateValues;

  static GProjectCardState valueOf(String name) =>
      _$gProjectCardStateValueOf(name);
}

class GProjectColumnPurpose extends EnumClass {
  const GProjectColumnPurpose._(String name) : super(name);

  static const GProjectColumnPurpose DONE = _$gProjectColumnPurposeDONE;

  static const GProjectColumnPurpose IN_PROGRESS =
      _$gProjectColumnPurposeIN_PROGRESS;

  static const GProjectColumnPurpose TODO = _$gProjectColumnPurposeTODO;

  static Serializer<GProjectColumnPurpose> get serializer =>
      _$gProjectColumnPurposeSerializer;

  static BuiltSet<GProjectColumnPurpose> get values =>
      _$gProjectColumnPurposeValues;

  static GProjectColumnPurpose valueOf(String name) =>
      _$gProjectColumnPurposeValueOf(name);
}

abstract class GProjectOrder
    implements Built<GProjectOrder, GProjectOrderBuilder> {
  GProjectOrder._();

  factory GProjectOrder([Function(GProjectOrderBuilder b) updates]) =
      _$GProjectOrder;

  GOrderDirection get direction;
  GProjectOrderField get field;
  static Serializer<GProjectOrder> get serializer => _$gProjectOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProjectOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GProjectOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProjectOrder.serializer,
        json,
      );
}

class GProjectOrderField extends EnumClass {
  const GProjectOrderField._(String name) : super(name);

  static const GProjectOrderField CREATED_AT = _$gProjectOrderFieldCREATED_AT;

  static const GProjectOrderField NAME = _$gProjectOrderFieldNAME;

  static const GProjectOrderField UPDATED_AT = _$gProjectOrderFieldUPDATED_AT;

  static Serializer<GProjectOrderField> get serializer =>
      _$gProjectOrderFieldSerializer;

  static BuiltSet<GProjectOrderField> get values => _$gProjectOrderFieldValues;

  static GProjectOrderField valueOf(String name) =>
      _$gProjectOrderFieldValueOf(name);
}

class GProjectState extends EnumClass {
  const GProjectState._(String name) : super(name);

  static const GProjectState CLOSED = _$gProjectStateCLOSED;

  static const GProjectState OPEN = _$gProjectStateOPEN;

  static Serializer<GProjectState> get serializer => _$gProjectStateSerializer;

  static BuiltSet<GProjectState> get values => _$gProjectStateValues;

  static GProjectState valueOf(String name) => _$gProjectStateValueOf(name);
}

class GProjectTemplate extends EnumClass {
  const GProjectTemplate._(String name) : super(name);

  static const GProjectTemplate AUTOMATED_KANBAN_V2 =
      _$gProjectTemplateAUTOMATED_KANBAN_V2;

  static const GProjectTemplate AUTOMATED_REVIEWS_KANBAN =
      _$gProjectTemplateAUTOMATED_REVIEWS_KANBAN;

  static const GProjectTemplate BASIC_KANBAN = _$gProjectTemplateBASIC_KANBAN;

  static const GProjectTemplate BUG_TRIAGE = _$gProjectTemplateBUG_TRIAGE;

  static Serializer<GProjectTemplate> get serializer =>
      _$gProjectTemplateSerializer;

  static BuiltSet<GProjectTemplate> get values => _$gProjectTemplateValues;

  static GProjectTemplate valueOf(String name) =>
      _$gProjectTemplateValueOf(name);
}

class GPullRequestMergeMethod extends EnumClass {
  const GPullRequestMergeMethod._(String name) : super(name);

  static const GPullRequestMergeMethod MERGE = _$gPullRequestMergeMethodMERGE;

  static const GPullRequestMergeMethod REBASE = _$gPullRequestMergeMethodREBASE;

  static const GPullRequestMergeMethod SQUASH = _$gPullRequestMergeMethodSQUASH;

  static Serializer<GPullRequestMergeMethod> get serializer =>
      _$gPullRequestMergeMethodSerializer;

  static BuiltSet<GPullRequestMergeMethod> get values =>
      _$gPullRequestMergeMethodValues;

  static GPullRequestMergeMethod valueOf(String name) =>
      _$gPullRequestMergeMethodValueOf(name);
}

abstract class GPullRequestOrder
    implements Built<GPullRequestOrder, GPullRequestOrderBuilder> {
  GPullRequestOrder._();

  factory GPullRequestOrder([Function(GPullRequestOrderBuilder b) updates]) =
      _$GPullRequestOrder;

  GOrderDirection get direction;
  GPullRequestOrderField get field;
  static Serializer<GPullRequestOrder> get serializer =>
      _$gPullRequestOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPullRequestOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPullRequestOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPullRequestOrder.serializer,
        json,
      );
}

class GPullRequestOrderField extends EnumClass {
  const GPullRequestOrderField._(String name) : super(name);

  static const GPullRequestOrderField CREATED_AT =
      _$gPullRequestOrderFieldCREATED_AT;

  static const GPullRequestOrderField UPDATED_AT =
      _$gPullRequestOrderFieldUPDATED_AT;

  static Serializer<GPullRequestOrderField> get serializer =>
      _$gPullRequestOrderFieldSerializer;

  static BuiltSet<GPullRequestOrderField> get values =>
      _$gPullRequestOrderFieldValues;

  static GPullRequestOrderField valueOf(String name) =>
      _$gPullRequestOrderFieldValueOf(name);
}

class GPullRequestReviewCommentState extends EnumClass {
  const GPullRequestReviewCommentState._(String name) : super(name);

  static const GPullRequestReviewCommentState PENDING =
      _$gPullRequestReviewCommentStatePENDING;

  static const GPullRequestReviewCommentState SUBMITTED =
      _$gPullRequestReviewCommentStateSUBMITTED;

  static Serializer<GPullRequestReviewCommentState> get serializer =>
      _$gPullRequestReviewCommentStateSerializer;

  static BuiltSet<GPullRequestReviewCommentState> get values =>
      _$gPullRequestReviewCommentStateValues;

  static GPullRequestReviewCommentState valueOf(String name) =>
      _$gPullRequestReviewCommentStateValueOf(name);
}

class GPullRequestReviewEvent extends EnumClass {
  const GPullRequestReviewEvent._(String name) : super(name);

  static const GPullRequestReviewEvent APPROVE =
      _$gPullRequestReviewEventAPPROVE;

  static const GPullRequestReviewEvent COMMENT =
      _$gPullRequestReviewEventCOMMENT;

  static const GPullRequestReviewEvent DISMISS =
      _$gPullRequestReviewEventDISMISS;

  static const GPullRequestReviewEvent REQUEST_CHANGES =
      _$gPullRequestReviewEventREQUEST_CHANGES;

  static Serializer<GPullRequestReviewEvent> get serializer =>
      _$gPullRequestReviewEventSerializer;

  static BuiltSet<GPullRequestReviewEvent> get values =>
      _$gPullRequestReviewEventValues;

  static GPullRequestReviewEvent valueOf(String name) =>
      _$gPullRequestReviewEventValueOf(name);
}

class GPullRequestReviewState extends EnumClass {
  const GPullRequestReviewState._(String name) : super(name);

  static const GPullRequestReviewState APPROVED =
      _$gPullRequestReviewStateAPPROVED;

  static const GPullRequestReviewState CHANGES_REQUESTED =
      _$gPullRequestReviewStateCHANGES_REQUESTED;

  static const GPullRequestReviewState COMMENTED =
      _$gPullRequestReviewStateCOMMENTED;

  static const GPullRequestReviewState DISMISSED =
      _$gPullRequestReviewStateDISMISSED;

  static const GPullRequestReviewState PENDING =
      _$gPullRequestReviewStatePENDING;

  static Serializer<GPullRequestReviewState> get serializer =>
      _$gPullRequestReviewStateSerializer;

  static BuiltSet<GPullRequestReviewState> get values =>
      _$gPullRequestReviewStateValues;

  static GPullRequestReviewState valueOf(String name) =>
      _$gPullRequestReviewStateValueOf(name);
}

class GPullRequestState extends EnumClass {
  const GPullRequestState._(String name) : super(name);

  static const GPullRequestState CLOSED = _$gPullRequestStateCLOSED;

  static const GPullRequestState MERGED = _$gPullRequestStateMERGED;

  static const GPullRequestState OPEN = _$gPullRequestStateOPEN;

  static Serializer<GPullRequestState> get serializer =>
      _$gPullRequestStateSerializer;

  static BuiltSet<GPullRequestState> get values => _$gPullRequestStateValues;

  static GPullRequestState valueOf(String name) =>
      _$gPullRequestStateValueOf(name);
}

class GPullRequestTimelineItemsItemType extends EnumClass {
  const GPullRequestTimelineItemsItemType._(String name) : super(name);

  static const GPullRequestTimelineItemsItemType ADDED_TO_PROJECT_EVENT =
      _$gPullRequestTimelineItemsItemTypeADDED_TO_PROJECT_EVENT;

  static const GPullRequestTimelineItemsItemType ASSIGNED_EVENT =
      _$gPullRequestTimelineItemsItemTypeASSIGNED_EVENT;

  static const GPullRequestTimelineItemsItemType BASE_REF_CHANGED_EVENT =
      _$gPullRequestTimelineItemsItemTypeBASE_REF_CHANGED_EVENT;

  static const GPullRequestTimelineItemsItemType BASE_REF_FORCE_PUSHED_EVENT =
      _$gPullRequestTimelineItemsItemTypeBASE_REF_FORCE_PUSHED_EVENT;

  static const GPullRequestTimelineItemsItemType CLOSED_EVENT =
      _$gPullRequestTimelineItemsItemTypeCLOSED_EVENT;

  static const GPullRequestTimelineItemsItemType COMMENT_DELETED_EVENT =
      _$gPullRequestTimelineItemsItemTypeCOMMENT_DELETED_EVENT;

  static const GPullRequestTimelineItemsItemType CONNECTED_EVENT =
      _$gPullRequestTimelineItemsItemTypeCONNECTED_EVENT;

  static const GPullRequestTimelineItemsItemType CONVERTED_NOTE_TO_ISSUE_EVENT =
      _$gPullRequestTimelineItemsItemTypeCONVERTED_NOTE_TO_ISSUE_EVENT;

  static const GPullRequestTimelineItemsItemType CROSS_REFERENCED_EVENT =
      _$gPullRequestTimelineItemsItemTypeCROSS_REFERENCED_EVENT;

  static const GPullRequestTimelineItemsItemType DEMILESTONED_EVENT =
      _$gPullRequestTimelineItemsItemTypeDEMILESTONED_EVENT;

  static const GPullRequestTimelineItemsItemType DEPLOYED_EVENT =
      _$gPullRequestTimelineItemsItemTypeDEPLOYED_EVENT;

  static const GPullRequestTimelineItemsItemType
      DEPLOYMENT_ENVIRONMENT_CHANGED_EVENT =
      _$gPullRequestTimelineItemsItemTypeDEPLOYMENT_ENVIRONMENT_CHANGED_EVENT;

  static const GPullRequestTimelineItemsItemType DISCONNECTED_EVENT =
      _$gPullRequestTimelineItemsItemTypeDISCONNECTED_EVENT;

  static const GPullRequestTimelineItemsItemType HEAD_REF_DELETED_EVENT =
      _$gPullRequestTimelineItemsItemTypeHEAD_REF_DELETED_EVENT;

  static const GPullRequestTimelineItemsItemType HEAD_REF_FORCE_PUSHED_EVENT =
      _$gPullRequestTimelineItemsItemTypeHEAD_REF_FORCE_PUSHED_EVENT;

  static const GPullRequestTimelineItemsItemType HEAD_REF_RESTORED_EVENT =
      _$gPullRequestTimelineItemsItemTypeHEAD_REF_RESTORED_EVENT;

  static const GPullRequestTimelineItemsItemType ISSUE_COMMENT =
      _$gPullRequestTimelineItemsItemTypeISSUE_COMMENT;

  static const GPullRequestTimelineItemsItemType LABELED_EVENT =
      _$gPullRequestTimelineItemsItemTypeLABELED_EVENT;

  static const GPullRequestTimelineItemsItemType LOCKED_EVENT =
      _$gPullRequestTimelineItemsItemTypeLOCKED_EVENT;

  static const GPullRequestTimelineItemsItemType MARKED_AS_DUPLICATE_EVENT =
      _$gPullRequestTimelineItemsItemTypeMARKED_AS_DUPLICATE_EVENT;

  static const GPullRequestTimelineItemsItemType MENTIONED_EVENT =
      _$gPullRequestTimelineItemsItemTypeMENTIONED_EVENT;

  static const GPullRequestTimelineItemsItemType MERGED_EVENT =
      _$gPullRequestTimelineItemsItemTypeMERGED_EVENT;

  static const GPullRequestTimelineItemsItemType MILESTONED_EVENT =
      _$gPullRequestTimelineItemsItemTypeMILESTONED_EVENT;

  static const GPullRequestTimelineItemsItemType
      MOVED_COLUMNS_IN_PROJECT_EVENT =
      _$gPullRequestTimelineItemsItemTypeMOVED_COLUMNS_IN_PROJECT_EVENT;

  static const GPullRequestTimelineItemsItemType PINNED_EVENT =
      _$gPullRequestTimelineItemsItemTypePINNED_EVENT;

  static const GPullRequestTimelineItemsItemType PULL_REQUEST_COMMIT =
      _$gPullRequestTimelineItemsItemTypePULL_REQUEST_COMMIT;

  static const GPullRequestTimelineItemsItemType
      PULL_REQUEST_COMMIT_COMMENT_THREAD =
      _$gPullRequestTimelineItemsItemTypePULL_REQUEST_COMMIT_COMMENT_THREAD;

  static const GPullRequestTimelineItemsItemType PULL_REQUEST_REVIEW =
      _$gPullRequestTimelineItemsItemTypePULL_REQUEST_REVIEW;

  static const GPullRequestTimelineItemsItemType PULL_REQUEST_REVIEW_THREAD =
      _$gPullRequestTimelineItemsItemTypePULL_REQUEST_REVIEW_THREAD;

  static const GPullRequestTimelineItemsItemType PULL_REQUEST_REVISION_MARKER =
      _$gPullRequestTimelineItemsItemTypePULL_REQUEST_REVISION_MARKER;

  static const GPullRequestTimelineItemsItemType READY_FOR_REVIEW_EVENT =
      _$gPullRequestTimelineItemsItemTypeREADY_FOR_REVIEW_EVENT;

  static const GPullRequestTimelineItemsItemType REFERENCED_EVENT =
      _$gPullRequestTimelineItemsItemTypeREFERENCED_EVENT;

  static const GPullRequestTimelineItemsItemType REMOVED_FROM_PROJECT_EVENT =
      _$gPullRequestTimelineItemsItemTypeREMOVED_FROM_PROJECT_EVENT;

  static const GPullRequestTimelineItemsItemType RENAMED_TITLE_EVENT =
      _$gPullRequestTimelineItemsItemTypeRENAMED_TITLE_EVENT;

  static const GPullRequestTimelineItemsItemType REOPENED_EVENT =
      _$gPullRequestTimelineItemsItemTypeREOPENED_EVENT;

  static const GPullRequestTimelineItemsItemType REVIEW_DISMISSED_EVENT =
      _$gPullRequestTimelineItemsItemTypeREVIEW_DISMISSED_EVENT;

  static const GPullRequestTimelineItemsItemType REVIEW_REQUESTED_EVENT =
      _$gPullRequestTimelineItemsItemTypeREVIEW_REQUESTED_EVENT;

  static const GPullRequestTimelineItemsItemType REVIEW_REQUEST_REMOVED_EVENT =
      _$gPullRequestTimelineItemsItemTypeREVIEW_REQUEST_REMOVED_EVENT;

  static const GPullRequestTimelineItemsItemType SUBSCRIBED_EVENT =
      _$gPullRequestTimelineItemsItemTypeSUBSCRIBED_EVENT;

  static const GPullRequestTimelineItemsItemType TRANSFERRED_EVENT =
      _$gPullRequestTimelineItemsItemTypeTRANSFERRED_EVENT;

  static const GPullRequestTimelineItemsItemType UNASSIGNED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNASSIGNED_EVENT;

  static const GPullRequestTimelineItemsItemType UNLABELED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNLABELED_EVENT;

  static const GPullRequestTimelineItemsItemType UNLOCKED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNLOCKED_EVENT;

  static const GPullRequestTimelineItemsItemType UNMARKED_AS_DUPLICATE_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNMARKED_AS_DUPLICATE_EVENT;

  static const GPullRequestTimelineItemsItemType UNPINNED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNPINNED_EVENT;

  static const GPullRequestTimelineItemsItemType UNSUBSCRIBED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUNSUBSCRIBED_EVENT;

  static const GPullRequestTimelineItemsItemType USER_BLOCKED_EVENT =
      _$gPullRequestTimelineItemsItemTypeUSER_BLOCKED_EVENT;

  static Serializer<GPullRequestTimelineItemsItemType> get serializer =>
      _$gPullRequestTimelineItemsItemTypeSerializer;

  static BuiltSet<GPullRequestTimelineItemsItemType> get values =>
      _$gPullRequestTimelineItemsItemTypeValues;

  static GPullRequestTimelineItemsItemType valueOf(String name) =>
      _$gPullRequestTimelineItemsItemTypeValueOf(name);
}

class GPullRequestUpdateState extends EnumClass {
  const GPullRequestUpdateState._(String name) : super(name);

  static const GPullRequestUpdateState CLOSED = _$gPullRequestUpdateStateCLOSED;

  static const GPullRequestUpdateState OPEN = _$gPullRequestUpdateStateOPEN;

  static Serializer<GPullRequestUpdateState> get serializer =>
      _$gPullRequestUpdateStateSerializer;

  static BuiltSet<GPullRequestUpdateState> get values =>
      _$gPullRequestUpdateStateValues;

  static GPullRequestUpdateState valueOf(String name) =>
      _$gPullRequestUpdateStateValueOf(name);
}

class GReactionContent extends EnumClass {
  const GReactionContent._(String name) : super(name);

  static const GReactionContent CONFUSED = _$gReactionContentCONFUSED;

  static const GReactionContent EYES = _$gReactionContentEYES;

  static const GReactionContent HEART = _$gReactionContentHEART;

  static const GReactionContent HOORAY = _$gReactionContentHOORAY;

  static const GReactionContent LAUGH = _$gReactionContentLAUGH;

  static const GReactionContent ROCKET = _$gReactionContentROCKET;

  static const GReactionContent THUMBS_DOWN = _$gReactionContentTHUMBS_DOWN;

  static const GReactionContent THUMBS_UP = _$gReactionContentTHUMBS_UP;

  static Serializer<GReactionContent> get serializer =>
      _$gReactionContentSerializer;

  static BuiltSet<GReactionContent> get values => _$gReactionContentValues;

  static GReactionContent valueOf(String name) =>
      _$gReactionContentValueOf(name);
}

abstract class GReactionOrder
    implements Built<GReactionOrder, GReactionOrderBuilder> {
  GReactionOrder._();

  factory GReactionOrder([Function(GReactionOrderBuilder b) updates]) =
      _$GReactionOrder;

  GOrderDirection get direction;
  GReactionOrderField get field;
  static Serializer<GReactionOrder> get serializer =>
      _$gReactionOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReactionOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReactionOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReactionOrder.serializer,
        json,
      );
}

class GReactionOrderField extends EnumClass {
  const GReactionOrderField._(String name) : super(name);

  static const GReactionOrderField CREATED_AT = _$gReactionOrderFieldCREATED_AT;

  static Serializer<GReactionOrderField> get serializer =>
      _$gReactionOrderFieldSerializer;

  static BuiltSet<GReactionOrderField> get values =>
      _$gReactionOrderFieldValues;

  static GReactionOrderField valueOf(String name) =>
      _$gReactionOrderFieldValueOf(name);
}

abstract class GRefOrder implements Built<GRefOrder, GRefOrderBuilder> {
  GRefOrder._();

  factory GRefOrder([Function(GRefOrderBuilder b) updates]) = _$GRefOrder;

  GOrderDirection get direction;
  GRefOrderField get field;
  static Serializer<GRefOrder> get serializer => _$gRefOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRefOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRefOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRefOrder.serializer,
        json,
      );
}

class GRefOrderField extends EnumClass {
  const GRefOrderField._(String name) : super(name);

  static const GRefOrderField ALPHABETICAL = _$gRefOrderFieldALPHABETICAL;

  static const GRefOrderField TAG_COMMIT_DATE = _$gRefOrderFieldTAG_COMMIT_DATE;

  static Serializer<GRefOrderField> get serializer =>
      _$gRefOrderFieldSerializer;

  static BuiltSet<GRefOrderField> get values => _$gRefOrderFieldValues;

  static GRefOrderField valueOf(String name) => _$gRefOrderFieldValueOf(name);
}

abstract class GRegenerateEnterpriseIdentityProviderRecoveryCodesInput
    implements
        Built<GRegenerateEnterpriseIdentityProviderRecoveryCodesInput,
            GRegenerateEnterpriseIdentityProviderRecoveryCodesInputBuilder> {
  GRegenerateEnterpriseIdentityProviderRecoveryCodesInput._();

  factory GRegenerateEnterpriseIdentityProviderRecoveryCodesInput(
      [Function(
              GRegenerateEnterpriseIdentityProviderRecoveryCodesInputBuilder b)
          updates]) = _$GRegenerateEnterpriseIdentityProviderRecoveryCodesInput;

  String? get clientMutationId;
  String get enterpriseId;
  static Serializer<GRegenerateEnterpriseIdentityProviderRecoveryCodesInput>
      get serializer =>
          _$gRegenerateEnterpriseIdentityProviderRecoveryCodesInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRegenerateEnterpriseIdentityProviderRecoveryCodesInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRegenerateEnterpriseIdentityProviderRecoveryCodesInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRegenerateEnterpriseIdentityProviderRecoveryCodesInput.serializer,
        json,
      );
}

class GRegistryPackageDependencyType extends EnumClass {
  const GRegistryPackageDependencyType._(String name) : super(name);

  static const GRegistryPackageDependencyType BUNDLED =
      _$gRegistryPackageDependencyTypeBUNDLED;

  static const GRegistryPackageDependencyType DEFAULT =
      _$gRegistryPackageDependencyTypeDEFAULT;

  static const GRegistryPackageDependencyType DEV =
      _$gRegistryPackageDependencyTypeDEV;

  static const GRegistryPackageDependencyType OPTIONAL =
      _$gRegistryPackageDependencyTypeOPTIONAL;

  static const GRegistryPackageDependencyType PEER =
      _$gRegistryPackageDependencyTypePEER;

  static const GRegistryPackageDependencyType TEST =
      _$gRegistryPackageDependencyTypeTEST;

  static Serializer<GRegistryPackageDependencyType> get serializer =>
      _$gRegistryPackageDependencyTypeSerializer;

  static BuiltSet<GRegistryPackageDependencyType> get values =>
      _$gRegistryPackageDependencyTypeValues;

  static GRegistryPackageDependencyType valueOf(String name) =>
      _$gRegistryPackageDependencyTypeValueOf(name);
}

abstract class GRegistryPackageMetadatum
    implements
        Built<GRegistryPackageMetadatum, GRegistryPackageMetadatumBuilder> {
  GRegistryPackageMetadatum._();

  factory GRegistryPackageMetadatum(
          [Function(GRegistryPackageMetadatumBuilder b) updates]) =
      _$GRegistryPackageMetadatum;

  String get name;
  @BuiltValueField(wireName: 'update')
  bool? get Gupdate;
  String get value;
  static Serializer<GRegistryPackageMetadatum> get serializer =>
      _$gRegistryPackageMetadatumSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRegistryPackageMetadatum.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRegistryPackageMetadatum? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRegistryPackageMetadatum.serializer,
        json,
      );
}

class GRegistryPackageType extends EnumClass {
  const GRegistryPackageType._(String name) : super(name);

  static const GRegistryPackageType DEBIAN = _$gRegistryPackageTypeDEBIAN;

  static const GRegistryPackageType DOCKER = _$gRegistryPackageTypeDOCKER;

  static const GRegistryPackageType MAVEN = _$gRegistryPackageTypeMAVEN;

  static const GRegistryPackageType NPM = _$gRegistryPackageTypeNPM;

  static const GRegistryPackageType NUGET = _$gRegistryPackageTypeNUGET;

  static const GRegistryPackageType PYTHON = _$gRegistryPackageTypePYTHON;

  static const GRegistryPackageType RUBYGEMS = _$gRegistryPackageTypeRUBYGEMS;

  static Serializer<GRegistryPackageType> get serializer =>
      _$gRegistryPackageTypeSerializer;

  static BuiltSet<GRegistryPackageType> get values =>
      _$gRegistryPackageTypeValues;

  static GRegistryPackageType valueOf(String name) =>
      _$gRegistryPackageTypeValueOf(name);
}

abstract class GReleaseOrder
    implements Built<GReleaseOrder, GReleaseOrderBuilder> {
  GReleaseOrder._();

  factory GReleaseOrder([Function(GReleaseOrderBuilder b) updates]) =
      _$GReleaseOrder;

  GOrderDirection get direction;
  GReleaseOrderField get field;
  static Serializer<GReleaseOrder> get serializer => _$gReleaseOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReleaseOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseOrder.serializer,
        json,
      );
}

class GReleaseOrderField extends EnumClass {
  const GReleaseOrderField._(String name) : super(name);

  static const GReleaseOrderField CREATED_AT = _$gReleaseOrderFieldCREATED_AT;

  static const GReleaseOrderField NAME = _$gReleaseOrderFieldNAME;

  static Serializer<GReleaseOrderField> get serializer =>
      _$gReleaseOrderFieldSerializer;

  static BuiltSet<GReleaseOrderField> get values => _$gReleaseOrderFieldValues;

  static GReleaseOrderField valueOf(String name) =>
      _$gReleaseOrderFieldValueOf(name);
}

abstract class GRemoveAssigneesFromAssignableInput
    implements
        Built<GRemoveAssigneesFromAssignableInput,
            GRemoveAssigneesFromAssignableInputBuilder> {
  GRemoveAssigneesFromAssignableInput._();

  factory GRemoveAssigneesFromAssignableInput(
          [Function(GRemoveAssigneesFromAssignableInputBuilder b) updates]) =
      _$GRemoveAssigneesFromAssignableInput;

  String get assignableId;
  BuiltList<String> get assigneeIds;
  String? get clientMutationId;
  static Serializer<GRemoveAssigneesFromAssignableInput> get serializer =>
      _$gRemoveAssigneesFromAssignableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveAssigneesFromAssignableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveAssigneesFromAssignableInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveAssigneesFromAssignableInput.serializer,
        json,
      );
}

abstract class GRemoveEnterpriseAdminInput
    implements
        Built<GRemoveEnterpriseAdminInput, GRemoveEnterpriseAdminInputBuilder> {
  GRemoveEnterpriseAdminInput._();

  factory GRemoveEnterpriseAdminInput(
          [Function(GRemoveEnterpriseAdminInputBuilder b) updates]) =
      _$GRemoveEnterpriseAdminInput;

  String? get clientMutationId;
  String get enterpriseId;
  String get login;
  static Serializer<GRemoveEnterpriseAdminInput> get serializer =>
      _$gRemoveEnterpriseAdminInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveEnterpriseAdminInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveEnterpriseAdminInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveEnterpriseAdminInput.serializer,
        json,
      );
}

abstract class GRemoveEnterpriseOrganizationInput
    implements
        Built<GRemoveEnterpriseOrganizationInput,
            GRemoveEnterpriseOrganizationInputBuilder> {
  GRemoveEnterpriseOrganizationInput._();

  factory GRemoveEnterpriseOrganizationInput(
          [Function(GRemoveEnterpriseOrganizationInputBuilder b) updates]) =
      _$GRemoveEnterpriseOrganizationInput;

  String? get clientMutationId;
  String get enterpriseId;
  String get organizationId;
  static Serializer<GRemoveEnterpriseOrganizationInput> get serializer =>
      _$gRemoveEnterpriseOrganizationInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveEnterpriseOrganizationInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveEnterpriseOrganizationInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveEnterpriseOrganizationInput.serializer,
        json,
      );
}

abstract class GRemoveLabelsFromLabelableInput
    implements
        Built<GRemoveLabelsFromLabelableInput,
            GRemoveLabelsFromLabelableInputBuilder> {
  GRemoveLabelsFromLabelableInput._();

  factory GRemoveLabelsFromLabelableInput(
          [Function(GRemoveLabelsFromLabelableInputBuilder b) updates]) =
      _$GRemoveLabelsFromLabelableInput;

  String? get clientMutationId;
  BuiltList<String> get labelIds;
  String get labelableId;
  static Serializer<GRemoveLabelsFromLabelableInput> get serializer =>
      _$gRemoveLabelsFromLabelableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveLabelsFromLabelableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveLabelsFromLabelableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveLabelsFromLabelableInput.serializer,
        json,
      );
}

abstract class GRemoveOutsideCollaboratorInput
    implements
        Built<GRemoveOutsideCollaboratorInput,
            GRemoveOutsideCollaboratorInputBuilder> {
  GRemoveOutsideCollaboratorInput._();

  factory GRemoveOutsideCollaboratorInput(
          [Function(GRemoveOutsideCollaboratorInputBuilder b) updates]) =
      _$GRemoveOutsideCollaboratorInput;

  String? get clientMutationId;
  String get organizationId;
  String get userId;
  static Serializer<GRemoveOutsideCollaboratorInput> get serializer =>
      _$gRemoveOutsideCollaboratorInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveOutsideCollaboratorInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveOutsideCollaboratorInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveOutsideCollaboratorInput.serializer,
        json,
      );
}

abstract class GRemoveReactionInput
    implements Built<GRemoveReactionInput, GRemoveReactionInputBuilder> {
  GRemoveReactionInput._();

  factory GRemoveReactionInput(
          [Function(GRemoveReactionInputBuilder b) updates]) =
      _$GRemoveReactionInput;

  String? get clientMutationId;
  GReactionContent get content;
  String get subjectId;
  static Serializer<GRemoveReactionInput> get serializer =>
      _$gRemoveReactionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveReactionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveReactionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveReactionInput.serializer,
        json,
      );
}

abstract class GRemoveStarInput
    implements Built<GRemoveStarInput, GRemoveStarInputBuilder> {
  GRemoveStarInput._();

  factory GRemoveStarInput([Function(GRemoveStarInputBuilder b) updates]) =
      _$GRemoveStarInput;

  String? get clientMutationId;
  String get starrableId;
  static Serializer<GRemoveStarInput> get serializer =>
      _$gRemoveStarInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveStarInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRemoveStarInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveStarInput.serializer,
        json,
      );
}

abstract class GReopenIssueInput
    implements Built<GReopenIssueInput, GReopenIssueInputBuilder> {
  GReopenIssueInput._();

  factory GReopenIssueInput([Function(GReopenIssueInputBuilder b) updates]) =
      _$GReopenIssueInput;

  String? get clientMutationId;
  String get issueId;
  static Serializer<GReopenIssueInput> get serializer =>
      _$gReopenIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReopenIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReopenIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReopenIssueInput.serializer,
        json,
      );
}

abstract class GReopenPullRequestInput
    implements Built<GReopenPullRequestInput, GReopenPullRequestInputBuilder> {
  GReopenPullRequestInput._();

  factory GReopenPullRequestInput(
          [Function(GReopenPullRequestInputBuilder b) updates]) =
      _$GReopenPullRequestInput;

  String? get clientMutationId;
  String get pullRequestId;
  static Serializer<GReopenPullRequestInput> get serializer =>
      _$gReopenPullRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReopenPullRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReopenPullRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReopenPullRequestInput.serializer,
        json,
      );
}

class GRepoAccessAuditEntryVisibility extends EnumClass {
  const GRepoAccessAuditEntryVisibility._(String name) : super(name);

  static const GRepoAccessAuditEntryVisibility INTERNAL =
      _$gRepoAccessAuditEntryVisibilityINTERNAL;

  static const GRepoAccessAuditEntryVisibility PRIVATE =
      _$gRepoAccessAuditEntryVisibilityPRIVATE;

  static const GRepoAccessAuditEntryVisibility PUBLIC =
      _$gRepoAccessAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoAccessAuditEntryVisibility> get serializer =>
      _$gRepoAccessAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoAccessAuditEntryVisibility> get values =>
      _$gRepoAccessAuditEntryVisibilityValues;

  static GRepoAccessAuditEntryVisibility valueOf(String name) =>
      _$gRepoAccessAuditEntryVisibilityValueOf(name);
}

class GRepoAddMemberAuditEntryVisibility extends EnumClass {
  const GRepoAddMemberAuditEntryVisibility._(String name) : super(name);

  static const GRepoAddMemberAuditEntryVisibility INTERNAL =
      _$gRepoAddMemberAuditEntryVisibilityINTERNAL;

  static const GRepoAddMemberAuditEntryVisibility PRIVATE =
      _$gRepoAddMemberAuditEntryVisibilityPRIVATE;

  static const GRepoAddMemberAuditEntryVisibility PUBLIC =
      _$gRepoAddMemberAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoAddMemberAuditEntryVisibility> get serializer =>
      _$gRepoAddMemberAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoAddMemberAuditEntryVisibility> get values =>
      _$gRepoAddMemberAuditEntryVisibilityValues;

  static GRepoAddMemberAuditEntryVisibility valueOf(String name) =>
      _$gRepoAddMemberAuditEntryVisibilityValueOf(name);
}

class GRepoArchivedAuditEntryVisibility extends EnumClass {
  const GRepoArchivedAuditEntryVisibility._(String name) : super(name);

  static const GRepoArchivedAuditEntryVisibility INTERNAL =
      _$gRepoArchivedAuditEntryVisibilityINTERNAL;

  static const GRepoArchivedAuditEntryVisibility PRIVATE =
      _$gRepoArchivedAuditEntryVisibilityPRIVATE;

  static const GRepoArchivedAuditEntryVisibility PUBLIC =
      _$gRepoArchivedAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoArchivedAuditEntryVisibility> get serializer =>
      _$gRepoArchivedAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoArchivedAuditEntryVisibility> get values =>
      _$gRepoArchivedAuditEntryVisibilityValues;

  static GRepoArchivedAuditEntryVisibility valueOf(String name) =>
      _$gRepoArchivedAuditEntryVisibilityValueOf(name);
}

class GRepoChangeMergeSettingAuditEntryMergeType extends EnumClass {
  const GRepoChangeMergeSettingAuditEntryMergeType._(String name) : super(name);

  static const GRepoChangeMergeSettingAuditEntryMergeType MERGE =
      _$gRepoChangeMergeSettingAuditEntryMergeTypeMERGE;

  static const GRepoChangeMergeSettingAuditEntryMergeType REBASE =
      _$gRepoChangeMergeSettingAuditEntryMergeTypeREBASE;

  static const GRepoChangeMergeSettingAuditEntryMergeType SQUASH =
      _$gRepoChangeMergeSettingAuditEntryMergeTypeSQUASH;

  static Serializer<GRepoChangeMergeSettingAuditEntryMergeType>
      get serializer => _$gRepoChangeMergeSettingAuditEntryMergeTypeSerializer;

  static BuiltSet<GRepoChangeMergeSettingAuditEntryMergeType> get values =>
      _$gRepoChangeMergeSettingAuditEntryMergeTypeValues;

  static GRepoChangeMergeSettingAuditEntryMergeType valueOf(String name) =>
      _$gRepoChangeMergeSettingAuditEntryMergeTypeValueOf(name);
}

class GRepoCreateAuditEntryVisibility extends EnumClass {
  const GRepoCreateAuditEntryVisibility._(String name) : super(name);

  static const GRepoCreateAuditEntryVisibility INTERNAL =
      _$gRepoCreateAuditEntryVisibilityINTERNAL;

  static const GRepoCreateAuditEntryVisibility PRIVATE =
      _$gRepoCreateAuditEntryVisibilityPRIVATE;

  static const GRepoCreateAuditEntryVisibility PUBLIC =
      _$gRepoCreateAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoCreateAuditEntryVisibility> get serializer =>
      _$gRepoCreateAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoCreateAuditEntryVisibility> get values =>
      _$gRepoCreateAuditEntryVisibilityValues;

  static GRepoCreateAuditEntryVisibility valueOf(String name) =>
      _$gRepoCreateAuditEntryVisibilityValueOf(name);
}

class GRepoDestroyAuditEntryVisibility extends EnumClass {
  const GRepoDestroyAuditEntryVisibility._(String name) : super(name);

  static const GRepoDestroyAuditEntryVisibility INTERNAL =
      _$gRepoDestroyAuditEntryVisibilityINTERNAL;

  static const GRepoDestroyAuditEntryVisibility PRIVATE =
      _$gRepoDestroyAuditEntryVisibilityPRIVATE;

  static const GRepoDestroyAuditEntryVisibility PUBLIC =
      _$gRepoDestroyAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoDestroyAuditEntryVisibility> get serializer =>
      _$gRepoDestroyAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoDestroyAuditEntryVisibility> get values =>
      _$gRepoDestroyAuditEntryVisibilityValues;

  static GRepoDestroyAuditEntryVisibility valueOf(String name) =>
      _$gRepoDestroyAuditEntryVisibilityValueOf(name);
}

class GRepoRemoveMemberAuditEntryVisibility extends EnumClass {
  const GRepoRemoveMemberAuditEntryVisibility._(String name) : super(name);

  static const GRepoRemoveMemberAuditEntryVisibility INTERNAL =
      _$gRepoRemoveMemberAuditEntryVisibilityINTERNAL;

  static const GRepoRemoveMemberAuditEntryVisibility PRIVATE =
      _$gRepoRemoveMemberAuditEntryVisibilityPRIVATE;

  static const GRepoRemoveMemberAuditEntryVisibility PUBLIC =
      _$gRepoRemoveMemberAuditEntryVisibilityPUBLIC;

  static Serializer<GRepoRemoveMemberAuditEntryVisibility> get serializer =>
      _$gRepoRemoveMemberAuditEntryVisibilitySerializer;

  static BuiltSet<GRepoRemoveMemberAuditEntryVisibility> get values =>
      _$gRepoRemoveMemberAuditEntryVisibilityValues;

  static GRepoRemoveMemberAuditEntryVisibility valueOf(String name) =>
      _$gRepoRemoveMemberAuditEntryVisibilityValueOf(name);
}

class GRepositoryAffiliation extends EnumClass {
  const GRepositoryAffiliation._(String name) : super(name);

  static const GRepositoryAffiliation COLLABORATOR =
      _$gRepositoryAffiliationCOLLABORATOR;

  static const GRepositoryAffiliation ORGANIZATION_MEMBER =
      _$gRepositoryAffiliationORGANIZATION_MEMBER;

  static const GRepositoryAffiliation OWNER = _$gRepositoryAffiliationOWNER;

  static Serializer<GRepositoryAffiliation> get serializer =>
      _$gRepositoryAffiliationSerializer;

  static BuiltSet<GRepositoryAffiliation> get values =>
      _$gRepositoryAffiliationValues;

  static GRepositoryAffiliation valueOf(String name) =>
      _$gRepositoryAffiliationValueOf(name);
}

class GRepositoryContributionType extends EnumClass {
  const GRepositoryContributionType._(String name) : super(name);

  static const GRepositoryContributionType COMMIT =
      _$gRepositoryContributionTypeCOMMIT;

  static const GRepositoryContributionType ISSUE =
      _$gRepositoryContributionTypeISSUE;

  static const GRepositoryContributionType PULL_REQUEST =
      _$gRepositoryContributionTypePULL_REQUEST;

  static const GRepositoryContributionType PULL_REQUEST_REVIEW =
      _$gRepositoryContributionTypePULL_REQUEST_REVIEW;

  static const GRepositoryContributionType REPOSITORY =
      _$gRepositoryContributionTypeREPOSITORY;

  static Serializer<GRepositoryContributionType> get serializer =>
      _$gRepositoryContributionTypeSerializer;

  static BuiltSet<GRepositoryContributionType> get values =>
      _$gRepositoryContributionTypeValues;

  static GRepositoryContributionType valueOf(String name) =>
      _$gRepositoryContributionTypeValueOf(name);
}

abstract class GRepositoryInvitationOrder
    implements
        Built<GRepositoryInvitationOrder, GRepositoryInvitationOrderBuilder> {
  GRepositoryInvitationOrder._();

  factory GRepositoryInvitationOrder(
          [Function(GRepositoryInvitationOrderBuilder b) updates]) =
      _$GRepositoryInvitationOrder;

  GOrderDirection get direction;
  GRepositoryInvitationOrderField get field;
  static Serializer<GRepositoryInvitationOrder> get serializer =>
      _$gRepositoryInvitationOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRepositoryInvitationOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRepositoryInvitationOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRepositoryInvitationOrder.serializer,
        json,
      );
}

class GRepositoryInvitationOrderField extends EnumClass {
  const GRepositoryInvitationOrderField._(String name) : super(name);

  static const GRepositoryInvitationOrderField CREATED_AT =
      _$gRepositoryInvitationOrderFieldCREATED_AT;

  static const GRepositoryInvitationOrderField INVITEE_LOGIN =
      _$gRepositoryInvitationOrderFieldINVITEE_LOGIN;

  static Serializer<GRepositoryInvitationOrderField> get serializer =>
      _$gRepositoryInvitationOrderFieldSerializer;

  static BuiltSet<GRepositoryInvitationOrderField> get values =>
      _$gRepositoryInvitationOrderFieldValues;

  static GRepositoryInvitationOrderField valueOf(String name) =>
      _$gRepositoryInvitationOrderFieldValueOf(name);
}

class GRepositoryLockReason extends EnumClass {
  const GRepositoryLockReason._(String name) : super(name);

  static const GRepositoryLockReason BILLING = _$gRepositoryLockReasonBILLING;

  static const GRepositoryLockReason MIGRATING =
      _$gRepositoryLockReasonMIGRATING;

  static const GRepositoryLockReason MOVING = _$gRepositoryLockReasonMOVING;

  static const GRepositoryLockReason RENAME = _$gRepositoryLockReasonRENAME;

  static Serializer<GRepositoryLockReason> get serializer =>
      _$gRepositoryLockReasonSerializer;

  static BuiltSet<GRepositoryLockReason> get values =>
      _$gRepositoryLockReasonValues;

  static GRepositoryLockReason valueOf(String name) =>
      _$gRepositoryLockReasonValueOf(name);
}

abstract class GRepositoryOrder
    implements Built<GRepositoryOrder, GRepositoryOrderBuilder> {
  GRepositoryOrder._();

  factory GRepositoryOrder([Function(GRepositoryOrderBuilder b) updates]) =
      _$GRepositoryOrder;

  GOrderDirection get direction;
  GRepositoryOrderField get field;
  static Serializer<GRepositoryOrder> get serializer =>
      _$gRepositoryOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRepositoryOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRepositoryOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRepositoryOrder.serializer,
        json,
      );
}

class GRepositoryOrderField extends EnumClass {
  const GRepositoryOrderField._(String name) : super(name);

  static const GRepositoryOrderField CREATED_AT =
      _$gRepositoryOrderFieldCREATED_AT;

  static const GRepositoryOrderField NAME = _$gRepositoryOrderFieldNAME;

  static const GRepositoryOrderField PUSHED_AT =
      _$gRepositoryOrderFieldPUSHED_AT;

  static const GRepositoryOrderField STARGAZERS =
      _$gRepositoryOrderFieldSTARGAZERS;

  static const GRepositoryOrderField UPDATED_AT =
      _$gRepositoryOrderFieldUPDATED_AT;

  static Serializer<GRepositoryOrderField> get serializer =>
      _$gRepositoryOrderFieldSerializer;

  static BuiltSet<GRepositoryOrderField> get values =>
      _$gRepositoryOrderFieldValues;

  static GRepositoryOrderField valueOf(String name) =>
      _$gRepositoryOrderFieldValueOf(name);
}

class GRepositoryPermission extends EnumClass {
  const GRepositoryPermission._(String name) : super(name);

  static const GRepositoryPermission ADMIN = _$gRepositoryPermissionADMIN;

  static const GRepositoryPermission MAINTAIN = _$gRepositoryPermissionMAINTAIN;

  static const GRepositoryPermission READ = _$gRepositoryPermissionREAD;

  static const GRepositoryPermission TRIAGE = _$gRepositoryPermissionTRIAGE;

  static const GRepositoryPermission WRITE = _$gRepositoryPermissionWRITE;

  static Serializer<GRepositoryPermission> get serializer =>
      _$gRepositoryPermissionSerializer;

  static BuiltSet<GRepositoryPermission> get values =>
      _$gRepositoryPermissionValues;

  static GRepositoryPermission valueOf(String name) =>
      _$gRepositoryPermissionValueOf(name);
}

class GRepositoryPrivacy extends EnumClass {
  const GRepositoryPrivacy._(String name) : super(name);

  static const GRepositoryPrivacy PRIVATE = _$gRepositoryPrivacyPRIVATE;

  static const GRepositoryPrivacy PUBLIC = _$gRepositoryPrivacyPUBLIC;

  static Serializer<GRepositoryPrivacy> get serializer =>
      _$gRepositoryPrivacySerializer;

  static BuiltSet<GRepositoryPrivacy> get values => _$gRepositoryPrivacyValues;

  static GRepositoryPrivacy valueOf(String name) =>
      _$gRepositoryPrivacyValueOf(name);
}

class GRepositoryVisibility extends EnumClass {
  const GRepositoryVisibility._(String name) : super(name);

  static const GRepositoryVisibility INTERNAL = _$gRepositoryVisibilityINTERNAL;

  static const GRepositoryVisibility PRIVATE = _$gRepositoryVisibilityPRIVATE;

  static const GRepositoryVisibility PUBLIC = _$gRepositoryVisibilityPUBLIC;

  static Serializer<GRepositoryVisibility> get serializer =>
      _$gRepositoryVisibilitySerializer;

  static BuiltSet<GRepositoryVisibility> get values =>
      _$gRepositoryVisibilityValues;

  static GRepositoryVisibility valueOf(String name) =>
      _$gRepositoryVisibilityValueOf(name);
}

abstract class GRequestReviewsInput
    implements Built<GRequestReviewsInput, GRequestReviewsInputBuilder> {
  GRequestReviewsInput._();

  factory GRequestReviewsInput(
          [Function(GRequestReviewsInputBuilder b) updates]) =
      _$GRequestReviewsInput;

  String? get clientMutationId;
  String get pullRequestId;
  BuiltList<String>? get teamIds;
  bool? get union;
  BuiltList<String>? get userIds;
  static Serializer<GRequestReviewsInput> get serializer =>
      _$gRequestReviewsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRequestReviewsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRequestReviewsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRequestReviewsInput.serializer,
        json,
      );
}

abstract class GResolveReviewThreadInput
    implements
        Built<GResolveReviewThreadInput, GResolveReviewThreadInputBuilder> {
  GResolveReviewThreadInput._();

  factory GResolveReviewThreadInput(
          [Function(GResolveReviewThreadInputBuilder b) updates]) =
      _$GResolveReviewThreadInput;

  String? get clientMutationId;
  String get threadId;
  static Serializer<GResolveReviewThreadInput> get serializer =>
      _$gResolveReviewThreadInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GResolveReviewThreadInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GResolveReviewThreadInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GResolveReviewThreadInput.serializer,
        json,
      );
}

class GSamlDigestAlgorithm extends EnumClass {
  const GSamlDigestAlgorithm._(String name) : super(name);

  static const GSamlDigestAlgorithm SHA1 = _$gSamlDigestAlgorithmSHA1;

  static const GSamlDigestAlgorithm SHA256 = _$gSamlDigestAlgorithmSHA256;

  static const GSamlDigestAlgorithm SHA384 = _$gSamlDigestAlgorithmSHA384;

  static const GSamlDigestAlgorithm SHA512 = _$gSamlDigestAlgorithmSHA512;

  static Serializer<GSamlDigestAlgorithm> get serializer =>
      _$gSamlDigestAlgorithmSerializer;

  static BuiltSet<GSamlDigestAlgorithm> get values =>
      _$gSamlDigestAlgorithmValues;

  static GSamlDigestAlgorithm valueOf(String name) =>
      _$gSamlDigestAlgorithmValueOf(name);
}

class GSamlSignatureAlgorithm extends EnumClass {
  const GSamlSignatureAlgorithm._(String name) : super(name);

  static const GSamlSignatureAlgorithm RSA_SHA1 =
      _$gSamlSignatureAlgorithmRSA_SHA1;

  static const GSamlSignatureAlgorithm RSA_SHA256 =
      _$gSamlSignatureAlgorithmRSA_SHA256;

  static const GSamlSignatureAlgorithm RSA_SHA384 =
      _$gSamlSignatureAlgorithmRSA_SHA384;

  static const GSamlSignatureAlgorithm RSA_SHA512 =
      _$gSamlSignatureAlgorithmRSA_SHA512;

  static Serializer<GSamlSignatureAlgorithm> get serializer =>
      _$gSamlSignatureAlgorithmSerializer;

  static BuiltSet<GSamlSignatureAlgorithm> get values =>
      _$gSamlSignatureAlgorithmValues;

  static GSamlSignatureAlgorithm valueOf(String name) =>
      _$gSamlSignatureAlgorithmValueOf(name);
}

abstract class GSavedReplyOrder
    implements Built<GSavedReplyOrder, GSavedReplyOrderBuilder> {
  GSavedReplyOrder._();

  factory GSavedReplyOrder([Function(GSavedReplyOrderBuilder b) updates]) =
      _$GSavedReplyOrder;

  GOrderDirection get direction;
  GSavedReplyOrderField get field;
  static Serializer<GSavedReplyOrder> get serializer =>
      _$gSavedReplyOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSavedReplyOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSavedReplyOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSavedReplyOrder.serializer,
        json,
      );
}

class GSavedReplyOrderField extends EnumClass {
  const GSavedReplyOrderField._(String name) : super(name);

  static const GSavedReplyOrderField UPDATED_AT =
      _$gSavedReplyOrderFieldUPDATED_AT;

  static Serializer<GSavedReplyOrderField> get serializer =>
      _$gSavedReplyOrderFieldSerializer;

  static BuiltSet<GSavedReplyOrderField> get values =>
      _$gSavedReplyOrderFieldValues;

  static GSavedReplyOrderField valueOf(String name) =>
      _$gSavedReplyOrderFieldValueOf(name);
}

class GSearchType extends EnumClass {
  const GSearchType._(String name) : super(name);

  static const GSearchType ISSUE = _$gSearchTypeISSUE;

  static const GSearchType REPOSITORY = _$gSearchTypeREPOSITORY;

  static const GSearchType USER = _$gSearchTypeUSER;

  static Serializer<GSearchType> get serializer => _$gSearchTypeSerializer;

  static BuiltSet<GSearchType> get values => _$gSearchTypeValues;

  static GSearchType valueOf(String name) => _$gSearchTypeValueOf(name);
}

class GSecurityAdvisoryEcosystem extends EnumClass {
  const GSecurityAdvisoryEcosystem._(String name) : super(name);

  static const GSecurityAdvisoryEcosystem COMPOSER =
      _$gSecurityAdvisoryEcosystemCOMPOSER;

  static const GSecurityAdvisoryEcosystem MAVEN =
      _$gSecurityAdvisoryEcosystemMAVEN;

  static const GSecurityAdvisoryEcosystem NPM = _$gSecurityAdvisoryEcosystemNPM;

  static const GSecurityAdvisoryEcosystem NUGET =
      _$gSecurityAdvisoryEcosystemNUGET;

  static const GSecurityAdvisoryEcosystem PIP = _$gSecurityAdvisoryEcosystemPIP;

  static const GSecurityAdvisoryEcosystem RUBYGEMS =
      _$gSecurityAdvisoryEcosystemRUBYGEMS;

  static Serializer<GSecurityAdvisoryEcosystem> get serializer =>
      _$gSecurityAdvisoryEcosystemSerializer;

  static BuiltSet<GSecurityAdvisoryEcosystem> get values =>
      _$gSecurityAdvisoryEcosystemValues;

  static GSecurityAdvisoryEcosystem valueOf(String name) =>
      _$gSecurityAdvisoryEcosystemValueOf(name);
}

abstract class GSecurityAdvisoryIdentifierFilter
    implements
        Built<GSecurityAdvisoryIdentifierFilter,
            GSecurityAdvisoryIdentifierFilterBuilder> {
  GSecurityAdvisoryIdentifierFilter._();

  factory GSecurityAdvisoryIdentifierFilter(
          [Function(GSecurityAdvisoryIdentifierFilterBuilder b) updates]) =
      _$GSecurityAdvisoryIdentifierFilter;

  GSecurityAdvisoryIdentifierType get type;
  String get value;
  static Serializer<GSecurityAdvisoryIdentifierFilter> get serializer =>
      _$gSecurityAdvisoryIdentifierFilterSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityAdvisoryIdentifierFilter.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSecurityAdvisoryIdentifierFilter? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityAdvisoryIdentifierFilter.serializer,
        json,
      );
}

class GSecurityAdvisoryIdentifierType extends EnumClass {
  const GSecurityAdvisoryIdentifierType._(String name) : super(name);

  static const GSecurityAdvisoryIdentifierType CVE =
      _$gSecurityAdvisoryIdentifierTypeCVE;

  static const GSecurityAdvisoryIdentifierType GHSA =
      _$gSecurityAdvisoryIdentifierTypeGHSA;

  static Serializer<GSecurityAdvisoryIdentifierType> get serializer =>
      _$gSecurityAdvisoryIdentifierTypeSerializer;

  static BuiltSet<GSecurityAdvisoryIdentifierType> get values =>
      _$gSecurityAdvisoryIdentifierTypeValues;

  static GSecurityAdvisoryIdentifierType valueOf(String name) =>
      _$gSecurityAdvisoryIdentifierTypeValueOf(name);
}

abstract class GSecurityAdvisoryOrder
    implements Built<GSecurityAdvisoryOrder, GSecurityAdvisoryOrderBuilder> {
  GSecurityAdvisoryOrder._();

  factory GSecurityAdvisoryOrder(
          [Function(GSecurityAdvisoryOrderBuilder b) updates]) =
      _$GSecurityAdvisoryOrder;

  GOrderDirection get direction;
  GSecurityAdvisoryOrderField get field;
  static Serializer<GSecurityAdvisoryOrder> get serializer =>
      _$gSecurityAdvisoryOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityAdvisoryOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSecurityAdvisoryOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityAdvisoryOrder.serializer,
        json,
      );
}

class GSecurityAdvisoryOrderField extends EnumClass {
  const GSecurityAdvisoryOrderField._(String name) : super(name);

  static const GSecurityAdvisoryOrderField PUBLISHED_AT =
      _$gSecurityAdvisoryOrderFieldPUBLISHED_AT;

  static const GSecurityAdvisoryOrderField UPDATED_AT =
      _$gSecurityAdvisoryOrderFieldUPDATED_AT;

  static Serializer<GSecurityAdvisoryOrderField> get serializer =>
      _$gSecurityAdvisoryOrderFieldSerializer;

  static BuiltSet<GSecurityAdvisoryOrderField> get values =>
      _$gSecurityAdvisoryOrderFieldValues;

  static GSecurityAdvisoryOrderField valueOf(String name) =>
      _$gSecurityAdvisoryOrderFieldValueOf(name);
}

class GSecurityAdvisorySeverity extends EnumClass {
  const GSecurityAdvisorySeverity._(String name) : super(name);

  static const GSecurityAdvisorySeverity CRITICAL =
      _$gSecurityAdvisorySeverityCRITICAL;

  static const GSecurityAdvisorySeverity HIGH = _$gSecurityAdvisorySeverityHIGH;

  static const GSecurityAdvisorySeverity LOW = _$gSecurityAdvisorySeverityLOW;

  static const GSecurityAdvisorySeverity MODERATE =
      _$gSecurityAdvisorySeverityMODERATE;

  static Serializer<GSecurityAdvisorySeverity> get serializer =>
      _$gSecurityAdvisorySeveritySerializer;

  static BuiltSet<GSecurityAdvisorySeverity> get values =>
      _$gSecurityAdvisorySeverityValues;

  static GSecurityAdvisorySeverity valueOf(String name) =>
      _$gSecurityAdvisorySeverityValueOf(name);
}

abstract class GSecurityVulnerabilityOrder
    implements
        Built<GSecurityVulnerabilityOrder, GSecurityVulnerabilityOrderBuilder> {
  GSecurityVulnerabilityOrder._();

  factory GSecurityVulnerabilityOrder(
          [Function(GSecurityVulnerabilityOrderBuilder b) updates]) =
      _$GSecurityVulnerabilityOrder;

  GOrderDirection get direction;
  GSecurityVulnerabilityOrderField get field;
  static Serializer<GSecurityVulnerabilityOrder> get serializer =>
      _$gSecurityVulnerabilityOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityVulnerabilityOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSecurityVulnerabilityOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityVulnerabilityOrder.serializer,
        json,
      );
}

class GSecurityVulnerabilityOrderField extends EnumClass {
  const GSecurityVulnerabilityOrderField._(String name) : super(name);

  static const GSecurityVulnerabilityOrderField UPDATED_AT =
      _$gSecurityVulnerabilityOrderFieldUPDATED_AT;

  static Serializer<GSecurityVulnerabilityOrderField> get serializer =>
      _$gSecurityVulnerabilityOrderFieldSerializer;

  static BuiltSet<GSecurityVulnerabilityOrderField> get values =>
      _$gSecurityVulnerabilityOrderFieldValues;

  static GSecurityVulnerabilityOrderField valueOf(String name) =>
      _$gSecurityVulnerabilityOrderFieldValueOf(name);
}

abstract class GSponsorsTierOrder
    implements Built<GSponsorsTierOrder, GSponsorsTierOrderBuilder> {
  GSponsorsTierOrder._();

  factory GSponsorsTierOrder([Function(GSponsorsTierOrderBuilder b) updates]) =
      _$GSponsorsTierOrder;

  GOrderDirection get direction;
  GSponsorsTierOrderField get field;
  static Serializer<GSponsorsTierOrder> get serializer =>
      _$gSponsorsTierOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSponsorsTierOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSponsorsTierOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSponsorsTierOrder.serializer,
        json,
      );
}

class GSponsorsTierOrderField extends EnumClass {
  const GSponsorsTierOrderField._(String name) : super(name);

  static const GSponsorsTierOrderField CREATED_AT =
      _$gSponsorsTierOrderFieldCREATED_AT;

  static const GSponsorsTierOrderField MONTHLY_PRICE_IN_CENTS =
      _$gSponsorsTierOrderFieldMONTHLY_PRICE_IN_CENTS;

  static Serializer<GSponsorsTierOrderField> get serializer =>
      _$gSponsorsTierOrderFieldSerializer;

  static BuiltSet<GSponsorsTierOrderField> get values =>
      _$gSponsorsTierOrderFieldValues;

  static GSponsorsTierOrderField valueOf(String name) =>
      _$gSponsorsTierOrderFieldValueOf(name);
}

abstract class GSponsorshipOrder
    implements Built<GSponsorshipOrder, GSponsorshipOrderBuilder> {
  GSponsorshipOrder._();

  factory GSponsorshipOrder([Function(GSponsorshipOrderBuilder b) updates]) =
      _$GSponsorshipOrder;

  GOrderDirection get direction;
  GSponsorshipOrderField get field;
  static Serializer<GSponsorshipOrder> get serializer =>
      _$gSponsorshipOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSponsorshipOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSponsorshipOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSponsorshipOrder.serializer,
        json,
      );
}

class GSponsorshipOrderField extends EnumClass {
  const GSponsorshipOrderField._(String name) : super(name);

  static const GSponsorshipOrderField CREATED_AT =
      _$gSponsorshipOrderFieldCREATED_AT;

  static Serializer<GSponsorshipOrderField> get serializer =>
      _$gSponsorshipOrderFieldSerializer;

  static BuiltSet<GSponsorshipOrderField> get values =>
      _$gSponsorshipOrderFieldValues;

  static GSponsorshipOrderField valueOf(String name) =>
      _$gSponsorshipOrderFieldValueOf(name);
}

class GSponsorshipPrivacy extends EnumClass {
  const GSponsorshipPrivacy._(String name) : super(name);

  static const GSponsorshipPrivacy PRIVATE = _$gSponsorshipPrivacyPRIVATE;

  static const GSponsorshipPrivacy PUBLIC = _$gSponsorshipPrivacyPUBLIC;

  static Serializer<GSponsorshipPrivacy> get serializer =>
      _$gSponsorshipPrivacySerializer;

  static BuiltSet<GSponsorshipPrivacy> get values =>
      _$gSponsorshipPrivacyValues;

  static GSponsorshipPrivacy valueOf(String name) =>
      _$gSponsorshipPrivacyValueOf(name);
}

abstract class GStarOrder implements Built<GStarOrder, GStarOrderBuilder> {
  GStarOrder._();

  factory GStarOrder([Function(GStarOrderBuilder b) updates]) = _$GStarOrder;

  GOrderDirection get direction;
  GStarOrderField get field;
  static Serializer<GStarOrder> get serializer => _$gStarOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStarOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStarOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStarOrder.serializer,
        json,
      );
}

class GStarOrderField extends EnumClass {
  const GStarOrderField._(String name) : super(name);

  static const GStarOrderField STARRED_AT = _$gStarOrderFieldSTARRED_AT;

  static Serializer<GStarOrderField> get serializer =>
      _$gStarOrderFieldSerializer;

  static BuiltSet<GStarOrderField> get values => _$gStarOrderFieldValues;

  static GStarOrderField valueOf(String name) => _$gStarOrderFieldValueOf(name);
}

class GStatusState extends EnumClass {
  const GStatusState._(String name) : super(name);

  static const GStatusState ERROR = _$gStatusStateERROR;

  static const GStatusState EXPECTED = _$gStatusStateEXPECTED;

  static const GStatusState FAILURE = _$gStatusStateFAILURE;

  static const GStatusState PENDING = _$gStatusStatePENDING;

  static const GStatusState SUCCESS = _$gStatusStateSUCCESS;

  static Serializer<GStatusState> get serializer => _$gStatusStateSerializer;

  static BuiltSet<GStatusState> get values => _$gStatusStateValues;

  static GStatusState valueOf(String name) => _$gStatusStateValueOf(name);
}

abstract class GSubmitPullRequestReviewInput
    implements
        Built<GSubmitPullRequestReviewInput,
            GSubmitPullRequestReviewInputBuilder> {
  GSubmitPullRequestReviewInput._();

  factory GSubmitPullRequestReviewInput(
          [Function(GSubmitPullRequestReviewInputBuilder b) updates]) =
      _$GSubmitPullRequestReviewInput;

  String? get body;
  String? get clientMutationId;
  GPullRequestReviewEvent get event;
  String? get pullRequestId;
  String? get pullRequestReviewId;
  static Serializer<GSubmitPullRequestReviewInput> get serializer =>
      _$gSubmitPullRequestReviewInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSubmitPullRequestReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSubmitPullRequestReviewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSubmitPullRequestReviewInput.serializer,
        json,
      );
}

class GSubscriptionState extends EnumClass {
  const GSubscriptionState._(String name) : super(name);

  static const GSubscriptionState IGNORED = _$gSubscriptionStateIGNORED;

  static const GSubscriptionState SUBSCRIBED = _$gSubscriptionStateSUBSCRIBED;

  static const GSubscriptionState UNSUBSCRIBED =
      _$gSubscriptionStateUNSUBSCRIBED;

  static Serializer<GSubscriptionState> get serializer =>
      _$gSubscriptionStateSerializer;

  static BuiltSet<GSubscriptionState> get values => _$gSubscriptionStateValues;

  static GSubscriptionState valueOf(String name) =>
      _$gSubscriptionStateValueOf(name);
}

abstract class GTeamDiscussionCommentOrder
    implements
        Built<GTeamDiscussionCommentOrder, GTeamDiscussionCommentOrderBuilder> {
  GTeamDiscussionCommentOrder._();

  factory GTeamDiscussionCommentOrder(
          [Function(GTeamDiscussionCommentOrderBuilder b) updates]) =
      _$GTeamDiscussionCommentOrder;

  GOrderDirection get direction;
  GTeamDiscussionCommentOrderField get field;
  static Serializer<GTeamDiscussionCommentOrder> get serializer =>
      _$gTeamDiscussionCommentOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTeamDiscussionCommentOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTeamDiscussionCommentOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTeamDiscussionCommentOrder.serializer,
        json,
      );
}

class GTeamDiscussionCommentOrderField extends EnumClass {
  const GTeamDiscussionCommentOrderField._(String name) : super(name);

  static const GTeamDiscussionCommentOrderField NUMBER =
      _$gTeamDiscussionCommentOrderFieldNUMBER;

  static Serializer<GTeamDiscussionCommentOrderField> get serializer =>
      _$gTeamDiscussionCommentOrderFieldSerializer;

  static BuiltSet<GTeamDiscussionCommentOrderField> get values =>
      _$gTeamDiscussionCommentOrderFieldValues;

  static GTeamDiscussionCommentOrderField valueOf(String name) =>
      _$gTeamDiscussionCommentOrderFieldValueOf(name);
}

abstract class GTeamDiscussionOrder
    implements Built<GTeamDiscussionOrder, GTeamDiscussionOrderBuilder> {
  GTeamDiscussionOrder._();

  factory GTeamDiscussionOrder(
          [Function(GTeamDiscussionOrderBuilder b) updates]) =
      _$GTeamDiscussionOrder;

  GOrderDirection get direction;
  GTeamDiscussionOrderField get field;
  static Serializer<GTeamDiscussionOrder> get serializer =>
      _$gTeamDiscussionOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTeamDiscussionOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTeamDiscussionOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTeamDiscussionOrder.serializer,
        json,
      );
}

class GTeamDiscussionOrderField extends EnumClass {
  const GTeamDiscussionOrderField._(String name) : super(name);

  static const GTeamDiscussionOrderField CREATED_AT =
      _$gTeamDiscussionOrderFieldCREATED_AT;

  static Serializer<GTeamDiscussionOrderField> get serializer =>
      _$gTeamDiscussionOrderFieldSerializer;

  static BuiltSet<GTeamDiscussionOrderField> get values =>
      _$gTeamDiscussionOrderFieldValues;

  static GTeamDiscussionOrderField valueOf(String name) =>
      _$gTeamDiscussionOrderFieldValueOf(name);
}

abstract class GTeamMemberOrder
    implements Built<GTeamMemberOrder, GTeamMemberOrderBuilder> {
  GTeamMemberOrder._();

  factory GTeamMemberOrder([Function(GTeamMemberOrderBuilder b) updates]) =
      _$GTeamMemberOrder;

  GOrderDirection get direction;
  GTeamMemberOrderField get field;
  static Serializer<GTeamMemberOrder> get serializer =>
      _$gTeamMemberOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTeamMemberOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTeamMemberOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTeamMemberOrder.serializer,
        json,
      );
}

class GTeamMemberOrderField extends EnumClass {
  const GTeamMemberOrderField._(String name) : super(name);

  static const GTeamMemberOrderField CREATED_AT =
      _$gTeamMemberOrderFieldCREATED_AT;

  static const GTeamMemberOrderField LOGIN = _$gTeamMemberOrderFieldLOGIN;

  static Serializer<GTeamMemberOrderField> get serializer =>
      _$gTeamMemberOrderFieldSerializer;

  static BuiltSet<GTeamMemberOrderField> get values =>
      _$gTeamMemberOrderFieldValues;

  static GTeamMemberOrderField valueOf(String name) =>
      _$gTeamMemberOrderFieldValueOf(name);
}

class GTeamMemberRole extends EnumClass {
  const GTeamMemberRole._(String name) : super(name);

  static const GTeamMemberRole MAINTAINER = _$gTeamMemberRoleMAINTAINER;

  static const GTeamMemberRole MEMBER = _$gTeamMemberRoleMEMBER;

  static Serializer<GTeamMemberRole> get serializer =>
      _$gTeamMemberRoleSerializer;

  static BuiltSet<GTeamMemberRole> get values => _$gTeamMemberRoleValues;

  static GTeamMemberRole valueOf(String name) => _$gTeamMemberRoleValueOf(name);
}

class GTeamMembershipType extends EnumClass {
  const GTeamMembershipType._(String name) : super(name);

  static const GTeamMembershipType ALL = _$gTeamMembershipTypeALL;

  static const GTeamMembershipType CHILD_TEAM = _$gTeamMembershipTypeCHILD_TEAM;

  static const GTeamMembershipType IMMEDIATE = _$gTeamMembershipTypeIMMEDIATE;

  static Serializer<GTeamMembershipType> get serializer =>
      _$gTeamMembershipTypeSerializer;

  static BuiltSet<GTeamMembershipType> get values =>
      _$gTeamMembershipTypeValues;

  static GTeamMembershipType valueOf(String name) =>
      _$gTeamMembershipTypeValueOf(name);
}

abstract class GTeamOrder implements Built<GTeamOrder, GTeamOrderBuilder> {
  GTeamOrder._();

  factory GTeamOrder([Function(GTeamOrderBuilder b) updates]) = _$GTeamOrder;

  GOrderDirection get direction;
  GTeamOrderField get field;
  static Serializer<GTeamOrder> get serializer => _$gTeamOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTeamOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTeamOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTeamOrder.serializer,
        json,
      );
}

class GTeamOrderField extends EnumClass {
  const GTeamOrderField._(String name) : super(name);

  static const GTeamOrderField NAME = _$gTeamOrderFieldNAME;

  static Serializer<GTeamOrderField> get serializer =>
      _$gTeamOrderFieldSerializer;

  static BuiltSet<GTeamOrderField> get values => _$gTeamOrderFieldValues;

  static GTeamOrderField valueOf(String name) => _$gTeamOrderFieldValueOf(name);
}

class GTeamPrivacy extends EnumClass {
  const GTeamPrivacy._(String name) : super(name);

  static const GTeamPrivacy SECRET = _$gTeamPrivacySECRET;

  static const GTeamPrivacy VISIBLE = _$gTeamPrivacyVISIBLE;

  static Serializer<GTeamPrivacy> get serializer => _$gTeamPrivacySerializer;

  static BuiltSet<GTeamPrivacy> get values => _$gTeamPrivacyValues;

  static GTeamPrivacy valueOf(String name) => _$gTeamPrivacyValueOf(name);
}

abstract class GTeamRepositoryOrder
    implements Built<GTeamRepositoryOrder, GTeamRepositoryOrderBuilder> {
  GTeamRepositoryOrder._();

  factory GTeamRepositoryOrder(
          [Function(GTeamRepositoryOrderBuilder b) updates]) =
      _$GTeamRepositoryOrder;

  GOrderDirection get direction;
  GTeamRepositoryOrderField get field;
  static Serializer<GTeamRepositoryOrder> get serializer =>
      _$gTeamRepositoryOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTeamRepositoryOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTeamRepositoryOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTeamRepositoryOrder.serializer,
        json,
      );
}

class GTeamRepositoryOrderField extends EnumClass {
  const GTeamRepositoryOrderField._(String name) : super(name);

  static const GTeamRepositoryOrderField CREATED_AT =
      _$gTeamRepositoryOrderFieldCREATED_AT;

  static const GTeamRepositoryOrderField NAME = _$gTeamRepositoryOrderFieldNAME;

  static const GTeamRepositoryOrderField PERMISSION =
      _$gTeamRepositoryOrderFieldPERMISSION;

  static const GTeamRepositoryOrderField PUSHED_AT =
      _$gTeamRepositoryOrderFieldPUSHED_AT;

  static const GTeamRepositoryOrderField STARGAZERS =
      _$gTeamRepositoryOrderFieldSTARGAZERS;

  static const GTeamRepositoryOrderField UPDATED_AT =
      _$gTeamRepositoryOrderFieldUPDATED_AT;

  static Serializer<GTeamRepositoryOrderField> get serializer =>
      _$gTeamRepositoryOrderFieldSerializer;

  static BuiltSet<GTeamRepositoryOrderField> get values =>
      _$gTeamRepositoryOrderFieldValues;

  static GTeamRepositoryOrderField valueOf(String name) =>
      _$gTeamRepositoryOrderFieldValueOf(name);
}

class GTeamRole extends EnumClass {
  const GTeamRole._(String name) : super(name);

  static const GTeamRole ADMIN = _$gTeamRoleADMIN;

  static const GTeamRole MEMBER = _$gTeamRoleMEMBER;

  static Serializer<GTeamRole> get serializer => _$gTeamRoleSerializer;

  static BuiltSet<GTeamRole> get values => _$gTeamRoleValues;

  static GTeamRole valueOf(String name) => _$gTeamRoleValueOf(name);
}

class GTopicSuggestionDeclineReason extends EnumClass {
  const GTopicSuggestionDeclineReason._(String name) : super(name);

  static const GTopicSuggestionDeclineReason NOT_RELEVANT =
      _$gTopicSuggestionDeclineReasonNOT_RELEVANT;

  static const GTopicSuggestionDeclineReason PERSONAL_PREFERENCE =
      _$gTopicSuggestionDeclineReasonPERSONAL_PREFERENCE;

  static const GTopicSuggestionDeclineReason TOO_GENERAL =
      _$gTopicSuggestionDeclineReasonTOO_GENERAL;

  static const GTopicSuggestionDeclineReason TOO_SPECIFIC =
      _$gTopicSuggestionDeclineReasonTOO_SPECIFIC;

  static Serializer<GTopicSuggestionDeclineReason> get serializer =>
      _$gTopicSuggestionDeclineReasonSerializer;

  static BuiltSet<GTopicSuggestionDeclineReason> get values =>
      _$gTopicSuggestionDeclineReasonValues;

  static GTopicSuggestionDeclineReason valueOf(String name) =>
      _$gTopicSuggestionDeclineReasonValueOf(name);
}

abstract class GTransferIssueInput
    implements Built<GTransferIssueInput, GTransferIssueInputBuilder> {
  GTransferIssueInput._();

  factory GTransferIssueInput(
      [Function(GTransferIssueInputBuilder b) updates]) = _$GTransferIssueInput;

  String? get clientMutationId;
  String get issueId;
  String get repositoryId;
  static Serializer<GTransferIssueInput> get serializer =>
      _$gTransferIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTransferIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTransferIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTransferIssueInput.serializer,
        json,
      );
}

abstract class GURI implements Built<GURI, GURIBuilder> {
  GURI._();

  factory GURI([String? value]) =>
      _$GURI((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GURI> get serializer => _i2.DefaultScalarSerializer<GURI>(
      (Object serialized) => GURI((serialized as String?)));
}

abstract class GUnarchiveRepositoryInput
    implements
        Built<GUnarchiveRepositoryInput, GUnarchiveRepositoryInputBuilder> {
  GUnarchiveRepositoryInput._();

  factory GUnarchiveRepositoryInput(
          [Function(GUnarchiveRepositoryInputBuilder b) updates]) =
      _$GUnarchiveRepositoryInput;

  String? get clientMutationId;
  String get repositoryId;
  static Serializer<GUnarchiveRepositoryInput> get serializer =>
      _$gUnarchiveRepositoryInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnarchiveRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnarchiveRepositoryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnarchiveRepositoryInput.serializer,
        json,
      );
}

abstract class GUnfollowUserInput
    implements Built<GUnfollowUserInput, GUnfollowUserInputBuilder> {
  GUnfollowUserInput._();

  factory GUnfollowUserInput([Function(GUnfollowUserInputBuilder b) updates]) =
      _$GUnfollowUserInput;

  String? get clientMutationId;
  String get userId;
  static Serializer<GUnfollowUserInput> get serializer =>
      _$gUnfollowUserInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnfollowUserInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnfollowUserInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnfollowUserInput.serializer,
        json,
      );
}

abstract class GUnlinkRepositoryFromProjectInput
    implements
        Built<GUnlinkRepositoryFromProjectInput,
            GUnlinkRepositoryFromProjectInputBuilder> {
  GUnlinkRepositoryFromProjectInput._();

  factory GUnlinkRepositoryFromProjectInput(
          [Function(GUnlinkRepositoryFromProjectInputBuilder b) updates]) =
      _$GUnlinkRepositoryFromProjectInput;

  String? get clientMutationId;
  String get projectId;
  String get repositoryId;
  static Serializer<GUnlinkRepositoryFromProjectInput> get serializer =>
      _$gUnlinkRepositoryFromProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnlinkRepositoryFromProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnlinkRepositoryFromProjectInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnlinkRepositoryFromProjectInput.serializer,
        json,
      );
}

abstract class GUnlockLockableInput
    implements Built<GUnlockLockableInput, GUnlockLockableInputBuilder> {
  GUnlockLockableInput._();

  factory GUnlockLockableInput(
          [Function(GUnlockLockableInputBuilder b) updates]) =
      _$GUnlockLockableInput;

  String? get clientMutationId;
  String get lockableId;
  static Serializer<GUnlockLockableInput> get serializer =>
      _$gUnlockLockableInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnlockLockableInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnlockLockableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnlockLockableInput.serializer,
        json,
      );
}

abstract class GUnmarkIssueAsDuplicateInput
    implements
        Built<GUnmarkIssueAsDuplicateInput,
            GUnmarkIssueAsDuplicateInputBuilder> {
  GUnmarkIssueAsDuplicateInput._();

  factory GUnmarkIssueAsDuplicateInput(
          [Function(GUnmarkIssueAsDuplicateInputBuilder b) updates]) =
      _$GUnmarkIssueAsDuplicateInput;

  String get canonicalId;
  String? get clientMutationId;
  String get duplicateId;
  static Serializer<GUnmarkIssueAsDuplicateInput> get serializer =>
      _$gUnmarkIssueAsDuplicateInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnmarkIssueAsDuplicateInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnmarkIssueAsDuplicateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnmarkIssueAsDuplicateInput.serializer,
        json,
      );
}

abstract class GUnresolveReviewThreadInput
    implements
        Built<GUnresolveReviewThreadInput, GUnresolveReviewThreadInputBuilder> {
  GUnresolveReviewThreadInput._();

  factory GUnresolveReviewThreadInput(
          [Function(GUnresolveReviewThreadInputBuilder b) updates]) =
      _$GUnresolveReviewThreadInput;

  String? get clientMutationId;
  String get threadId;
  static Serializer<GUnresolveReviewThreadInput> get serializer =>
      _$gUnresolveReviewThreadInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUnresolveReviewThreadInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUnresolveReviewThreadInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUnresolveReviewThreadInput.serializer,
        json,
      );
}

abstract class GUpdateBranchProtectionRuleInput
    implements
        Built<GUpdateBranchProtectionRuleInput,
            GUpdateBranchProtectionRuleInputBuilder> {
  GUpdateBranchProtectionRuleInput._();

  factory GUpdateBranchProtectionRuleInput(
          [Function(GUpdateBranchProtectionRuleInputBuilder b) updates]) =
      _$GUpdateBranchProtectionRuleInput;

  String get branchProtectionRuleId;
  String? get clientMutationId;
  bool? get dismissesStaleReviews;
  bool? get isAdminEnforced;
  String? get pattern;
  BuiltList<String>? get pushActorIds;
  int? get requiredApprovingReviewCount;
  BuiltList<String>? get requiredStatusCheckContexts;
  bool? get requiresApprovingReviews;
  bool? get requiresCodeOwnerReviews;
  bool? get requiresCommitSignatures;
  bool? get requiresStatusChecks;
  bool? get requiresStrictStatusChecks;
  bool? get restrictsPushes;
  bool? get restrictsReviewDismissals;
  BuiltList<String>? get reviewDismissalActorIds;
  static Serializer<GUpdateBranchProtectionRuleInput> get serializer =>
      _$gUpdateBranchProtectionRuleInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateBranchProtectionRuleInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateBranchProtectionRuleInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateBranchProtectionRuleInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseActionExecutionCapabilitySettingInput
    implements
        Built<GUpdateEnterpriseActionExecutionCapabilitySettingInput,
            GUpdateEnterpriseActionExecutionCapabilitySettingInputBuilder> {
  GUpdateEnterpriseActionExecutionCapabilitySettingInput._();

  factory GUpdateEnterpriseActionExecutionCapabilitySettingInput(
      [Function(GUpdateEnterpriseActionExecutionCapabilitySettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseActionExecutionCapabilitySettingInput;

  GActionExecutionCapabilitySetting get capability;
  String? get clientMutationId;
  String get enterpriseId;
  static Serializer<GUpdateEnterpriseActionExecutionCapabilitySettingInput>
      get serializer =>
          _$gUpdateEnterpriseActionExecutionCapabilitySettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseActionExecutionCapabilitySettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseActionExecutionCapabilitySettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseActionExecutionCapabilitySettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseAdministratorRoleInput
    implements
        Built<GUpdateEnterpriseAdministratorRoleInput,
            GUpdateEnterpriseAdministratorRoleInputBuilder> {
  GUpdateEnterpriseAdministratorRoleInput._();

  factory GUpdateEnterpriseAdministratorRoleInput(
      [Function(GUpdateEnterpriseAdministratorRoleInputBuilder b)
          updates]) = _$GUpdateEnterpriseAdministratorRoleInput;

  String? get clientMutationId;
  String get enterpriseId;
  String get login;
  GEnterpriseAdministratorRole get role;
  static Serializer<GUpdateEnterpriseAdministratorRoleInput> get serializer =>
      _$gUpdateEnterpriseAdministratorRoleInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseAdministratorRoleInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseAdministratorRoleInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseAdministratorRoleInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput
    implements
        Built<GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput,
            GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInputBuilder> {
  GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput._();

  factory GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput(
      [Function(
              GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInputBuilder
                  b)
          updates]) = _$GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput>
      get serializer =>
          _$gUpdateEnterpriseAllowPrivateRepositoryForkingSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseAllowPrivateRepositoryForkingSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseDefaultRepositoryPermissionSettingInput
    implements
        Built<GUpdateEnterpriseDefaultRepositoryPermissionSettingInput,
            GUpdateEnterpriseDefaultRepositoryPermissionSettingInputBuilder> {
  GUpdateEnterpriseDefaultRepositoryPermissionSettingInput._();

  factory GUpdateEnterpriseDefaultRepositoryPermissionSettingInput(
      [Function(
              GUpdateEnterpriseDefaultRepositoryPermissionSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseDefaultRepositoryPermissionSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseDefaultRepositoryPermissionSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseDefaultRepositoryPermissionSettingInput>
      get serializer =>
          _$gUpdateEnterpriseDefaultRepositoryPermissionSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseDefaultRepositoryPermissionSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseDefaultRepositoryPermissionSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseDefaultRepositoryPermissionSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
    implements
        Built<GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput,
            GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputBuilder> {
  GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput._();

  factory GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput(
          [Function(
                  GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputBuilder
                      b)
              updates]) =
      _$GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<
          GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateEnterpriseMembersCanChangeRepositoryVisibilitySettingInput
                .serializer,
            json,
          );
}

abstract class GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput,
            GUpdateEnterpriseMembersCanCreateRepositoriesSettingInputBuilder> {
  GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput._();

  factory GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput(
      [Function(
              GUpdateEnterpriseMembersCanCreateRepositoriesSettingInputBuilder
                  b)
          updates]) = _$GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  bool? get membersCanCreateInternalRepositories;
  bool? get membersCanCreatePrivateRepositories;
  bool? get membersCanCreatePublicRepositories;
  bool? get membersCanCreateRepositoriesPolicyEnabled;
  GEnterpriseMembersCanCreateRepositoriesSettingValue? get settingValue;
  static Serializer<GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanCreateRepositoriesSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseMembersCanCreateRepositoriesSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanDeleteIssuesSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanDeleteIssuesSettingInput,
            GUpdateEnterpriseMembersCanDeleteIssuesSettingInputBuilder> {
  GUpdateEnterpriseMembersCanDeleteIssuesSettingInput._();

  factory GUpdateEnterpriseMembersCanDeleteIssuesSettingInput(
      [Function(GUpdateEnterpriseMembersCanDeleteIssuesSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseMembersCanDeleteIssuesSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseMembersCanDeleteIssuesSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanDeleteIssuesSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanDeleteIssuesSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanDeleteIssuesSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseMembersCanDeleteIssuesSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput,
            GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInputBuilder> {
  GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput._();

  factory GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput(
      [Function(
              GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInputBuilder
                  b)
          updates]) = _$GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanDeleteRepositoriesSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseMembersCanDeleteRepositoriesSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput,
            GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInputBuilder> {
  GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput._();

  factory GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput(
      [Function(
              GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInputBuilder
                  b)
          updates]) = _$GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanInviteCollaboratorsSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseMembersCanInviteCollaboratorsSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanMakePurchasesSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanMakePurchasesSettingInput,
            GUpdateEnterpriseMembersCanMakePurchasesSettingInputBuilder> {
  GUpdateEnterpriseMembersCanMakePurchasesSettingInput._();

  factory GUpdateEnterpriseMembersCanMakePurchasesSettingInput(
      [Function(GUpdateEnterpriseMembersCanMakePurchasesSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseMembersCanMakePurchasesSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseMembersCanMakePurchasesSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseMembersCanMakePurchasesSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanMakePurchasesSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanMakePurchasesSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanMakePurchasesSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseMembersCanMakePurchasesSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput,
            GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputBuilder> {
  GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput._();

  factory GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput(
          [Function(
                  GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputBuilder
                      b)
              updates]) =
      _$GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<
          GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateEnterpriseMembersCanUpdateProtectedBranchesSettingInput
                .serializer,
            json,
          );
}

abstract class GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
    implements
        Built<GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput,
            GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInputBuilder> {
  GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput._();

  factory GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput(
          [Function(
                  GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInputBuilder
                      b)
              updates]) =
      _$GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<
          GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput>
      get serializer =>
          _$gUpdateEnterpriseMembersCanViewDependencyInsightsSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GUpdateEnterpriseMembersCanViewDependencyInsightsSettingInput
                .serializer,
            json,
          );
}

abstract class GUpdateEnterpriseOrganizationProjectsSettingInput
    implements
        Built<GUpdateEnterpriseOrganizationProjectsSettingInput,
            GUpdateEnterpriseOrganizationProjectsSettingInputBuilder> {
  GUpdateEnterpriseOrganizationProjectsSettingInput._();

  factory GUpdateEnterpriseOrganizationProjectsSettingInput(
      [Function(GUpdateEnterpriseOrganizationProjectsSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseOrganizationProjectsSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseOrganizationProjectsSettingInput>
      get serializer =>
          _$gUpdateEnterpriseOrganizationProjectsSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseOrganizationProjectsSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseOrganizationProjectsSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseOrganizationProjectsSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseProfileInput
    implements
        Built<GUpdateEnterpriseProfileInput,
            GUpdateEnterpriseProfileInputBuilder> {
  GUpdateEnterpriseProfileInput._();

  factory GUpdateEnterpriseProfileInput(
          [Function(GUpdateEnterpriseProfileInputBuilder b) updates]) =
      _$GUpdateEnterpriseProfileInput;

  String? get clientMutationId;
  String? get description;
  String get enterpriseId;
  String? get location;
  String? get name;
  String? get websiteUrl;
  static Serializer<GUpdateEnterpriseProfileInput> get serializer =>
      _$gUpdateEnterpriseProfileInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseProfileInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseRepositoryProjectsSettingInput
    implements
        Built<GUpdateEnterpriseRepositoryProjectsSettingInput,
            GUpdateEnterpriseRepositoryProjectsSettingInputBuilder> {
  GUpdateEnterpriseRepositoryProjectsSettingInput._();

  factory GUpdateEnterpriseRepositoryProjectsSettingInput(
      [Function(GUpdateEnterpriseRepositoryProjectsSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseRepositoryProjectsSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseRepositoryProjectsSettingInput>
      get serializer =>
          _$gUpdateEnterpriseRepositoryProjectsSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseRepositoryProjectsSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseRepositoryProjectsSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseRepositoryProjectsSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseTeamDiscussionsSettingInput
    implements
        Built<GUpdateEnterpriseTeamDiscussionsSettingInput,
            GUpdateEnterpriseTeamDiscussionsSettingInputBuilder> {
  GUpdateEnterpriseTeamDiscussionsSettingInput._();

  factory GUpdateEnterpriseTeamDiscussionsSettingInput(
      [Function(GUpdateEnterpriseTeamDiscussionsSettingInputBuilder b)
          updates]) = _$GUpdateEnterpriseTeamDiscussionsSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledDisabledSettingValue get settingValue;
  static Serializer<GUpdateEnterpriseTeamDiscussionsSettingInput>
      get serializer =>
          _$gUpdateEnterpriseTeamDiscussionsSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseTeamDiscussionsSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseTeamDiscussionsSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseTeamDiscussionsSettingInput.serializer,
        json,
      );
}

abstract class GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput
    implements
        Built<GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput,
            GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputBuilder> {
  GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput._();

  factory GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput(
          [Function(
                  GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputBuilder
                      b)
              updates]) =
      _$GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput;

  String? get clientMutationId;
  String get enterpriseId;
  GEnterpriseEnabledSettingValue get settingValue;
  static Serializer<
          GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput>
      get serializer =>
          _$gUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEnterpriseTwoFactorAuthenticationRequiredSettingInput.serializer,
        json,
      );
}

abstract class GUpdateIssueCommentInput
    implements
        Built<GUpdateIssueCommentInput, GUpdateIssueCommentInputBuilder> {
  GUpdateIssueCommentInput._();

  factory GUpdateIssueCommentInput(
          [Function(GUpdateIssueCommentInputBuilder b) updates]) =
      _$GUpdateIssueCommentInput;

  String get body;
  String? get clientMutationId;
  String get id;
  static Serializer<GUpdateIssueCommentInput> get serializer =>
      _$gUpdateIssueCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateIssueCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateIssueCommentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateIssueCommentInput.serializer,
        json,
      );
}

abstract class GUpdateIssueInput
    implements Built<GUpdateIssueInput, GUpdateIssueInputBuilder> {
  GUpdateIssueInput._();

  factory GUpdateIssueInput([Function(GUpdateIssueInputBuilder b) updates]) =
      _$GUpdateIssueInput;

  BuiltList<String>? get assigneeIds;
  String? get body;
  String? get clientMutationId;
  String get id;
  BuiltList<String>? get labelIds;
  String? get milestoneId;
  BuiltList<String>? get projectIds;
  GIssueState? get state;
  String? get title;
  static Serializer<GUpdateIssueInput> get serializer =>
      _$gUpdateIssueInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateIssueInput.serializer,
        json,
      );
}

abstract class GUpdateProjectCardInput
    implements Built<GUpdateProjectCardInput, GUpdateProjectCardInputBuilder> {
  GUpdateProjectCardInput._();

  factory GUpdateProjectCardInput(
          [Function(GUpdateProjectCardInputBuilder b) updates]) =
      _$GUpdateProjectCardInput;

  String? get clientMutationId;
  bool? get isArchived;
  String? get note;
  String get projectCardId;
  static Serializer<GUpdateProjectCardInput> get serializer =>
      _$gUpdateProjectCardInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProjectCardInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProjectCardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProjectCardInput.serializer,
        json,
      );
}

abstract class GUpdateProjectColumnInput
    implements
        Built<GUpdateProjectColumnInput, GUpdateProjectColumnInputBuilder> {
  GUpdateProjectColumnInput._();

  factory GUpdateProjectColumnInput(
          [Function(GUpdateProjectColumnInputBuilder b) updates]) =
      _$GUpdateProjectColumnInput;

  String? get clientMutationId;
  String get name;
  String get projectColumnId;
  static Serializer<GUpdateProjectColumnInput> get serializer =>
      _$gUpdateProjectColumnInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProjectColumnInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProjectColumnInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProjectColumnInput.serializer,
        json,
      );
}

abstract class GUpdateProjectInput
    implements Built<GUpdateProjectInput, GUpdateProjectInputBuilder> {
  GUpdateProjectInput._();

  factory GUpdateProjectInput(
      [Function(GUpdateProjectInputBuilder b) updates]) = _$GUpdateProjectInput;

  String? get body;
  String? get clientMutationId;
  String? get name;
  String get projectId;
  bool? get public;
  GProjectState? get state;
  static Serializer<GUpdateProjectInput> get serializer =>
      _$gUpdateProjectInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProjectInput.serializer,
        json,
      );
}

abstract class GUpdatePullRequestInput
    implements Built<GUpdatePullRequestInput, GUpdatePullRequestInputBuilder> {
  GUpdatePullRequestInput._();

  factory GUpdatePullRequestInput(
          [Function(GUpdatePullRequestInputBuilder b) updates]) =
      _$GUpdatePullRequestInput;

  BuiltList<String>? get assigneeIds;
  String? get baseRefName;
  String? get body;
  String? get clientMutationId;
  BuiltList<String>? get labelIds;
  bool? get maintainerCanModify;
  String? get milestoneId;
  BuiltList<String>? get projectIds;
  String get pullRequestId;
  GPullRequestUpdateState? get state;
  String? get title;
  static Serializer<GUpdatePullRequestInput> get serializer =>
      _$gUpdatePullRequestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePullRequestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePullRequestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePullRequestInput.serializer,
        json,
      );
}

abstract class GUpdatePullRequestReviewCommentInput
    implements
        Built<GUpdatePullRequestReviewCommentInput,
            GUpdatePullRequestReviewCommentInputBuilder> {
  GUpdatePullRequestReviewCommentInput._();

  factory GUpdatePullRequestReviewCommentInput(
          [Function(GUpdatePullRequestReviewCommentInputBuilder b) updates]) =
      _$GUpdatePullRequestReviewCommentInput;

  String get body;
  String? get clientMutationId;
  String get pullRequestReviewCommentId;
  static Serializer<GUpdatePullRequestReviewCommentInput> get serializer =>
      _$gUpdatePullRequestReviewCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePullRequestReviewCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePullRequestReviewCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePullRequestReviewCommentInput.serializer,
        json,
      );
}

abstract class GUpdatePullRequestReviewInput
    implements
        Built<GUpdatePullRequestReviewInput,
            GUpdatePullRequestReviewInputBuilder> {
  GUpdatePullRequestReviewInput._();

  factory GUpdatePullRequestReviewInput(
          [Function(GUpdatePullRequestReviewInputBuilder b) updates]) =
      _$GUpdatePullRequestReviewInput;

  String get body;
  String? get clientMutationId;
  String get pullRequestReviewId;
  static Serializer<GUpdatePullRequestReviewInput> get serializer =>
      _$gUpdatePullRequestReviewInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePullRequestReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdatePullRequestReviewInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePullRequestReviewInput.serializer,
        json,
      );
}

abstract class GUpdateRefInput
    implements Built<GUpdateRefInput, GUpdateRefInputBuilder> {
  GUpdateRefInput._();

  factory GUpdateRefInput([Function(GUpdateRefInputBuilder b) updates]) =
      _$GUpdateRefInput;

  String? get clientMutationId;
  bool? get force;
  GGitObjectID get oid;
  String get refId;
  static Serializer<GUpdateRefInput> get serializer =>
      _$gUpdateRefInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRefInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRefInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRefInput.serializer,
        json,
      );
}

abstract class GUpdateRepositoryInput
    implements Built<GUpdateRepositoryInput, GUpdateRepositoryInputBuilder> {
  GUpdateRepositoryInput._();

  factory GUpdateRepositoryInput(
          [Function(GUpdateRepositoryInputBuilder b) updates]) =
      _$GUpdateRepositoryInput;

  String? get clientMutationId;
  String? get description;
  bool? get hasIssuesEnabled;
  bool? get hasProjectsEnabled;
  bool? get hasWikiEnabled;
  GURI? get homepageUrl;
  String? get name;
  String get repositoryId;
  bool? get template;
  static Serializer<GUpdateRepositoryInput> get serializer =>
      _$gUpdateRepositoryInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateRepositoryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRepositoryInput.serializer,
        json,
      );
}

abstract class GUpdateSubscriptionInput
    implements
        Built<GUpdateSubscriptionInput, GUpdateSubscriptionInputBuilder> {
  GUpdateSubscriptionInput._();

  factory GUpdateSubscriptionInput(
          [Function(GUpdateSubscriptionInputBuilder b) updates]) =
      _$GUpdateSubscriptionInput;

  String? get clientMutationId;
  GSubscriptionState get state;
  String get subscribableId;
  static Serializer<GUpdateSubscriptionInput> get serializer =>
      _$gUpdateSubscriptionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateSubscriptionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateSubscriptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateSubscriptionInput.serializer,
        json,
      );
}

abstract class GUpdateTeamDiscussionCommentInput
    implements
        Built<GUpdateTeamDiscussionCommentInput,
            GUpdateTeamDiscussionCommentInputBuilder> {
  GUpdateTeamDiscussionCommentInput._();

  factory GUpdateTeamDiscussionCommentInput(
          [Function(GUpdateTeamDiscussionCommentInputBuilder b) updates]) =
      _$GUpdateTeamDiscussionCommentInput;

  String get body;
  String? get bodyVersion;
  String? get clientMutationId;
  String get id;
  static Serializer<GUpdateTeamDiscussionCommentInput> get serializer =>
      _$gUpdateTeamDiscussionCommentInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateTeamDiscussionCommentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateTeamDiscussionCommentInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateTeamDiscussionCommentInput.serializer,
        json,
      );
}

abstract class GUpdateTeamDiscussionInput
    implements
        Built<GUpdateTeamDiscussionInput, GUpdateTeamDiscussionInputBuilder> {
  GUpdateTeamDiscussionInput._();

  factory GUpdateTeamDiscussionInput(
          [Function(GUpdateTeamDiscussionInputBuilder b) updates]) =
      _$GUpdateTeamDiscussionInput;

  String? get body;
  String? get bodyVersion;
  String? get clientMutationId;
  String get id;
  bool? get pinned;
  String? get title;
  static Serializer<GUpdateTeamDiscussionInput> get serializer =>
      _$gUpdateTeamDiscussionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateTeamDiscussionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateTeamDiscussionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateTeamDiscussionInput.serializer,
        json,
      );
}

abstract class GUpdateTopicsInput
    implements Built<GUpdateTopicsInput, GUpdateTopicsInputBuilder> {
  GUpdateTopicsInput._();

  factory GUpdateTopicsInput([Function(GUpdateTopicsInputBuilder b) updates]) =
      _$GUpdateTopicsInput;

  String? get clientMutationId;
  String get repositoryId;
  BuiltList<String> get topicNames;
  static Serializer<GUpdateTopicsInput> get serializer =>
      _$gUpdateTopicsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateTopicsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateTopicsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateTopicsInput.serializer,
        json,
      );
}

class GUserBlockDuration extends EnumClass {
  const GUserBlockDuration._(String name) : super(name);

  static const GUserBlockDuration ONE_DAY = _$gUserBlockDurationONE_DAY;

  static const GUserBlockDuration ONE_MONTH = _$gUserBlockDurationONE_MONTH;

  static const GUserBlockDuration ONE_WEEK = _$gUserBlockDurationONE_WEEK;

  static const GUserBlockDuration PERMANENT = _$gUserBlockDurationPERMANENT;

  static const GUserBlockDuration THREE_DAYS = _$gUserBlockDurationTHREE_DAYS;

  static Serializer<GUserBlockDuration> get serializer =>
      _$gUserBlockDurationSerializer;

  static BuiltSet<GUserBlockDuration> get values => _$gUserBlockDurationValues;

  static GUserBlockDuration valueOf(String name) =>
      _$gUserBlockDurationValueOf(name);
}

abstract class GUserStatusOrder
    implements Built<GUserStatusOrder, GUserStatusOrderBuilder> {
  GUserStatusOrder._();

  factory GUserStatusOrder([Function(GUserStatusOrderBuilder b) updates]) =
      _$GUserStatusOrder;

  GOrderDirection get direction;
  GUserStatusOrderField get field;
  static Serializer<GUserStatusOrder> get serializer =>
      _$gUserStatusOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserStatusOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserStatusOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserStatusOrder.serializer,
        json,
      );
}

class GUserStatusOrderField extends EnumClass {
  const GUserStatusOrderField._(String name) : super(name);

  static const GUserStatusOrderField UPDATED_AT =
      _$gUserStatusOrderFieldUPDATED_AT;

  static Serializer<GUserStatusOrderField> get serializer =>
      _$gUserStatusOrderFieldSerializer;

  static BuiltSet<GUserStatusOrderField> get values =>
      _$gUserStatusOrderFieldValues;

  static GUserStatusOrderField valueOf(String name) =>
      _$gUserStatusOrderFieldValueOf(name);
}

abstract class GX509Certificate
    implements Built<GX509Certificate, GX509CertificateBuilder> {
  GX509Certificate._();

  factory GX509Certificate([String? value]) =>
      _$GX509Certificate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GX509Certificate> get serializer =>
      _i2.DefaultScalarSerializer<GX509Certificate>(
          (Object serialized) => GX509Certificate((serialized as String?)));
}

const Map<String, Set<String>> possibleTypesMap = {
  'Node': {
    'AddedToProjectEvent',
    'App',
    'AssignedEvent',
    'BaseRefChangedEvent',
    'BaseRefForcePushedEvent',
    'Blob',
    'Bot',
    'BranchProtectionRule',
    'ClosedEvent',
    'CodeOfConduct',
    'CommentDeletedEvent',
    'Commit',
    'CommitComment',
    'CommitCommentThread',
    'ConnectedEvent',
    'ConvertedNoteToIssueEvent',
    'CrossReferencedEvent',
    'DemilestonedEvent',
    'DeployKey',
    'DeployedEvent',
    'Deployment',
    'DeploymentEnvironmentChangedEvent',
    'DeploymentStatus',
    'DisconnectedEvent',
    'Enterprise',
    'EnterpriseAdministratorInvitation',
    'EnterpriseIdentityProvider',
    'EnterpriseRepositoryInfo',
    'EnterpriseServerInstallation',
    'EnterpriseServerUserAccount',
    'EnterpriseServerUserAccountEmail',
    'EnterpriseServerUserAccountsUpload',
    'EnterpriseUserAccount',
    'ExternalIdentity',
    'Gist',
    'GistComment',
    'HeadRefDeletedEvent',
    'HeadRefForcePushedEvent',
    'HeadRefRestoredEvent',
    'Issue',
    'IssueComment',
    'Label',
    'LabeledEvent',
    'Language',
    'License',
    'LockedEvent',
    'Mannequin',
    'MarkedAsDuplicateEvent',
    'MarketplaceCategory',
    'MarketplaceListing',
    'MembersCanDeleteReposClearAuditEntry',
    'MembersCanDeleteReposDisableAuditEntry',
    'MembersCanDeleteReposEnableAuditEntry',
    'MentionedEvent',
    'MergedEvent',
    'Milestone',
    'MilestonedEvent',
    'MovedColumnsInProjectEvent',
    'OauthApplicationCreateAuditEntry',
    'OrgAddBillingManagerAuditEntry',
    'OrgAddMemberAuditEntry',
    'OrgBlockUserAuditEntry',
    'OrgConfigDisableCollaboratorsOnlyAuditEntry',
    'OrgConfigEnableCollaboratorsOnlyAuditEntry',
    'OrgCreateAuditEntry',
    'OrgDisableOauthAppRestrictionsAuditEntry',
    'OrgDisableSamlAuditEntry',
    'OrgDisableTwoFactorRequirementAuditEntry',
    'OrgEnableOauthAppRestrictionsAuditEntry',
    'OrgEnableSamlAuditEntry',
    'OrgEnableTwoFactorRequirementAuditEntry',
    'OrgInviteMemberAuditEntry',
    'OrgInviteToBusinessAuditEntry',
    'OrgOauthAppAccessApprovedAuditEntry',
    'OrgOauthAppAccessDeniedAuditEntry',
    'OrgOauthAppAccessRequestedAuditEntry',
    'OrgRemoveBillingManagerAuditEntry',
    'OrgRemoveMemberAuditEntry',
    'OrgRemoveOutsideCollaboratorAuditEntry',
    'OrgRestoreMemberAuditEntry',
    'OrgUnblockUserAuditEntry',
    'OrgUpdateDefaultRepositoryPermissionAuditEntry',
    'OrgUpdateMemberAuditEntry',
    'OrgUpdateMemberRepositoryCreationPermissionAuditEntry',
    'OrgUpdateMemberRepositoryInvitationPermissionAuditEntry',
    'Organization',
    'OrganizationIdentityProvider',
    'OrganizationInvitation',
    'PinnedEvent',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'Project',
    'ProjectCard',
    'ProjectColumn',
    'PublicKey',
    'PullRequest',
    'PullRequestCommit',
    'PullRequestCommitCommentThread',
    'PullRequestReview',
    'PullRequestReviewComment',
    'PullRequestReviewThread',
    'PushAllowance',
    'Reaction',
    'ReadyForReviewEvent',
    'Ref',
    'ReferencedEvent',
    'RegistryPackage',
    'RegistryPackageDependency',
    'RegistryPackageFile',
    'RegistryPackageTag',
    'RegistryPackageVersion',
    'Release',
    'ReleaseAsset',
    'RemovedFromProjectEvent',
    'RenamedTitleEvent',
    'ReopenedEvent',
    'RepoAccessAuditEntry',
    'RepoAddMemberAuditEntry',
    'RepoAddTopicAuditEntry',
    'RepoArchivedAuditEntry',
    'RepoChangeMergeSettingAuditEntry',
    'RepoConfigDisableAnonymousGitAccessAuditEntry',
    'RepoConfigDisableCollaboratorsOnlyAuditEntry',
    'RepoConfigDisableContributorsOnlyAuditEntry',
    'RepoConfigDisableSockpuppetDisallowedAuditEntry',
    'RepoConfigEnableAnonymousGitAccessAuditEntry',
    'RepoConfigEnableCollaboratorsOnlyAuditEntry',
    'RepoConfigEnableContributorsOnlyAuditEntry',
    'RepoConfigEnableSockpuppetDisallowedAuditEntry',
    'RepoConfigLockAnonymousGitAccessAuditEntry',
    'RepoConfigUnlockAnonymousGitAccessAuditEntry',
    'RepoCreateAuditEntry',
    'RepoDestroyAuditEntry',
    'RepoRemoveMemberAuditEntry',
    'RepoRemoveTopicAuditEntry',
    'Repository',
    'RepositoryInvitation',
    'RepositoryTopic',
    'RepositoryVisibilityChangeDisableAuditEntry',
    'RepositoryVisibilityChangeEnableAuditEntry',
    'RepositoryVulnerabilityAlert',
    'ReviewDismissalAllowance',
    'ReviewDismissedEvent',
    'ReviewRequest',
    'ReviewRequestRemovedEvent',
    'ReviewRequestedEvent',
    'SavedReply',
    'SecurityAdvisory',
    'SponsorsListing',
    'SponsorsTier',
    'Sponsorship',
    'Status',
    'StatusContext',
    'SubscribedEvent',
    'Tag',
    'Team',
    'TeamAddMemberAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamChangeParentTeamAuditEntry',
    'TeamDiscussion',
    'TeamDiscussionComment',
    'TeamRemoveMemberAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
    'Topic',
    'TransferredEvent',
    'Tree',
    'UnassignedEvent',
    'UnlabeledEvent',
    'UnlockedEvent',
    'UnmarkedAsDuplicateEvent',
    'UnpinnedEvent',
    'UnsubscribedEvent',
    'User',
    'UserBlockedEvent',
    'UserContentEdit',
    'UserStatus',
  },
  'Assignee': {
    'Bot',
    'Mannequin',
    'Organization',
    'User',
  },
  'AuditEntryActor': {
    'Bot',
    'Organization',
    'User',
  },
  'GitObject': {
    'Blob',
    'Commit',
    'Tag',
    'Tree',
  },
  'Actor': {
    'Bot',
    'EnterpriseUserAccount',
    'Mannequin',
    'Organization',
    'User',
  },
  'UniformResourceLocatable': {
    'Bot',
    'ClosedEvent',
    'Commit',
    'CrossReferencedEvent',
    'Gist',
    'Issue',
    'Mannequin',
    'MergedEvent',
    'Milestone',
    'Organization',
    'PullRequest',
    'PullRequestCommit',
    'ReadyForReviewEvent',
    'Release',
    'Repository',
    'RepositoryTopic',
    'ReviewDismissedEvent',
    'TeamDiscussion',
    'TeamDiscussionComment',
    'User',
  },
  'Closer': {
    'Commit',
    'PullRequest',
  },
  'Subscribable': {
    'Commit',
    'Issue',
    'PullRequest',
    'Repository',
    'Team',
    'TeamDiscussion',
  },
  'Comment': {
    'CommitComment',
    'GistComment',
    'Issue',
    'IssueComment',
    'PullRequest',
    'PullRequestReview',
    'PullRequestReviewComment',
    'TeamDiscussion',
    'TeamDiscussionComment',
  },
  'Deletable': {
    'CommitComment',
    'GistComment',
    'IssueComment',
    'PullRequestReview',
    'PullRequestReviewComment',
    'TeamDiscussion',
    'TeamDiscussionComment',
  },
  'Reactable': {
    'CommitComment',
    'Issue',
    'IssueComment',
    'PullRequest',
    'PullRequestReview',
    'PullRequestReviewComment',
    'TeamDiscussion',
    'TeamDiscussionComment',
  },
  'RepositoryNode': {
    'CommitComment',
    'CommitCommentThread',
    'Issue',
    'IssueComment',
    'PullRequest',
    'PullRequestCommitCommentThread',
    'PullRequestReview',
    'PullRequestReviewComment',
    'RepositoryVulnerabilityAlert',
  },
  'Updatable': {
    'CommitComment',
    'GistComment',
    'Issue',
    'IssueComment',
    'Project',
    'PullRequest',
    'PullRequestReview',
    'PullRequestReviewComment',
    'TeamDiscussion',
    'TeamDiscussionComment',
  },
  'UpdatableComment': {
    'CommitComment',
    'GistComment',
    'Issue',
    'IssueComment',
    'PullRequest',
    'PullRequestReview',
    'PullRequestReviewComment',
    'TeamDiscussion',
    'TeamDiscussionComment',
  },
  'Contribution': {
    'CreatedCommitContribution',
    'CreatedIssueContribution',
    'CreatedPullRequestContribution',
    'CreatedPullRequestReviewContribution',
    'CreatedRepositoryContribution',
    'JoinedGitHubContribution',
    'RestrictedContribution',
  },
  'CreatedIssueOrRestrictedContribution': {
    'CreatedIssueContribution',
    'RestrictedContribution',
  },
  'CreatedPullRequestOrRestrictedContribution': {
    'CreatedPullRequestContribution',
    'RestrictedContribution',
  },
  'CreatedRepositoryOrRestrictedContribution': {
    'CreatedRepositoryContribution',
    'RestrictedContribution',
  },
  'EnterpriseMember': {
    'EnterpriseUserAccount',
    'User',
  },
  'HovercardContext': {
    'GenericHovercardContext',
    'OrganizationTeamsHovercardContext',
    'OrganizationsHovercardContext',
    'ReviewStatusHovercardContext',
    'ViewerHovercardContext',
  },
  'Starrable': {
    'Gist',
    'Repository',
    'Topic',
  },
  'GitSignature': {
    'GpgSignature',
    'SmimeSignature',
    'UnknownSignature',
  },
  'Assignable': {
    'Issue',
    'PullRequest',
  },
  'Closable': {
    'Issue',
    'Milestone',
    'Project',
    'PullRequest',
  },
  'Labelable': {
    'Issue',
    'PullRequest',
  },
  'Lockable': {
    'Issue',
    'PullRequest',
  },
  'IssueOrPullRequest': {
    'Issue',
    'PullRequest',
  },
  'IssueTimelineItem': {
    'AssignedEvent',
    'ClosedEvent',
    'Commit',
    'CrossReferencedEvent',
    'DemilestonedEvent',
    'IssueComment',
    'LabeledEvent',
    'LockedEvent',
    'MilestonedEvent',
    'ReferencedEvent',
    'RenamedTitleEvent',
    'ReopenedEvent',
    'SubscribedEvent',
    'TransferredEvent',
    'UnassignedEvent',
    'UnlabeledEvent',
    'UnlockedEvent',
    'UnsubscribedEvent',
    'UserBlockedEvent',
  },
  'IssueTimelineItems': {
    'AddedToProjectEvent',
    'AssignedEvent',
    'ClosedEvent',
    'CommentDeletedEvent',
    'ConnectedEvent',
    'ConvertedNoteToIssueEvent',
    'CrossReferencedEvent',
    'DemilestonedEvent',
    'DisconnectedEvent',
    'IssueComment',
    'LabeledEvent',
    'LockedEvent',
    'MarkedAsDuplicateEvent',
    'MentionedEvent',
    'MilestonedEvent',
    'MovedColumnsInProjectEvent',
    'PinnedEvent',
    'ReferencedEvent',
    'RemovedFromProjectEvent',
    'RenamedTitleEvent',
    'ReopenedEvent',
    'SubscribedEvent',
    'TransferredEvent',
    'UnassignedEvent',
    'UnlabeledEvent',
    'UnlockedEvent',
    'UnmarkedAsDuplicateEvent',
    'UnpinnedEvent',
    'UnsubscribedEvent',
    'UserBlockedEvent',
  },
  'AuditEntry': {
    'MembersCanDeleteReposClearAuditEntry',
    'MembersCanDeleteReposDisableAuditEntry',
    'MembersCanDeleteReposEnableAuditEntry',
    'OauthApplicationCreateAuditEntry',
    'OrgAddBillingManagerAuditEntry',
    'OrgAddMemberAuditEntry',
    'OrgBlockUserAuditEntry',
    'OrgConfigDisableCollaboratorsOnlyAuditEntry',
    'OrgConfigEnableCollaboratorsOnlyAuditEntry',
    'OrgCreateAuditEntry',
    'OrgDisableOauthAppRestrictionsAuditEntry',
    'OrgDisableSamlAuditEntry',
    'OrgDisableTwoFactorRequirementAuditEntry',
    'OrgEnableOauthAppRestrictionsAuditEntry',
    'OrgEnableSamlAuditEntry',
    'OrgEnableTwoFactorRequirementAuditEntry',
    'OrgInviteMemberAuditEntry',
    'OrgInviteToBusinessAuditEntry',
    'OrgOauthAppAccessApprovedAuditEntry',
    'OrgOauthAppAccessDeniedAuditEntry',
    'OrgOauthAppAccessRequestedAuditEntry',
    'OrgRemoveBillingManagerAuditEntry',
    'OrgRemoveMemberAuditEntry',
    'OrgRemoveOutsideCollaboratorAuditEntry',
    'OrgRestoreMemberAuditEntry',
    'OrgUnblockUserAuditEntry',
    'OrgUpdateDefaultRepositoryPermissionAuditEntry',
    'OrgUpdateMemberAuditEntry',
    'OrgUpdateMemberRepositoryCreationPermissionAuditEntry',
    'OrgUpdateMemberRepositoryInvitationPermissionAuditEntry',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'RepoAccessAuditEntry',
    'RepoAddMemberAuditEntry',
    'RepoAddTopicAuditEntry',
    'RepoArchivedAuditEntry',
    'RepoChangeMergeSettingAuditEntry',
    'RepoConfigDisableAnonymousGitAccessAuditEntry',
    'RepoConfigDisableCollaboratorsOnlyAuditEntry',
    'RepoConfigDisableContributorsOnlyAuditEntry',
    'RepoConfigDisableSockpuppetDisallowedAuditEntry',
    'RepoConfigEnableAnonymousGitAccessAuditEntry',
    'RepoConfigEnableCollaboratorsOnlyAuditEntry',
    'RepoConfigEnableContributorsOnlyAuditEntry',
    'RepoConfigEnableSockpuppetDisallowedAuditEntry',
    'RepoConfigLockAnonymousGitAccessAuditEntry',
    'RepoConfigUnlockAnonymousGitAccessAuditEntry',
    'RepoCreateAuditEntry',
    'RepoDestroyAuditEntry',
    'RepoRemoveMemberAuditEntry',
    'RepoRemoveTopicAuditEntry',
    'RepositoryVisibilityChangeDisableAuditEntry',
    'RepositoryVisibilityChangeEnableAuditEntry',
    'TeamAddMemberAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamChangeParentTeamAuditEntry',
    'TeamRemoveMemberAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
  },
  'EnterpriseAuditEntryData': {
    'MembersCanDeleteReposClearAuditEntry',
    'MembersCanDeleteReposDisableAuditEntry',
    'MembersCanDeleteReposEnableAuditEntry',
    'OrgInviteToBusinessAuditEntry',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'RepositoryVisibilityChangeDisableAuditEntry',
    'RepositoryVisibilityChangeEnableAuditEntry',
  },
  'OrganizationAuditEntryData': {
    'MembersCanDeleteReposClearAuditEntry',
    'MembersCanDeleteReposDisableAuditEntry',
    'MembersCanDeleteReposEnableAuditEntry',
    'OauthApplicationCreateAuditEntry',
    'OrgAddBillingManagerAuditEntry',
    'OrgAddMemberAuditEntry',
    'OrgBlockUserAuditEntry',
    'OrgConfigDisableCollaboratorsOnlyAuditEntry',
    'OrgConfigEnableCollaboratorsOnlyAuditEntry',
    'OrgCreateAuditEntry',
    'OrgDisableOauthAppRestrictionsAuditEntry',
    'OrgDisableSamlAuditEntry',
    'OrgDisableTwoFactorRequirementAuditEntry',
    'OrgEnableOauthAppRestrictionsAuditEntry',
    'OrgEnableSamlAuditEntry',
    'OrgEnableTwoFactorRequirementAuditEntry',
    'OrgInviteMemberAuditEntry',
    'OrgInviteToBusinessAuditEntry',
    'OrgOauthAppAccessApprovedAuditEntry',
    'OrgOauthAppAccessDeniedAuditEntry',
    'OrgOauthAppAccessRequestedAuditEntry',
    'OrgRemoveBillingManagerAuditEntry',
    'OrgRemoveMemberAuditEntry',
    'OrgRemoveOutsideCollaboratorAuditEntry',
    'OrgRestoreMemberAuditEntry',
    'OrgRestoreMemberMembershipOrganizationAuditEntryData',
    'OrgUnblockUserAuditEntry',
    'OrgUpdateDefaultRepositoryPermissionAuditEntry',
    'OrgUpdateMemberAuditEntry',
    'OrgUpdateMemberRepositoryCreationPermissionAuditEntry',
    'OrgUpdateMemberRepositoryInvitationPermissionAuditEntry',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'RepoAccessAuditEntry',
    'RepoAddMemberAuditEntry',
    'RepoAddTopicAuditEntry',
    'RepoArchivedAuditEntry',
    'RepoChangeMergeSettingAuditEntry',
    'RepoConfigDisableAnonymousGitAccessAuditEntry',
    'RepoConfigDisableCollaboratorsOnlyAuditEntry',
    'RepoConfigDisableContributorsOnlyAuditEntry',
    'RepoConfigDisableSockpuppetDisallowedAuditEntry',
    'RepoConfigEnableAnonymousGitAccessAuditEntry',
    'RepoConfigEnableCollaboratorsOnlyAuditEntry',
    'RepoConfigEnableContributorsOnlyAuditEntry',
    'RepoConfigEnableSockpuppetDisallowedAuditEntry',
    'RepoConfigLockAnonymousGitAccessAuditEntry',
    'RepoConfigUnlockAnonymousGitAccessAuditEntry',
    'RepoCreateAuditEntry',
    'RepoDestroyAuditEntry',
    'RepoRemoveMemberAuditEntry',
    'RepoRemoveTopicAuditEntry',
    'RepositoryVisibilityChangeDisableAuditEntry',
    'RepositoryVisibilityChangeEnableAuditEntry',
    'TeamAddMemberAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamChangeParentTeamAuditEntry',
    'TeamRemoveMemberAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
  },
  'MilestoneItem': {
    'Issue',
    'PullRequest',
  },
  'OauthApplicationAuditEntryData': {
    'OauthApplicationCreateAuditEntry',
    'OrgOauthAppAccessApprovedAuditEntry',
    'OrgOauthAppAccessDeniedAuditEntry',
    'OrgOauthAppAccessRequestedAuditEntry',
  },
  'OrgRestoreMemberAuditEntryMembership': {
    'OrgRestoreMemberMembershipOrganizationAuditEntryData',
    'OrgRestoreMemberMembershipRepositoryAuditEntryData',
    'OrgRestoreMemberMembershipTeamAuditEntryData',
  },
  'RepositoryAuditEntryData': {
    'OrgRestoreMemberMembershipRepositoryAuditEntryData',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'RepoAccessAuditEntry',
    'RepoAddMemberAuditEntry',
    'RepoAddTopicAuditEntry',
    'RepoArchivedAuditEntry',
    'RepoChangeMergeSettingAuditEntry',
    'RepoConfigDisableAnonymousGitAccessAuditEntry',
    'RepoConfigDisableCollaboratorsOnlyAuditEntry',
    'RepoConfigDisableContributorsOnlyAuditEntry',
    'RepoConfigDisableSockpuppetDisallowedAuditEntry',
    'RepoConfigEnableAnonymousGitAccessAuditEntry',
    'RepoConfigEnableCollaboratorsOnlyAuditEntry',
    'RepoConfigEnableContributorsOnlyAuditEntry',
    'RepoConfigEnableSockpuppetDisallowedAuditEntry',
    'RepoConfigLockAnonymousGitAccessAuditEntry',
    'RepoConfigUnlockAnonymousGitAccessAuditEntry',
    'RepoCreateAuditEntry',
    'RepoDestroyAuditEntry',
    'RepoRemoveMemberAuditEntry',
    'RepoRemoveTopicAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
  },
  'TeamAuditEntryData': {
    'OrgRestoreMemberMembershipTeamAuditEntryData',
    'TeamAddMemberAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamChangeParentTeamAuditEntry',
    'TeamRemoveMemberAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
  },
  'MemberStatusable': {
    'Organization',
    'Team',
  },
  'ProfileOwner': {
    'Organization',
    'User',
  },
  'ProjectOwner': {
    'Organization',
    'Repository',
    'User',
  },
  'RegistryPackageOwner': {
    'Organization',
    'Repository',
    'User',
  },
  'RegistryPackageSearch': {
    'Organization',
    'Repository',
    'User',
  },
  'RepositoryOwner': {
    'Organization',
    'User',
  },
  'Sponsorable': {
    'Organization',
    'User',
  },
  'OrganizationAuditEntry': {
    'MembersCanDeleteReposClearAuditEntry',
    'MembersCanDeleteReposDisableAuditEntry',
    'MembersCanDeleteReposEnableAuditEntry',
    'OauthApplicationCreateAuditEntry',
    'OrgAddBillingManagerAuditEntry',
    'OrgAddMemberAuditEntry',
    'OrgBlockUserAuditEntry',
    'OrgConfigDisableCollaboratorsOnlyAuditEntry',
    'OrgConfigEnableCollaboratorsOnlyAuditEntry',
    'OrgCreateAuditEntry',
    'OrgDisableOauthAppRestrictionsAuditEntry',
    'OrgDisableSamlAuditEntry',
    'OrgDisableTwoFactorRequirementAuditEntry',
    'OrgEnableOauthAppRestrictionsAuditEntry',
    'OrgEnableSamlAuditEntry',
    'OrgEnableTwoFactorRequirementAuditEntry',
    'OrgInviteMemberAuditEntry',
    'OrgInviteToBusinessAuditEntry',
    'OrgOauthAppAccessApprovedAuditEntry',
    'OrgOauthAppAccessDeniedAuditEntry',
    'OrgOauthAppAccessRequestedAuditEntry',
    'OrgRemoveBillingManagerAuditEntry',
    'OrgRemoveMemberAuditEntry',
    'OrgRemoveOutsideCollaboratorAuditEntry',
    'OrgRestoreMemberAuditEntry',
    'OrgUnblockUserAuditEntry',
    'OrgUpdateDefaultRepositoryPermissionAuditEntry',
    'OrgUpdateMemberAuditEntry',
    'OrgUpdateMemberRepositoryCreationPermissionAuditEntry',
    'OrgUpdateMemberRepositoryInvitationPermissionAuditEntry',
    'PrivateRepositoryForkingDisableAuditEntry',
    'PrivateRepositoryForkingEnableAuditEntry',
    'RepoAccessAuditEntry',
    'RepoAddMemberAuditEntry',
    'RepoAddTopicAuditEntry',
    'RepoArchivedAuditEntry',
    'RepoChangeMergeSettingAuditEntry',
    'RepoConfigDisableAnonymousGitAccessAuditEntry',
    'RepoConfigDisableCollaboratorsOnlyAuditEntry',
    'RepoConfigDisableContributorsOnlyAuditEntry',
    'RepoConfigDisableSockpuppetDisallowedAuditEntry',
    'RepoConfigEnableAnonymousGitAccessAuditEntry',
    'RepoConfigEnableCollaboratorsOnlyAuditEntry',
    'RepoConfigEnableContributorsOnlyAuditEntry',
    'RepoConfigEnableSockpuppetDisallowedAuditEntry',
    'RepoConfigLockAnonymousGitAccessAuditEntry',
    'RepoConfigUnlockAnonymousGitAccessAuditEntry',
    'RepoCreateAuditEntry',
    'RepoDestroyAuditEntry',
    'RepoRemoveMemberAuditEntry',
    'RepoRemoveTopicAuditEntry',
    'RepositoryVisibilityChangeDisableAuditEntry',
    'RepositoryVisibilityChangeEnableAuditEntry',
    'TeamAddMemberAuditEntry',
    'TeamAddRepositoryAuditEntry',
    'TeamChangeParentTeamAuditEntry',
    'TeamRemoveMemberAuditEntry',
    'TeamRemoveRepositoryAuditEntry',
  },
  'PermissionGranter': {
    'Organization',
    'Repository',
    'Team',
  },
  'PinnableItem': {
    'Gist',
    'Repository',
  },
  'ProjectCardItem': {
    'Issue',
    'PullRequest',
  },
  'PullRequestTimelineItem': {
    'AssignedEvent',
    'BaseRefForcePushedEvent',
    'ClosedEvent',
    'Commit',
    'CommitCommentThread',
    'CrossReferencedEvent',
    'DemilestonedEvent',
    'DeployedEvent',
    'DeploymentEnvironmentChangedEvent',
    'HeadRefDeletedEvent',
    'HeadRefForcePushedEvent',
    'HeadRefRestoredEvent',
    'IssueComment',
    'LabeledEvent',
    'LockedEvent',
    'MergedEvent',
    'MilestonedEvent',
    'PullRequestReview',
    'PullRequestReviewComment',
    'PullRequestReviewThread',
    'ReferencedEvent',
    'RenamedTitleEvent',
    'ReopenedEvent',
    'ReviewDismissedEvent',
    'ReviewRequestRemovedEvent',
    'ReviewRequestedEvent',
    'SubscribedEvent',
    'UnassignedEvent',
    'UnlabeledEvent',
    'UnlockedEvent',
    'UnsubscribedEvent',
    'UserBlockedEvent',
  },
  'PullRequestTimelineItems': {
    'AddedToProjectEvent',
    'AssignedEvent',
    'BaseRefChangedEvent',
    'BaseRefForcePushedEvent',
    'ClosedEvent',
    'CommentDeletedEvent',
    'ConnectedEvent',
    'ConvertedNoteToIssueEvent',
    'CrossReferencedEvent',
    'DemilestonedEvent',
    'DeployedEvent',
    'DeploymentEnvironmentChangedEvent',
    'DisconnectedEvent',
    'HeadRefDeletedEvent',
    'HeadRefForcePushedEvent',
    'HeadRefRestoredEvent',
    'IssueComment',
    'LabeledEvent',
    'LockedEvent',
    'MarkedAsDuplicateEvent',
    'MentionedEvent',
    'MergedEvent',
    'MilestonedEvent',
    'MovedColumnsInProjectEvent',
    'PinnedEvent',
    'PullRequestCommit',
    'PullRequestCommitCommentThread',
    'PullRequestReview',
    'PullRequestReviewThread',
    'PullRequestRevisionMarker',
    'ReadyForReviewEvent',
    'ReferencedEvent',
    'RemovedFromProjectEvent',
    'RenamedTitleEvent',
    'ReopenedEvent',
    'ReviewDismissedEvent',
    'ReviewRequestRemovedEvent',
    'ReviewRequestedEvent',
    'SubscribedEvent',
    'TransferredEvent',
    'UnassignedEvent',
    'UnlabeledEvent',
    'UnlockedEvent',
    'UnmarkedAsDuplicateEvent',
    'UnpinnedEvent',
    'UnsubscribedEvent',
    'UserBlockedEvent',
  },
  'PushAllowanceActor': {
    'App',
    'Team',
    'User',
  },
  'ReferencedSubject': {
    'Issue',
    'PullRequest',
  },
  'RenamedTitleSubject': {
    'Issue',
    'PullRequest',
  },
  'TopicAuditEntryData': {
    'RepoAddTopicAuditEntry',
    'RepoRemoveTopicAuditEntry',
  },
  'RepositoryInfo': {'Repository'},
  'RequestedReviewer': {
    'Mannequin',
    'Team',
    'User',
  },
  'ReviewDismissalAllowanceActor': {
    'Team',
    'User',
  },
  'SearchResultItem': {
    'App',
    'Issue',
    'MarketplaceListing',
    'Organization',
    'PullRequest',
    'Repository',
    'User',
  },
};
