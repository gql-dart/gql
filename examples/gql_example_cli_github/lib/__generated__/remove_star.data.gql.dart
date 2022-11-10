// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i1;

part 'remove_star.data.gql.g.dart';

abstract class GRemoveStarData
    implements Built<GRemoveStarData, GRemoveStarDataBuilder> {
  GRemoveStarData._();

  factory GRemoveStarData([Function(GRemoveStarDataBuilder b) updates]) =
      _$GRemoveStarData;

  static void _initializeBuilder(GRemoveStarDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRemoveStarData_action? get action;
  static Serializer<GRemoveStarData> get serializer =>
      _$gRemoveStarDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveStarData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemoveStarData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveStarData.serializer,
        json,
      );
}

abstract class GRemoveStarData_action
    implements Built<GRemoveStarData_action, GRemoveStarData_actionBuilder> {
  GRemoveStarData_action._();

  factory GRemoveStarData_action(
          [Function(GRemoveStarData_actionBuilder b) updates]) =
      _$GRemoveStarData_action;

  static void _initializeBuilder(GRemoveStarData_actionBuilder b) =>
      b..G__typename = 'RemoveStarPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRemoveStarData_action_starrable? get starrable;
  static Serializer<GRemoveStarData_action> get serializer =>
      _$gRemoveStarDataActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveStarData_action.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemoveStarData_action? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveStarData_action.serializer,
        json,
      );
}

abstract class GRemoveStarData_action_starrable
    implements
        Built<GRemoveStarData_action_starrable,
            GRemoveStarData_action_starrableBuilder> {
  GRemoveStarData_action_starrable._();

  factory GRemoveStarData_action_starrable(
          [Function(GRemoveStarData_action_starrableBuilder b) updates]) =
      _$GRemoveStarData_action_starrable;

  static void _initializeBuilder(GRemoveStarData_action_starrableBuilder b) =>
      b..G__typename = 'Starrable';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get viewerHasStarred;
  static Serializer<GRemoveStarData_action_starrable> get serializer =>
      _$gRemoveStarDataActionStarrableSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveStarData_action_starrable.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemoveStarData_action_starrable? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveStarData_action_starrable.serializer,
        json,
      );
}
