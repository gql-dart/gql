import "dart:io" show stdout, stderr, exit;

import "package:args/args.dart";
import "package:gql_example_cli_github/__generated__/add_star.data.gql.dart";
import "package:gql_example_cli_github/__generated__/add_star.req.gql.dart";
import "package:gql_example_cli_github/__generated__/read_repos.data.gql.dart";
import "package:gql_example_cli_github/__generated__/read_repos.req.gql.dart";
import "package:gql_example_cli_github/__generated__/remove_star.data.gql.dart";
import "package:gql_example_cli_github/__generated__/remove_star.req.gql.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_transform_link/gql_transform_link.dart";

// to run the example, create a file ../local.dart with the content:
// const String yourPersonalAccessToken =
//    "<yourPersonalAccessToken>";
// ignore: uri_does_not_exist
import "./local.dart";

// query example - fetch all your github repositories
void query(
  Link link,
) async {
  const int nRepositories = 50;

  final req = GReadRepositories(
    (b) => b..vars.nRepositories = nRepositories,
  );

  final result = await link
      .request(
        Request(
          operation: req.operation,
          variables: req.vars.toJson(),
        ),
      )
      .first;

  if (result.errors != null && result.errors!.isNotEmpty) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final data = GReadRepositoriesData.fromJson(result.data!);

  final repositories = data!.viewer.repositories.nodes!;

  repositories.forEach(
    (repo) {
      if (repo != null) {
        stdout.writeln(
          "Id: ${repo.id} Name: ${repo.name} Created at: ${repo.createdAt.value}",
        );
      }
    },
  );

  exit(0);
}

void starRepository(
  Link link,
  String repositoryId,
) async {
  if (repositoryId == "") {
    stderr.writeln("The ID of the Repository is Required!");
    exit(2);
  }

  final req = GAddStar(
    (b) => b..vars.starrableId = repositoryId,
  );

  final result = await link
      .request(
        Request(
          operation: req.operation,
          variables: req.vars.toJson(),
        ),
      )
      .first;

  if (result.errors != null && result.errors!.isNotEmpty) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final data = GAddStarData.fromJson(result.data!)!;

  final isStarred = data.action!.starrable!.viewerHasStarred;

  if (isStarred) {
    stdout.writeln("Thanks for your star!");
  }

  exit(0);
}

void removeStarFromRepository(
  Link link,
  String repositoryId,
) async {
  if (repositoryId == "") {
    stderr.writeln("The ID of the Repository is Required!");
    exit(2);
  }

  final req = GRemoveStar(
    (b) => b..vars.starrableId = repositoryId,
  );

  final result = await link
      .request(
        Request(
          operation: req.operation,
          variables: req.vars.toJson(),
        ),
      )
      .first;

  if (result.errors != null && result.errors!.isNotEmpty) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final data = GRemoveStarData.fromJson(result.data!);

  final isStarred = data!.action!.starrable!.viewerHasStarred;

  if (!isStarred) {
    stdout.writeln("Sorry you changed your mind!");
  }

  exit(0);
}

void main(List<String> arguments) {
  final ArgParser parser = ArgParser()
    ..addOption("action", abbr: "a", defaultsTo: "fetch")
    ..addOption("id", defaultsTo: "");

  final argResults = parser.parse(arguments);

  final String action = argResults["action"] as String;
  final String id = argResults["id"] as String;

  final link = Link.concat(
    TransformLink(
      requestTransformer: (Request request) => request.withContextEntry(
        const HttpLinkHeaders(
          headers: {
            "Authorization": "Bearer $yourPersonalAccessToken",
          },
        ),
      ),
    ),
    HttpLink("https://api.github.com/graphql"),
  );

  switch (action) {
    case "star":
      starRepository(link, id);
      break;
    case "unstar":
      removeStarFromRepository(link, id);
      break;
    default:
      query(link);
      break;
  }
}
