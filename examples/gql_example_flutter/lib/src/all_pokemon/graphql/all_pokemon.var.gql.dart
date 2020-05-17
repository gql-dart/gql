// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/serializers.gql.dart' as _i2;

part 'all_pokemon.var.gql.g.dart';

abstract class GAllPokemonVars
    implements Built<GAllPokemonVars, GAllPokemonVarsBuilder> {
  GAllPokemonVars._();

  factory GAllPokemonVars([Function(GAllPokemonVarsBuilder b) updates]) =
      _$GAllPokemonVars;

  int get first;
  static Serializer<GAllPokemonVars> get serializer =>
      _$gAllPokemonVarsSerializer;
  String toJson() => _i1.json
      .encode(_i2.serializers.serializeWith(GAllPokemonVars.serializer, this));
  static GAllPokemonVars fromJson(String jsonString) => _i2.serializers
      .deserializeWith(GAllPokemonVars.serializer, _i1.json.decode(jsonString));
}
