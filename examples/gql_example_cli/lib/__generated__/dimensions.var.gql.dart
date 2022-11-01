// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i1;

part 'dimensions.var.gql.g.dart';

abstract class GDimensionsVars
    implements Built<GDimensionsVars, GDimensionsVarsBuilder> {
  GDimensionsVars._();

  factory GDimensionsVars([Function(GDimensionsVarsBuilder b) updates]) =
      _$GDimensionsVars;

  static Serializer<GDimensionsVars> get serializer =>
      _$gDimensionsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDimensionsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDimensionsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDimensionsVars.serializer,
        json,
      );
}
