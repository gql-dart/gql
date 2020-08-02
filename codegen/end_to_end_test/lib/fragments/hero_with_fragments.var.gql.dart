// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/serializers.gql.dart' as _i1;

part 'hero_with_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsVars
    implements Built<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  GHeroWithFragmentsVars._();

  factory GHeroWithFragmentsVars(
          [Function(GHeroWithFragmentsVarsBuilder b) updates]) =
      _$GHeroWithFragmentsVars;

  @nullable
  int get first;
  static Serializer<GHeroWithFragmentsVars> get serializer =>
      _$gHeroWithFragmentsVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroWithFragmentsVars.serializer, this);
  static GHeroWithFragmentsVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroWithFragmentsVars.serializer, json);
}
