// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i1;

part 'pokemon_detail.data.gql.g.dart';

abstract class PokemonDetail_Data
    implements Built<PokemonDetail_Data, PokemonDetail_DataBuilder> {
  PokemonDetail_Data._();

  factory PokemonDetail_Data([Function(PokemonDetail_DataBuilder b) updates]) =
      _$PokemonDetail_Data;

  @nullable
  PokemonDetail_Data_pokemon get pokemon;
  static Serializer<PokemonDetail_Data> get serializer =>
      _$pokemonDetailDataSerializer;
}

abstract class PokemonDetail_Data_pokemon
    implements
        Built<PokemonDetail_Data_pokemon, PokemonDetail_Data_pokemonBuilder>,
        _i1.PokemonCard {
  PokemonDetail_Data_pokemon._();

  factory PokemonDetail_Data_pokemon(
          [Function(PokemonDetail_Data_pokemonBuilder b) updates]) =
      _$PokemonDetail_Data_pokemon;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  @nullable
  PokemonDetail_Data_pokemon_weight get weight;
  @nullable
  PokemonDetail_Data_pokemon_height get height;
  static Serializer<PokemonDetail_Data_pokemon> get serializer =>
      _$pokemonDetailDataPokemonSerializer;
}

abstract class PokemonDetail_Data_pokemon_weight
    implements
        Built<PokemonDetail_Data_pokemon_weight,
            PokemonDetail_Data_pokemon_weightBuilder> {
  PokemonDetail_Data_pokemon_weight._();

  factory PokemonDetail_Data_pokemon_weight(
          [Function(PokemonDetail_Data_pokemon_weightBuilder b) updates]) =
      _$PokemonDetail_Data_pokemon_weight;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<PokemonDetail_Data_pokemon_weight> get serializer =>
      _$pokemonDetailDataPokemonWeightSerializer;
}

abstract class PokemonDetail_Data_pokemon_height
    implements
        Built<PokemonDetail_Data_pokemon_height,
            PokemonDetail_Data_pokemon_heightBuilder> {
  PokemonDetail_Data_pokemon_height._();

  factory PokemonDetail_Data_pokemon_height(
          [Function(PokemonDetail_Data_pokemon_heightBuilder b) updates]) =
      _$PokemonDetail_Data_pokemon_height;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<PokemonDetail_Data_pokemon_height> get serializer =>
      _$pokemonDetailDataPokemonHeightSerializer;
}
