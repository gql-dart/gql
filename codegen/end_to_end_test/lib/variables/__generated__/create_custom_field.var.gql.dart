// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'create_custom_field.var.gql.g.dart';

abstract class GCreateCustomFieldVars
    implements Built<GCreateCustomFieldVars, GCreateCustomFieldVarsBuilder> {
  GCreateCustomFieldVars._();

  factory GCreateCustomFieldVars(
          [void Function(GCreateCustomFieldVarsBuilder b) updates]) =
      _$GCreateCustomFieldVars;

  factory GCreateCustomFieldVars.create(
          {required _i1.GCustomFieldInput input}) =>
      GCreateCustomFieldVars((b) => b..input = input.toBuilder());

  _i1.GCustomFieldInput get input;
  static Serializer<GCreateCustomFieldVars> get serializer =>
      _$gCreateCustomFieldVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateCustomFieldVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCustomFieldVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateCustomFieldVars.serializer,
        json,
      );
}
