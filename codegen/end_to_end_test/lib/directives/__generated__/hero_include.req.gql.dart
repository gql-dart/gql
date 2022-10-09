// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/directives/__generated__/hero_include.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/directives/__generated__/hero_include.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_include.req.gql.g.dart';

abstract class GHeroInclude
    implements Built<GHeroInclude, GHeroIncludeBuilder> {
  GHeroInclude._();

  factory GHeroInclude([Function(GHeroIncludeBuilder b) updates]) =
      _$GHeroInclude;

  static void _initializeBuilder(GHeroIncludeBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'HeroInclude');
  _i3.GHeroIncludeVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroInclude> get serializer => _$gHeroIncludeSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GHeroInclude.serializer, this)
          as Map<String, dynamic>);
  static GHeroInclude? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GHeroInclude.serializer, json);
}
