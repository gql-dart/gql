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
[discord-link]: https://discord.gg/NryjpVa

A package for Dart code generation from GraphQL source.

Builders in this package let you build your GraphQL requests and view the response in a type-safe way. 

## Usage example

See the [gql_example_cli](../../examples/gql_example_cli) or [gql_example_flutter](../../examples/gql_example_flutter) for usage examples.

## Provided builders

### ast_builder
Generates an AST representation of a GraphQL Document

### data_builder
Generates a typed view of your data.

### var_builder
Creates data classes for any GraphQL variables used in a query or fragment.

### enum_builder
Generates an enum-like class per GraphQL enum type. Defines known enum values to be used in your code, and allows unknown enum values to be used without causing runtime error when handling response data.

### scalar_builder
Generates a container for a scalar value to be used when viewing the response data and building request variables.

### schema_builder
Combines `enum_builder`, `input_builder` and `scalar_builder`.

### serializer_builder
Creates `built_value` serializers for each `built_value` class.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
