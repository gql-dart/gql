import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.data.gql.dart'
    show AllPokemon_Data, AllPokemon_Data_pokemons;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/pokemon_detail.data.gql.dart'
    show
        PokemonDetail_Data,
        PokemonDetail_Data_pokemon,
        PokemonDetail_Data_pokemon_weight,
        PokemonDetail_Data_pokemon_height;

part 'serializers.gql.g.dart';

@SerializersFor([
  PokemonDetail_Data,
  PokemonDetail_Data_pokemon,
  PokemonDetail_Data_pokemon_weight,
  PokemonDetail_Data_pokemon_height,
  AllPokemon_Data,
  AllPokemon_Data_pokemons
])
final Serializers serializers = _$serializers;
