# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-09-20

### Changes

---

Packages with breaking changes:

 - [`gql_dedupe_link` - `v4.0.0`](#gql_dedupe_link---v400)
 - [`gql_dio_link` - `v2.0.0`](#gql_dio_link---v200)

Packages with other changes:

 - [`gql` - `v1.0.1`](#gql---v101)
 - [`gql_build` - `v0.13.1`](#gql_build---v0131)
 - [`gql_code_builder` - `v0.15.1`](#gql_code_builder---v0151)
 - [`gql_exec` - `v1.1.0`](#gql_exec---v110)
 - [`gql_http_link` - `v1.2.0`](#gql_http_link---v120)
 - [`gql_link` - `v1.1.0`](#gql_link---v110)
 - [`gql_pedantic` - `v1.2.0`](#gql_pedantic---v120)
 - [`gql_tristate_value` - `v1.1.0`](#gql_tristate_value---v110)
 - [`gql_websocket_link` - `v2.1.0`](#gql_websocket_link---v210)
 - [`gql_code_builder_serializers` - `v0.1.0+1`](#gql_code_builder_serializers---v0101)
 - [`gql_transform_link` - `v1.0.1`](#gql_transform_link---v101)
 - [`gql_error_link` - `v1.0.1`](#gql_error_link---v101)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `gql_code_builder_serializers` - `v0.1.0+1`
 - `gql_transform_link` - `v1.0.1`
 - `gql_error_link` - `v1.0.1`

---

#### `gql_dedupe_link` - `v4.0.0`

 - **FEAT**(dedupe_link): Add shouldDedupe option (#429).
 - **BREAKING** **FIX**(gql_dedupe_link): do not dedupe mutations by default (#489).

#### `gql_dio_link` - `v2.0.0`

 - **FIX**: use typedefs instead of subclasses for base contexts for http bases links (#369).
 - **FIX**: broken json tests.
 - **FIX**: remove duplicated content-type headers added by link.
 - **FEAT**(gql_dio_link): migrate to dio 5.2.0: use DioException instead of deprecated (typedef) DioError, fix serializableDioError using new copyWith methods on RequestOptions (#406).
 - **FEAT**(gql_dio_link): add option to ensure thrown errors are serializable (#378).
 - **BREAKING** **FEAT**(gql_dio_link): dio 5.

#### `gql` - `v1.0.1`

 - **FIX**: move CatsRunner to test directory in order to not depend on package:test in the lib/ folder.

#### `gql_build` - `v0.13.1`

 - **FIX**(gql_code_builder): Fixing nullables and type overrides for vars create factories (#444).
 - **FIX**(gql_code_builder): properly generate nullable types for nullable elements in lists (#363).
 - **FEAT**: deferred allocator pattern and configurable formatting support (#495).
 - **FEAT**: deferred allocator pattern and configurable formatting support.
 - **FEAT**: allow distinguishing between null and absent values in gql_code_builder (#381).
 - **FEAT**(gql_code_builder): add when() method to fragment spread classes (#377).
 - **FEAT**: build possible types map.

#### `gql_code_builder` - `v0.15.1`

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

#### `gql_exec` - `v1.1.0`

 - **FIX**: use typedefs instead of subclasses for base contexts for http bases links (#369).
 - **FEAT**: allow distinguishing between null and absent values in gql_code_builder (#381).
 - **FEAT**(gql_exec): add getOperationType() to Operation via extension method (#389).

#### `gql_http_link` - `v1.2.0`

 - **PERF**(gql_http_link): improve json decoder performance (#464).
 - **FIX**: use typedefs instead of subclasses for base contexts for http bases links (#369).
 - **FEAT**: allow distinguishing between null and absent values in gql_code_builder (#381).
 - **FEAT**: add canonical dispose method on gql_link.

#### `gql_link` - `v1.1.0`

 - **FEAT**: add canonical dispose method on gql_link.

#### `gql_pedantic` - `v1.2.0`

 - **FEAT**(gql_pedantic): migrate to nullsafety (#397).

#### `gql_tristate_value` - `v1.1.0`

 - **FEAT**(gql_tristate_link): add abstentWhenNull factory.

#### `gql_websocket_link` - `v2.1.0`

 - **FIX**(graphql-transport-ws): ensure result message is processed before … (#466).
 - **FIX**: vars_create_factories handle BuiltList type (#447).
 - **FEAT**: add canonical dispose method on gql_link.
 - **DOCS**(gql_websocket_link): add more documentation about the websocket subprotocols (#433).
 - **DOCS**(gql_websocket_link): add docs for WebSocketLink (#400).

