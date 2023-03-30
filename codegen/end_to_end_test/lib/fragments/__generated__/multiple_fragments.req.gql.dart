// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/multiple_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/multiple_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'multiple_fragments.req.gql.g.dart';

abstract class GHeroWith2Fragments
    implements Built<GHeroWith2Fragments, GHeroWith2FragmentsBuilder> {
  GHeroWith2Fragments._();

  factory GHeroWith2Fragments(
      [Function(GHeroWith2FragmentsBuilder b) updates]) = _$GHeroWith2Fragments;

  static void _initializeBuilder(GHeroWith2FragmentsBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HeroWith2Fragments',
    );
  _i3.GHeroWith2FragmentsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroWith2Fragments> get serializer =>
      _$gHeroWith2FragmentsSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroWith2Fragments.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroWith2Fragments? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroWith2Fragments.serializer,
        json,
      );
}
