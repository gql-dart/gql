// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_with_duplicated_fields_due_to_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsDuplicationVars
    implements
        Built<GHeroWithFragmentsDuplicationVars,
            GHeroWithFragmentsDuplicationVarsBuilder> {
  GHeroWithFragmentsDuplicationVars._();

  factory GHeroWithFragmentsDuplicationVars(
          [Function(GHeroWithFragmentsDuplicationVarsBuilder b) updates]) =
      _$GHeroWithFragmentsDuplicationVars;

  static Serializer<GHeroWithFragmentsDuplicationVars> get serializer =>
      _$gHeroWithFragmentsDuplicationVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GHeroWithFragmentsDuplicationVars.serializer, this)
      as Map<String, dynamic>);
  static GHeroWithFragmentsDuplicationVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithFragmentsDuplicationVars.serializer, json);
}

abstract class GheroDataVars
    implements Built<GheroDataVars, GheroDataVarsBuilder> {
  GheroDataVars._();

  factory GheroDataVars([Function(GheroDataVarsBuilder b) updates]) =
      _$GheroDataVars;

  static Serializer<GheroDataVars> get serializer => _$gheroDataVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GheroDataVars.serializer, this)
          as Map<String, dynamic>);
  static GheroDataVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GheroDataVars.serializer, json);
}
