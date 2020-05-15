// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pokemon_detail.var.gql.g.dart';

abstract class PokemonDetailVars
    implements Built<PokemonDetailVars, PokemonDetailVarsBuilder> {
  PokemonDetailVars._();

  factory PokemonDetailVars([Function(PokemonDetailVarsBuilder b) updates]) =
      _$PokemonDetailVars;

  String get id;
  String get name;
  static Serializer<PokemonDetailVars> get serializer =>
      _$pokemonDetailVarsSerializer;
}
