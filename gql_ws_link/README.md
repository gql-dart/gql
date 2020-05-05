GQL WebSocket link to execute subscriptions as well as mutations & queries against a GraphQL backend

## Usage

A simple usage example:

```dart
import "package:gql_link/gql_link.dart";
import "package:gql_ws_link/gql_ws_link.dart";

void main () {
  final link = Link.from([
    // SomeLink(),
    WSLink("/graphql"),
  ]);
}

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
