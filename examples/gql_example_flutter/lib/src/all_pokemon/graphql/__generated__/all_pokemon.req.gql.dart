// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_example_flutter/src/all_pokemon/graphql/__generated__/all_pokemon.ast.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/all_pokemon/graphql/__generated__/all_pokemon.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'all_pokemon.req.gql.g.dart';

abstract class GAllPokemon implements Built<GAllPokemon, GAllPokemonBuilder> {
  GAllPokemon._();

  factory GAllPokemon([Function(GAllPokemonBuilder b) updates]) = _$GAllPokemon;

  static void _initializeBuilder(GAllPokemonBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'AllPokemon',
    );
  _i3.GAllPokemonVars get vars;
  _i1.Operation get operation;
  static Serializer<GAllPokemon> get serializer => _$gAllPokemonSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GAllPokemon.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllPokemon? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GAllPokemon.serializer,
        json,
      );
}
