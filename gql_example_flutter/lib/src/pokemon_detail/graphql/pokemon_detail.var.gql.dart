// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i2;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/schema.schema.gql.dart' as _i1;
import 'package:gql_example_flutter/src/graphql/serializers.gql.dart' as _i3;

part 'pokemon_detail.var.gql.g.dart';

abstract class PokemonDetailVars
    implements Built<PokemonDetailVars, PokemonDetailVarsBuilder> {
  PokemonDetailVars._();

  factory PokemonDetailVars([Function(PokemonDetailVarsBuilder b) updates]) =
      _$PokemonDetailVars;

  @nullable
  _i1.PokemonInput get input;
  static Serializer<PokemonDetailVars> get serializer =>
      _$pokemonDetailVarsSerializer;
  String toJson() => _i2.json.encode(
      _i3.serializers.serializeWith(PokemonDetailVars.serializer, this));
  static PokemonDetailVars fromJson(String jsonString) =>
      _i3.serializers.deserializeWith(
          PokemonDetailVars.serializer, _i2.json.decode(jsonString));
}
