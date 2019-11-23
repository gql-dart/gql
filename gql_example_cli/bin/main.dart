import "package:args/args.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";

import "find_pokemon.ast.g.dart" as find_pokemon;
import "list_pokemon.ast.g.dart" as list_pokemon;

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
          Request(
            operation: Operation(
              document: find_pokemon.document,
            ),
            variables: <String, String>{
              "name": find,
            },
          ),
        )
        .first;

    final pokemon = result.data["pokemon"] as Map<String, dynamic>;

    if (pokemon == null) {
      print("${find} was not found. Does it even exist?");

      return;
    }

    print("Found ${pokemon["name"]}");
    print("ID: ${pokemon["id"]}");
    print(
      "Weight: ${pokemon["weight"]["minimum"]} – ${pokemon["weight"]["maximum"]}",
    );
    print(
      "Height: ${pokemon["height"]["minimum"]} – ${pokemon["height"]["maximum"]}",
    );

    return;
  }

  final count = argResults["count"] as String;

  print("Looking for some pokemon...");
  final result = await link
      .request(
        Request(
          operation: Operation(
            document: list_pokemon.document,
          ),
          variables: <String, String>{
            "count": count,
          },
        ),
      )
      .first;

  final pokemons = result.data["pokemons"] as List<dynamic>;

  print("Found ${pokemons.length} pokemon");

  pokemons.cast<Map<String, dynamic>>().forEach(
    (pokemon) {
      print("${pokemon["id"]} | ${pokemon["name"]}");
    },
  );

  return;
}
