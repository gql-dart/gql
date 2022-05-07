## 0.3.3

- Expose `connectionStateStream` getter on `WebSocketLink`.

## 0.3.2

- Upgrade `gql_exec`.

## 0.3.1

- Close [227](https://github.com/gql-dart/gql/issues/227).

## 0.3.0

- Migrate to null safety

## 0.3.0-nullsafety.1

- Migrate to null safety

## 0.2.0

- Add `autoReconnect` feature.
- Auto subscribe to active subscriptions after reconnect.
- *BREAKING*: removed `channel` from constructor, use `channelGenerator` instead.

## 0.1.7

- fix #188, Determine the boundary if `channelGenerator` is null and uri is not null
- Update the dependent package rxdart to ^0.25.0

## 0.1.6

- Delay requests until connect is done

## 0.1.5

- Add `graphQLSocketMessageDecoder` & `graphQLSocketMessageEncoder` to the constructor.

## 0.1.4

- Add `channelGenerator` to the constructor.

## 0.1.3

- Add `inactivityTimeout` parameter.

## 0.1.2

- Send `stop` command to server once subscription canceled.

## 0.1.1

- Handle exceptions.
- Throw `WebSocketLinkParserException` and `WebSocketLinkServerException`.

## 0.1.0

- port Websocket link from `graphq-flutter`
- use `WebSocketChannel` as a base for the connection
