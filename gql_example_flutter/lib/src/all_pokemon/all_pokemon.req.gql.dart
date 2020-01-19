import 'package:gql_exec/gql_exec.dart' as _i1;
import 'package:gql_example_flutter/src/all_pokemon/all_pokemon.var.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/all_pokemon/all_pokemon.op.gql.dart'
    as _i3;

class AllPokemon extends _i1.Request {
  AllPokemon(
      _i2.AllPokemonVarBuilder Function(_i2.AllPokemonVarBuilder) buildVars)
      : super(
            operation: _i3.AllPokemon,
            variables: buildVars(_i2.AllPokemonVarBuilder()).variables);
}
