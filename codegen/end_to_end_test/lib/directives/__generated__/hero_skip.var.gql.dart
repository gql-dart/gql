// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip.var.gql.g.dart';

abstract class GHeroSkipVars
    implements Built<GHeroSkipVars, GHeroSkipVarsBuilder> {
  GHeroSkipVars._();

  factory GHeroSkipVars([Function(GHeroSkipVarsBuilder b) updates]) =
      _$GHeroSkipVars;

  bool get skipName;
  static Serializer<GHeroSkipVars> get serializer => _$gHeroSkipVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GHeroSkipVars.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroSkipVars.serializer, json);
}
