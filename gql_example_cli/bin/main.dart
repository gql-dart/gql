import "package:args/args.dart";
import "package:gql_http_link/gql_http_link.dart";

import "find_pokemon.data.gql.dart";
import "find_pokemon.req.gql.dart";
import "list_pokemon.data.gql.dart";
import "list_pokemon.req.gql.dart";

Future<Null> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption("count", abbr: "c", defaultsTo: "50")
    ..addOption("find", abbr: "f");

  final argResults = parser.parse(arguments);

  final link = HttpLink(
    "https://graphql-pokemon.now.sh/graphql",
  );

  final find = argResults["find"] as String;

  if (find != null) {
    print("Looking for ${find}...");
    final result = await link
        .request(
          FindPokemon()..name = find,
        )
        .first;

    final data = $FindPokemon(result.data);

    final pokemon = data.pokemon;

    if (pokemon == null) {
      print("${find} was not found. Does it even exist?");

      return;
    }

    final weight = pokemon.weight;
    final height = pokemon.height;

    print("Found ${pokemon.name}");
    print("ID: ${pokemon.id}");
    print(
      "Weight: ${weight.minimum} – ${weight.maximum}",
    );
    print(
      "Height: ${height.minimum} – ${height.maximum}",
    );

    return;
  }

  final count = argResults["count"] as String;

  print("Looking for some pokemon...");
  final result = await link
      .request(
        ListPokemon()..count = int.parse(count),
      )
      .first;

  final data = $ListPokemon(result.data);

  final pokemons = data.pokemons;

  print("Found ${pokemons.length} pokemon");

  pokemons.forEach(
    (pokemon) {
      print("${pokemon.id} | ${pokemon.name}");
    },
  );

  return;
}
