import "package:gql_dedupe_link/gql_dedupe_link.dart";
import "package:gql_link/gql_link.dart";

void main() {
  // ignore: unused_local_variable
  final link = Link.from([
    // SomeLink(),
    DedupeLink(),
    // SomeTerminatingLink(),
  ]);
}
