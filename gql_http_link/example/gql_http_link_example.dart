import "package:gql/link.dart";
import "package:gql_http_link/gql_http_link.dart";

void main () {
  // ignore: unused_local_variable
  final link = Link.from([
    // SomeLink(),
    HttpLink("/graphql"),
  ]);
}
