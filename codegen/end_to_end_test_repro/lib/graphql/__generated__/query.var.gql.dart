// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_repro/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'query.var.gql.g.dart';

abstract class GReproQueryVars
    implements Built<GReproQueryVars, GReproQueryVarsBuilder> {
  GReproQueryVars._();

  factory GReproQueryVars([void Function(GReproQueryVarsBuilder b) updates]) =
      _$GReproQueryVars;

  static Serializer<GReproQueryVars> get serializer =>
      _$gReproQueryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReproQueryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReproQueryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReproQueryVars.serializer,
        json,
      );
}

abstract class GChildFragmentVars
    implements Built<GChildFragmentVars, GChildFragmentVarsBuilder> {
  GChildFragmentVars._();

  factory GChildFragmentVars(
          [void Function(GChildFragmentVarsBuilder b) updates]) =
      _$GChildFragmentVars;

  static Serializer<GChildFragmentVars> get serializer =>
      _$gChildFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentVars.serializer,
        json,
      );
}
