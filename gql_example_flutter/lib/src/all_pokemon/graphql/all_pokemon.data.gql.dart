// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class AllPokemon_Data
    implements Built<AllPokemon_Data, AllPokemon_DataBuilder> {
  AllPokemon_Data._();

  factory AllPokemon_Data([Function(AllPokemon_DataBuilder b) updates]) =
      _$AllPokemon_Data;

  @nullable
  _i1.BuiltList<AllPokemon_Data_pokemons> get pokemons;
  static Serializer<AllPokemon_Data> get serializer =>
      _$allPokemonDataSerializer;
}

abstract class AllPokemon_Data_pokemons
    implements
        Built<AllPokemon_Data_pokemons, AllPokemon_Data_pokemonsBuilder>,
        _i2.PokemonCard {
  AllPokemon_Data_pokemons._();

  factory AllPokemon_Data_pokemons(
          [Function(AllPokemon_Data_pokemonsBuilder b) updates]) =
      _$AllPokemon_Data_pokemons;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<AllPokemon_Data_pokemons> get serializer =>
      _$allPokemonDataPokemonsSerializer;
}
