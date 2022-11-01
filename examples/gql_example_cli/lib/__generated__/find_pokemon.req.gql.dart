// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/find_pokemon.ast.gql.dart' as _i2;
import 'package:gql_example_cli/__generated__/find_pokemon.var.gql.dart' as _i3;
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'find_pokemon.req.gql.g.dart';

abstract class GFindPokemon
    implements Built<GFindPokemon, GFindPokemonBuilder> {
  GFindPokemon._();

  factory GFindPokemon([Function(GFindPokemonBuilder b) updates]) =
      _$GFindPokemon;

  static void _initializeBuilder(GFindPokemonBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'FindPokemon',
    );
  _i3.GFindPokemonVars get vars;
  _i1.Operation get operation;
  static Serializer<GFindPokemon> get serializer => _$gFindPokemonSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GFindPokemon.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFindPokemon? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GFindPokemon.serializer,
        json,
      );
}
