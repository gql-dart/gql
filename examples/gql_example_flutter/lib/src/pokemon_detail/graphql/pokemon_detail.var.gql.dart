// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/serializers.gql.dart' as _i2;

part 'pokemon_detail.var.gql.g.dart';

abstract class GPokemonDetailVars
    implements Built<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  GPokemonDetailVars._();

  factory GPokemonDetailVars([Function(GPokemonDetailVarsBuilder b) updates]) =
      _$GPokemonDetailVars;

  @nullable
  String get id;
  @nullable
  String get name;
  static Serializer<GPokemonDetailVars> get serializer =>
      _$gPokemonDetailVarsSerializer;
  String toJson() => _i1.json.encode(
      _i2.serializers.serializeWith(GPokemonDetailVars.serializer, this));
  static GPokemonDetailVars fromJson(String jsonString) =>
      _i2.serializers.deserializeWith(
          GPokemonDetailVars.serializer, _i1.json.decode(jsonString));
}
