// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'nested_fragments.var.gql.g.dart';

abstract class GTestQueryVars
    implements Built<GTestQueryVars, GTestQueryVarsBuilder> {
  GTestQueryVars._();

  factory GTestQueryVars([void Function(GTestQueryVarsBuilder b) updates]) =
      _$GTestQueryVars;

  static Serializer<GTestQueryVars> get serializer =>
      _$gTestQueryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTestQueryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTestQueryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTestQueryVars.serializer,
        json,
      );
}

abstract class GUserFragmentVars
    implements Built<GUserFragmentVars, GUserFragmentVarsBuilder> {
  GUserFragmentVars._();

  factory GUserFragmentVars(
          [void Function(GUserFragmentVarsBuilder b) updates]) =
      _$GUserFragmentVars;

  static Serializer<GUserFragmentVars> get serializer =>
      _$gUserFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFragmentVars.serializer,
        json,
      );
}
