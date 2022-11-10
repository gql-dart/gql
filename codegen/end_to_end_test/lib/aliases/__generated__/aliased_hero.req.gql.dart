// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/aliases/__generated__/aliased_hero.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/aliases/__generated__/aliased_hero.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'aliased_hero.req.gql.g.dart';

abstract class GAliasedHero
    implements Built<GAliasedHero, GAliasedHeroBuilder> {
  GAliasedHero._();

  factory GAliasedHero([Function(GAliasedHeroBuilder b) updates]) =
      _$GAliasedHero;

  static void _initializeBuilder(GAliasedHeroBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'AliasedHero',
    );
  _i3.GAliasedHeroVars get vars;
  _i1.Operation get operation;
  static Serializer<GAliasedHero> get serializer => _$gAliasedHeroSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GAliasedHero.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAliasedHero? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GAliasedHero.serializer,
        json,
      );
}
