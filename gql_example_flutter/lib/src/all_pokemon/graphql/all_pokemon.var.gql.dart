// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/serializers.gql.dart' as _i2;

part 'all_pokemon.var.gql.g.dart';

abstract class AllPokemonVars
    implements Built<AllPokemonVars, AllPokemonVarsBuilder> {
  AllPokemonVars._();

  factory AllPokemonVars([Function(AllPokemonVarsBuilder b) updates]) =
      _$AllPokemonVars;

  int get first;
  static Serializer<AllPokemonVars> get serializer =>
      _$allPokemonVarsSerializer;
  String toJson() => _i1.json
      .encode(_i2.serializers.serializeWith(AllPokemonVars.serializer, this));
  static AllPokemonVars fromJson(String jsonString) => _i2.serializers
      .deserializeWith(AllPokemonVars.serializer, _i1.json.decode(jsonString));
}
