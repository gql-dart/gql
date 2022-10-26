// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/directives/__generated__/hero_skip_fragment.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/directives/__generated__/hero_skip_fragment.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_skip_fragment.req.gql.g.dart';

abstract class GHeroSkipFragment
    implements Built<GHeroSkipFragment, GHeroSkipFragmentBuilder> {
  GHeroSkipFragment._();

  factory GHeroSkipFragment([Function(GHeroSkipFragmentBuilder b) updates]) =
      _$GHeroSkipFragment;

  static void _initializeBuilder(GHeroSkipFragmentBuilder b) => b
    ..operation = _i1.Operation(
        document: _i2.document, operationName: 'HeroSkipFragment');
  _i3.GHeroSkipFragmentVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroSkipFragment> get serializer =>
      _$gHeroSkipFragmentSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GHeroSkipFragment.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkipFragment? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GHeroSkipFragment.serializer, json);
}
