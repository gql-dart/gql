// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class AllPokemonData
    implements Built<AllPokemonData, AllPokemonDataBuilder> {
  AllPokemonData._();

  factory AllPokemonData([Function(AllPokemonDataBuilder b) updates]) =
      _$AllPokemonData;

  @nullable
  _i1.BuiltList<AllPokemonData_pokemons> get pokemons;
  static Serializer<AllPokemonData> get serializer =>
      _$allPokemonDataSerializer;
}

abstract class AllPokemonData_pokemons
    implements
        Built<AllPokemonData_pokemons, AllPokemonData_pokemonsBuilder>,
        _i2.PokemonCard {
  AllPokemonData_pokemons._();

  factory AllPokemonData_pokemons(
          [Function(AllPokemonData_pokemonsBuilder b) updates]) =
      _$AllPokemonData_pokemons;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<AllPokemonData_pokemons> get serializer =>
      _$allPokemonDataPokemonsSerializer;
}
