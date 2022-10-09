// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_include.var.gql.g.dart';

abstract class GHeroIncludeVars
    implements Built<GHeroIncludeVars, GHeroIncludeVarsBuilder> {
  GHeroIncludeVars._();

  factory GHeroIncludeVars([Function(GHeroIncludeVarsBuilder b) updates]) =
      _$GHeroIncludeVars;

  bool get includeId;
  static Serializer<GHeroIncludeVars> get serializer =>
      _$gHeroIncludeVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroIncludeVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroIncludeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroIncludeVars.serializer, json);
}
