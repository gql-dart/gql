// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/directives/__generated__/hero_skip.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/directives/__generated__/hero_skip.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_skip.req.gql.g.dart';

abstract class GHeroSkip implements Built<GHeroSkip, GHeroSkipBuilder> {
  GHeroSkip._();

  factory GHeroSkip([Function(GHeroSkipBuilder b) updates]) = _$GHeroSkip;

  static void _initializeBuilder(GHeroSkipBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'HeroSkip');
  _i3.GHeroSkipVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroSkip> get serializer => _$gHeroSkipSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GHeroSkip.serializer, this)
          as Map<String, dynamic>);
  static GHeroSkip? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GHeroSkip.serializer, json);
}
