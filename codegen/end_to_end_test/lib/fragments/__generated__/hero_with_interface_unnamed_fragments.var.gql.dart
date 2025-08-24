// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_interface_unnamed_fragments.var.gql.g.dart';

abstract class GHeroWithInterfaceUnnamedFragmentsVars
    implements
        Built<
          GHeroWithInterfaceUnnamedFragmentsVars,
          GHeroWithInterfaceUnnamedFragmentsVarsBuilder
        > {
  GHeroWithInterfaceUnnamedFragmentsVars._();

  factory GHeroWithInterfaceUnnamedFragmentsVars([
    void Function(GHeroWithInterfaceUnnamedFragmentsVarsBuilder b) updates,
  ]) = _$GHeroWithInterfaceUnnamedFragmentsVars;

  factory GHeroWithInterfaceUnnamedFragmentsVars.create({
    required _i1.GEpisode episode,
  }) => GHeroWithInterfaceUnnamedFragmentsVars((b) => b..episode = episode);

  _i1.GEpisode get episode;
  static Serializer<GHeroWithInterfaceUnnamedFragmentsVars> get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(
            GHeroWithInterfaceUnnamedFragmentsVars.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragmentsVars? fromJson(
    Map<String, dynamic> json,
  ) => _i2.serializers.deserializeWith(
    GHeroWithInterfaceUnnamedFragmentsVars.serializer,
    json,
  );
}
