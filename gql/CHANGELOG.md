## 0.13.1

- Support `interfaces`.
- Add support for Schema description.

## 0.13.0-nullsafety.2

Loosen `source_span` constraint for `flutter_test` compatibility

## 0.13.0-nullsafety.1

Null Safety Pre-release

## 0.12.4

- add enum fallback

## 0.12.3

- remove `author` field from `pubspec.yaml`
- some more experimental validation rules thanks to [@jonas-jonas](https://github.com/jonas-jonas)
- add experimental `package:gql/schema.dart`
- add experimental `package:gql/operation.dart`

## 0.12.2

- improve readme
- remove type_system API

## 0.12.1

- upgrade `package:gql_pedantic`

## 0.12.0

- extracted `package:gql/execution.dart` to `package:gql_exec/gql_exec.dart`

## 0.11.1

- fix for parsing empty list and object literals

## 0.11.0

- expose `Request` and `Response` extensions via `Context` 
- add convenience methods to work with `Context`
- split off `Link` to `package:gql_link`

## 0.10.0

- rework `Context` to consist of `ContextEntry` map with equality checks

## 0.9.0

- split off code generation to `package:gql_code_gen`

## 0.8.3

- downgrade some dependencies for Flutter compatibility

## 0.8.2

- `package:gql/link`: add `const` constructor to `ResponseParser` and `RequestSerializer`

## 0.8.1

- `package:gql/execution`: add `Context` to `Response`
- make `Link` extendable
- `package:gql/link`: implement `ResponseParser` and `RequestSerializer`

## 0.8.0

- `package:gql/execution`: add `Context` to `Request`

## 0.7.4

- Implement `GraphQLError.toString`
- Use `package:gql_http_link` in `ast_builder` example

## 0.7.3

- Fix equality for `package:gql/execution` `ErrorLocation`

## 0.7.2

- Implement equality checks for all `package:gql/execution` classes

## 0.7.1

- Fix AST equality
- Extract lint rules

## 0.7.0

- Breaking: use `List` instead of `Iterbale`
- Add documentation to experimental `package:gql/execution` and `package:gql/link`

## 0.6.0

- Experimental `package:gql/execution` to define request/response types
- Experimental `package:gql/link` to implement `Link` based on `DocumentNode` queries

## 0.5.0

- Implement `package:gql/ast_builder` to parse `*.graphql` documents at build-time
- Stricter lint rules

## 0.4.0

- Define `name` on `DefinitionNode` to simplify `name` access for `DocumentNode.definitions`
- Rework `Node.visitChildren` and implement `Node.==` and `Node.hashCode`
- Lower SDK requirement to `>=2.2.2`

## 0.3.0

- Dart code generation via `fromNode` from `package:gql/dart.dart` using `code_gen`

## 0.2.0

- `parseString` to parse directly from `String`
- Improve parsing exceptions
- `AccumulatingVisitor` for validation rules
- Expose experimental Validation API

## 0.1.0

- A functional GraphQL parser, transformer and printer
