// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_interface_subtyped_fragments.var.gql.g.dart';

abstract class GHeroWithInterfaceSubTypedFragmentsVars
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsVars,
            GHeroWithInterfaceSubTypedFragmentsVarsBuilder> {
  GHeroWithInterfaceSubTypedFragmentsVars._();

  factory GHeroWithInterfaceSubTypedFragmentsVars(
      [Function(GHeroWithInterfaceSubTypedFragmentsVarsBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsVars;

  _i1.GEpisode get episode;
  static Serializer<GHeroWithInterfaceSubTypedFragmentsVars> get serializer =>
      _$gHeroWithInterfaceSubTypedFragmentsVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWithInterfaceSubTypedFragmentsVars? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsVars.serializer,
        json,
      );
}

abstract class GheroFieldsFragmentVars
    implements Built<GheroFieldsFragmentVars, GheroFieldsFragmentVarsBuilder> {
  GheroFieldsFragmentVars._();

  factory GheroFieldsFragmentVars(
          [Function(GheroFieldsFragmentVarsBuilder b) updates]) =
      _$GheroFieldsFragmentVars;

  static Serializer<GheroFieldsFragmentVars> get serializer =>
      _$gheroFieldsFragmentVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GheroFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GheroFieldsFragmentVars.serializer,
        json,
      );
}

abstract class GhumanFieldsFragmentVars
    implements
        Built<GhumanFieldsFragmentVars, GhumanFieldsFragmentVarsBuilder> {
  GhumanFieldsFragmentVars._();

  factory GhumanFieldsFragmentVars(
          [Function(GhumanFieldsFragmentVarsBuilder b) updates]) =
      _$GhumanFieldsFragmentVars;

  static Serializer<GhumanFieldsFragmentVars> get serializer =>
      _$ghumanFieldsFragmentVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GhumanFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GhumanFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GhumanFieldsFragmentVars.serializer,
        json,
      );
}

abstract class GdroidFieldsFragmentVars
    implements
        Built<GdroidFieldsFragmentVars, GdroidFieldsFragmentVarsBuilder> {
  GdroidFieldsFragmentVars._();

  factory GdroidFieldsFragmentVars(
          [Function(GdroidFieldsFragmentVarsBuilder b) updates]) =
      _$GdroidFieldsFragmentVars;

  static Serializer<GdroidFieldsFragmentVars> get serializer =>
      _$gdroidFieldsFragmentVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GdroidFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GdroidFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GdroidFieldsFragmentVars.serializer,
        json,
      );
}
