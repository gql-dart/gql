// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart' as _i1;

part 'nested_fragment.data.gql.g.dart';

abstract class GNestedFragment {
  String get G__typename;
  String get id;
  String? get name;
  Map<String, dynamic> toJson();
}

abstract class GNestedFragmentData
    implements
        Built<GNestedFragmentData, GNestedFragmentDataBuilder>,
        GNestedFragment {
  GNestedFragmentData._();

  factory GNestedFragmentData(
      [Function(GNestedFragmentDataBuilder b) updates]) = _$GNestedFragmentData;

  static void _initializeBuilder(GNestedFragmentDataBuilder b) =>
      b..G__typename = 'Pokemon';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String? get name;
  static Serializer<GNestedFragmentData> get serializer =>
      _$gNestedFragmentDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GNestedFragmentData.serializer, this)
          as Map<String, dynamic>);
  static GNestedFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GNestedFragmentData.serializer, json);
}
