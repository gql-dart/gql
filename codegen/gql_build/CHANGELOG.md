# 0.12.0

- Fixes Interface Fragment Inheritance (#484)

# 0.11.0

- Adding 'vars_create_factories' option to create factory initializers with required parameters (
  #434)

# 0.10.0

- add `tristate_optionals` option to `schema_builder` and `var_builder` in order to wrap nullable
  fields in input types in a `Value` class in order distinguish between three cases:
    - absent
    - null
    - non-null value

# 0.9.0

- add experimental `reuse_fragments` option to builder in order to reuse data classes of selection
  sets that only include a single inline fragment spread

# 0.8.0

- Add a const constructor to `AddTypenameField`.

# 0.7.0

- **Breaking Change**: properly generate nullable types for nullable elements in lists

## 0.6.0

- generate 'possibleTypesMap' in the schema
- to disable, set 'generate_possible_types_map' to `false` in build.yaml

## 0.5.0

- Fixes dependency issues by upgrading to `gql_code_builder`.

## 0.4.1

- Support `interfaces`.

## 0.4.0

- Upgrade `gql_code_builder`.

## 0.3.0-alpha.0

- **Breaking Change** - generated files are built to `__generated__` subdirectory

## 0.2.0-nullsafety.1

- bump `built_value`

## 0.2.0-nullsafety.0

- add initial null-safety support

## 0.1.4+2

- bump `gql` version

## 0.1.4+1

- update `gql_code_builder` dependency

## 0.1.4

- fix inline fragment sub-selections (#166)
- add enum fallback (#160)

## 0.1.3

- use latest `gql_code_builder`
- add `type_overrides` config to serializer_builder

## 0.1.2

- use latest `gql_code_builder`
- add typenames to OperationDefinitionNode

## 0.1.1

- build var classes for fragments
- build instantiable data classes for fragments

## 0.1.0

- use `built_value` for generated classes
- add `serializer_builder` to aggregate `built_value` serializers
- remove `op` builder
- add custom scalar support
- add support for graphql type overrides (necessary for custom scalars)
- add support for custom serializers (necessary for custom scalars)
- add `JsonSerializer`
- add and automatically apply `OperationSerializer`

## 0.0.11

- remove `author` field from `pubspec.yaml`
- "generated code" header by [@liyuqian](https://github.com/liyuqian)

## 0.0.10

- remove duplicate ast imports

## 0.0.9

- add `__typename` field to interface and object types

## 0.0.8

- escape reserved and private names

## 0.0.7

- fix schema url bug

## 0.0.6

- fix nullable url bug

## 0.0.5

- upgrade `package:gql_code_builder`
- read source as a tree of `SourceNode`s
- use allocator to resolve references to other generated files

## 0.0.4

- upgrade `package:gql_code_gen`

## 0.0.3

- Support for fragment builder

## 0.0.2

- Split off `var_builder` off of `req_builder`

## 0.0.1

- Spun off of `package:gql_code_gen`
