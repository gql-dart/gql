// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/custom_field.dart' as _i1;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'create_custom_field.data.gql.g.dart';

abstract class GCreateCustomFieldData
    implements Built<GCreateCustomFieldData, GCreateCustomFieldDataBuilder> {
  GCreateCustomFieldData._();

  factory GCreateCustomFieldData(
          [void Function(GCreateCustomFieldDataBuilder b) updates]) =
      _$GCreateCustomFieldData;

  static void _initializeBuilder(GCreateCustomFieldDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i1.CustomField? get createCustomField;
  static Serializer<GCreateCustomFieldData> get serializer =>
      _$gCreateCustomFieldDataSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateCustomFieldData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCustomFieldData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateCustomFieldData.serializer,
        json,
      );
}
