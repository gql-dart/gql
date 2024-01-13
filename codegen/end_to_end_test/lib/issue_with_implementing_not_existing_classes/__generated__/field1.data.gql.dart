// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field1.data.gql.g.dart';

abstract class GField1 {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GField1Data
    implements Built<GField1Data, GField1DataBuilder>, GField1 {
  GField1Data._();

  factory GField1Data([void Function(GField1DataBuilder b) updates]) =
      _$GField1Data;

  static void _initializeBuilder(GField1DataBuilder b) =>
      b..G__typename = 'Field1';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GField1Data> get serializer => _$gField1DataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField1Data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField1Data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField1Data.serializer,
        json,
      );
}
