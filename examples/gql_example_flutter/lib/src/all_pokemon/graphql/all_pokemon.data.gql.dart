// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/serializers.gql.dart' as _i2;
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i3;

part 'all_pokemon.data.gql.g.dart';

abstract class GAllPokemonData
    implements Built<GAllPokemonData, GAllPokemonDataBuilder> {
  GAllPokemonData._();

  factory GAllPokemonData([Function(GAllPokemonDataBuilder b) updates]) =
      _$GAllPokemonData;

  @nullable
  BuiltList<GAllPokemonData_pokemons> get pokemons;
  static Serializer<GAllPokemonData> get serializer =>
      _$gAllPokemonDataSerializer;
  String toJson() => _i1.json
      .encode(_i2.serializers.serializeWith(GAllPokemonData.serializer, this));
  static GAllPokemonData fromJson(String jsonString) => _i2.serializers
      .deserializeWith(GAllPokemonData.serializer, _i1.json.decode(jsonString));
}

abstract class GAllPokemonData_pokemons
    implements
        Built<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder>,
        _i3.GPokemonCard {
  GAllPokemonData_pokemons._();

  factory GAllPokemonData_pokemons(
          [Function(GAllPokemonData_pokemonsBuilder b) updates]) =
      _$GAllPokemonData_pokemons;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  static Serializer<GAllPokemonData_pokemons> get serializer =>
      _$gAllPokemonDataPokemonsSerializer;
  String toJson() => _i1.json.encode(
      _i2.serializers.serializeWith(GAllPokemonData_pokemons.serializer, this));
  static GAllPokemonData_pokemons fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GAllPokemonData_pokemons.serializer, _i1.json.decode(jsonString));
}
