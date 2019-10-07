A simple and modular AST-based GraphQL request execution interface.

## Usage

A simple usage example:

```dart
import "package:gql_link/gql_link.dart";
import "package:gql_dedupe_link/gql_dedupe_link.dart";
import "package:gql_http_link/gql_http_link.dart";

import "./my_custom_link.dart";

void main () {
  final link = Link.from([
    MyCustomLink(),
    DedupeLink()
    HttpLink("/graphql"),
  ]);
}

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
