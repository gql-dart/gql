// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i1;

part 'list_pokemon.var.gql.g.dart';

abstract class GListPokemonVars
    implements Built<GListPokemonVars, GListPokemonVarsBuilder> {
  GListPokemonVars._();

  factory GListPokemonVars([Function(GListPokemonVarsBuilder b) updates]) =
      _$GListPokemonVars;

  int get count;
  static Serializer<GListPokemonVars> get serializer =>
      _$gListPokemonVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GListPokemonVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListPokemonVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GListPokemonVars.serializer,
        json,
      );
}
