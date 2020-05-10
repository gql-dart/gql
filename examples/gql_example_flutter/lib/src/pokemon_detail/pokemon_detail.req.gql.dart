import 'package:gql_exec/gql_exec.dart' as _i1;
import 'package:gql_example_flutter/src/pokemon_detail/pokemon_detail.var.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/pokemon_detail/pokemon_detail.op.gql.dart'
    as _i3;

class PokemonDetail extends _i1.Request {
  PokemonDetail(
      _i2.PokemonDetailVarBuilder Function(_i2.PokemonDetailVarBuilder)
          buildVars)
      : super(
            operation: _i3.PokemonDetail,
            variables: buildVars(_i2.PokemonDetailVarBuilder()).variables);
}
