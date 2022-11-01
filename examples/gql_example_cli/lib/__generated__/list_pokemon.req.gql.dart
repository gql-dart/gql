// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli/__generated__/list_pokemon.ast.gql.dart' as _i2;
import 'package:gql_example_cli/__generated__/list_pokemon.var.gql.dart' as _i3;
import 'package:gql_example_cli/__generated__/serializers.gql.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'list_pokemon.req.gql.g.dart';

abstract class GListPokemon
    implements Built<GListPokemon, GListPokemonBuilder> {
  GListPokemon._();

  factory GListPokemon([Function(GListPokemonBuilder b) updates]) =
      _$GListPokemon;

  static void _initializeBuilder(GListPokemonBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'ListPokemon',
    );
  _i3.GListPokemonVars get vars;
  _i1.Operation get operation;
  static Serializer<GListPokemon> get serializer => _$gListPokemonSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GListPokemon.serializer,
        this,
      ) as Map<String, dynamic>);
  static GListPokemon? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GListPokemon.serializer,
        json,
      );
}
