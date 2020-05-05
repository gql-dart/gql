import "package:gql_ws_link/gql_ws_link.dart";
import "package:gql_link/gql_link.dart";

void main() {
  // ignore: unused_local_variable
  final link = Link.from([
    // SomeLink(),
    WSLink("ws://localhost:5000/graphql"),
  ]);
}
