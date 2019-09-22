import "dart:io" show stdout, stderr, exit;

import "package:args/args.dart";
import "package:gql/execution.dart";
import "package:gql/link.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:http/http.dart" as http;

import "./gql/add_star.ast.g.dart" as add_star;
import "./gql/read_repos.ast.g.dart" as read_repos;
import "./gql/remove_star.ast.g.dart" as remove_star;
import "./local.dart";

ArgResults argResults;

class AuthClient extends http.BaseClient {
  final _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers["Authorization"] = "Bearer $token";

    return _client.send(request);
  }
}

// query example - fetch all your github repositories
void query() async {
  final Link link = HttpLink(
    "https://api.github.com/graphql",
    httpClient: AuthClient(),
  );

  const int nRepositories = 50;

  final responseStream = link.request(
    const Request(
      operation: Operation(
        document: read_repos.document,
        variables: <String, dynamic>{
          "nRepositories": nRepositories,
        },
      ),
    ),
  );

  final result = await responseStream.first;

  if (result.errors != null) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final List<dynamic> repositories =
      result.data["viewer"]["repositories"]["nodes"] as List<dynamic>;

  repositories.forEach(
    (dynamic repo) => stdout.writeln("Id: ${repo["id"]} Name: ${repo["name"]}"),
  );

  exit(0);
}

// mutation example - add star to repository
void starRepository(String repositoryID) async {
  if (repositoryID == "") {
    stderr.writeln("The ID of the Repository is Required!");
    exit(2);
  }

  final Link link = HttpLink(
    "https://api.github.com/graphql",
    httpClient: AuthClient(),
  );

  final responseStream = link.request(
    Request(
      operation: Operation(
        document: add_star.document,
        variables: <String, dynamic>{
          "starrableId": repositoryID,
        },
      ),
    ),
  );

  final result = await responseStream.first;

  if (result.errors != null) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final bool isStarred =
      result.data["action"]["starrable"]["viewerHasStarred"] as bool;

  if (isStarred) {
    stdout.writeln("Thanks for your star!");
  }

  exit(0);
}

// mutation example - remove star from repository
void removeStarFromRepository(String repositoryID) async {
  if (repositoryID == "") {
    stderr.writeln("The ID of the Repository is Required!");
    exit(2);
  }

  final Link link = HttpLink(
    "https://api.github.com/graphql",
    httpClient: AuthClient(),
  );

  final responseStream = link.request(
    Request(
      operation: Operation(
        document: remove_star.document,
        variables: <String, dynamic>{
          "starrableId": repositoryID,
        },
      ),
    ),
  );

  final result = await responseStream.first;

  if (result.errors != null) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final bool isStarred =
      result.data["action"]["starrable"]["viewerHasStarred"] as bool;

  if (!isStarred) {
    stdout.writeln("Sorry you changed your mind!");
  }

  exit(0);
}

void main(List<String> arguments) {
  final ArgParser parser = ArgParser()
    ..addOption("action", abbr: "a", defaultsTo: "fetch")
    ..addOption("id", defaultsTo: "");

  argResults = parser.parse(arguments);

  final String action = argResults["action"] as String;
  final String id = argResults["id"] as String;

  switch (action) {
    case "star":
      starRepository(id);
      break;
    case "unstar":
      removeStarFromRepository(id);
      break;
    default:
      query();
      break;
  }
}
