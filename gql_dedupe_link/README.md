A GQL Link to deduplicate in-flight requests.

## Usage

A simple usage example:

```dart
import "package:gql_link/gql_link.dart";
import "package:gql_dedupe_link/gql_dedupe_link.dart";

void main () {
  final link = Link.from([
    // SomeLink(),
    DedupeLink(),
    // SomeTerminatingLink(),
  ]);
}
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
