## 0.4.2

- Upgrade `gql_exec`.

## 0.4.1

- Upgrade `gql_exec`.

## 0.4.0-nullsafety.1

Null Safety Pre-release

## 0.3.3

- Add `HttpResponseDecoder httpResponseDecoder` constructor parameter

## 0.3.2

- discard assertion in `extractFlattenedFileMap` to allow for custom scalars, add test

## 0.3.1

- `extractFlattenedFileMap` fix to support `bool` values

## 0.3.0

- add multipart file support
- add `useGETForQueries` option

## 0.2.10

- add `headers` to `HttpLinkResponseContext`

## 0.2.9

- remove `author` field from `pubspec.yaml`
- handle more possible exceptions

## 0.2.8

- catch more possible exceptions

## 0.2.7

- upgrade `package:gql_pedantic`

## 0.2.6

- add `dispose()` function to close the `http.Client`

## 0.2.5

- upgrade `package:gql_exec` to v0.2.0

## 0.2.4

- use `package:gql_exec`

## 0.2.3

- upgrade `package:gql_link` to v0.2.0

## 0.2.2

- `package:gql` version fix

## 0.2.1

- re-use `package:gql_link` exceptions
- add support for extensions via `Context` by using the latest `package:gql`

## 0.2.0

- ability to configure headers on link
- read headers from `Context`
- pass HTTP status code in `Response.context`
- improved exception handling

## 0.1.2

- upgrade `package:gql` to v0.9.0

## 0.1.1

- upgrade `package:gql` to v0.8.3 which downgrades some dependencies for Flutter compatibility

## 0.1.0

- HTTP JSON Link
