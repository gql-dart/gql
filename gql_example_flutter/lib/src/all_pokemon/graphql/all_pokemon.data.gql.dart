// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class AllPokemon implements Built<AllPokemon, AllPokemonBuilder> {
  AllPokemon._();

  factory AllPokemon([Function(AllPokemonBuilder b) updates]) = _$AllPokemon;

  @nullable
  _i1.BuiltList<AllPokemon_pokemons> get pokemons;
}

abstract class AllPokemon_pokemons
    implements
        Built<AllPokemon_pokemons, AllPokemon_pokemonsBuilder>,
        _i2.PokemonCard {
  AllPokemon_pokemons._();

  factory AllPokemon_pokemons(
      [Function(AllPokemon_pokemonsBuilder b) updates]) = _$AllPokemon_pokemons;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
}
