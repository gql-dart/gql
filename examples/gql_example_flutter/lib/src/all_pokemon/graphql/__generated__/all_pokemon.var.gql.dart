// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'all_pokemon.var.gql.g.dart';

abstract class GAllPokemonVars
    implements Built<GAllPokemonVars, GAllPokemonVarsBuilder> {
  GAllPokemonVars._();

  factory GAllPokemonVars([Function(GAllPokemonVarsBuilder b) updates]) =
      _$GAllPokemonVars;

  int get first;
  static Serializer<GAllPokemonVars> get serializer =>
      _$gAllPokemonVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllPokemonVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllPokemonVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllPokemonVars.serializer,
        json,
      );
}
