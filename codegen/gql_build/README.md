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

#### Configuration

`tristate_optionals:` [bool\] Whether to wrap nullable fields in a `Value` class in order to distinguish between three cases:
- absent
- null
- non-null value


Example:
```yaml

        tristate_optionals: true 

```


### schema_builder
Creates data classes from your specified graphql schema.

#### Configuration

`type_overrides`: [Map\] Specify how scalar types should be serialized



Example:

```yaml
type_overrides:
    CustomStringScalar:
      name: String
    CustomField:
       name: CustomField
       import: 'package:mypackage/custom_field.dart'
```

`enum_fallbacks`: \[Map\] Specify fallback values to enum values in order to not break the serializer when
new enum values are added to the schema and the client has not updated to the new schema yet.

`global_enum_fallbacks`: \[bool\] Add a generated fallback value for each enum value (except for ones that have a custom fallback value specified in the enum_fallbacks map).
Defaults to false.

Example:

```yaml
global_enum_fallbacks: true # add a generated fallback value to all enums
enum_fallbacks:
    MyEnumType: OTHER   # except for the type 'MyEnumType', use the value 'OTHER' as fallback there
```

`tristate_optionals`: [bool\] Whether to wrap nullable fields in input types in a `Value` class in order distinguish between three cases:
- absent
- null
- non-null value

Example:

```yaml
tristate_optionals: true
```

### serializer_builder
Creates `built_value` serializers for each `built_value` class.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
