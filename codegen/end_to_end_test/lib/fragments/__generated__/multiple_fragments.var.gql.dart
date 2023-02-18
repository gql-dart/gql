// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'multiple_fragments.var.gql.g.dart';

abstract class GHeroWith2FragmentsVars
    implements Built<GHeroWith2FragmentsVars, GHeroWith2FragmentsVarsBuilder> {
  GHeroWith2FragmentsVars._();

  factory GHeroWith2FragmentsVars(
          [Function(GHeroWith2FragmentsVarsBuilder b) updates]) =
      _$GHeroWith2FragmentsVars;

  int? get first;
  static Serializer<GHeroWith2FragmentsVars> get serializer =>
      _$gHeroWith2FragmentsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWith2FragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWith2FragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWith2FragmentsVars.serializer,
        json,
      );
}

abstract class GheroNameVars
    implements Built<GheroNameVars, GheroNameVarsBuilder> {
  GheroNameVars._();

  factory GheroNameVars([Function(GheroNameVarsBuilder b) updates]) =
      _$GheroNameVars;

  static Serializer<GheroNameVars> get serializer => _$gheroNameVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroNameVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroNameVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroNameVars.serializer,
        json,
      );
}

abstract class GheroIdVars implements Built<GheroIdVars, GheroIdVarsBuilder> {
  GheroIdVars._();

  factory GheroIdVars([Function(GheroIdVarsBuilder b) updates]) = _$GheroIdVars;

  static Serializer<GheroIdVars> get serializer => _$gheroIdVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroIdVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GheroIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroIdVars.serializer,
        json,
      );
}
