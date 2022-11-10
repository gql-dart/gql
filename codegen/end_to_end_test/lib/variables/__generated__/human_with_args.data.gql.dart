// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'human_with_args.data.gql.g.dart';

abstract class GHumanWithArgsData
    implements Built<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  GHumanWithArgsData._();

  factory GHumanWithArgsData([Function(GHumanWithArgsDataBuilder b) updates]) =
      _$GHumanWithArgsData;

  static void _initializeBuilder(GHumanWithArgsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GHumanWithArgsData_human? get human;
  static Serializer<GHumanWithArgsData> get serializer =>
      _$gHumanWithArgsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanWithArgsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHumanWithArgsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanWithArgsData.serializer,
        json,
      );
}

abstract class GHumanWithArgsData_human
    implements
        Built<GHumanWithArgsData_human, GHumanWithArgsData_humanBuilder> {
  GHumanWithArgsData_human._();

  factory GHumanWithArgsData_human(
          [Function(GHumanWithArgsData_humanBuilder b) updates]) =
      _$GHumanWithArgsData_human;

  static void _initializeBuilder(GHumanWithArgsData_humanBuilder b) =>
      b..G__typename = 'Human';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  double? get height;
  static Serializer<GHumanWithArgsData_human> get serializer =>
      _$gHumanWithArgsDataHumanSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanWithArgsData_human.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHumanWithArgsData_human? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanWithArgsData_human.serializer,
        json,
      );
}
