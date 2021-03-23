// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/hero_with_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/hero_with_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/serializers.gql.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_with_fragments.req.gql.g.dart';

abstract class GHeroWithFragments
    implements Built<GHeroWithFragments, GHeroWithFragmentsBuilder> {
  GHeroWithFragments._();

  factory GHeroWithFragments([Function(GHeroWithFragmentsBuilder b) updates]) =
      _$GHeroWithFragments;

  static void _initializeBuilder(GHeroWithFragmentsBuilder b) => b
    ..operation = _i1.Operation(
        document: _i2.document, operationName: 'HeroWithFragments');
  _i3.GHeroWithFragmentsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroWithFragments> get serializer =>
      _$gHeroWithFragmentsSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GHeroWithFragments.serializer, this)
          as Map<String, dynamic>);
  static GHeroWithFragments? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GHeroWithFragments.serializer, json);
}
