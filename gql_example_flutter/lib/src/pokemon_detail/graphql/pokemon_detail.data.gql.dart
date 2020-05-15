// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/serializers.gql.dart' as _i2;
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i3;

part 'pokemon_detail.data.gql.g.dart';

abstract class PokemonDetailData
    implements Built<PokemonDetailData, PokemonDetailDataBuilder> {
  PokemonDetailData._();

  factory PokemonDetailData([Function(PokemonDetailDataBuilder b) updates]) =
      _$PokemonDetailData;

  @nullable
  PokemonDetailData_pokemon get pokemon;
  static Serializer<PokemonDetailData> get serializer =>
      _$pokemonDetailDataSerializer;
  String toJson() => _i1.json.encode(
      _i2.serializers.serializeWith(PokemonDetailData.serializer, this));
  static PokemonDetailData fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          PokemonDetailData.serializer, _i1.json.decode(jsonString));
}

abstract class PokemonDetailData_pokemon
    implements
        Built<PokemonDetailData_pokemon, PokemonDetailData_pokemonBuilder>,
        _i3.PokemonCard {
  PokemonDetailData_pokemon._();

  factory PokemonDetailData_pokemon(
          [Function(PokemonDetailData_pokemonBuilder b) updates]) =
      _$PokemonDetailData_pokemon;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  @nullable
  PokemonDetailData_pokemon_weight get weight;
  @nullable
  PokemonDetailData_pokemon_height get height;
  static Serializer<PokemonDetailData_pokemon> get serializer =>
      _$pokemonDetailDataPokemonSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(PokemonDetailData_pokemon.serializer, this));
  static PokemonDetailData_pokemon fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          PokemonDetailData_pokemon.serializer, _i1.json.decode(jsonString));
}

abstract class PokemonDetailData_pokemon_weight
    implements
        Built<PokemonDetailData_pokemon_weight,
            PokemonDetailData_pokemon_weightBuilder> {
  PokemonDetailData_pokemon_weight._();

  factory PokemonDetailData_pokemon_weight(
          [Function(PokemonDetailData_pokemon_weightBuilder b) updates]) =
      _$PokemonDetailData_pokemon_weight;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<PokemonDetailData_pokemon_weight> get serializer =>
      _$pokemonDetailDataPokemonWeightSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(PokemonDetailData_pokemon_weight.serializer, this));
  static PokemonDetailData_pokemon_weight fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          PokemonDetailData_pokemon_weight.serializer,
          _i1.json.decode(jsonString));
}

abstract class PokemonDetailData_pokemon_height
    implements
        Built<PokemonDetailData_pokemon_height,
            PokemonDetailData_pokemon_heightBuilder> {
  PokemonDetailData_pokemon_height._();

  factory PokemonDetailData_pokemon_height(
          [Function(PokemonDetailData_pokemon_heightBuilder b) updates]) =
      _$PokemonDetailData_pokemon_height;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<PokemonDetailData_pokemon_height> get serializer =>
      _$pokemonDetailDataPokemonHeightSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(PokemonDetailData_pokemon_height.serializer, this));
  static PokemonDetailData_pokemon_height fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          PokemonDetailData_pokemon_height.serializer,
          _i1.json.decode(jsonString));
}
