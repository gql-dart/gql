Similar to [`gql_http_link`](https://pub.dev/packages/gql_http_link), This is a GQL Terminating Link to execute requests via Dio using JSON.

## Usage

A simple usage example:

```dart
import "package:dio/dio.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_http_link/gql_http_link.dart";

void main () {
  final dio = Dio();
  final link = Link.from([
    // SomeLink(),
    DioLink("/graphql", client: dio),
  ]);
}

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/TarekkMA/gql_dio_link/issues
