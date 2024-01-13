// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field2.data.gql.g.dart';

abstract class GField2 {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GField2Data
    implements Built<GField2Data, GField2DataBuilder>, GField2 {
  GField2Data._();

  factory GField2Data([void Function(GField2DataBuilder b) updates]) =
      _$GField2Data;

  static void _initializeBuilder(GField2DataBuilder b) =>
      b..G__typename = 'Field2';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GField2Data> get serializer => _$gField2DataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField2Data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField2Data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField2Data.serializer,
        json,
      );
}
