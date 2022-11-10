// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i1;

part 'add_star.data.gql.g.dart';

abstract class GAddStarData
    implements Built<GAddStarData, GAddStarDataBuilder> {
  GAddStarData._();

  factory GAddStarData([Function(GAddStarDataBuilder b) updates]) =
      _$GAddStarData;

  static void _initializeBuilder(GAddStarDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAddStarData_action? get action;
  static Serializer<GAddStarData> get serializer => _$gAddStarDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddStarData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddStarData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddStarData.serializer,
        json,
      );
}

abstract class GAddStarData_action
    implements Built<GAddStarData_action, GAddStarData_actionBuilder> {
  GAddStarData_action._();

  factory GAddStarData_action(
      [Function(GAddStarData_actionBuilder b) updates]) = _$GAddStarData_action;

  static void _initializeBuilder(GAddStarData_actionBuilder b) =>
      b..G__typename = 'AddStarPayload';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAddStarData_action_starrable? get starrable;
  static Serializer<GAddStarData_action> get serializer =>
      _$gAddStarDataActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddStarData_action.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddStarData_action? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddStarData_action.serializer,
        json,
      );
}

abstract class GAddStarData_action_starrable
    implements
        Built<GAddStarData_action_starrable,
            GAddStarData_action_starrableBuilder> {
  GAddStarData_action_starrable._();

  factory GAddStarData_action_starrable(
          [Function(GAddStarData_action_starrableBuilder b) updates]) =
      _$GAddStarData_action_starrable;

  static void _initializeBuilder(GAddStarData_action_starrableBuilder b) =>
      b..G__typename = 'Starrable';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get viewerHasStarred;
  static Serializer<GAddStarData_action_starrable> get serializer =>
      _$gAddStarDataActionStarrableSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddStarData_action_starrable.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddStarData_action_starrable? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddStarData_action_starrable.serializer,
        json,
      );
}
