// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:convert' as _i1;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/src/graphql/serializers.gql.dart' as _i2;

part 'schema.schema.gql.g.dart';

abstract class PokemonInput
    implements Built<PokemonInput, PokemonInputBuilder> {
  PokemonInput._();

  factory PokemonInput([Function(PokemonInputBuilder b) updates]) =
      _$PokemonInput;

  @nullable
  String get id;
  @nullable
  String get name;
  static Serializer<PokemonInput> get serializer => _$pokemonInputSerializer;
  String toJson() => _i1.json
      .encode(_i2.serializers.serializeWith(PokemonInput.serializer, this));
  static PokemonInput fromJson(String jsonString) => _i2.serializers
      .deserializeWith(PokemonInput.serializer, _i1.json.decode(jsonString));
}
