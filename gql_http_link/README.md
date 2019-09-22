GQL Terminating Link to execute requests via HTTP using JSON.

## Usage

A simple usage example:

```dart
import "package:gql/link.dart";
import "package:gql_http_link/gql_http_link.dart";

void main () {
  final link = Link.from([
    // SomeLink(),
    HttpLink("/graphql"),
  ]);
}

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
