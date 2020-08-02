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
