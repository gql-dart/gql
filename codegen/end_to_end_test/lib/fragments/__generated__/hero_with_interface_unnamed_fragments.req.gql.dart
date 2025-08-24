// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_unnamed_fragments.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_unnamed_fragments.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'hero_with_interface_unnamed_fragments.req.gql.g.dart';

abstract class GHeroWithInterfaceUnnamedFragments
    implements
        Built<GHeroWithInterfaceUnnamedFragments,
            GHeroWithInterfaceUnnamedFragmentsBuilder> {
  GHeroWithInterfaceUnnamedFragments._();

  factory GHeroWithInterfaceUnnamedFragments(
      [void Function(GHeroWithInterfaceUnnamedFragmentsBuilder b)
          updates]) = _$GHeroWithInterfaceUnnamedFragments;

  static void _initializeBuilder(GHeroWithInterfaceUnnamedFragmentsBuilder b) =>
      b
        ..operation = _i1.Operation(
          document: _i2.document,
          operationName: 'HeroWithInterfaceUnnamedFragments',
        );

  _i3.GHeroWithInterfaceUnnamedFragmentsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHeroWithInterfaceUnnamedFragments> get serializer =>
      _$gHeroWithInterfaceUnnamedFragmentsSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHeroWithInterfaceUnnamedFragments.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceUnnamedFragments? fromJson(
          Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHeroWithInterfaceUnnamedFragments.serializer,
        json,
      );
}
