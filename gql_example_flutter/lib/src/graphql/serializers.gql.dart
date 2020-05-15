import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.data.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/pokemon_detail.data.gql.dart'
    as _i1;

part 'serializers.gql.g.dart';

@SerializersFor([
  _i1.PokemonDetail,
  _i1.PokemonDetail_pokemon,
  _i1.PokemonDetail_pokemon_weight,
  _i1.PokemonDetail_pokemon_height,
  _i2.AllPokemon,
  _i2.AllPokemon_pokemons
])
final Serializers serializers = _$serializers;
