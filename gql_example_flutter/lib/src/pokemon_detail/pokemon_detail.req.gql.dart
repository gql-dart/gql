import 'package:gql_exec/gql_exec.dart' as _i1;
import 'package:gql_example_flutter/src/pokemon_detail/pokemon_detail.op.gql.dart'
    as _i2;

class PokemonDetail extends _i1.Request {
  PokemonDetail()
      : super(operation: _i2.PokemonDetail, variables: <String, dynamic>{});

  set id(String value) => variables['id'] = value;
  set name(String value) => variables['name'] = value;
}
