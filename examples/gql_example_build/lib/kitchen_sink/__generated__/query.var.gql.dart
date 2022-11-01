// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_build/__generated__/schema.schema.gql.dart' as _i1;
import 'package:gql_example_build/__generated__/serializers.gql.dart' as _i2;

part 'query.var.gql.g.dart';

abstract class GQueryOperationVars
    implements Built<GQueryOperationVars, GQueryOperationVarsBuilder> {
  GQueryOperationVars._();

  factory GQueryOperationVars(
      [Function(GQueryOperationVarsBuilder b) updates]) = _$GQueryOperationVars;

  String? get id;
  @BuiltValueField(wireName: 'bool')
  bool? get Gbool;
  @BuiltValueField(wireName: 'int')
  int? get Gint;
  double? get float;
  String? get string;
  _i1.GScalar? get scalar;
  @BuiltValueField(wireName: 'enum')
  _i1.GEnum? get Genum;
  _i1.GInput? get input;
  String get idRequired;
  bool get boolRequired;
  int get intRequired;
  double get floatRequired;
  String get stringRequired;
  _i1.GScalar get scalarRequired;
  _i1.GEnum get enumRequired;
  _i1.GInput get inputRequired;
  static Serializer<GQueryOperationVars> get serializer =>
      _$gQueryOperationVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GQueryOperationVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GQueryOperationVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GQueryOperationVars.serializer,
        json,
      );
}
