import 'package:gql_exec/gql_exec.dart' as _i1;
import 'package:gql_example_flutter/src/all_pokemon/all_pokemon.op.gql.dart'
    as _i2;

class AllPokemon extends _i1.Request {
  AllPokemon()
      : super(operation: _i2.AllPokemon, variables: <String, dynamic>{});

  set first(int value) => variables['first'] = value;
}
