// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i1;

part 'pokemon_detail.data.gql.g.dart';

abstract class PokemonDetail
    implements Built<PokemonDetail, PokemonDetailBuilder> {
  PokemonDetail._();

  factory PokemonDetail([Function(PokemonDetailBuilder b) updates]) =
      _$PokemonDetail;

  @nullable
  PokemonDetail_pokemon get pokemon;
}

abstract class PokemonDetail_pokemon
    implements
        Built<PokemonDetail_pokemon, PokemonDetail_pokemonBuilder>,
        _i1.PokemonCard {
  PokemonDetail_pokemon._();

  factory PokemonDetail_pokemon(
          [Function(PokemonDetail_pokemonBuilder b) updates]) =
      _$PokemonDetail_pokemon;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  @nullable
  PokemonDetail_pokemon_weight get weight;
  @nullable
  PokemonDetail_pokemon_height get height;
}

abstract class PokemonDetail_pokemon_weight
    implements
        Built<PokemonDetail_pokemon_weight,
            PokemonDetail_pokemon_weightBuilder> {
  PokemonDetail_pokemon_weight._();

  factory PokemonDetail_pokemon_weight(
          [Function(PokemonDetail_pokemon_weightBuilder b) updates]) =
      _$PokemonDetail_pokemon_weight;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
}

abstract class PokemonDetail_pokemon_height
    implements
        Built<PokemonDetail_pokemon_height,
            PokemonDetail_pokemon_heightBuilder> {
  PokemonDetail_pokemon_height._();

  factory PokemonDetail_pokemon_height(
          [Function(PokemonDetail_pokemon_heightBuilder b) updates]) =
      _$PokemonDetail_pokemon_height;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
}
