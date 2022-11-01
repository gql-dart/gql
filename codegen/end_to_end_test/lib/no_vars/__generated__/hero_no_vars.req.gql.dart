// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/no_vars/__generated__/hero_no_vars.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/no_vars/__generated__/hero_no_vars.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_no_vars.req.gql.g.dart';

abstract class GHeroNoVars implements Built<GHeroNoVars, GHeroNoVarsBuilder> {
  GHeroNoVars._();

  factory GHeroNoVars([Function(GHeroNoVarsBuilder b) updates]) = _$GHeroNoVars;

  static void _initializeBuilder(GHeroNoVarsBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HeroNoVars',
    );
  _i3.GHeroNoVarsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroNoVars> get serializer => _$gHeroNoVarsSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroNoVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeroNoVars? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroNoVars.serializer,
        json,
      );
}
