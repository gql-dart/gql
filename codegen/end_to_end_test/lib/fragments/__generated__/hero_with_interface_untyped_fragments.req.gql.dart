// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_untyped_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_untyped_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_with_interface_untyped_fragments.req.gql.g.dart';

abstract class GHeroWithoutFragments
    implements Built<GHeroWithoutFragments, GHeroWithoutFragmentsBuilder> {
  GHeroWithoutFragments._();

  factory GHeroWithoutFragments(
          [void Function(GHeroWithoutFragmentsBuilder b) updates]) =
      _$GHeroWithoutFragments;

  static void _initializeBuilder(GHeroWithoutFragmentsBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HeroWithoutFragments',
    );

  _i3.GHeroWithoutFragmentsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroWithoutFragments> get serializer =>
      _$gHeroWithoutFragmentsSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroWithoutFragments.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithoutFragments? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroWithoutFragments.serializer,
        json,
      );
}
