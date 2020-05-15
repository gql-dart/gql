// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i2;

import 'package:built_collection/built_collection.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/serializers.gql.dart' as _i3;
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i4;

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
  String toJson() => _i2.json
      .encode(_i3.serializers.serializeWith(AllPokemonData.serializer, this));
  static AllPokemonData fromJson(String jsonString) => _i3.serializers
      .deserializeWith(AllPokemonData.serializer, _i2.json.decode(jsonString));
}

abstract class AllPokemonData_pokemons
    implements
        Built<AllPokemonData_pokemons, AllPokemonData_pokemonsBuilder>,
        _i4.PokemonCard {
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
  String toJson() => _i2.json.encode(
      _i3.serializers.serializeWith(AllPokemonData_pokemons.serializer, this));
  static AllPokemonData_pokemons fromJson(String jsonString) =>
      _i3.serializers.deserializeWith(
          AllPokemonData_pokemons.serializer, _i2.json.decode(jsonString));
}
