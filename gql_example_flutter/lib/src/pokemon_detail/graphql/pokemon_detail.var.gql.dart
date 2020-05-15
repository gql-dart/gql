// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/schema.schema.gql.dart' as _i1;

part 'pokemon_detail.var.gql.g.dart';

abstract class PokemonDetailVars
    implements Built<PokemonDetailVars, PokemonDetailVarsBuilder> {
  PokemonDetailVars._();

  factory PokemonDetailVars([Function(PokemonDetailVarsBuilder b) updates]) =
      _$PokemonDetailVars;

  @nullable
  _i1.pokemonInput get input;
  static Serializer<PokemonDetailVars> get serializer =>
      _$pokemonDetailVarsSerializer;
}
