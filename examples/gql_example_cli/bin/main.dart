import "package:args/args.dart";
import "package:gql_example_cli/__generated__/find_pokemon.data.gql.dart";
import "package:gql_example_cli/__generated__/find_pokemon.req.gql.dart";
import "package:gql_example_cli/__generated__/list_pokemon.data.gql.dart";
import "package:gql_example_cli/__generated__/list_pokemon.req.gql.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";

Future<Null> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption("count", abbr: "c", defaultsTo: "50")
    ..addOption("find", abbr: "f");

  final argResults = parser.parse(arguments);

  final link = HttpLink(
    "https://graphql-pokemon2.vercel.app",
  );

  final find = argResults["find"] as String?;

  if (find != null) {
    print("Looking for ${find}...");
    final req = GFindPokemon(
      (b) => b..vars.name = find,
    );

    final result = await link
        .request(
          Request(
            operation: req.operation,
            variables: req.vars.toJson(),
          ),
        )
        .first;

    if (result.data == null) {
      print("Nothing was received from the server!");

      return;
    }

    final data = GFindPokemonData.fromJson(result.data!);

    final GFindPokemonData_pokemon? pokemon = data!.pokemon;

    if (pokemon == null) {
      print("${find} was not found. Does it even exist?");

      return;
    }

    final weight = pokemon.weight;
    final height = pokemon.height;

    print("Found ${pokemon.name}");
    print("ID: ${pokemon.id}");
    print(
      "Weight: ${weight!.minimum} – ${weight.maximum}",
    );
    print(
      "Height: ${height!.minimum} – ${height.maximum}",
    );

    return;
  }

  final count = argResults["count"] as String;

  print("Looking for some pokemon...");
  final req = GListPokemon(
    (b) => b..vars.count = int.parse(count),
  );

  final result = await link
      .request(
        Request(
          operation: req.operation,
          variables: req.vars.toJson(),
        ),
      )
      .first;

  if (result.data == null) {
    print("Nothing was received from the server!");

    return;
  }

  final data = GListPokemonData.fromJson(result.data!);

  final pokemons = data!.pokemons;

  print("Found ${pokemons?.length ?? 0} pokemon");

  pokemons?.forEach(
    (pokemon) {
      if (pokemon != null) {
        print("${pokemon.id} | ${pokemon.name}");
      }
    },
  );

  return;
}
