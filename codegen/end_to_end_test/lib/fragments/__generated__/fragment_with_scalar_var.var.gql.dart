// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'fragment_with_scalar_var.var.gql.g.dart';

abstract class GPostsWithFixedVariableVars
    implements
        Built<GPostsWithFixedVariableVars, GPostsWithFixedVariableVarsBuilder> {
  GPostsWithFixedVariableVars._();

  factory GPostsWithFixedVariableVars(
          [Function(GPostsWithFixedVariableVarsBuilder b) updates]) =
      _$GPostsWithFixedVariableVars;

  _i1.GJson? get filter;
  static Serializer<GPostsWithFixedVariableVars> get serializer =>
      _$gPostsWithFixedVariableVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPostsWithFixedVariableVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsWithFixedVariableVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPostsWithFixedVariableVars.serializer,
        json,
      );
}

abstract class GPostFragmentForUser1Vars
    implements
        Built<GPostFragmentForUser1Vars, GPostFragmentForUser1VarsBuilder> {
  GPostFragmentForUser1Vars._();

  factory GPostFragmentForUser1Vars(
          [Function(GPostFragmentForUser1VarsBuilder b) updates]) =
      _$GPostFragmentForUser1Vars;

  static Serializer<GPostFragmentForUser1Vars> get serializer =>
      _$gPostFragmentForUser1VarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPostFragmentForUser1Vars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostFragmentForUser1Vars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPostFragmentForUser1Vars.serializer,
        json,
      );
}
