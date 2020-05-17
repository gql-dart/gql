// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.op.gql.dart'
    as _i3;
import 'package:gql_example_flutter/src/all_pokemon/graphql/all_pokemon.var.gql.dart'
    as _i2;
import 'package:gql_exec/gql_exec.dart' as _i1;

class AllPokemon extends _i1.Request {
  AllPokemon(
      _i2.AllPokemonVarBuilder Function(_i2.AllPokemonVarBuilder) buildVars)
      : super(
            operation: _i3.AllPokemon,
            variables: buildVars(_i2.AllPokemonVarBuilder()).variables);
}
