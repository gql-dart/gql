## 0.1.0

- use `built_value` for generated classes
- add `serializer_builder` to aggregate `built_value` serializers
- remove `op` builder
- add custom scalar support
- add support for graphql type overrides (necessary for custom scalars)
- add support for custom serializers (necessary for custom scalars)
- add `JsonSerializer`
- add and automatically apply `OperationSerializer`

## 0.0.10

- remove `author` field from `pubspec.yaml`

## 0.0.9

- remove duplicate ast imports

## 0.0.8

- escape reserved and private names

## 0.0.7

- fix schema url bug

## 0.0.6

- fix nullable url bug

## 0.0.5

- rework builders to be based on `SourceNode` to handle imports
- combine data and fragment builder
- no more global fragments file
- combine schema builders
- refer to other generated files by using URI fragments

## 0.0.4

- upgrade `package:gql_pedantic`

## 0.0.3

- Support for fragment builder

## 0.0.2

- Split off `var_builder` off of `req_builder`

## 0.0.1

- Spun off of `package:gql_code_gen`
