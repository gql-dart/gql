import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:gql_example_cli/find_pokemon.data.gql.dart'
    show
        GFindPokemonData,
        GFindPokemonData_pokemon,
        GFindPokemonData_pokemon_weight,
        GFindPokemonData_pokemon_height;
import 'package:gql_example_cli/find_pokemon.req.gql.dart' show GFindPokemon;
import 'package:gql_example_cli/find_pokemon.var.gql.dart'
    show GFindPokemonVars;
import 'package:gql_example_cli/list_pokemon.data.gql.dart'
    show GListPokemonData, GListPokemonData_pokemons;
import 'package:gql_example_cli/list_pokemon.req.gql.dart' show GListPokemon;
import 'package:gql_example_cli/list_pokemon.var.gql.dart'
    show GListPokemonVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GListPokemonData,
  GListPokemonData_pokemons,
  GFindPokemonData,
  GFindPokemonData_pokemon,
  GFindPokemonData_pokemon_weight,
  GFindPokemonData_pokemon_height,
  GListPokemon,
  GFindPokemon,
  GListPokemonVars,
  GFindPokemonVars
])
final Serializers serializers = _serializersBuilder.build();
