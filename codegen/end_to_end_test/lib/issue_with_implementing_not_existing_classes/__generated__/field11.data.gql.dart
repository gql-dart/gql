// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field11.data.gql.g.dart';

abstract class GField11 {
  String get G__typename;
  GField11_field111 get field111;
  Map<String, dynamic> toJson();
}

abstract class GField11_field111 {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GField11Data
    implements Built<GField11Data, GField11DataBuilder>, GField11 {
  GField11Data._();

  factory GField11Data([void Function(GField11DataBuilder b) updates]) =
      _$GField11Data;

  static void _initializeBuilder(GField11DataBuilder b) =>
      b..G__typename = 'Field11';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GField11Data_field111 get field111;
  static Serializer<GField11Data> get serializer => _$gField11DataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField11Data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField11Data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField11Data.serializer,
        json,
      );
}

abstract class GField11Data_field111
    implements
        Built<GField11Data_field111, GField11Data_field111Builder>,
        GField11_field111 {
  GField11Data_field111._();

  factory GField11Data_field111(
          [void Function(GField11Data_field111Builder b) updates]) =
      _$GField11Data_field111;

  static void _initializeBuilder(GField11Data_field111Builder b) =>
      b..G__typename = 'Field111';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GField11Data_field111> get serializer =>
      _$gField11DataField111Serializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField11Data_field111.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField11Data_field111? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField11Data_field111.serializer,
        json,
      );
}
