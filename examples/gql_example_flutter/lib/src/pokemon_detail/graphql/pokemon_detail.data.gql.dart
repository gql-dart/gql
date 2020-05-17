// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/serializers.gql.dart' as _i2;
import 'package:gql_example_flutter/src/pokemon_card/graphql/pokemon_card_fragment.data.gql.dart'
    as _i3;

part 'pokemon_detail.data.gql.g.dart';

abstract class GPokemonDetailData
    implements Built<GPokemonDetailData, GPokemonDetailDataBuilder> {
  GPokemonDetailData._();

  factory GPokemonDetailData([Function(GPokemonDetailDataBuilder b) updates]) =
      _$GPokemonDetailData;

  @nullable
  GPokemonDetailData_pokemon get pokemon;
  static Serializer<GPokemonDetailData> get serializer =>
      _$gPokemonDetailDataSerializer;
  String toJson() => _i1.json.encode(
      _i2.serializers.serializeWith(GPokemonDetailData.serializer, this));
  static GPokemonDetailData fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GPokemonDetailData.serializer, _i1.json.decode(jsonString));
}

abstract class GPokemonDetailData_pokemon
    implements
        Built<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder>,
        _i3.GPokemonCard {
  GPokemonDetailData_pokemon._();

  factory GPokemonDetailData_pokemon(
          [Function(GPokemonDetailData_pokemonBuilder b) updates]) =
      _$GPokemonDetailData_pokemon;

  String get id;
  @nullable
  String get name;
  @nullable
  int get maxHP;
  @nullable
  String get image;
  @nullable
  GPokemonDetailData_pokemon_weight get weight;
  @nullable
  GPokemonDetailData_pokemon_height get height;
  static Serializer<GPokemonDetailData_pokemon> get serializer =>
      _$gPokemonDetailDataPokemonSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(GPokemonDetailData_pokemon.serializer, this));
  static GPokemonDetailData_pokemon fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GPokemonDetailData_pokemon.serializer, _i1.json.decode(jsonString));
}

abstract class GPokemonDetailData_pokemon_weight
    implements
        Built<GPokemonDetailData_pokemon_weight,
            GPokemonDetailData_pokemon_weightBuilder> {
  GPokemonDetailData_pokemon_weight._();

  factory GPokemonDetailData_pokemon_weight(
          [Function(GPokemonDetailData_pokemon_weightBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_weight;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_pokemon_weight> get serializer =>
      _$gPokemonDetailDataPokemonWeightSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(GPokemonDetailData_pokemon_weight.serializer, this));
  static GPokemonDetailData_pokemon_weight fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GPokemonDetailData_pokemon_weight.serializer,
          _i1.json.decode(jsonString));
}

abstract class GPokemonDetailData_pokemon_height
    implements
        Built<GPokemonDetailData_pokemon_height,
            GPokemonDetailData_pokemon_heightBuilder> {
  GPokemonDetailData_pokemon_height._();

  factory GPokemonDetailData_pokemon_height(
          [Function(GPokemonDetailData_pokemon_heightBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_height;

  @nullable
  String get minimum;
  @nullable
  String get maximum;
  static Serializer<GPokemonDetailData_pokemon_height> get serializer =>
      _$gPokemonDetailDataPokemonHeightSerializer;
  String toJson() => _i1.json.encode(_i2.serializers
      .serializeWith(GPokemonDetailData_pokemon_height.serializer, this));
  static GPokemonDetailData_pokemon_height fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GPokemonDetailData_pokemon_height.serializer,
          _i1.json.decode(jsonString));
}
