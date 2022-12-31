// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_example_flutter/src/pokemon_card/graphql/__generated__/pokemon_card_fragment.data.gql.dart'
    as _i2;

part 'all_pokemon.data.gql.g.dart';

abstract class GAllPokemonData
    implements Built<GAllPokemonData, GAllPokemonDataBuilder> {
  GAllPokemonData._();

  factory GAllPokemonData([Function(GAllPokemonDataBuilder b) updates]) =
      _$GAllPokemonData;

  static void _initializeBuilder(GAllPokemonDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAllPokemonData_pokemons?>? get pokemons;
  static Serializer<GAllPokemonData> get serializer =>
      _$gAllPokemonDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllPokemonData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllPokemonData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllPokemonData.serializer,
        json,
      );
}

abstract class GAllPokemonData_pokemons
    implements
        Built<GAllPokemonData_pokemons, GAllPokemonData_pokemonsBuilder>,
        _i2.GPokemonCard {
  GAllPokemonData_pokemons._();

  factory GAllPokemonData_pokemons(
          [Function(GAllPokemonData_pokemonsBuilder b) updates]) =
      _$GAllPokemonData_pokemons;

  static void _initializeBuilder(GAllPokemonData_pokemonsBuilder b) =>
      b..G__typename = 'Pokemon';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int? get maxHP;
  @override
  String? get image;
  @override
  String get id;
  @override
  String? get name;
  static Serializer<GAllPokemonData_pokemons> get serializer =>
      _$gAllPokemonDataPokemonsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllPokemonData_pokemons.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllPokemonData_pokemons? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllPokemonData_pokemons.serializer,
        json,
      );
}
