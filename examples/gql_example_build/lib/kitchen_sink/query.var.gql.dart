// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_build/schema.schema.gql.dart' as _i1;
import 'package:gql_example_build/serializers.gql.dart' as _i2;

part 'query.var.gql.g.dart';

abstract class GQueryOperationVars
    implements Built<GQueryOperationVars, GQueryOperationVarsBuilder> {
  GQueryOperationVars._();

  factory GQueryOperationVars(
      [Function(GQueryOperationVarsBuilder b) updates]) = _$GQueryOperationVars;

  @nullable
  String get id;
  @nullable
  @BuiltValueField(wireName: 'bool')
  bool get bool$;
  @nullable
  @BuiltValueField(wireName: 'int')
  int get int$;
  @nullable
  double get float;
  @nullable
  String get string;
  @nullable
  _i1.GScalar get scalar;
  @nullable
  @BuiltValueField(wireName: 'enum')
  _i1.GEnum get enum$;
  @nullable
  _i1.GInput get input;
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
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GQueryOperationVars.serializer, this);
  static GQueryOperationVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GQueryOperationVars.serializer, json);
}
