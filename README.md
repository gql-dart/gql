## `gql-dart/gql` 

This is an effort to advance the Dart GraphQL ecosystem.

It consists of multiple packages and libraries centered around GraphQL AST.

#### Core

The core of this project is the GraphQL parser which parses GraphQL strings into an AST. The parsed AST can then be transformed, visited and printed back to GraphQL string.

Another core part of the project is the types definitions used to execute GraphQL operations. They include AST-based operation, request with per operation context, and response. These types are used by the Links (see below).

| Pub | Package | Library | Description |
|-----|---------|---------|-------------|
| [![version][package:gql:version]][package:gql] | [`package:gql`][package:gql:source] | `ast.dart` | GraphQL AST implementation with Visitor pattern and AST transformer |
| [![version][package:gql:version]][package:gql] | [`package:gql`][package:gql:source] | `language.dart` | GraphQL source parser and printer. Recognizes both operations and SDL |
| [![version][package:gql:version]][package:gql] | [`package:gql`][package:gql:source] | `document.dart` | Document and schema validation |
| [![version][package:gql:version]][package:gql] | [`package:gql`][package:gql:source] | `execution.dart` | Implementation of types for GraphQL requests and responses |

#### Code generation

Current code generator is capable of building a Dart representation of GraphQL documents. It can be used to pre-build AST of `*.graphql` documents.

Ideas for future work:
- Dart types from a GraphQL schema
- Dart types per GraphQL operation and it's variables (see [Artemis project][artemis])
- typed resolvers for field resolution on the client or server

| Pub | Package | Library | Description |
|-----|---------|---------|-------------|
| [![version][package:gql_code_gen:version]][package:gql_code_gen] | [`package:gql_code_gen`][package:gql_code_gen:source] | `gql_code_gen.dart` | Code generator to print AST into Dart representation of the same AST |
| [![version][package:gql_code_gen:version]][package:gql_code_gen] | [`package:gql_code_gen`][package:gql_code_gen:source] | `ast_builder.dart` | Source builder to parse `*.graphql` documents into AST at build-time |

#### Client

Link is the current client implementation. Link is GraphQL AST-aware request/response middleware. They can be used to build a pipeline to deduplicate requests, conditionally transforming requests and responses (including the context), and eventually sending the requests to the server.

Ideas for future work:
- websocket link for subscriptions
- batched request HTTP link
- retry link to handle network issues transparently
- link for client-side request resolution 

| Pub | Package | Library | Description |
|-----|---------|---------|-------------|
| [![version][package:gql_link:version]][package:gql_link] | [`package:gql_link`][package:gql_link:source] | `link.dart` | Base for modular GraphQL execution interface |
| [![version][package:gql_http_link:version]][package:gql_http_link] | [`package:gql_http_link`][package:gql_http_link:source] | `gql_http_link.dart` | Link to execute GraphQL requests via HTTP |
| [![version][package:gql_dedupe_link:version]][package:gql_dedupe_link] | [`package:gql_dedupe_link`][package:gql_dedupe_link:source] | `gql_dedupe_link.dart` | De-duplicating Link to avoid execution of identical requests |
| [![version][package:gql_transform_link:version]][package:gql_transform_link] | [`package:gql_transform_link`][package:gql_transform_link:source] | `gql_transform_link.dart` | GQL Link to transform Requests and Responses. May be used to update context, document, variables, data, errors, etc. |

#### Other

| Pub | Package | Library | Description |
|-----|---------|---------|-------------|
| [![version][package:gql_pedantic:version]][package:gql_pedantic] | [`package:gql_pedantic`][package:gql_pedantic:source] |  | Lint rules used by all `gql-dart/gql` packages |


[package:gql:source]: ./gql/README.md
[package:gql]: https://pub.dartlang.org/packages/gql
[package:gql:version]: https://img.shields.io/pub/v/gql.svg?style=flat-square 
[package:gql_link:source]: ./gql_link/README.md
[package:gql_link]: https://pub.dartlang.org/packages/gql_link
[package:gql_link:version]: https://img.shields.io/pub/v/gql_link.svg?style=flat-square 
[package:gql_http_link:source]: ./gql_http_link/README.md
[package:gql_http_link]: https://pub.dartlang.org/packages/gql_http_link
[package:gql_http_link:version]: https://img.shields.io/pub/v/gql_http_link.svg?style=flat-square 
[package:gql_code_gen:source]: ./gql_code_gen/README.md
[package:gql_code_gen]: https://pub.dartlang.org/packages/gql_code_gen
[package:gql_code_gen:version]: https://img.shields.io/pub/v/gql_code_gen.svg?style=flat-square 
[package:gql_dedupe_link:source]: ./gql_dedupe_link/README.md
[package:gql_dedupe_link]: https://pub.dartlang.org/packages/gql_dedupe_link
[package:gql_transform_link:version]: https://img.shields.io/pub/v/gql_transform_link.svg?style=flat-square 
[package:gql_transform_link:source]: ./gql_transform_link/README.md
[package:gql_transform_link]: https://pub.dartlang.org/packages/gql_transform_link
[package:gql_dedupe_link:version]: https://img.shields.io/pub/v/gql_dedupe_link.svg?style=flat-square 
[package:gql_pedantic:source]: ./gql_pedantic/README.md
[package:gql_pedantic]: https://pub.dartlang.org/packages/gql_pedantic
[package:gql_pedantic:version]: https://img.shields.io/pub/v/gql_pedantic.svg?style=flat-square 


## Users

| Project | Description |
|---------|-------------|
| [artemis][artemis] | Build dart types from GraphQL schemas and queries (using Introspection Query). | 
| [graphql fork][graphql_flutter] | A stand-alone GraphQL client for Dart, bringing all the features from a modern GraphQL client to one easy to use package. |
| [graphql_flutter fork][graphql_flutter] | A GraphQL client for Flutter, bringing all the features from a modern GraphQL client to one easy to use package. |
| Your project? | Open a PR to add it to this readme! |

[artemis]: https://github.com/comigor/artemis
[graphql_flutter]: https://github.com/zino-app/graphql-flutter/pull/414

## Contributing

The goal of this project is to expand Dart GraphQL ecosystem
and building a community around this vendor-neutral implementation.

That said, this project is in it's early days and the best
way to contribute currently is to open issues with questions
about current and future scope and features of this project.

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
