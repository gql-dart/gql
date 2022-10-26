// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip_fragment_and_field.var.gql.g.dart';

abstract class GHeroSkipFragmentVars
    implements Built<GHeroSkipFragmentVars, GHeroSkipFragmentVarsBuilder> {
  GHeroSkipFragmentVars._();

  factory GHeroSkipFragmentVars(
          [Function(GHeroSkipFragmentVarsBuilder b) updates]) =
      _$GHeroSkipFragmentVars;

  bool get skipDetails;
  static Serializer<GHeroSkipFragmentVars> get serializer =>
      _$gHeroSkipFragmentVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroSkipFragmentVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroSkipFragmentVars.serializer, json);
}

abstract class GHeroDetailVars
    implements Built<GHeroDetailVars, GHeroDetailVarsBuilder> {
  GHeroDetailVars._();

  factory GHeroDetailVars([Function(GHeroDetailVarsBuilder b) updates]) =
      _$GHeroDetailVars;

  static Serializer<GHeroDetailVars> get serializer =>
      _$gHeroDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroDetailVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroDetailVars.serializer, json);
}
