import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.data.gql.dart'
    show AllPokemonData, AllPokemonData_pokemons;
import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.var.gql.dart'
    show AllPokemonVars;
import 'package:gql_example_flutter/src/graphql/schema.schema.gql.dart'
    show PokemonInput;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/pokemon_detail.data.gql.dart'
    show
        PokemonDetailData,
        PokemonDetailData_pokemon,
        PokemonDetailData_pokemon_weight,
        PokemonDetailData_pokemon_height;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/pokemon_detail.var.gql.dart'
    show PokemonDetailVars;

part 'serializers.gql.g.dart';

@SerializersFor([
  PokemonDetailData,
  PokemonDetailData_pokemon,
  PokemonDetailData_pokemon_weight,
  PokemonDetailData_pokemon_height,
  AllPokemonData,
  AllPokemonData_pokemons,
  PokemonInput,
  PokemonDetailVars,
  AllPokemonVars
])
final Serializers serializers = _$serializers;
