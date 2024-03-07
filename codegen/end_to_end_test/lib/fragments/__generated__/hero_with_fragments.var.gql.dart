// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_with_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsVars
    implements Built<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  GHeroWithFragmentsVars._();

  factory GHeroWithFragmentsVars(
          [void Function(GHeroWithFragmentsVarsBuilder b) updates]) =
      _$GHeroWithFragmentsVars;

  factory GHeroWithFragmentsVars.create({int? first}) =>
      GHeroWithFragmentsVars((b) => b..first = first);

  int? get first;
  static Serializer<GHeroWithFragmentsVars> get serializer =>
      _$gHeroWithFragmentsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroWithFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroWithFragmentsVars.serializer,
        json,
      );
}

abstract class GheroDataVars
    implements Built<GheroDataVars, GheroDataVarsBuilder> {
  GheroDataVars._();

  factory GheroDataVars([void Function(GheroDataVarsBuilder b) updates]) =
      _$GheroDataVars;

  factory GheroDataVars.create() => GheroDataVars();

  static Serializer<GheroDataVars> get serializer => _$gheroDataVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GheroDataVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroDataVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GheroDataVars.serializer,
        json,
      );
}

abstract class GcomparisonFieldsVars
    implements Built<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  GcomparisonFieldsVars._();

  factory GcomparisonFieldsVars(
          [void Function(GcomparisonFieldsVarsBuilder b) updates]) =
      _$GcomparisonFieldsVars;

  factory GcomparisonFieldsVars.create({int? first}) =>
      GcomparisonFieldsVars((b) => b..first = first);

  int? get first;
  static Serializer<GcomparisonFieldsVars> get serializer =>
      _$gcomparisonFieldsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcomparisonFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcomparisonFieldsVars.serializer,
        json,
      );
}
