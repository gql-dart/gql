// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i1;

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
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get name;
  static Serializer<GNestedFragmentData> get serializer =>
      _$gNestedFragmentDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNestedFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNestedFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNestedFragmentData.serializer,
        json,
      );
}
