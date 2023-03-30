// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i1;

part 'find_pokemon.var.gql.g.dart';

abstract class GFindPokemonVars
    implements Built<GFindPokemonVars, GFindPokemonVarsBuilder> {
  GFindPokemonVars._();

  factory GFindPokemonVars([Function(GFindPokemonVarsBuilder b) updates]) =
      _$GFindPokemonVars;

  String get name;
  static Serializer<GFindPokemonVars> get serializer =>
      _$gFindPokemonVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFindPokemonVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFindPokemonVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFindPokemonVars.serializer,
        json,
      );
}
