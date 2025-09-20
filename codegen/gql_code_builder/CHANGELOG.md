## 0.15.1

 - **FIX**: vars_create_factories handle BuiltList type (#447).
 - **FIX**(gql_code_builder): Fixing nullables and type overrides for vars create factories (#444).
 - **FIX**(gql_code_builder): add void return to builder param function type (#431).
 - **FIX**: value should be non-null (#428).
 - **FIX**(gql_code_builder): improve variable resolution in fragment types (#382).
 - **FIX**(gql_codegen): Proper field selector recursion on InlineFragments for Interface-extended Types and Typed FragmentSpreads   (#373).
 - **FIX**: escape reserved dart names for references (#335).
 - **FIX**(gql_code_builder): properly generate nullable types for nullable elements in lists (#363).
 - **FIX**(gql_code_builder): add typename to possibletypesmap to generate t… (#353).
 - **FIX**(gql_code_builder): add @override annotation.
 - **FEAT**: deferred allocator pattern and configurable formatting support.
 - **FEAT**: allow distinguishing between null and absent values in gql_code_builder (#381).
 - **FEAT**(gql_code_builder): add when() method to fragment spread classes (#377).
 - **FEAT**: build possible types map.
 - **DOCS**(gql_code_builder): fix typo in changelog.

## 0.15.0

- **BREAKING**: Remove allocator parameter from public APIs - allocation is now deferred using Code.scope
- Use Code.scope pattern for deferred type allocation
- Improves separation of concerns between code generation and import management

## 0.14.0

- Fixes Interface Fragment Inheritance (#484)
- Major refactor (#485)

## 0.13.1

- support analyzer 7.0.0

## 0.13.0

- allow importing an externally generated schema


## 0.12.0

- Moving built-in Serializers to gql_code_builder_serializers package, so
  so don't have to depend on gql_code_builder in dependencies, and can keep
  it as dev-dependency (#456)

## 0.11.0

- Adding option to create factory initializers with required parameters also for inputs (#585)

## 0.10.0

- Adding 'vars_create_factories' option to create factory initializers with required parameters (
  #434)

## 0.9.1+1

- fix generating the `Value` wrappers as nullable

## 0.9.0

- add TriStateValueConfig option in order to wrap nullable fields in input types in a `Value` class
  in order distinguish between three cases:
    - absent
    - null
    - non-null value
      in serialization

## 0.8.0

- add experimental `DataClassConfig` option to reuse data classes when a selection set only consists
  of a single fragment spread

## 0.7.2

- Add a const constructor to `_PrintVisitor` and `_SchemaBuilderVisitor`.

## 0.7.1

- experimental support for when/maybeWhen methods in inline spread fragments with type condition
- fix issue with generating fragment classes with variables,
  see https://github.com/gql-dart/ferry/issues/484

## 0.7.0

- **Breaking Change**: properly generate nullable types for nullable elements in lists

## 0.6.0

- add support for generating `possibleTypesMap`.

## 0.5.1

- Support `interfaces`.

## 0.5.0

- Support analyzer >=2.3.0 < 4.0.0

## 0.4.0

- Bump `gql_exec` version.

## 0.3.0-alpha.0

- **Breaking Change** - generated files are built to `__generated__` subdirectory

## 0.2.0-nullsafety.1

- bump `built_value`

## 0.2.0-nullsafety.0

- add initial null-safety support

## 0.1.4+1

- bump `gql` version

## 0.1.4

- fix inline fragment sub-selections (#166)
- add enum fallback (#160)

## 0.1.3

- automatically include all custom type imports in `serializers.gql.dart`

## 0.1.2

- sort custom serializers

## 0.1.1

- build var classes for fragments
- build instantiable data classes for fragments
- consolidate serialization methods

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
