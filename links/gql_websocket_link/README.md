[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/gql.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/gql/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/gql/issues

[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/gql/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/gql/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/gql/network/members

[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.gg/YBFCTXNbwY

GQL WebSocket link to execute subscriptions as well as mutations & queries against a GraphQL backend. 
This link support `autoReconnect` and will resubscribe after reconnecting.

This package supports both the deprecated `graphql-ws` and the `graphql-transport-ws` protocol
via the `WebSocketLink` and `TransportWebSocketLink` classes respectively.


## Usage

### `WebSocketLink` / `graphql-ws` protocol

```dart
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";

void main () {
  final link = Link.from([
    // SomeLink(),
    WebSocketLink("ws://<GRAPHQL_SERVER_ENDPOINT>/graphql"),
  ]);
}

```

### `TransportWebSocketLink` / `graphql-transport-ws` protocol

```dart
import "package:gql_link/gql_link.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";

void main () {
  final link = Link.from([
    // SomeLink(),
    TransportWebSocketLink(
      TransportWsClientOptions(
          socketMaker: WebSocketMaker.url(() => "ws://<GRAPHQL_SERVER_ENDPOINT>/graphql")
      ),
    ),
  ]);
}

```

## Websocket Sub-Protocols And Their Dart Implementations

There are two websocket sub-protocols available for GraphQL supported by this package:

- `graphql-ws`  (also known as `subscriptions-transport-ws`, which is the name of the npm package which implements it, [spec](https://github.com/apollographql/subscriptions-transport-ws/blob/master/PROTOCOL.md)])
- `graphql-transport-ws` (confusingly, also known as `graphql-ws`, which is the name of the npm package which implements it [spec](https://github.com/enisdenjo/graphql-ws/blob/master/PROTOCOL.md))

In this document, we will refer to the protocols not by their npm package names, but by the name of the sub-protocol.

See also the [Apollo docs](https://www.apollographql.com/docs/react/data/subscriptions/#websocket-subprotocols).

Generally, you should use `graphql-transport-ws` if your server supports it.

In order to use `graphql-transport-ws`, you need to use the `TransportWebSocketLink` class.
For `graphql-ws`, use the `WebSocketLink` class.

The `WebSocketLink` class has some known issues, see:

- https://github.com/gql-dart/gql/issues/430





## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues

## Attribution

This code was adapted with minor changed from the `graphql-flutter` repo
