// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/variables/__generated__/create_custom_field.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/variables/__generated__/create_custom_field.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'create_custom_field.req.gql.g.dart';

abstract class GCreateCustomField
    implements Built<GCreateCustomField, GCreateCustomFieldBuilder> {
  GCreateCustomField._();

  factory GCreateCustomField(
          [void Function(GCreateCustomFieldBuilder b) updates]) =
      _$GCreateCustomField;

  static void _initializeBuilder(GCreateCustomFieldBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'CreateCustomField',
    );

  _i3.GCreateCustomFieldVars get vars;
  _i1.Operation get operation;
  static Serializer<GCreateCustomField> get serializer =>
      _$gCreateCustomFieldSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GCreateCustomField.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCustomField? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GCreateCustomField.serializer,
        json,
      );
}
