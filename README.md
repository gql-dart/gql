## `gql-dart/gql` 

This is an effort to advance the Dart GraphQL ecosystem.

It consists of multiple packages and libraries centered around GraphQL AST.

#### Core

| Package | Library | Description |
|---------|---------|-------------|
| [`package:gql`][package:gql] | `ast.dart` | GraphQL AST implementation with Visitor pattern and AST transformer |
| [`package:gql`][package:gql] | `language.dart` | GraphQL source parser and printer. Recognizes both operations and SDL |
| [`package:gql`][package:gql] | `document.dart` | Document and schema validation |
| [`package:gql`][package:gql] | `execution.dart` | Implementation of types for GraphQL requests and responses |

#### Code generation

| Package | Library | Description |
|---------|---------|-------------|
| [`package:gql_code_gen`][package:gql_code_gen] | `gql_code_gen.dart` | Code generator to print AST into Dart representation of the same AST |
| [`package:gql_code_gen`][package:gql_code_gen] | `ast_builder.dart` | Source builder to parse `*.graphql` documents into AST at build-time |

#### Client

| Package | Library | Description |
|---------|---------|-------------|
| [`package:gql`][package:gql] | `link.dart` | Base for modular GraphQL execution interface |
| [`package:gql_http_link`][package:gql_http_link] | `gql_http_link.dart` | Link to execute GraphQL requests via HTTP |
| [`package:gql_dedupe_link`][package:gql_dedupe_link] | `gql_dedupe_link.dart` | De-duplicating Link to avoid execution of identical requests |

#### Other

| Package | Library | Description |
|---------|---------|-------------|
| [`package:gql_pedantic`][package:gql_pedantic] |  | Lint rules used by all `gql-dart/gql` packages |


[package:gql]: ./gql/README.md
[package:gql_http_link]: ./gql_http_link/README.md
[package:gql_code_gen]: ./gql_code_gen/README.md
[package:gql_dedupe_link]: ./gql_dedupe_link/README.md
[package:gql_pedantic]: ./gql_pedantic/README.md

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
