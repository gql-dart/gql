import "dart:io" show stdout, stderr, exit;

import "package:args/args.dart";
import "package:gql/language.dart";
import "package:graphql/client.dart";

import "./gql/add_star.ast.g.dart" as add_star;
import "./gql/read_repos.ast.g.dart" as read_repos;
import "./gql/remove_star.ast.g.dart" as remove_star;
import "./local.dart";

ArgResults argResults;

// client - create a graphql client
GraphQLClient client() {
  final HttpLink _httpLink = HttpLink(
    uri: "https://api.github.com/graphql",
  );

  final AuthLink _authLink = AuthLink(
    // ignore: undefined_identifier
    getToken: () async => "Bearer $token",
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  );
}

// query example - fetch all your github repositories
void query() async {
  final GraphQLClient _client = client();

  const int nRepositories = 50;

  final QueryOptions options = QueryOptions(
    document: printNode(read_repos.document),
    variables: <String, dynamic>{
      "nRepositories": nRepositories,
    },
  );

  final QueryResult result = await _client.query(options);

  if (result.hasErrors) {
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

  final GraphQLClient _client = client();

  final MutationOptions options = MutationOptions(
    document: printNode(add_star.document),
    variables: <String, dynamic>{
      "starrableId": repositoryID,
    },
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasErrors) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final bool isStarrred =
      result.data["action"]["starrable"]["viewerHasStarred"] as bool;

  if (isStarrred) {
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

  final GraphQLClient _client = client();

  final MutationOptions options = MutationOptions(
    document: printNode(remove_star.document),
    variables: <String, dynamic>{
      "starrableId": repositoryID,
    },
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasErrors) {
    stderr.writeln(result.errors);
    exit(2);
  }

  final bool isStarrred =
      result.data["action"]["starrable"]["viewerHasStarred"] as bool;

  if (!isStarrred) {
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
